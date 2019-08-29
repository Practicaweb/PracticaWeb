<?php
	// Exit if accessed directly
	if( !defined( 'ABSPATH' ) ) exit;
 

class wpForoPermissions{
	public $accesses;

	static $cache = array();
	
	function __construct(){}

	public function init(){
        if( WPF()->is_installed() ){
            if( $accesses = $this->get_accesses() ){
                foreach( $accesses as $access ) {
                    $this->accesses[$access['access']] = $access;
                }
            }
        }
    }
 	
 	/**
	 * 
	 * @param string $access
	 * 
	 * @return array access row by access key
	 */
 	function get_access($access){
		$access = sanitize_text_field($access);
		if( !empty($this->accesses[$access]) ){
			return $this->accesses[$access];
		}else{
			$sql = "SELECT * FROM `".WPF()->tables->accesses."` WHERE `access` = '" . esc_sql($access) . "'";
			return WPF()->db->get_row($sql, ARRAY_A);
		}
	}
	
	
 	/**
	* get all accesses from accesses table
	* 
	* @return array|null
	*/
 	function get_accesses(){
		$sql = "SELECT * FROM ".WPF()->tables->accesses;
		return WPF()->db->get_results($sql, ARRAY_A);
	}
 	
 	function usergroup_cans_form( $groupid = FALSE ){
		
		$can_data = array();
		$cans = WPF()->usergroup->cans;
		
		if( $groupid == FALSE ){
			foreach($cans as $can => $name){ 
				@$can_data[$can]['value'] = 0;
				@$can_data[$can]['name'] = $name;
			}
		}else{
			$usegroup = WPF()->usergroup->get_usergroup( $groupid );
			$ug_cans = unserialize($usegroup['cans']);
			foreach($cans as $can => $name){ 
				@$can_data[$can]['value'] = $ug_cans[$can];
				@$can_data[$can]['name'] = $name;
			}
		}
		
		return $can_data;
	}
	
	function forum_cans_form( $access = FALSE ){
		
		$can_data = array();
		$cans = WPF()->forum->cans;
		
		if( !$access ){
			foreach($cans as $can => $name){ 
				@$can_data[$can]['value'] = 0;
				@$can_data[$can]['name'] = $name;
			}
		}else{
			$access = $this->get_access( $access );
			$access_cans = unserialize($access['cans']);
			foreach($cans as $can => $name){ 
				@$can_data[$can]['value'] = $access_cans[$can];
				@$can_data[$can]['name'] = $name;
			}
		}
		
		return $can_data;
	}
	
	
	/**
	* 
	* @param  string $title (required)
	* @param  array  $cans
	* @param  string $key
	* 
	* @return int|bool rows count or false
	*/
	function add( $title, $cans = array(), $key = '' ){
		$cans = wpforo_parse_args($cans, array_map('wpforo_return_zero', WPF()->forum->cans));
		if(!$key) $key = $title;
		
		$i = 2;
		while( WPF()->db->get_var("SELECT `access` FROM ".WPF()->tables->accesses." WHERE `access` = '". esc_sql(sanitize_text_field($key)) . "'") ){
			$key = $key . '-' . $i;
			$i++;
		}
		
		if( WPF()->db->insert(
			WPF()->tables->accesses,
				array( 
					'title'		=> sanitize_text_field($title), 
					'access' 	=> sanitize_text_field($key), 
					'cans'		=> serialize($cans)
				), 
				array( 
					'%s',
					'%s',
					'%s'
				)
			)
		){
			WPF()->notice->add( sprintf( __('%s access successfully added', 'wpforo') , esc_html($title)) , 'success');
			return WPF()->db->insert_id;
		}
		
		WPF()->notice->add('Access add error', 'error');
		return FALSE;
	}
	
	function edit( $title, $cans, $key ){
		$cans = wpforo_parse_args($cans, array_map('wpforo_return_zero', WPF()->forum->cans));
		
		if( FALSE !== WPF()->db->update(
			WPF()->tables->accesses,
			array( 
				'title' =>  sanitize_text_field($title), 
				'cans' => serialize( $cans ), 
			),
			array( 'access' => sanitize_text_field($key) ),
			array( 
				'%s',
				'%s'
			),
			array( '%s' ))
		){
			WPF()->notice->add( sprintf( __('%s access successfully edited', 'wpforo'), esc_html($title)) , 'success');
			return $key;
		}
		
		WPF()->notice->add('Access edit error', 'error');
		return FALSE;
	}
	
