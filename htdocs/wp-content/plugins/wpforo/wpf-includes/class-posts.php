<?php
	// Exit if accessed directly
	if( !defined( 'ABSPATH' ) ) exit;

class wpForoPost{
	public $default;
	public $options;

	public static $cache = array( 'posts' => array(), 'post' => array(), 'item' => array(), 'topic_slug' => array(), 'forum_slug' => array(), 'post_url' => array() );
	
	function __construct(){
		$this->init_defaults();
		$this->init_options();
	}

	public function get_cache( $var ){
		if( isset(self::$cache[$var]) ) return self::$cache[$var];
	}

    public function reset(){
        self::$cache = array( 'posts' => array(), 'post' => array(), 'item' => array(), 'topic_slug' => array(), 'forum_slug' => array(), 'post_url' => array() );
    }

	private function init_defaults(){
	    $this->default = new stdClass;

        $upload_max_filesize = @ini_get('upload_max_filesize');
        $upload_max_filesize = wpforo_human_size_to_bytes($upload_max_filesize);
        if( !$upload_max_filesize || $upload_max_filesize > 10485760 ) $upload_max_filesize = 10485760;

		$this->default->options = array(
			'layout_extended_intro_posts_toggle' => 1,
			'layout_extended_intro_posts_count'  => 4,
			'layout_extended_intro_posts_length' => 50,
			'recent_posts_type'                  => 'topics',
			'tags'                               => 1,
			'max_tags'                           => 5,
			'tags_per_page'                      => 100,
			'topics_per_page'                    => 10,
			'edit_topic'                         => 1,
			'edit_post'                          => 1,
			'eot_durr'                           => 300,
			'dot_durr'                           => 300,
			'posts_per_page'                     => 15,
			'layout_threaded_posts_per_page'     => 5,
			'layout_qa_posts_per_page'           => 15,
			'layout_qa_comments_limit_count'     => 3,
			'layout_qa_first_post_reply'         => 1,
			'layout_threaded_nesting_level'      => 5,
			'layout_threaded_first_post_reply'   => 0,
			'eor_durr'                           => 300,
			'dor_durr'                           => 300,
			'max_upload_size'                    => $upload_max_filesize,
			'display_current_viewers'            => 1,
			'display_recent_viewers'             => 1,
			'display_admin_viewers'              => 1,
			'union_first_post'                   => array(
				1 => 0,
				2 => 0,
				3 => 1,
				4 => 0
			),
			'attach_cant_view_msg'               => __( "You are not permitted to view this attachment", 'wpforo' ),
			'search_max_results'                 => 100,
			'topic_body_min_length'              => 2,
			'topic_body_max_length'              => 0,
			'post_body_min_length'               => 2,
			'post_body_max_length'               => 0,
			'comment_body_min_length'            => 2,
			'comment_body_max_length'            => 0
		);
    }

    private function init_options(){
        $this->options = get_wpf_option('wpforo_post_options', $this->default->options);
    }

	/**
	 * @param int $layout
	 *
	 * @return int items_per_page
	 */
    public function get_option_items_per_page($layout = null){
	    switch ( $layout ) {
		    case 4:
			    $items_per_page = $this->options['layout_threaded_posts_per_page'];
			    break;
		    case 3:
			    $items_per_page = $this->options['layout_qa_posts_per_page'];
			    break;
		    default:
			    $items_per_page = $this->options['posts_per_page'];
			    break;
	    }

	    return (int) apply_filters('wpforo_post_get_option_items_per_page', $items_per_page, $layout);
    }
	
	/**
	 * @param int $layout
	 *
	 * @return bool
	 */
	public function get_option_union_first_post($layout){
		$layout = intval($layout);
		$union_first_post = (bool) wpfval($this->options['union_first_post'], $layout);
		return (bool) apply_filters('wpforo_post_options_get_union_first_post', $union_first_post, $layout);
	}
	
	public function add( $args = array() ){

		$guestposting = false;
        $root_exists = wpforo_root_exist();

		if( empty($args) && empty($_REQUEST['post']) ){ WPF()->notice->add('Reply request error', 'error'); return FALSE; }
		if( empty($args) && !empty($_REQUEST['post']) ) $args = $_REQUEST['post'];
		if( !isset($args['body']) || !$args['body'] ){ WPF()->notice->add('Post is empty', 'error'); return FALSE; }
        if( !wpfval($args, 'title') && wpfval($args, 'topicid') ){ $args['title'] = wpforo_phrase('RE', false) . ': ' . wpforo_topic($args['topicid'], 'title'); }
		$args['name'] = (isset($args['name']) ? strip_tags($args['name']) : '' );
		$args['email'] = (isset($args['email']) ? sanitize_email($args['email']) : '' );
		if( isset($args['userid']) && $args['userid'] == 0 && $args['name'] && $args['email'] ) $guestposting = true;
		
		extract($args);
		
		if( !isset($topicid) || !$topicid ){ WPF()->notice->add('Error: No topic selected', 'error'); return FALSE; }
		if( !$topic = WPF()->topic->get_topic(intval($topicid)) ){ WPF()->notice->add('Error: Topic is not found', 'error'); return FALSE; }
		if( !$forum = WPF()->forum->get_forum(intval($topic['forumid'])) ){ WPF()->notice->add('Error: Forum is not found', 'error'); return FALSE; }

		if( $topic['closed'] ){
			WPF()->notice->add('Can\'t write a post: This topic is closed', 'error');
			return FALSE;
		}
		
		if( !$guestposting && !WPF()->perm->forum_can('cr', $topic['forumid']) ){
			WPF()->notice->add('You don\'t have permission to create post in this forum', 'error');
			return FALSE;
		}

		if( !WPF()->perm->can_post_now() ){
			WPF()->notice->add('You are posting too quickly. Slow down.', 'error');
			return FALSE;
		}
		
		if( !is_user_logged_in() ){
			if( !$args['name'] || !$args['email'] ){
				WPF()->notice->add('Please insert required fields!', 'error');
				return FALSE;
			}
			else{
				WPF()->member->set_guest_cookies( $args );
			}
		}
		
		do_action( 'wpforo_start_add_post', $args );
		
		$post = $args;
		$post['forumid'] = $forumid = (isset($topic['forumid']) ? intval($topic['forumid']) : 0);
		$post['parentid'] = $parentid = (isset($parentid) ? intval($parentid) : 0);
		$post['title'] = $title = (isset($title) ? wpforo_text( trim($title), 250, false ) : '');
		$post['body'] = $body = ( isset($body) ? preg_replace('#</pre>[\r\n\t\s\0]*<pre>#isu', "\r\n", $body) : '' );
		$post['created'] = $created = ( isset($created) ? $created : current_time( 'mysql', 1 ) );
		$post['userid'] = $userid = ( isset($userid) ? intval($userid) : WPF()->current_userid );
		if( $root_exists ){
            $post['root'] = ( $parentid ) ? ( isset($root) ? intval($root) : $this->get_root( $parentid ) ) : -1;
        } else {
            $root = NULL;
        }

		$post = apply_filters('wpforo_add_post_data_filter', $post);
		
		if(empty($post)) return FALSE;

		extract($post, EXTR_OVERWRITE);
		
		if(isset($forumid)) $forumid = intval($forumid);
		if(isset($topicid)) $topicid = intval($topicid);
		if(isset($parentid)) $parentid = intval($parentid);
		if(isset($title)) $title = sanitize_text_field(trim($title));
		if(isset($created)) $created = sanitize_text_field($created);
		if(isset($userid)) $userid = intval($userid);
		if(isset($body)) $body = wpforo_kses(trim($body), 'post');
        $status = ( isset($status) && $status ? 1 : 0 );
        $private = ( isset($topic['private']) && $topic['private'] ? 1 : 0 );
        if(isset($name)) $name = strip_tags(trim($name));
        if(isset($email)) $email = strip_tags(trim($email));

        do_action( 'wpforo_before_add_post', $post );

        $fields = array('forumid'	=> $forumid,
                        'topicid'	=> $topicid,
                        'parentid'	=> $parentid,
                        'userid' 	=> $userid,
                        'title'     => stripslashes($title),
                        'body'      => stripslashes($body),
                        'created'	=> $created,
                        'modified'	=> $created,
                        'status'	=> $status,
                        'private'	=> $private,
                        'name' 		=> $name,
                        'email' 	=> $email,
                        'root' 	    => $root );

		$values = array('%d','%d','%d','%d','%s','%s','%s','%s','%d','%d','%s','%s','%d');

		if(!$root_exists){ unset($fields['root']); unset($fields[12]); }

		if( WPF()->db->insert(
				WPF()->tables->posts,
                $fields,
				$values
			)
		){
			$postid = WPF()->db->insert_id;

			$post['postid'] = $postid;
			$post['status'] = $status;
			$post['private'] = $private;
			$post['posturl'] = $this->get_post_url($postid);

            if( $root_exists ) {
                WPF()->topic->rebuild_threads( $topic, $root );
            }

			if ( !$status ) {
				$answ_incr = '';
				$comm_incr = '';
				if ( WPF()->forum->get_layout($forum) == 3 ) {
					if ( $parentid ) {
						$comm_incr = ', `comments` = `comments` + 1 ';
					} else {
						$answ_incr = ', `answers` = `answers` + 1 ';
					}
				}
				WPF()->db->query( "UPDATE `" . WPF()->tables->profiles . "` SET `posts` = `posts` + 1 $answ_incr $comm_incr WHERE `userid` = " . wpforo_bigintval( $userid ) );
                WPF()->topic->rebuild_first_last( $topic );
				WPF()->topic->rebuild_stats( $topic );
				WPF()->forum->rebuild_last_infos( $forum['forumid'] );
				WPF()->forum->rebuild_stats( $forum['forumid'] );
			}

			do_action( 'wpforo_after_add_post', $post, $topic );
			
			wpforo_clean_cache('post', $postid, $post);
			WPF()->member->reset($userid);
			WPF()->notice->add('You successfully replied', 'success');
			return $postid;
		}
		
		WPF()->notice->add('Reply request error', 'error');
		return FALSE;
	}
	
