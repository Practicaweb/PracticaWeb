<?php
	// Exit if accessed directly
	if( !defined( 'ABSPATH' ) ) exit;
 
class wpForoPhrase{
	public $phrases;
	public $__phrases;

	public function __construct(){}

    public function init(){
        if( WPF()->is_installed() ) {
            if ( $phrases = $this->get_phrases() ) {
                foreach ($phrases as $phrase) {
                    $this->phrases[addslashes(strtolower($phrase['phrase_key']))] = $phrase['phrase_value'];
                    $this->__phrases[addslashes(strtolower($phrase['phrase_key']))] = wpforo_phrase($phrase['phrase_key'], false);
                }
                add_action('wp_ajax_nopriv_wpforo_get_phrases', array($this, 'ajax_get_phrases'));
                add_action('wp_ajax_wpforo_get_phrases', array($this, 'ajax_get_phrases'));
            }
        }
    }
	
	function add( $args = array(), $clear_cache = true ){
		if( empty($args) && empty($_REQUEST['phrase']) ) return FALSE;
		if( empty($args) && !empty($_REQUEST['phrase']) ) $args = $_REQUEST['phrase'];

		if( empty($args['package']) ) $args['package'] = 'wpforo';
		$sql = WPF()->db->prepare( "INSERT IGNORE INTO `".WPF()->tables->phrases."` 
												(`langid`, `phrase_key`, `phrase_value`, `package`) 
													VALUES (%d, %s, %s, %s)", 
														WPF()->general_options['lang'],
														stripslashes($args['key']),
														stripslashes($args['value']),
														stripslashes($args['package']) );
		if( false !== WPF()->db->query( $sql )){
			WPF()->notice->add('Phrase successfully added', 'success');
			if ($clear_cache) $this->clear_cache();
			return WPF()->db->insert_id;
		}
		WPF()->notice->add('Phrase add error', 'error');
		return FALSE;
	}
	
	function edit(){
		if( !empty($_POST['phrase']['data']) && is_array($_POST['phrase']['data']) ){
			foreach($_POST['phrase']['data'] as $key => $phrase){
				WPF()->db->update(
					WPF()->tables->phrases,
					array( 'phrase_value' => sanitize_text_field(stripslashes($phrase['title']))), 
					array( 'phraseid' => intval($key) ), 
					array( '%s' ),
					array( '%d' ) 
				);
				
			}
			$this->clear_cache();
			WPF()->notice->add('Phrase successfully updates', 'success');
			return TRUE;
		}
		
		WPF()->notice->add('Phrase update error', 'error');
		return FALSE;
	}
	
	function get_wpforo_phrase($phraseid){
		$sql = 'SELECT * FROM '.WPF()->tables->phrases.' WHERE `phraseid` ='.intval($phraseid);
		return WPF()->db->get_row($sql, ARRAY_A);
	}
	
	function get_phrases($args = array(), &$items_count = 0, $count = false){
		$default = array( 
		  'include' => array(), 		// array( 2, 10, 25 )
		  'exclude' => array(),  		// array( 2, 10, 25 )
		  'langid' => WPF()->general_options['lang'],
		  'package' => array(),
		  
		  'orderby'		=> 'phraseid', 
		  'order'		=> 'ASC', 		// ASC DESC
		  'offset' 		=> '',			// this use when you give row_count
		  'row_count'	=> '' 	
		);
		
		$args = wpforo_parse_args( $args, $default );

        $key = substr(md5(serialize($args)), 0, 10);

        extract($args, EXTR_OVERWRITE);

        $package = wpforo_parse_args( $package );
        $include = wpforo_parse_args( $include );
        $exclude = wpforo_parse_args( $exclude );

        $wheres = array();

        if(!empty($package))        $wheres[] = "`package` IN('" . implode("','", array_map('esc_sql', array_map('sanitize_text_field', $package))  ) . "')";
        if(!empty($include))        $wheres[] = "`phraseid` IN(" . implode(', ', array_map('intval', $include)) . ")";
        if(!empty($exclude))        $wheres[] = "`phraseid` NOT IN(" . implode(', ', array_map('intval', $exclude)) . ")";
        if($langid != NULL) $wheres[] = "`langid` = " . intval($langid);

        $sql = "SELECT * FROM `".WPF()->tables->phrases."`";
        if(!empty($wheres)){
            $sql .= " WHERE " . implode($wheres, " AND ");
        }

        if( $count ){
	        $item_count_sql = preg_replace('#SELECT.+?FROM#isu', 'SELECT count(*) FROM', $sql);
//	        $item_count_sql = preg_replace('#ORDER.+$#is', '', $item_count_sql);
	        if( $item_count_sql ) $items_count = WPF()->db->get_var($item_count_sql);
        }

        $sql .= esc_sql(" ORDER BY `$orderby` " . $order);

        if($row_count != '' && $offset == ''){  // If you give only row_count this if fixed problam
            $offset = $row_count;
            $row_count  = '';
        }
        $sql .= $offset != '' ? esc_sql(' LIMIT '.$offset) : '';
        $sql .= $row_count != '' ? esc_sql(', '.$row_count) : '';

        if ( false === ( $phrases = get_transient( 'wpforo_get_phrases_' . $key ) ) ) {
            $phrases = WPF()->db->get_results($sql, ARRAY_A);
            set_transient( 'wpforo_get_phrases_' . $key , $phrases, 60*60*24 );
        }
        return get_transient( 'wpforo_get_phrases_' . $key );
	}
	