	function delete($accessid){
		
		$accessid = intval($accessid);
		
		if(!$accessid){
			WPF()->notice->add('Access delete error', 'error');
			return FALSE;
		}
		
		if( FALSE !== WPF()->db->delete( WPF()->tables->accesses, array( 'accessid' => $accessid ), array( '%d' ) ) ){
			WPF()->notice->add('Access successfully deleted', 'success');
			return $accessid;
		}
		
		WPF()->notice->add('Access delete error', 'error');
		return FALSE;
	}
	
	function forum_can( $do, $forumid = NULL, $groupid = NULL, $second_usergroupids = NULL ){
		/**
		 * filter for other add-ons to manage can_attach bool value.
		 * e.g. PM add-on attachment function.
		 */
		$filter_forum_can = apply_filters('wpforo_permissions_forum_can', null, $do, $forumid, $groupid, $second_usergroupids);
		if( !is_null($filter_forum_can) ) return (int) (bool) $filter_forum_can;

		$can = 0;
        $second_can = 0;
        $secondary_can = 0;
		if( !WPF()->current_user_groupid && is_null($groupid) || !$do ) return 0;

		//User Forum accesses from Current Object of Current user
        if( !empty(WPF()->current_user_accesses) && is_null($groupid) ){
            if( is_null($forumid) && wpfval(WPF()->current_object, 'forum', 'forumid') ) {
                $forum_id = WPF()->current_object['forum']['forumid'];
            } else {
            	$forum_id = ( is_array($forumid) && wpfkey($forumid, 'forumid') ) ? $forumid['forumid'] : $forumid;
            }
            if( $forum_id ){
                //Primary Usergroup
                $primary_can = wpfval( WPF()->current_user_accesses, 'primary', $forum_id, $do );
                //Secondary Usergroup
                if( wpfval(WPF()->current_user_accesses, 'secondary') ) {
                    $secondary_accesses = wpfval( WPF()->current_user_accesses, 'secondary' );
                    foreach( $secondary_accesses as $secondary_access ){
                        $secondary_can = wpfval($secondary_access, $forum_id, $do); if( $secondary_can ) break;
                    }
                }
                //Return Access
                if( !$primary_can && $secondary_can ){
                    return $secondary_can;
                } else {
                    return $primary_can;
                }
            }
        }

        //Use Custom User Forum Accesses
        if( is_null($forumid) ) {
            $forum = WPF()->current_object['forum'];
        }else{
            if( is_array($forumid) && wpfkey($forumid, 'forumid') ){
                $forum = $forumid;
            }else{
                $forum = WPF()->forum->get_forum($forumid);
            }
        }

        if( is_null($groupid) ) {
            $groupid = WPF()->current_user_groupid;
        }
        if( is_null($second_usergroupids) && WPF()->current_user_secondary_groupids ) {
            $second_usergroupids = explode(',', WPF()->current_user_secondary_groupids );
        }
        if( !is_null($second_usergroupids) && is_string($second_usergroupids) ) {
            $second_usergroupids = explode(',', $second_usergroupids);
        }

        if( $forum ){
            $permissions = unserialize($forum['permissions']);
            //Primary Usergroup
            if( isset($permissions[$groupid]) ){
                $access = $permissions[$groupid];
                $access_arr = $this->get_access($access);
                $cans = unserialize($access_arr['cans']);
                $can = ( isset($cans[$do]) ? $cans[$do] : 0 );
            }
            //Secondary Usergroup
            if( !empty($second_usergroupids) && is_array($second_usergroupids) ){
                $second_usergroupids = array_map('intval', $second_usergroupids );
                foreach( $second_usergroupids as $second_usergroupid ){
                    if( isset($permissions[$second_usergroupid]) ){
                        $access_second = $permissions[$second_usergroupid];
                        $access_second_arr = $this->get_access($access_second);
                        $second_cans = unserialize($access_second_arr['cans']);
                        $second_can = ( isset($second_cans[$do]) ? $second_cans[$do] : 0 );
                        if( $second_can ) break;
                    }
                }
            }
        }

        if( !$can && $second_can ){
            return $second_can;
        } else {
            return $can;
        }
	}
	