	public function edit( $args = array() ){
		
		//This variable will be based on according CAN of guest usergroup once Guest Posing is ready
		$guestposting = false;
		
		if( empty($args) && (!isset($_REQUEST['post']) || empty($_REQUEST['post'])) ) return FALSE;
		if( empty($args) && !empty($_REQUEST['post']) ) $args = $_REQUEST['post'];
		if( isset($args['name']) ){ $args['name'] = strip_tags($args['name']); }
		if( isset($args['email']) ){ $args['email'] = sanitize_email($args['email']); }
		
		do_action( 'wpforo_start_edit_post', $args );
		
		if( !isset($args['postid']) || !$args['postid'] || !is_numeric($args['postid']) ){
			WPF()->notice->add('Cannot update post data', 'error');
			return FALSE;
		}
		$args['postid'] = intval($args['postid']);
		if( !$post = $this->get_post($args['postid']) ){ WPF()->notice->add('No Posts found for update', 'error'); return FALSE; }
		
		if( !is_user_logged_in() ){
			if( !isset($post['email']) || !$post['email'] ){
				WPF()->notice->add('Permission denied', 'error');
				return FALSE;
			}
			elseif( !wpforo_current_guest( $post['email'] ) ){
				WPF()->notice->add('You are not allowed to edit this post', 'error');
				return FALSE;
			}
			if( !$args['name'] || !$args['email'] ){
				WPF()->notice->add('Please insert required fields!', 'error');
				return FALSE;
			}
			else{
				WPF()->member->set_guest_cookies( $args );
			}
		}
		
		$args['userid'] = $post['userid'];
		$args['status'] = $post['status'];

        if( isset($args['userid']) && $args['userid'] == 0 && isset($args['name']) && isset($args['email']) ) $guestposting = true;

		$args = apply_filters('wpforo_edit_post_data_filter', $args);
		if(empty($args)) return FALSE;
		
		extract($args, EXTR_OVERWRITE);
		
		if( !$guestposting ){
			$diff = current_time( 'timestamp', 1 ) - strtotime($post['created']);
			if( !(WPF()->perm->forum_can('er', $post['forumid']) ||
					(WPF()->current_userid == $post['userid'] && WPF()->perm->forum_can('eor', $post['forumid'])) )
            ){
				WPF()->notice->add('You don\'t have permission to edit post from this forum', 'error');
				return FALSE;
			}

            if(!WPF()->perm->forum_can('er', $post['forumid']) &&
                    $this->options['eor_durr'] !== 0 &&
                        $diff > $this->options['eor_durr']){
                WPF()->notice->add('The time to edit this post is expired.', 'error');
                return FALSE;
            }
		}

		$title = (isset($title) ? wpforo_text( trim($title), 250, false ) : '');
		$body = ( isset($body) ? preg_replace('#</pre>[\r\n\t\s\0]*<pre>#isu', "\r\n", $body) : '' );
		
		if(isset($forumid)) $forumid = intval($forumid);
		if(isset($topicid)) $topicid = intval($topicid);
		if(isset($parentid)) $parentid = intval($parentid);
		if(isset($title)) $title = sanitize_text_field(trim($title));
		if(isset($slug)) $slug = sanitize_title($slug);
		if(isset($created)) $created = sanitize_text_field($created);
		if(isset($userid)) $userid = intval($userid);
		if(isset($body)) $body = wpforo_kses(trim($body), 'post');
		if(isset($status)) $status = intval($status);
		if(isset($private)) $private = intval($private);
		if(isset($name)) $name = strip_tags(trim($name));
		if(isset($email)) $email = strip_tags(trim($email));
		
		$title  = ( isset($title) ? stripslashes($title) : stripslashes($post['title']) );
		$body = ( (isset($body) && $body) ? stripslashes($body) : stripslashes($post['body']) );
		$status = ( isset($status) ? $status : intval($post['status']) );
        $private = ( isset($private) ? $private : intval($post['private']) );
		$name = ( isset($name) ? stripslashes($name) : stripslashes($post['name']) );
		$email = ( isset($email) ? stripslashes($email) : stripslashes($post['email']) );
		
		if( FALSE !== WPF()->db->update(
				WPF()->tables->posts,
				array( 
					'title'     => $title,
					'body'      => $body,
					'modified'	=> current_time( 'mysql', 1 ),
					'status'  => $status,
					'name' => $name,
					'email' => $email,
				), 
				array('postid' => $postid),
				array('%s','%s','%s','%d','%s','%s'),
				array('%d') 
			)
		){
			do_action( 'wpforo_after_edit_post', array( 'postid' => $postid, 'topicid' => $topicid, 'title' => $title, 'body' => $body, 'status' => $status, 'private' => $private, 'name' => $name, 'email' => $email) );
			
			wpforo_clean_cache('post', $postid, $post);
			WPF()->notice->add('This post successfully edited', 'success');
			return $postid;
		}
		
		WPF()->notice->add('Reply request error', 'error');
		return FALSE;
	}
	
	#################################################################################
	/**
	 * Delete post from DB
	 * 
	 * Returns true if successfully deleted or false.
	 *
	 * @since 1.0.0
	 *
	 * @return	bool
	 */
	 