	function search( $needle = '', $fields = array( 'phrase_key', 'phrase_value' )){
		if( !$needle ) return array();
		$phreseids = array();
		if(!is_array($fields)) $fields = array($fields);
		$needle = substr(sanitize_text_field($needle), 0, 60);
		foreach($fields as $field){
			$field = sanitize_text_field($field);
			$matches = WPF()->db->get_col( "SELECT `phraseid` FROM ".WPF()->tables->phrases." WHERE `".esc_sql($field)."` LIKE '%".esc_sql($needle)."%'" );
			$phreseids = array_merge( $phreseids, $matches );
		}
		return array_unique($phreseids);
	}
	
	public function xml_import($xmlfile, $type = 'import'){
		$file = WPFORO_DIR . '/wpf-admin/xml/' . $xmlfile;
		if( file_exists( $file ) && function_exists('xml_parser_create') ) {
			$xr = xml_parser_create();
			$fp = fopen($file, "r");
			$xml = fread($fp, filesize($file));
			
			xml_parser_set_option( $xr, XML_OPTION_CASE_FOLDING, 1 );
			xml_parse_into_struct( $xr, $xml, $vals, $index );
			xml_parser_free( $xr );
			
			delete_transient( 'wpforo_get_phrases' );
			
			if(!empty($vals)){
				
				if( isset($vals[0]['tag']) && $vals[0]['tag'] == 'LANGUAGE' && isset($vals[0]['attributes']['LANGUAGE']) && $vals[0]['attributes']['LANGUAGE'] ){
					
					$sql = "SELECT `langid` FROM `".WPF()->tables->languages."` WHERE `name` LIKE '". esc_sql(sanitize_text_field($vals[0]['attributes']['LANGUAGE'])) ."'";
					$langid = WPF()->db->get_var( $sql );
					
					if( !$langid ){
						$sql = "INSERT INTO `".WPF()->tables->languages."` (`name`) VALUES ( '".esc_sql(sanitize_text_field($vals[0]['attributes']['LANGUAGE']))."' )";
						if( WPF()->db->query($sql) ){
							$langid = WPF()->db->insert_id;
						}
					}
					
					if( $langid ){
						foreach($vals as $val){
							if( isset($val['tag']) && $val['tag'] == 'PHRASE' && isset($val['attributes']['NAME']) && trim($val['attributes']['NAME']) && isset($val['value']) && trim($val['value']) ){
								$sql = "INSERT IGNORE INTO `".WPF()->tables->phrases."` 
									(`phraseid`, `langid`, `phrase_key`, `phrase_value`)
									VALUES( NULL, 
									  '".intval($langid)."', 
									  '".esc_sql(stripslashes(htmlspecialchars_decode($val['attributes']['NAME'], ENT_QUOTES)))."', 
									  '".esc_sql(stripslashes(htmlspecialchars_decode($val['value'], ENT_QUOTES)))."')";
								WPF()->db->query($sql);
							}
						}
						if( !isset(WPF()->general_options['lang']) ){
							$blogname = get_option('blogname');
							$general_options = array(
								'title' => $blogname .  __(' Forum', 'wpforo'),
								'description' => $blogname . __(' Discussion Board', 'wpforo'),
								'lang' => sanitize_text_field($langid),
							);
						}else{
							$general_options = WPF()->general_options;
							$general_options['lang'] = sanitize_text_field($langid);
						}
						if( $type == 'install' ){
							add_option('wpforo_general_options', $general_options);
						}
						else{
							update_option('wpforo_general_options', $general_options);
						}
						return $langid;
					}
				}
			}
		}
		
		return FALSE;
	}
	
	function add_lang(){
		if( is_array($_FILES['add_lang']['name']) && !empty($_FILES['add_lang']['name']) && isset($_FILES['add_lang']['name']['xml']) ){
			if(!is_dir( WPFORO_DIR . '/wpf-admin/xml' )) wp_mkdir_p( WPFORO_DIR . '/wpf-admin/xml' );
			
			$error = $_FILES['add_lang']['error']['xml'];
			
			if( $error ){
				$error = wpforo_file_upload_error($error);
				WPF()->notice->add($error, 'error');
				return FALSE;
			}
			
			$xmlfile = strtolower(sanitize_file_name($_FILES['add_lang']['name']['xml']));
			if( move_uploaded_file(sanitize_text_field($_FILES['add_lang']['tmp_name']['xml']),  WPFORO_DIR . '/wpf-admin/xml/' . $xmlfile) ){
				if($langid = $this->xml_import($xmlfile) ){
					delete_transient( 'wpforo_get_phrases' );
					WPF()->notice->add('New language successfully added and changed wpforo language to new language', 'success');
					return $langid;
				}
			}
		}
		
		WPF()->notice->add('Can\'t add new language', 'error');
		return FALSE;
	}
	