	function usergroup_can( $do, $usergroupid = NULL, $second_usergroupids = NULL ){
	    if( is_null($usergroupid) ) {
	        if( current_user_can('administrator') ) return 1;
	        $usergroupid = WPF()->current_user_groupid;
        }
        $usergroupid = intval($usergroupid);
        $usergroup = WPF()->usergroup->get_usergroup( $usergroupid );
        $cans = unserialize($usergroup['cans']);
        $can = ( isset($cans[$do]) ? $cans[$do] : 0 );

        $second_can = 0;
        if( is_null($second_usergroupids) && WPF()->current_user_secondary_groupids ) {
            $second_usergroupids = explode(',', WPF()->current_user_secondary_groupids );
        }
        if( !is_null($second_usergroupids) && is_string($second_usergroupids) ) {
            $second_usergroupids = explode(',', $second_usergroupids);
        }
        if( !empty($second_usergroupids) && is_array($second_usergroupids) ){
            $second_usergroupids = array_map('intval', $second_usergroupids );
            foreach( $second_usergroupids as $second_usergroupid ){
                if( $second_usergroupid ){
                    $second_usergroup = WPF()->usergroup->get_usergroup( $second_usergroupid );
                    $second_cans = unserialize($second_usergroup['cans']);
                    $second_can = ( isset($second_cans[$do]) ? $second_cans[$do] : 0 );
                    if( $second_can ) break;
                }
            }
        }

        if( !$can && $second_can ){
            return $second_can;
        } else {
            return $can;
        }
	}
	
	function usergroups_can( $do ){
		$usergroupids = array();
		$usergroups = WPF()->usergroup->get_usergroups();
		foreach( $usergroups as $usergroup ){
			$cans = unserialize( $usergroup['cans'] );
			if( isset($cans[$do]) && $cans[$do] ){
				$usergroupids[] = $usergroup['groupid'];
			}
		}
		return $usergroupids;
	}
	
	function user_can_manage_user( $user_id, $managing_user_id ){
		
		if( !$user_id || !$managing_user_id ) return false;
		if( $user_id == $managing_user_id ) return true;
		
		$user = new WP_User( $user_id ); 
		$user_level = $this->user_wp_level( $user );
		if( !empty($user->roles) && is_array($user->roles) ) $user_role = array_shift($user->roles);
		
		$managing_user = new WP_User( $managing_user_id );  
		$managing_user_level = $this->user_wp_level( $managing_user );
		if( !empty($managing_user->roles) && is_array($managing_user->roles) ) $managing_user_role = array_shift($managing_user->roles);
		
		if( (int)$user_level > (int)$managing_user_level ){
			return true;
		}
		elseif( $user_id == 1 && $user_role == 'administrator' ){
			return true;
		}
		elseif( (int)$user_level == (int)$managing_user_level ){
			$member = WPF()->member->get_member( $user_id );
			$managing_member = WPF()->member->get_member( $managing_user_id );
			$user_wpforo_can = $this->usergroup_can( 'em', $member['groupid'] );
			$managing_user_wpforo_can = $this->usergroup_can( 'em', $managing_member['groupid'] );
			if( $user_wpforo_can && !$managing_user_wpforo_can ){
				return true;
			}
			else{
				return false;
			}
		}
		elseif( $user_id != 1 && $managing_user_id == 1 && $managing_user_role == 'administrator' ){
			return false;
		}
		else{
			return false;
		}
	}

    function user_wp_level( $user_object ){
        $level = 0;
        $levels = array();
        if( is_int($user_object) ){
            $user_object = new WP_User( $user_object );
        }
        if( isset($user_object->allcaps) && is_array($user_object->allcaps) && !empty($user_object->allcaps) ){
            foreach($user_object->allcaps as $level_key => $level_value){
                if( strpos($level_key, 'level_') !== FALSE && $level_value == 1 ){
                    $levels[] = intval(str_replace('level_', '', $level_key));
                }
            }
            if(!empty($levels)){
                $level = max($levels);
            }
        }
        return $level;
    }

	function can_edit_user( $userid ){

	    if( !$userid ) return false;

        if( !( $userid == WPF()->current_userid ||
            ( WPF()->perm->usergroup_can('em') &&
                WPF()->perm->user_can_manage_user( WPF()->current_userid, $userid )
            )
        )
        ){
            WPF()->notice->clear();
            WPF()->notice->add('Permission denied', 'error');
            wp_redirect(wpforo_get_request_uri());
            exit();
        }

        return true;
    }
	
	public function can_link(){
		if( !WPF()->perm->usergroup_can( 'em' ) ){
			$posts = WPF()->member->member_approved_posts( WPF()->current_userid );
			$posts = intval($posts);
			if( isset(WPF()->tools_antispam['min_number_post_to_link']) ){
				$min_posts = intval(WPF()->tools_antispam['min_number_post_to_link']);
				if( $min_posts !== 0 ){
					if ( $posts <= $min_posts ) {
						return false;
					}
				}
			}
		}
		return true;
	}
	