	function delete( $postid, $delete_cache = true, $rebuild_data = true, &$exclude = array() ){
		$postid = intval($postid);
		
		if( !$post = $this->get_post($postid) ) return true;

		do_action('wpforo_before_delete_post', $post);

		$diff = current_time( 'timestamp', 1 ) - strtotime($post['created']);
		if( !(WPF()->perm->forum_can('dr', $post['forumid']) ||
            (WPF()->current_userid == $post['userid'] &&
                WPF()->perm->forum_can('dor', $post['forumid'])  )) ){
			WPF()->notice->add('You don\'t have permission to delete post from this forum', 'error');
			return FALSE;
		}

		if( !WPF()->perm->forum_can('dr', $post['forumid']) &&
                $this->options['dor_durr'] !== 0 &&
                    $diff > $this->options['dor_durr'] ){
            WPF()->notice->add('The time to delete this post is expired.', 'error');
            return FALSE;
        }
		//Find and delete default attachments before deleting post
		$this->delete_attachments( $postid );
		
		//Delete post
		if( WPF()->db->delete(WPF()->tables->posts,  array( 'postid' => $postid ), array( '%d' )) ){
			WPF()->db->delete(
				WPF()->tables->likes, array( 'postid' => $postid ), array( '%d' )
			);
			WPF()->db->delete(
				WPF()->tables->votes, array( 'postid' => $postid ), array( '%d' )
			);
			
			$answ_incr = '';
			$comm_incr = '';
			$layout = WPF()->forum->get_layout($post['forumid']);
			if($layout == 3){
				if($post['parentid']){
					$comm_incr = ', `comments` = IF( (`comments` - 1) < 0, 0, `comments` - 1 ) ';
				}else{
					$answ_incr = ', `answers` = IF( (`answers` - 1) < 0, 0, `answers` - 1 ) ';
				}
			}

			if( isset($post['parentid']) ){
			    if( !$post['is_first_post'] && $layout == 4 ){
			        if( $post['parentid'] == 0 ){
                        $replies = WPF()->db->get_results( "SELECT `postid` FROM `".WPF()->tables->posts."` WHERE `root` = " . wpforo_bigintval($postid), ARRAY_A );
                    } else {
                        $children = array();
                        $replies = $this->get_children( $postid, $children, true );
                    }
			        if( !empty( $replies ) ){
                        foreach( $replies as $reply ){
                            if( !in_array($reply['postid'], $exclude) ){
                                $exclude[] = $reply['postid'];
                                $this->delete( $reply['postid'], false, false , $exclude);
                            }
                        }
                    }
			    } elseif( $post['parentid'] != 0 ) {
                    WPF()->db->query("UPDATE `".WPF()->tables->posts."` SET `parentid` = " . wpforo_bigintval($post['parentid']) . " WHERE `parentid` = " . wpforo_bigintval($postid) );
                }
            }

			if( $rebuild_data ){
                if( !$post['is_first_post'] && $layout == 4 ){
                    WPF()->topic->rebuild_threads($post['topicid']);
                }
			    WPF()->topic->rebuild_first_last($post['topicid']);
                WPF()->topic->rebuild_stats($post['topicid']);
                WPF()->forum->rebuild_last_infos($post['forumid']);
                WPF()->forum->rebuild_stats($post['forumid']);
            }

			if( false !== WPF()->db->query( "UPDATE IGNORE `".WPF()->tables->profiles."` SET `posts` = IF( (`posts` - 1) < 0, 0, `posts` - 1 ) $answ_incr $comm_incr WHERE `userid` = " . wpforo_bigintval($post['userid']) ) ){
				WPF()->member->reset($post['userid']);
			}

			WPF()->notice->add('This post successfully deleted', 'success');

			do_action('wpforo_after_delete_post', $post);
			
			if( $post['is_first_post'] ) return WPF()->topic->delete($post['topicid']);
			if( $delete_cache ) wpforo_clean_cache('post', $postid, $post);
			return TRUE;
		}
		
		WPF()->notice->add('Post delete error', 'error');
		return FALSE;
	}
	
	#################################################################################
	/**
	 * array get_post(id(num)) 
	 * 
	 * Returns array from defined and default arguments.
	 *
	 * @since 1.0.0
	 *
	 * @return	array	
	 */
	function get_post( $postid, $protect = true ){
		
		$post = array();
		$cache = WPF()->cache->on('memory_cashe');
		
		if( $cache && isset(self::$cache['post'][$postid]) ){
			return self::$cache['post'][$postid];
		}
		
		$sql = "SELECT * FROM `".WPF()->tables->posts."` WHERE `postid` = " . wpforo_bigintval($postid);
		$post = WPF()->db->get_row($sql, ARRAY_A);

		if(!empty($post)) $post['userid'] = wpforo_bigintval($post['userid']);

		if( $protect ){
            if( isset($post['forumid']) && $post['forumid'] && !WPF()->perm->forum_can('vf', $post['forumid']) ){
                return array();
            }
            if( isset($post['status']) && $post['status'] && !wpforo_is_owner($post['userid'], $post['email'])){
                if( isset($post['forumid']) && $post['forumid'] && !WPF()->perm->forum_can('au', $post['forumid']) ){
                    return array();
                }
            }
        }
		
		if($cache && isset($postid)){
			self::$cache['post'][$postid] = $post;
		}
		
		$post = apply_filters('wpforo_get_post', $post);
		return $post;
	}
	