	function get_languages(){
		return WPF()->db->get_results( "SELECT * FROM `".WPF()->tables->languages."`", ARRAY_A );
	}
	
	function show_lang_list(){
		$langs = $this->get_languages();
		if(!empty($langs)){
			foreach($langs as $lang) : 
				extract($lang, EXTR_OVERWRITE); ?>
				<option value="<?php echo esc_attr($langid) ?>"<?php if($langid == WPF()->general_options['lang']) echo ' selected' ?>><?php echo esc_html($name) ?></option>
				<?php 
			endforeach;
		}
	}
	
	function clear_cache(){
		WPF()->db->query("DELETE FROM ".WPF()->db->options." WHERE `option_name` LIKE '%_wpforo_get_phrases_%'");
	}

	public function crawl_phrases($pattern = null){
	    if( is_null($pattern) ) $pattern = dirname(WPFORO_DIR) . DIRECTORY_SEPARATOR . 'wpforo*';
	    if( $matches = glob($pattern) ){
		    $package = 'wpforo';
	        if( preg_match('#[/\\\]wp-content[/\\\]plugins[/\\\]([^/\\\]+)[/\\\]#isu', $pattern, $p) ){
                $package = $p[1];
            }
	        foreach ( $matches as $match){
	            if( is_dir( $match ) ){
	                $this->crawl_phrases($match . DIRECTORY_SEPARATOR .'*');
                }elseif (is_file($match) && preg_match('#\.(php|js)$#isu', $match)){
                    if( $file_content = wpforo_get_file_content($match) ){
                        if( preg_match_all('#(?:wpforo_phrase|WPF\(\)->notice->add)\([\r\n\t\s\0]*[\'\"](?P<phrase_key>.+?)[\'\"][\r\n\t\s\0\,\)]+#isu', $file_content, $phrases, PREG_SET_ORDER ) ){
                            foreach ( $phrases as $phrase ){
                                if( $phrase['phrase_key'] ){
	                                $args = array(
		                                'key' => $phrase['phrase_key'],
		                                'value' => __($phrase['phrase_key'], $package),
		                                'package' => $package
	                                );
	                                $this->add( $args, false );
                                }
                            }
                        }
                    }
                }

            }
        }
    }

    public function rebuild_file_wpf_phrases_php(){
	    $file_path = wpforo_fix_directory( WPFORO_DIR . '/wpf-includes/wpf-phrases.php' );
	    if( WPF()->is_installed() && $file_content = wpforo_get_file_content($file_path) ){

            if ( $phrases = $this->get_phrases( array('package' => 'wpforo') ) ) {
                foreach ($phrases as $phrase) {
                    $key = addcslashes($phrase['phrase_key'], '"');

	                if( !preg_match('#[\'\"]'.preg_quote($key).'[\'\"][\r\n\t\s\0]*=>[\r\n\t\s\0]*__\([\r\n\t\s\0]*[\'\"]'.preg_quote($key).'[\'\"][\r\n\t\s\0]*,[\r\n\t\s\0]*[\'\"]wpforo[\'\"][\r\n\t\s\0]*\)#isu', $file_content) ){
		                $file_content = preg_replace('#(\$wpforo_phrases[\r\n\t\s\0]*=[\r\n\t\s\0]*array\([\r\n\t\s\0]*)#isu', '$1"' . $key . '" => __("' . $key . '", "wpforo"),' . "\r\n\t", $file_content);
	                }
                }

                wpforo_write_file($file_path, $file_content);
            }

	    }
    }

    public function rebuild_file_english_xml(){
	    $file_path = wpforo_fix_directory( WPFORO_DIR . '/wpf-admin/xml/english.xml' );
	    if( WPF()->is_installed() && $file_content = wpforo_get_file_content($file_path) ){

		    if ( $phrases = $this->get_phrases( array('package' => 'wpforo') ) ) {
			    foreach ($phrases as $phrase) {
				    $key = htmlspecialchars($phrase['phrase_key'], ENT_QUOTES);

				    if( !preg_match('#<phrase[^<>]*?name=[\'\"]'.preg_quote($key).'[\'\"][^<>]*?>[^<>]*?<\!\[CDATA\['.preg_quote($key).'\]\]>[^<>]*?</phrase>#isu', $file_content) ){
					    $file_content = preg_replace('#([\r\n\t\s\0]*</language>)#isu', "\r\n\t".'<phrase name="' . $key . '"><![CDATA[' . $key . ']]></phrase>$1', $file_content);
				    }
			    }

			    wpforo_write_file($file_path, $file_content);
		    }

	    }
    }

    public function ajax_get_phrases(){
	    echo json_encode($this->__phrases);
	    exit();
    }
	
}