	public function can_attach($forumid = null){
		if( !$forumid ) $forumid = null;

		/**
		 * filter for other add-ons to manage can_attach bool value.
		 * e.g. PM add-on attachment function.
		 */
		$filter_wpforo_can_attach = apply_filters('wpforo_can_attach', null, $forumid);
		if( !is_null($filter_wpforo_can_attach) ) return (bool) $filter_wpforo_can_attach;

		if( !$this->forum_can('a', $forumid) ) return false;
		if( !$this->usergroup_can( 'em' ) ){
			$posts = WPF()->member->member_approved_posts( WPF()->current_userid );
			$posts = intval($posts);
			if( isset(WPF()->tools_antispam['min_number_post_to_attach']) ){
				$min_posts = intval(WPF()->tools_antispam['min_number_post_to_attach']);
				if( $min_posts != 0 ){
					if ( $posts <= $min_posts  ) {
						return false;
					}
				}
			}
		}
		return true;
	}
	
	public function can_attach_file_type( $ext = '' ){
		if( !$this->usergroup_can( 'em' ) ){
			if( isset(WPF()->tools_antispam['limited_file_ext']) && WPF()->member->current_user_is_new() ){
				$expld = explode('|', WPF()->tools_antispam['limited_file_ext'] );
				if( in_array($ext, $expld) ){
					return false;
				}
			}
		}
		return true;
	}

	/**
	 * @return bool
	 */
	public function can_post_now() {
		if ( wpforo_is_admin() || ( defined( 'IS_GO2WPFORO' ) && IS_GO2WPFORO ) ) {
			return true;
		}

		$email   = ( ( $userid = WPF()->current_userid ) ? '' : WPF()->current_user_email );
		$groupid = WPF()->current_user_groupid;
		if ( WPF()->member->current_user_is_new() ) {
			$groupid = 0;
		}
		if ( ! $flood_interval = WPF()->usergroup->get_flood_interval( $groupid ) ) {
			return true;
		}
		$hour_ago = gmdate( 'Y-m-d H:i:s', time() - HOUR_IN_SECONDS );

		$args        = array(
			'userid'    => $userid,
			'email'     => $email,
			'orderby'   => '`created` DESC, `postid` DESC',
			'row_count' => 1,
			'where'     => "`created` >= '$hour_ago'"
		);
		$items_count = 0;
		$lastpost    = WPF()->post->get_posts( $args, $items_count, false );
		if ( $lasttime = wpfval($lastpost, 0, 'created' ) ) {
		     $lasttime = strtotime( $lasttime );
			 $nowtime  = current_time( 'timestamp', 1 );
			 $diff     = $nowtime - $lasttime;
			 if ( $diff < $flood_interval ) {
				return false;
			 }
		}
		return true;
	}

    public function get_forum_accesses_by_usergroup( $usergroup = 0, $secondary_usergroups = '' ){

	    $user_accesses = array('primary' => array(), 'secondary' => array() );
	    $forums = WPF()->forum->get_forums();
        $usergroup = ( $usergroup ) ? $usergroup : WPF()->current_user_groupid;
        $secondary_usergroups = ( $secondary_usergroups ) ? $secondary_usergroups : WPF()->current_user_secondary_groupids;
        $secondary_usergroups = ( $secondary_usergroups ) ? explode( ',', $secondary_usergroups ) : array();
        if(!empty($forums)){
            foreach( $forums as $forum ){
                if( wpfval( $forum, 'permissions' ) ){
                    $permissions = unserialize( $forum['permissions'] );
                    if( !empty($permissions) ){
                        //Primary Usergroup Access
                        if( wpfval( $permissions, $usergroup ) ){
                            if(wpfval($this->accesses, $permissions[ $usergroup ], 'cans')){
                                $user_accesses['primary'][ $forum['forumid'] ] = unserialize($this->accesses[ $permissions[ $usergroup ] ] ['cans']);
                            }
                        }
                        //Secondary Usergroup Access
                        if( !empty($secondary_usergroups) ){
                            foreach( $secondary_usergroups as $secondary_usergroup ){
                                if( wpfval( $permissions, $secondary_usergroup ) ){
                                    if(wpfval($this->accesses, $permissions[ $secondary_usergroup ], 'cans')){
                                        $user_accesses['secondary'][ $secondary_usergroup ][ $forum['forumid'] ] = unserialize($this->accesses[ $permissions[ $secondary_usergroup ] ] ['cans']);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return $user_accesses;
    }
	
}