	/**
	 * get all posts based on provided arguments
	 *
	 * @since 1.0.0
	 *
	 * @param	array $args
	 * @param int $items_count
	 * @param bool $count
	 *
	 * @return 	array
	 */
	function get_posts($args = array(), &$items_count = 0, $count = true ){

		$cache = WPF()->cache->on('object_cashe');

		$default = array(
			'include'          => array(),        // array( 2, 10, 25 )
			'exclude'          => array(),        // array( 2, 10, 25 )
			'forumids'         => array(),
			'topicid'          => null,        // topic id in DB
			'forumid'          => null,        // forum id in DB
			'parentid'         => null,        // parent post id
			'root'             => null,        // root postid
			'userid'           => null,        // user id in DB
			'orderby'          => '`is_first_post` DESC, `created` ASC, `postid` ASC',    // forumid, order, parentid
			'order'            => '',            // ASC DESC
			'offset'           => null,        // this use when you give row_count
			'row_count'        => null,        // 4 or 1 ...
			'status'           => null,        // 0 or 1 ...
			'private'          => null,        // 0 or 1 ...
			'email'            => null,        // example@example.com ...
			'check_private'    => true,
			'where'            => null,
			'owner'            => null,
			'cache_type'       => 'sql',       // sql or args
			'limit_per_topic'  => null,
			'union_first_post' => false,
			'is_first_post'    => null,
			'is_answer'        => null,
            'threaded'         => false,
		);

        $request = $args;
		if( empty($args['orderby']) ) $args['order'] = '';

		$args = wpforo_parse_args( $args, $default );

        if( $args['row_count'] === 0 ) return array();
        if( $args['forumid'] && $args['check_private'] && !WPF()->perm->forum_can('vf', $args['forumid']) ) return array();
        if( strtoupper( $args['order'] ) != 'DESC' && strtoupper( $args['order'] ) != 'ASC' ) $args['order'] = '';
        if(!wpforo_root_exist() && !is_null($args['root']) ) { $args['parentid'] = $args['root']; $args['root'] = NULL; }

        $wheres = $this->get_posts_conditions( $args );

		$ordering = ( $args['orderby'] ? " ORDER BY " . esc_sql( $args['orderby'] . ' ' . $args['order'] ) : '' );
		$limiting = ( $args['row_count'] ? " LIMIT " . intval( $args['offset'] ) . "," . intval( $args['row_count'] ) : '' );

		if( $limit_per_topic = intval($args['limit_per_topic']) ){
			$sql = "SELECT SUBSTRING_INDEX( GROUP_CONCAT(`postid` ORDER BY `created` DESC), ',', " . $limit_per_topic . " ) postids
					FROM `".WPF()->tables->posts."` ".
			       ($wheres ? " WHERE " . implode(" AND ", $wheres) : '')
					." GROUP BY `topicid` ORDER BY MAX(`postid`) DESC " . $limiting;
			return WPF()->db->get_col($sql);
		} else {
			$sql = "SELECT * FROM `".WPF()->tables->posts."`";
			if(!empty($wheres)){
				$sql .= " WHERE " . implode(" AND ", $wheres);
			}
			if( $count ){
				$item_count_sql = preg_replace('#SELECT.+?FROM#isu', 'SELECT count(*) FROM', $sql, 1);
				if( $item_count_sql ) $items_count = WPF()->db->get_var($item_count_sql);
			}

			$sql .= $ordering . $limiting;

			if( $args['union_first_post'] && $args['topicid'] && !$args['parentid'] && $items_count > intval( $args['offset'] ) ){
				$sql = "( SELECT * FROM `".WPF()->tables->posts."` 
				WHERE `topicid` = ".wpforo_bigintval($args['topicid'])." 
				AND `is_first_post` = 1 ) 
				UNION 
				( " . $sql . " )";
			}

			if( $cache ){
                if( $args['cache_type'] == 'sql' ){
                    $object_key = md5( $sql . WPF()->current_user_groupid );
                    $object_cache = WPF()->cache->get($object_key);
                    if(!empty($object_cache)){
                        return $object_cache['items'];
                    }
                }
				if( $args['cache_type'] == 'args' ){
                    $hach = serialize($request);
                    $cache_args_key = md5( $hach . WPF()->current_user_groupid );
                    $object_cache = WPF()->cache->get($cache_args_key, 'loop', 'post');
                    if(!empty($object_cache)){
                        return $object_cache['items'];
                    }
                }
			}

			$posts = WPF()->db->get_results($sql, ARRAY_A);
			$posts = apply_filters('wpforo_get_posts', $posts);

			if( $args['check_private'] && !$args['forumid'] ){
				$posts = $this->access_filter( $posts, $args['owner'] );
			}

			if($cache && isset($object_key) && !empty($posts)){
				self::$cache['posts'][$object_key]['items'] = $posts;
				self::$cache['posts'][$object_key]['items_count'] = $items_count;
				if(isset($cache_args_key) && $args['cache_type'] == 'args' ){
					WPF()->cache->create_custom( $request, $posts, 'post', $items_count );
				}
			}
			return $posts;
		}
	}

	function get_posts_conditions( $args = array() ){

        $wheres = array();
        $table_as_prefix = '`'.WPF()->tables->posts.'`.';

        $args['include'] = wpforo_parse_args( $args['include'] );
        $args['exclude'] = wpforo_parse_args( $args['exclude'] );
        $args['forumids'] = wpforo_parse_args( $args['forumids'] );

        if(!empty($args['include'])) $wheres[] = $table_as_prefix . "`postid` IN(" . implode(',', array_map('wpforo_bigintval', $args['include'])) . ")";
        if(!empty($args['exclude'])) $wheres[] = $table_as_prefix . "`postid` NOT IN(" . implode(',', array_map('wpforo_bigintval', $args['exclude'])) . ")";
        if(!empty($args['forumids'])) $wheres[] = $table_as_prefix . "`forumid` IN(" . implode(',', array_map('intval', $args['forumids'])) . ")";

        if(!is_null($args['topicid']))       $wheres[] = $table_as_prefix . "`topicid` = " . wpforo_bigintval($args['topicid']);
        if(!is_null($args['parentid']))      $wheres[] = $table_as_prefix . "`parentid` = " . wpforo_bigintval($args['parentid']);
        if(!is_null($args['root']))          $wheres[] = $table_as_prefix . "`root` = " . wpforo_bigintval($args['root']);
        if(!is_null($args['userid']))        $wheres[] = $table_as_prefix . "`userid` = " . wpforo_bigintval($args['userid']);
        if(!is_null($args['status']))        $wheres[] = $table_as_prefix . "`status` = " . intval( (bool) $args['status']);
        if(!is_null($args['private']))       $wheres[] = $table_as_prefix . "`private` = " . intval( (bool) $args['private']);
        if(!is_null($args['is_first_post'])) $wheres[] = $table_as_prefix . "`is_first_post` = " . intval( (bool) $args['is_first_post']);
        if(!is_null($args['is_answer']))     $wheres[] = $table_as_prefix . "`is_answer` = " . intval( (bool) $args['is_answer']);
        if(!is_null($args['email']))         $wheres[] = $table_as_prefix . "`email` = '" . esc_sql($args['email']) . "' ";
        if(!is_null($args['where']))         $wheres[] = $table_as_prefix . $args['where'];

        if(wpfval($args, 'forumid') && $args['check_private']){

            /////Check "View Reply" Access//////////////////////////////
            if( !WPF()->perm->forum_can('vr', $args['forumid']) ){
                $wheres[] = $table_as_prefix . " `is_first_post` = 1";
            }

            /////Check Unapproved Post Access////////////////////////////
            if( WPF()->perm->forum_can('au', $args['forumid']) ){
                //Check "Can Approve/Unapprove Posts" Access (View Unapproved Posts)
                if(!is_null($args['status'])) $wheres[] = $table_as_prefix . " `status` = " . intval($args['status']);
            }
            elseif( WPF()->current_userid ){
                //Allow Users see own unapproved posts
                $wheres[] = " ( " . $table_as_prefix .  "`status` = 0 OR (" . $table_as_prefix .  "`status` = 1 AND " . $table_as_prefix .  "`userid` = " .intval(WPF()->current_userid). ") )";
            }
            elseif( WPF()->current_user_email ){
                //Allow Guests see own unapproved posts
                $wheres[] = " ( " . $table_as_prefix .  "`status` = 0 OR (" . $table_as_prefix .  "`status` = 1 AND " . $table_as_prefix .  "`email` = '" . sanitize_email(WPF()->current_user_email) . "') )";
            }
            else{
                //If doesn't have "Can Approve/Unapprove Posts" access and not Owner, only return approved posts
                $wheres[] = " " . $table_as_prefix .  "`status` = 0";
            }
        }
        return $wheres;
    }

    function access_filter( $posts, $owner = NULL ){
	    if( !empty($posts) ){
            foreach($posts as $key => $post){
                if(!$this->access($post, $owner)) unset($posts[$key]);
            }
        }
        return $posts;
    }


	function access( $post, $owner = NULL ){
		if( isset($post['forumid']) && !WPF()->perm->forum_can('vf', $post['forumid']) ){
			return false;
		}
		if( isset($post['forumid']) && !wpfval($post, 'is_first_post') && !WPF()->perm->forum_can('vr', $post['forumid']) ){
			return false;
		}
		if( isset($post['forumid']) && isset($post['private']) && $post['private'] && !$owner ){
			if(!WPF()->perm->forum_can('vp', $post['forumid'])){
				if(is_null($owner)){
					$topic_userid = wpforo_topic($post['topicid'], 'userid');
					if(!wpforo_is_owner($topic_userid) && !wpforo_is_owner($post['userid'])){
						return false;
					}
				}else{
					return false;
				}
			}
		}
		if( isset($post['forumid']) && isset($post['status']) && $post['status'] && !wpforo_is_owner($post['userid'], $post['email']) ){
			if( !WPF()->perm->forum_can('au', $post['forumid']) ){
				return false;
			}
		}
		return true;
	}


    function replies( array $posts, $topic = array(), $forum = array(), $level = 0 ) {
        $level++;
        if( function_exists('wpforo_thread_reply') ){
            if( wpfval($posts, 'posts') ){
                $key = key($posts['posts']);
                $parentid = (wpfval($posts, 'posts', $key,'parentid')) ? $posts['posts'][$key]['parentid'] : 0;
                $max_level = $this->options['layout_threaded_nesting_level'];
                if( !$max_level ){
                    $class = ( $level > 1 ) ? '' : ' level-1';
                } elseif( $level > ( $max_level + 1 ) ) {
                    $class = '';
                } else {
                    $class = ' level-' . $level;
                }
                echo '<div id="wpf-post-replies-'.intval($parentid).'" class="wpf-post-replies '. $class .'">';
                foreach ( $posts['posts'] as $post ) {
                    $parents = ( wpfval($posts, 'parents') ) ? $posts['parents'] : array();
                    wpforo_thread_reply( $post, $topic, $forum, $level, $parents );
                    if ( !empty($post['children']) ) {
                        $posts['posts'] = $post['children'];
                        $this->replies($posts, $topic, $forum, $level );
                    }
                }
                echo '</div>';
            }
        } else{
            wpforo_phrase('Function wpforo_thread_reply() not found.');
        }
    }

	function get_thread_tree( $post, $parents = true ){

        if(!wpfval($post, 'postid') || (wpfkey($post, 'root') && $post['root'] == -1) ) {
            return array('posts' => array(), 'parents' => array(), 'count' => 0, 'children' => '' );
        }

        $items = array();
        $thread = array();
        $parentid = $post['postid'];
        $type = apply_filters('wpforo_thread_builder_type', 'topic-query'); //'topic-query', 'inside-mysql', 'multi-query'
        if( $type == 'topic-query' ) {
            if( wpfval($post, 'topicid') ){
                $args = array( 'root' => $post['postid'], 'orderby' => '`created` ASC' );
                $posts = $this->get_posts( $args, $items_count, false);
                if( empty($posts) ){
                    $args = array( 'topicid' => $post['topicid'], 'orderby' => '`created` ASC' );
                    $posts = $this->get_posts( $args, $items_count, false);
                }
                if( !empty($posts) ){
                    foreach( $posts as $post ){
                        $items[$post['postid']] = $post;
                    }
                    $thread = $this->build_thread_data( $parentid, $items );
                }
            }
        }
        elseif( $type == 'inside-mysql' ){
            $mod = ( wpforo_current_user_is('admin') || wpforo_current_user_is('moderator') ) ? true : false;
            $sql = "SELECT GROUP_CONCAT( @id :=  ( SELECT  GROUP_CONCAT(postid,'-', parentid, '-', userid, '-', status, '-', email)  FROM  `" . WPF()->tables->posts . "` WHERE   parentid = @id ) ) AS tree
                          FROM ( SELECT  @id := " . intval($parentid) . " ) vars STRAIGHT_JOIN `" . WPF()->tables->posts . "` WHERE @id IS NOT NULL";
            if( $posts = WPF()->db->get_var($sql) ){
                $posts = explode(',', $posts);
                if(!empty($posts)){
                    foreach($posts as $post) {
                        $post = explode('-', $post);
                        if( !$mod && isset($post[3]) && $post[3] ){
                            if( isset($post[2]) && isset($post[4]) && ( isset(WPF()->current_user['ID']) || isset(WPF()->current_user['user_email']) ) ){
                                if( WPF()->current_user['ID'] != $post[2] && WPF()->current_user['user_email'] != $post[4] ) continue;
                            }
                        }
                        if( isset($post[0]) && isset($post[1]) ){
                            $items[$post[0]] = array('postid' => $post[0], 'parentid' => $post[1]);
                        }
                    }
                    $thread = $this->build_thread_data( $parentid, $items );
                }
            }
        }
        elseif( $type == 'multi-query' ) {
            $mod = ( wpforo_current_user_is('admin') || wpforo_current_user_is('moderator') ) ? true : false;
            $items = $this->get_children( $parentid, $children, $mod );
            $thread = $this->build_thread_data( $parentid, $items );
        }
        return $thread;
    }

    function build_thread_data( $parentid, $items = array(), $count = 0 ){

        $parents = array();
        $thread = array('posts' => array(), 'parents' => array(), 'count' => 0, 'children' => '' );

        if( !empty($items) ){
            foreach( $items as $item ){
                $parents[$item['postid']] = $this->parents( $item['postid'], $items );
            }
            if( !empty($parents) ) $thread['parents'] = $parents;
            $thread['posts'] = $this->build_thread_tree( $parentid, $items );
            $children = $this->children( $parentid, $thread['posts']);
            $thread['count'] = count($children);
            $thread['children'] = array_keys($children);
        }
        return $thread;
    }

    function build_thread_tree( $parentid = 0, array $posts ) {
        $tree = array();
        foreach ( $posts as $post ) {
            if ($post['parentid'] == $parentid) {
                $children = $this->build_thread_tree( $post['postid'], $posts );
                if ($children) {
                    $post['children'] = $children;
                }
                $tree[] = $post;
            }
        }
        return $tree;
    }

    function root( $postid, $parentid = NULL ){
        if( !$postid ) return 0;
        $parents = $this->get_parents( $postid, $parentid );
        $root = array_pop($parents);
        return intval($root);
    }

    function get_root( $postid ){
	    if( !$postid || !wpforo_root_exist() ) return $postid;
        $root = WPF()->db->get_var("SELECT `root` FROM `" . WPF()->tables->posts . "` WHERE  `postid` = " . intval($postid) );
        if( !is_null($root) && ( $root <= 0 || $root == $postid ) ){
            $root = $postid;
        } else {
            $root = $this->root( $postid );
        }
        return $root;
	}

    function parents( $postid, $posts, $parents = array() ) {
	    if( !empty($posts) ){
	        if( isset($posts[$postid]) ){
                $parentid = wpfval($posts[$postid], 'parentid') ? $posts[$postid]['parentid'] : 0;
                if ($parentid > 0) {
                    array_unshift($parents, $parentid);
                    return $this->parents($parentid, $posts, $parents);
                }
            }
        }
        return $parents;
    }

    function get_parents( $postid, $parentid = NULL, &$parents = array(), $mod = false ) {
        if( $postid ){
            $status = ( !$mod ) ? ' AND `status` = 0 ': '';
            if( is_null($parentid) ){
                $where = "`postid` = " . intval($postid);
            } else {
                $where = "`postid` = " . intval($parentid);
            }
            if( $parentid === 0 ) {
                return $parents;
            } else {
                $post = WPF()->db->get_row("SELECT `postid`, `parentid` FROM `" . WPF()->tables->posts . "` WHERE  " . $where .  $status, ARRAY_A );
                if( wpfval($post, 'parentid') ){
                    $parents[ $post['postid'] ] = $post['parentid'];
                    $this->get_parents( $post['postid'], $post['parentid'], $parents, $mod );
                }
            }
        }
        return $parents;
    }

    function children( $parentid, $posts, &$children = array() ){
        if( $parentid ){
            if( !empty($posts) ){
                foreach( $posts as $post ){
                    $children[ $post['postid'] ] = array('postid' => $post['postid'], 'parentid' => $post['parentid']);
                    if( isset($post['children']) ) $this->children($post['postid'], $post['children'], $children);
                }
            }
        }
        return $children;
    }

    function get_children( $parentid, &$children = array(), $mod = false ){
	    if( $parentid ){
            $status = ( !$mod ) ? ' AND `status` = 0 ': '';
            $posts = WPF()->db->get_results("SELECT `postid`, `parentid` FROM `" . WPF()->tables->posts . "` FORCE INDEX (PRIMARY) WHERE `parentid` = " . intval($parentid) ." " . $status, ARRAY_A );
            if( !empty($posts) ){
                foreach( $posts as $post ){
                    $children[ $post['postid'] ] = array('postid' => $post['postid'], 'parentid' => $post['parentid']) ;
                    $this->get_children( $post['postid'], $children, $mod );
                }
            }
	    }
	    return $children;
    }

    function get_root_replies_count( $postid ){
	    if( $postid && wpforo_root_exist() ) {
	        return WPF()->db->get_var("SELECT COUNT(*) FROM `" . WPF()->tables->posts . "` WHERE `root` = " . intval($postid) );
        } else {
            return WPF()->db->get_var("SELECT COUNT(*) FROM `" . WPF()->tables->posts . "` WHERE `parentid` = " . intval($postid) );
        }
    }

	function get_posts_filtered( $args = array() ){
		$posts = $this->get_posts( $args, $items_count, false );
		if( !empty($posts) ){
			foreach($posts as $key => $post){
				if( isset($post['forumid']) && !WPF()->perm->forum_can('vf', $post['forumid']) ){
					unset($posts[$key]);
				}
				if( isset($posts[$key]) && isset($post['forumid']) && isset($post['private']) && $post['private'] && !wpforo_is_owner($post['userid'], $post['email']) ){
					if( !WPF()->perm->forum_can('vp', $post['forumid']) ){
						unset($posts[$key]);
					}
				}
				if( isset($posts[$key]) && isset($post['forumid']) && isset($post['status']) && $post['status'] && !wpforo_is_owner($post['userid'], $post['email']) ){
					if( !WPF()->perm->forum_can('au', $post['forumid']) ){
						unset($posts[$key]);
					}
				}
			}
		}
		return $posts;
	}
	
	function search( $args = array(), &$items_count = 0 ){
		if(!is_array($args)) $args = array('needle' => $args);

		$default = array( 
		  'needle'		=> '', 		 		 // search needle
		  'forumids' 	=> array(), 		 // array( 2, 10, 25 )
		  'date_period'	=> 0,				 // topic id in DB
		  'type'		=> 'entire-posts',	 // search type ( entire-posts | titles-only | user-posts | user-topics | tag )
		  'orderby'		=> 'relevancy',      // Sort Search Results by ( relevancy | date | user | forum )
		  'order'		=> 'DESC', 			 // Sort Search Results ( ASC | DESC )
		  'offset' 		=> NULL,			 // this use when you give row_count
		  'row_count'	=> NULL 			 // 4 or 1 ...
		);
		
		$args = wpforo_parse_args( $args, $default );

		$args['order'] = strtoupper($args['order']);
		if( !in_array($args['order'], array('ASC', 'DESC')) ) $args['order'] = 'DESC';

		$date_period = intval($args['date_period']);

		$fa = "p";
		$from = "`".WPF()->tables->posts."` " . $fa;
		$selects = array($fa.'.`postid`', $fa.'.`topicid`', $fa.'.`private`', $fa.'.`status`', $fa.'.`forumid`', $fa.'.`userid`', $fa.'.`title`', $fa.'.`created`', $fa.'.`body`', $fa.'.`is_first_post`' );
		$innerjoins = array();
		$wheres = array();
		$orders = array();

		if($args['forumids']) $wheres[] = $fa.".`forumid` IN(" . implode(', ', array_map('intval', $args['forumids'])) . ")";
		if( $date_period != 0 ){
			$date = date( 'Y-m-d H:i:s', current_time( 'timestamp', 1 ) - ($date_period * 24 * 60 * 60) );
			if($date) $wheres[] = $fa.".`created` > '".esc_sql($date)."'";
		}

		if($args['needle']){
			$needle = trim( trim( str_replace(' ', '* ', $args['needle']) ), '*' ) . "*";
			$needle = esc_sql(substr(sanitize_text_field($needle), 0, 60));

			if($args['type'] === 'entire-posts'){
				$selects[] = "MATCH(".$fa.".`title`) AGAINST('$needle' IN BOOLEAN MODE) + MATCH(".$fa.".`body`) AGAINST('$needle' IN BOOLEAN MODE) AS matches";
				$wheres[] = "( MATCH(".$fa.".`title`, ".$fa.".`body`) AGAINST('$needle' IN BOOLEAN MODE) )";
				$orders[] = "MATCH(".$fa.".`title`) AGAINST('$needle') + MATCH(".$fa.".`body`) AGAINST('$needle')";
				$orders[] = "MATCH(".$fa.".`title`) AGAINST('$needle' IN BOOLEAN MODE) + MATCH(".$fa.".`body`) AGAINST('$needle' IN BOOLEAN MODE)";
			}elseif($args['type'] === 'titles-only'){
				$selects[] = "MATCH(".$fa.".`title`) AGAINST('$needle' IN BOOLEAN MODE) AS matches";
				$wheres[] = "( MATCH(".$fa.".`title`) AGAINST('$needle' IN BOOLEAN MODE) )";
				$orders[] = "MATCH(".$fa.".`title`) AGAINST('$needle')";
				$orders[] = "MATCH(".$fa.".`title`) AGAINST('$needle' IN BOOLEAN MODE)";
			}elseif($args['type'] === 'user-posts' || $args['type'] === 'user-topics'){
                $needle = str_replace('*', '%', $needle);
			    $innerjoins[] = "INNER JOIN `".WPF()->db->users."` u ON u.`ID` = ".$fa.".`userid`";
				$wheres[] = "( u.`user_nicename` LIKE '$needle' OR u.`display_name` LIKE '$needle' )";
				if($args['type'] === 'user-topics') $wheres[] = "".$fa.".`is_first_post` = 1";
			}elseif($args['type'] === 'tag'){
                $needle = str_replace('*', '', $needle);
                $fa = "t";
				$from = "`".WPF()->tables->topics."` " . $fa;
				$selects = array($fa.'.`first_postid` AS postid', $fa.'.`topicid`', $fa.'.`private`', $fa.'.`status`', $fa.'.`forumid`', $fa.'.`userid`', $fa.'.`title`', $fa.'.`created`', '1 AS `is_first_post`');
				$innerjoins = array();
                $wheres = array( "( ".$fa.".`tags` LIKE '%{$needle}%' )" );
            }
		}

		if($args['orderby'] === 'date'){
			$orders = array($fa.'.`created`');
		}elseif($args['orderby'] === 'user'){
			$orders = array($fa.'.`userid`');
		}elseif($args['orderby'] === 'forum'){
			$orders = array($fa.'.`forumid`');
		}

		$sql = "SELECT COUNT(*) FROM ". $from ." ".implode(' ', $innerjoins);
		if($wheres) $sql .= " WHERE " . implode( " AND ", $wheres );
		if( $this->options['search_max_results'] ) $sql .= " LIMIT " . $this->options['search_max_results'];
		$items_count = WPF()->db->get_var($sql);

		$sql = "SELECT ".implode(', ', $selects)." FROM ". $from ." ".implode(' ', $innerjoins);
		if($wheres) $sql .= " WHERE " . implode( " AND ", $wheres );
		if($orders) $sql .= " ORDER BY ".implode(' '.$args['order'].', ', $orders)." ".$args['order'];

		if( $this->options['search_max_results'] ) $sql = "SELECT * FROM (".$sql." LIMIT ". $this->options['search_max_results'] .") AS p";

		if( $args['row_count'] ) $sql .= " LIMIT ". intval($args['offset']) ."," . intval($args['row_count']);

		$posts = WPF()->db->get_results($sql, ARRAY_A);
		foreach($posts as $key => $post){
			if( !WPF()->perm->forum_can( 'vf', $post['forumid'] ) ) unset($posts[$key]);
			if( !WPF()->perm->forum_can( 'vt', $post['forumid'] ) ) unset($posts[$key]);
			if( !$post['is_first_post'] && !WPF()->perm->forum_can( 'vr', $post['forumid'] ) ) unset($posts[$key]);
			if( $post['private'] && !WPF()->perm->forum_can( 'vp', $post['forumid'] ) ) unset($posts[$key]);
			if( $post['status'] && !WPF()->perm->forum_can( 'au', $post['forumid'] ) ) unset($posts[$key]);
		}
		return $posts;
	}
	
	/**
	 *  return likes count by post id
	 * 
	 * Return likes count 
	 *
	 * @since 1.0.0
	 *
	 * @param	int 
	 *
	 * @return	int
	 */
	function get_post_likes_count($postid){
		return WPF()->db->get_var( WPF()->db->prepare( "SELECT COUNT(`likeid`) FROM `".WPF()->tables->likes."` WHERE `postid` = %d", $postid ) );
	}
	
	/**
	 *  return usernames who likes this post
	 * 
	 * Return array with username
	 *
	 * @since 1.0.0
	 *
	 * @param	int
	 *
	 * @return	array
	 */
	function get_likers_usernames($postid){
		return WPF()->db->get_results("SELECT u.ID, u.display_name FROM `".WPF()->tables->likes."` l, `".WPF()->db->users."` u WHERE `l`.`userid` = `u`.ID AND `l`.`postid` = ".intval($postid)." ORDER BY l.`userid` = " . intval(WPF()->current_userid) . " DESC, l.`likeid` DESC LIMIT 3", ARRAY_A);
	}
	
	/**
	 *  return like ID or null
	 * 
	 * @since 1.0.0
	 *
	 * @param	int int
	 *
	 * @return null or like id
	 */
	function is_liked($postid, $userid){
		$returned_value = WPF()->db->get_var("SELECT likeid FROM `".WPF()->tables->likes."` WHERE `postid` = ".intval($postid)." AND `userid` = ".intval($userid) );
		if(is_null($returned_value)){
			return FALSE;	
		}else{
			return $returned_value;
		}
	}
	
	/**
	 *  return votes sum by post id
	 * 
	 * Return votes count 
	 *
	 * @since 1.0.0
	 *
	 * @param	int 
	 *
	 * @return	int
	 */
	function get_post_votes_sum($postid){
		$sum = WPF()->db->get_var("SELECT sum(`reaction`) FROM `".WPF()->tables->votes."` WHERE `postid` = ".intval($postid) );
		if($sum == null){
			$sum = 0;
		}
		return $sum;
	}
	
	
	/**
	 *  return forum slug
	 * 
	 * string (slug)
	 *
	 * @since 1.0.0
	 *
	 * @param	int
	 *
	 * @return	string or false
	 */
	 
	function get_forumslug_byid($postid){
		
		$cache = WPF()->cache->on('memory_cashe');
		
		if( $cache && isset(self::$cache['forum_slug'][$postid]) ){
			return self::$cache['forum_slug'][$postid];
		}
		
		$slug = WPF()->db->get_var("SELECT `slug` FROM ".WPF()->tables->forums." WHERE `forumid` =(SELECT forumid FROM `".WPF()->tables->topics."` WHERE `topicid` =(SELECT `topicid` FROM `".WPF()->tables->posts."` WHERE postid = ".intval($postid)."))");
		
		if($cache && isset($postid)){
			self::$cache['forum_slug'][$postid] = $slug;
		}
		
		if($slug){
			return $slug;
		}else{
			return FALSE;
		}
	}
	
	
	/**
	 *  return topic slug
	 * 
	 * string (slug)
	 *
	 * @since 1.0.0
	 *
	 * @param	int
	 *
	 * @return	string or false
	 */
	 
	function get_topicslug_byid( $postid ){
		
		$cache = WPF()->cache->on('memory_cashe');
		
		if( $cache && isset(self::$cache['topic_slug'][$postid]) ){
			return self::$cache['topic_slug'][$postid];
		}
		
		$slug = WPF()->db->get_var("SELECT `slug` FROM ".WPF()->tables->topics." WHERE `topicid` =(SELECT `topicid` FROM `".WPF()->tables->posts."` WHERE postid = ".intval($postid).")");
		
		if($cache && isset($postid)){
			self::$cache['topic_slug'][$postid] = $slug;
		}
		
		if($slug){
			return $slug;
		}else{
			return FALSE;
		}
	}

	/**
	 * return post full url by id
	 *
	 * @since 1.0.0
	 *
	 * @param mixed $arg
	 * @param bool $absolute
	 *
	 * @return string $url
	 */
	function get_post_url( $arg, $absolute = true ) {
		if ( isset( $arg ) && ! is_array( $arg ) ) {
			$postid = wpforo_bigintval( $arg );
			$post   = $this->get_post( $postid );
		} elseif ( ! empty( $arg ) && isset( $arg['postid'] ) ) {
			$post   = $arg;
			$postid = $post['postid'];
		}

		if ( ! empty( $post ) && is_array( $post ) && !empty($postid) ) {

		    $forum_slug = (wpfval($post, 'forumid')) ? wpforo_forum($post['forumid'], 'slug') : $this->get_forumslug_byid( $postid );
			$topic_slug = (wpfval($post, 'topicid')) ? wpforo_topic($post['topicid'], 'slug') : $this->get_topicslug_byid( $postid );

			$url = $forum_slug . '/' . $topic_slug;

			if ( $post['topicid'] ) {
				$layout = WPF()->forum->get_layout( $post['forumid'] );
				$pid = $postid;
				if ( $post['parentid'] ) {
					switch ( $layout ) {
						case 3:
							$pid = $post['parentid'];
							break;
						case 4:
							$pid = $post['root'];
							break;
					}
				}

				$where = "";
				$orderby = "`is_first_post` DESC, `created` ASC, `postid` ASC";
				if ( $layout == 3 ) {
					$where   .= " AND NOT p.`parentid` ";
					$orderby = "`is_first_post` DESC, `is_answer` DESC, `votes` DESC, `created` ASC, `postid` ASC";
				} elseif ( $layout == 4 ) {
					$where   .= " AND NOT p.`parentid` ";
				}

				if ( ! wpforo_current_user_is( 'admin' ) && ! wpforo_current_user_is( 'moderator' ) && ! WPF()->perm->forum_can( 'au', $post['forumid'] ) ) {
					if ( WPF()->current_userid ) {
						$where .= " AND ( p.`status` = 0 OR (p.`status` = 1 AND p.`userid` = %d) ) ";
						$where = WPF()->db->prepare( $where, WPF()->current_userid );
					} elseif ( WPF()->current_user_email ) {
						$where .= " AND ( p.`status` = 0 OR (p.`status` = 1 AND p.`email` = %s) ) ";
						$where = WPF()->db->prepare( $where, sanitize_email( WPF()->current_user_email ) );
					} else {
						$where .= " AND NOT p.`status` ";
					}
				}

				$sql = "SELECT tmp_view.`rownum` FROM
							(SELECT @rownum := @rownum + 1 AS rownum, p.`postid`
								FROM `" . WPF()->tables->posts . "` p
								CROSS JOIN ( SELECT @rownum := 0 ) AS init_var
								WHERE p.`topicid` = %d
								" . $where . "
								ORDER BY " . $orderby . ") AS tmp_view
						WHERE tmp_view.`postid` = %d";
				$position = wpforo_bigintval( WPF()->db->get_var( WPF()->db->prepare($sql, $post['topicid'], $pid) ) );

				$items_per_page = $this->get_option_items_per_page($layout);

				if ( $position <= $items_per_page ) {
					return wpforo_home_url( $url, false, $absolute ) . "#post-" . wpforo_bigintval( $postid );
				}
				if ( $position && $items_per_page ) {
					$paged = ceil( $position / $items_per_page );
				} else {
					$paged = 1;
				}

				return wpforo_home_url( $url . "/" . WPF()->tpl->slugs['paged'] . "/" . $paged, false, $absolute ) . "#post-" . wpforo_bigintval( $postid );
			}
		}

		return wpforo_home_url();
	}


	/**
	 *
	 * @since 1.0.0
	 *
	 * @param int $postid
	 *
	 * @return int
	 */
	function is_answered( $postid ) {
		$is_answered = WPF()->db->get_var( WPF()->db->prepare(
			" SELECT is_answer 
				FROM `" . WPF()->tables->posts . "`
				WHERE postid = %d
			",
			$postid
		) );

		return $is_answered;
	}

    function is_approved( $postid ){
        $post = WPF()->db->get_var( "SELECT `status` FROM ".WPF()->tables->posts." WHERE `postid` = " . intval($postid) );
        if( $post ) return FALSE;
        return TRUE;
    }

	function get_count( $args = array() ){
		$sql = "SELECT SQL_NO_CACHE COUNT(*) FROM `".WPF()->tables->posts."`";
		if($args && is_array($args)){
			$wheres = array();
			foreach ($args as $key => $value)  $wheres[] = "`$key` = '" . esc_sql($value) . "'";
			if($wheres) $sql .= " WHERE " . implode(' AND ', $wheres);
		}
		return WPF()->db->get_var($sql);
	}
	
	function unapproved_count(){
		return WPF()->db->get_var( "SELECT COUNT(*) FROM `".WPF()->tables->posts."` WHERE `status` = 1" );
	}
	
	function get_attachment_id( $filename ){
		$attach_id =  WPF()->db->get_var( "SELECT `post_id` FROM `".WPF()->db->postmeta."` WHERE `meta_key` = '_wp_attached_file' AND `meta_value` LIKE '%" . esc_sql($filename) . "' LIMIT 1");
		return $attach_id;
	}
	
	function delete_attachments( $postid ){
		$post = $this->get_post($postid);
		if( isset($post['body']) && $post['body'] ){
			if( preg_match_all('|\/wpforo\/default_attachments\/([^\s\"\]]+)|is', $post['body'], $attachments, PREG_SET_ORDER) ){
				$upload_dir = wp_upload_dir();
                $default_attachments_dir = $upload_dir['basedir'] . '/wpforo/default_attachments/';
				foreach( $attachments as $attachment ){
					$filename = trim($attachment[1]);
					$file = $default_attachments_dir . $filename;
					if( file_exists($file) ){
						$posts = WPF()->db->get_var( "SELECT COUNT(*) as posts FROM `".WPF()->tables->posts."` WHERE `body` LIKE '%" . esc_sql( $attachment[0] ) . "%'" );
						if( is_numeric($posts) && $posts == 1 ){
							$attachmentid = $this->get_attachment_id( '/' . $filename  );
							if ( !wp_delete_attachment( $attachmentid ) ){
								@unlink($file); 
							}
						}
					}
				}
			}
		}
	}

	public function status( $postid, $status ){

	    if( !$postid = wpforo_bigintval($postid) ) return false;
        if( !$post = $this->get_post( $postid, false ) ) return false;

        if( $post['is_first_post'] ) {
            WPF()->topic->status($post['topicid'], $status);
        }

        if( false !== WPF()->db->update(
            WPF()->tables->posts,
            array( 'status' => intval($status) ),
            array( 'postid' => $postid ),
            array( '%d' ),
            array( '%d' )
        )){
            if( $status ){
                $this->last_post($post, 'remove');
                do_action( 'wpforo_post_unapprove', $post );
			} else {
                $this->last_post($post, 'add');
                do_action( 'wpforo_post_approve', $post );
			}

            do_action( 'wpforo_post_status_update', $postid, $status );
            wpforo_clean_cache('topic', $postid, $post);
			WPF()->notice->add('Done!', 'success');
            return true;
        }

        WPF()->notice->add('error: Change Status action', 'error');
        return false;
    }

	public function last_post($post, $action = 'add'){
	    if( is_numeric($post) ) $post = $this->get_post($post, false);
		if( !empty($post) && isset($post['postid']) && isset($post['topicid']) && isset($post['forumid']) && isset($post['userid']) ) {
            if( $action == 'add' ){
	            $answ_incr = '';
	            $comm_incr = '';
	            if ( WPF()->forum->get_layout($post) == 3 ) {
		            if ( $post['parentid'] ) {
			            $comm_incr = ', `comments` = `comments` + 1 ';
		            } else {
			            $answ_incr = ', `answers` = `answers` + 1 ';
		            }
	            }
	            WPF()->db->query( "UPDATE `" . WPF()->tables->profiles . "` SET `posts` = `posts` + 1 $answ_incr $comm_incr WHERE `userid` = " . wpforo_bigintval( $post['userid'] ) );

	            $topic = WPF()->topic->get_topic($post['topicid']);
                WPF()->topic->rebuild_first_last($topic);
                WPF()->topic->rebuild_stats($topic);
                WPF()->forum->rebuild_last_infos($post['forumid']);
                WPF()->forum->rebuild_stats($post['forumid']);
            } elseif( $action == 'remove' ) {
	            $comm_incr = '';
	            $answ_incr = '';
	            $layout = WPF()->forum->get_layout($post);
	            if($layout == 3){
		            if($post['parentid']){
			            $comm_incr = ', `comments` = IF( (`comments` - 1) < 0, 0, `comments` - 1 ) ';
		            }else{
			            $answ_incr = ', `answers` = IF( (`answers` - 1) < 0, 0, `answers` - 1 ) ';
		            }
	            }
	            WPF()->db->query( "UPDATE IGNORE `".WPF()->tables->profiles."` SET `posts` = IF( (`posts` - 1) < 0, 0, `posts` - 1 ) $answ_incr $comm_incr WHERE `userid` = " . wpforo_bigintval($post['userid']) );

                $excerpt = ($post['is_first_post']) ? ' AND `topicid` != ' . intval($post['topicid']) . ' ' : ' AND `postid` != ' . intval($post['postid']) . ' ';
                $last_topic_post = WPF()->db->get_row("SELECT * FROM `".WPF()->tables->posts."` WHERE `topicid` = " . intval($post['topicid']) . " AND `postid` != " . intval($post['postid']) . " AND `status` = 0 AND `private` = 0 ORDER BY `created` DESC, `postid` DESC LIMIT 1", ARRAY_A);
                $last_forum_post = WPF()->db->get_row("SELECT * FROM `".WPF()->tables->posts."` WHERE `forumid` = " . intval($post['forumid']) . " " . $excerpt . " AND `status` = 0 AND `private` = 0 ORDER BY `created` DESC, `postid` DESC LIMIT 1", ARRAY_A);
                if( !empty($last_topic_post) && !$last_topic_post['is_first_post'] ) {
                    $answers = ( !$last_topic_post['parentid'] ) ? ', `answers` = `answers` - 1 ' : '';
                    WPF()->db->query("UPDATE `".WPF()->tables->topics."` SET `last_post` = " . intval($last_topic_post['postid']) . ", `modified` = '" . esc_sql($last_topic_post['created']) . "', `posts` = `posts` - 1 " . $answers . " WHERE `topicid` = " . intval($post['topicid']) );
                }
                if( !empty($last_forum_post) ) {
                    $topics =  ( $last_forum_post['is_first_post'] ) ? ', `topics` = `topics` - 1 ' : '';
                    WPF()->db->query("UPDATE `".WPF()->tables->forums."` SET `last_post_date` = '" . esc_sql($last_forum_post['created']) . "', `last_userid` = " . intval($last_forum_post['userid']). ", `last_topicid` = " . intval($last_forum_post['topicid']) . ", `last_postid` = " . intval($last_forum_post['postid']) . ", `posts` = `posts` - 1 " . $topics . " WHERE `forumid` = " . intval($last_forum_post['forumid']) );
                } else {
                    WPF()->db->query("UPDATE `".WPF()->tables->forums."` SET `last_post_date` = '0000-00-00 00:00:00', `last_userid` = 0, `last_topicid` = 0, `last_postid` = 0, `posts` = 0, `topics` = 0 WHERE `forumid` = " . intval($post['forumid']) );
                }
            }

			WPF()->member->reset($post['userid']);
		}
	}

	public function get_liked_posts( $args = array(), &$items_count ){

	    $default = array(
            'userid'		=> NULL,
            'order'		    => 'DESC',
            'offset' 		=> NULL,
            'row_count'	    => NULL,
            'where'		    => NULL,
            'var'           => NULL
        );

        $posts = array();
        if(!wpfval($args, 'userid')) return array();
        $args = wpforo_parse_args( $args, $default );
        if(is_array($args) && !empty($args)){
            extract($args, EXTR_OVERWRITE);
            if( $row_count === 0 ) return array();
            $items_count = WPF()->db->get_var("SELECT COUNT(*) FROM `".WPF()->tables->likes."` WHERE `userid` = " . intval($userid) );
            $liked_posts = WPF()->db->get_col("SELECT `postid` FROM `".WPF()->tables->likes."` WHERE `userid` = " . intval($userid) ." ORDER BY `likeid` " . esc_sql($order) . " LIMIT " . intval($offset) . ", " . intval($row_count));
            if(empty($liked_posts)){
                $items_count = WPF()->db->get_var("SELECT COUNT(*) FROM `".WPF()->tables->votes."` WHERE `userid` = " . intval($userid) );
                $liked_posts = WPF()->db->get_col("SELECT `postid` FROM `".WPF()->tables->votes."` WHERE `userid` = " . intval($userid) ." AND `reaction` = 1 ORDER BY `voteid` " . esc_sql($order) . " LIMIT " . intval($offset) . ", " . intval($row_count));
            }
            if(!empty($liked_posts)){
                if($var == 'postid'){
                    return $liked_posts;
                }
                else{
                    $liked_posts = implode(',', $liked_posts);
                    $post_args = array( 'include' => $liked_posts, 'status' => 0, 'private' => 0 );
                    $posts = $this->get_posts( $post_args );
                }
            }
        }
        return $posts;
	}


}