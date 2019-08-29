<?php
	
// Exit if accessed directly
if( !defined( 'ABSPATH' ) ) exit;

$args = array(); $view = false; $items_count = 0; $paged = 1;
if(!empty($_GET['view'])) $view = sanitize_title($_GET['view']);
if(!empty($_GET['wpfpaged'])) $paged = intval($_GET['wpfpaged']);
if(!empty($_GET['wpff'])) $args['forumid'] = intval($_GET['wpff']);

$type = ( $view && $view != 'unapproved' ? 'topics' : WPF()->post->options['recent_posts_type'] );
if(!is_user_logged_in() || !WPF()->perm->usergroup_can('aum')){ $args['private'] = 0; $args['status'] = 0; }

if( $type == 'topics' ){
	$end_date = time() - (14 * 24 * 60 * 60);
	$args['where'] = "`modified` > '" . date( 'Y-m-d H:i:s', $end_date ) . "'";
	$args['orderby'] = (!empty($_GET['wpfob'])) ? sanitize_text_field($_GET['wpfob']) : 'modified';
	$args['order'] = 'DESC';
	$args['offset'] = ($paged - 1) * WPF()->post->options['topics_per_page'];
	$args['row_count'] = WPF()->post->options['topics_per_page'];

    switch ($view){
        case 'unread':
	        $args['read'] = false;
            break;
        case 'no-replies':
	        $args['where'] .= " AND `posts` < 2";
            break;
	    case 'solved':
		    $args['solved'] = 1;
		    break;
	    case 'unsolved':
		    $args['solved'] = 0;
		    break;
	    case 'closed':
		    $args['closed'] = 1;
		    break;
	    case 'sticky':
		    $args['type'] = 1;
		    break;
	    case 'private':
		    $args['private'] = 1;
		    break;
	    case 'unapproved':
		    $args['status'] = 1;
		    break;
    }

	$topics = WPF()->topic->get_topics($args, $items_count);
	if(empty($topics)){
	    $end_date = time() - (90 * 24 * 60 * 60);
	    $args['where'] = "`modified` > '" . date( 'Y-m-d H:i:s', $end_date ) . "'";
	    $topics = WPF()->topic->get_topics($args, $items_count);
	}
}
else{
	$end_date = time() - (14 * 24 * 60 * 60);
	$args['where'] = "`created` > '" . date( 'Y-m-d H:i:s', $end_date ) . "'"; 
	$args['orderby'] = (!empty($_GET['wpfob'])) ? sanitize_text_field($_GET['wpfob']) : 'created';
	$args['order'] = 'DESC';
	$args['offset'] = ($paged - 1) * WPF()->post->options['posts_per_page'];
	$args['row_count'] = WPF()->post->options['posts_per_page'];

    switch ($view){
	    case 'unapproved':
		    $args['status'] = 1;
		    break;
    }

	$posts = WPF()->post->get_posts($args, $items_count);
	if(empty($posts)){
	    $end_date = time() - (90 * 24 * 60 * 60);
	    $args['where'] = "`created` > '" . date( 'Y-m-d H:i:s', $end_date ) . "'";
	    $posts = WPF()->post->get_posts($args, $items_count);
	}
}
?>
<div class="wpforo-recent-wrap">
  <div class="wpf-head-bar">
	 <h1 id="wpforo-title">
         <?php
            switch ($view){
                case 'unread':
	                wpforo_phrase('Unread Posts');
                    break;
                case 'no-replies':
	                wpforo_phrase('Not Replied Topics');
                    break;
                case 'solved':
	                wpforo_phrase('Solved Topics');
                    break;
                case 'unsolved':
	                wpforo_phrase('Unsolved Topics');
                    break;
                case 'closed':
	                wpforo_phrase('Closed Topics');
                    break;
                case 'sticky':
	                wpforo_phrase('Sticky Topics');
                    break;
                case 'private':
	                wpforo_phrase('Private Topics');
                    break;
                case 'unapproved':
	                wpforo_phrase('Unapproved Posts');
                    break;
                default:
	                wpforo_phrase('Recent Posts');
                    break;
            }
         ?>
        <div class="wpforo-feed">
	        <?php if( wpforo_feature('rss-feed') ): ?>
                <span class="wpf-feed-forums">
                    <a href="<?php WPF()->feed->rss2_url( true, 'forum' ); ?>"  title="<?php wpforo_phrase('Forums RSS Feed') ?>" target="_blank">
                        <span><?php wpforo_phrase('Forums') ?></span> <i class="fas fa-rss wpfsx"></i>
                    </a>
                </span>
                <sep> &nbsp;|&nbsp; </sep>
                <span class="wpf-feed-topics">
                    <a href="<?php WPF()->feed->rss2_url( true, 'topic' ); ?>"  title="<?php wpforo_phrase('Topics RSS Feed') ?>" target="_blank">
                        <span><?php wpforo_phrase('Topics') ?></span> <i class="fas fa-rss wpfsx"></i>
                    </a>
                </span>
                <sep> &nbsp;|&nbsp; </sep>&nbsp;&nbsp;&nbsp;
	        <?php endif; ?>
            <select onchange="window.location.assign(this.value)">
                <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'])) ?>" <?php wpfo_check($view, 'recent', 'selected') ?>>
                    <?php wpforo_phrase('Recent Posts') ?>
                </option>
                <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'] . '?view=unread' )) ?>" <?php wpfo_check($view, 'unread', 'selected') ?>>
                    <?php wpforo_phrase('Unread Posts') ?>
                </option>
                <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'] . '?view=no-replies' )) ?>" <?php wpfo_check($view, 'no-replies', 'selected') ?>>
                    <?php wpforo_phrase('Not Replied Topics') ?>
                </option>
                <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'] . '?view=solved' )) ?>" <?php wpfo_check($view, 'solved', 'selected') ?>>
                    <?php wpforo_phrase('Solved Topics') ?>
                </option>
                <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'] . '?view=unsolved' )) ?>" <?php wpfo_check($view, 'unsolved', 'selected') ?>>
                    <?php wpforo_phrase('Unsolved Topics') ?>
                </option>
                <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'] . '?view=closed' )) ?>" <?php wpfo_check($view, 'closed', 'selected') ?>>
                    <?php wpforo_phrase('Closed Topics') ?>
                </option>
                <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'] . '?view=sticky' )) ?>" <?php wpfo_check($view, 'sticky', 'selected') ?>>
                    <?php wpforo_phrase('Sticky Topics') ?>
                </option>
                <?php if( wpforo_current_user_is('admin') || wpforo_current_user_is('moderator') ): ?>
                    <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'] . '?view=private' )) ?>" <?php wpfo_check($view, 'private', 'selected') ?>>
                        <?php wpforo_phrase('Private Topics') ?>
                    </option>
                    <option value="<?php echo esc_url(wpforo_home_url(WPF()->tpl->slugs['recent'] . '?view=unapproved' )) ?>" <?php wpfo_check($view, 'unapproved', 'selected') ?>>
                        <?php wpforo_phrase('Unapproved Posts') ?>
                    </option>
                <?php endif; ?>
            </select>
         </div>
     </h1>
  	 <div class="wpf-snavi">
        <?php WPF()->tpl->pagenavi($paged, $items_count, $args['row_count'], FALSE); ?>
     </div>
  </div>
  <?php if( $type == 'topics' ): ?>
     <div class="wpforo-recent-content wpfr-topics">
        <?php if( !empty($topics) ): ?>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="wpf-htr">
            <td class="wpf-shead-avatar">&nbsp;</td>
            <td class="wpf-shead-title"><?php wpforo_phrase('Topic Title') ?></td>
            <td class="wpf-shead-forum"><?php wpforo_phrase('Forum') ?></td>
          </tr>
              <?php foreach($topics as $topic) : extract($topic, EXTR_OVERWRITE); ?>
                  <?php
                    $posts = array();
                    $member = wpforo_member($topic); 
                    $forum = wpforo_forum($topic['forumid']);
					if(isset($topic['last_post']) && $topic['last_post'] != 0){ 
						$last_post = wpforo_post($topic['last_post']);
						$last_poster = wpforo_member($last_post);
					}
					if(isset($topic['first_postid']) && $topic['first_postid'] != 0){
						$first_post = wpforo_post($topic['first_postid']);
						$intro_posts = WPF()->post->options['layout_extended_intro_posts_count']; if( $intro_posts < 1 ){ $intro_posts = NULL; } else { $intro_posts = ($intro_posts > 1) ? ($intro_posts - 1) : $intro_posts = 0; }
						$first_poster = wpforo_member($first_post);
						if( !$view ){
						    $posts = WPF()->post->get_posts( array('topicid' => $topic['topicid'], 'orderby' => '`is_first_post` ASC, `created` DESC, `postid` DESC', 'row_count' => $intro_posts) );
                        }
					}
					$topic_url = wpforo_topic($topic['topicid'], 'url');
                    $topic_posturl = ( $view == 'unread' && wpfval($last_post, 'url') ) ? $last_post['url'] : WPF()->topic->get_topic_url($topicid);
					$post_toglle = WPF()->post->options['layout_extended_intro_posts_toggle'];
				  ?>
                  <tr class="wpf-ttr <?php wpforo_unread($topic['topicid'], 'topic'); ?>">
                    <td class="wpf-spost-avatar"> 
                        <?php if( WPF()->perm->usergroup_can('va') && wpforo_feature('avatars') ): ?>
                            <?php echo WPF()->member->avatar($member, 'alt="'.esc_attr($member['display_name']).'"', 30) ?>
                        <?php endif; ?>
                    </td>
                    <td class="wpf-spost-title">
                        <?php wpforo_topic_icon($topic); ?> <a href="<?php echo esc_url( $topic_posturl ) ?>" class="wpf-spost-title-link" title="<?php wpforo_phrase('View entire topic') ?>"><?php echo esc_html($title) ?> &nbsp;<i class="fas fa-chevron-right" style="font-size:11px;"></i></a> <?php wpforo_viewing( $topic ); ?>
                        <p style="font-size:12px"><?php wpforo_member_link($member, 'by'); ?> <?php if( wpfval($topic, 'created') ) wpforo_date($topic['created']); ?> &nbsp;|&nbsp; <span style="text-transform: lowercase;"><?php wpforo_phrase('Last post') ?>:</span> <?php wpforo_date($last_post['created']); ?></p>
                    </td>
                    <td class="wpf-spost-forum"><a href="<?php echo $forum['url'] ?>"><?php echo esc_html($forum['title']); ?></a></td>
                  </tr>
                  <?php if(!empty($posts) && is_array($posts)) : ?>
                      <tr class="wpf-ptr">
                        <td class="wpf-spost-icon">&nbsp;</td>
                        <td colspan="2" class="wpf-stext">
                            <ul>
                            <?php foreach($posts as $post) : ?>
                                <?php $poster = wpforo_member($post); ?>
                                <li>
                                    <i class="fas fa-reply fa-rotate-180 wpfsx wpfcl-0"></i> &nbsp; <a href="<?php echo esc_url( wpforo_post($post['postid'], 'url') ); ?>" title="<?php wpforo_phrase('REPLY:') ?> <?php echo esc_html( wpforo_text($post['body'], 100, false)) ?>"><?php echo (( $post_body = esc_html(wpforo_text($post['body'], WPF()->post->options['layout_extended_intro_posts_length'], FALSE)) ) ? $post_body : esc_html($post['title'])) ?></a>
                                    <div class="wpf-spost-topic-recent-posts"><?php wpforo_date($post['created']); ?>&nbsp; <?php wpforo_member_link($poster, 'by %s', 5); ?> </div>
                                    <br class="wpf-clear">
                                </li>
                            <?php endforeach ?>
                            <?php if(intval($topic['posts']) > ($intro_posts+1)): ?>
                                <li style="text-align:right;"><a href="<?php echo esc_url($topic_url) ?>"><?php wpforo_phrase('view all posts', true, 'lower');  ?> <i class="fas fa-angle-right" aria-hidden="true"></i></a></li>
                            <?php endif ?>
                        </ul>
                        </td>
                      </tr>
                  <?php else: ?>
                    <tr class="wpf-tr-sep"><td colspan="3" style="height: 2px;"></td></tr>
                  <?php endif; ?>
              <?php endforeach ?>
        </table>
        <?php else: ?>
            <?php if( $view == 'unread' ): ?>
                <p class="wpf-p-error"><?php wpforo_phrase('No unread posts were found') ?>  </p>
            <?php else: ?>
                <p class="wpf-p-error"><?php wpforo_phrase('No topics were found here') ?>  </p>
            <?php endif; ?>
        <?php endif; ?>
      </div>
  <?php else: ?>
      <div class="wpforo-recent-content wpfr-posts">
        <?php if( !empty($posts) ): ?>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="wpf-htr">
            <td class="wpf-shead-avatar">&nbsp;</td>
            <td class="wpf-shead-title"><?php wpforo_phrase('Post Title') ?></td>
            <td class="wpf-shead-forum"><?php wpforo_phrase('Forum') ?></td>
          </tr>
              <?php foreach($posts as $post) : extract($post, EXTR_OVERWRITE); ?>
                  <?php
                    $member = wpforo_member($post);
                    $forum = wpforo_forum($post['forumid']);
                  ?>
                  <tr class="wpf-ttr <?php wpforo_unread($post['topicid'], 'topic'); ?>">
                    <td class="wpf-spost-avatar"> 
                        <?php if( WPF()->perm->usergroup_can('va') && wpforo_feature('avatars') ): ?>
                            <?php echo WPF()->member->avatar($member, 'alt="'.esc_attr($member['display_name']).'"', 40) ?>
                        <?php endif; ?>
                    </td>
                    <td class="wpf-spost-title">
                        <a href="<?php echo esc_url(WPF()->post->get_post_url($postid)) ?>" class="wpf-spost-title-link" title="<?php wpforo_phrase('View entire post') ?>"><?php echo esc_html($title) ?> &nbsp;<i class="fas fa-chevron-right" style="font-size:11px;"></i></a>
                        <p style="font-size:12px"><?php wpforo_member_link($member, 'by'); ?>, <?php wpforo_date($post['created']); ?></p>
                    </td>
                    <td class="wpf-spost-forum"><a href="<?php echo $forum['url'] ?>"><?php echo esc_html($forum['title']); ?></a></td>
                  </tr>
                  <tr class="wpf-ptr">
                    <td class="wpf-spost-icon">&nbsp;</td>
                    <td colspan="2" class="wpf-stext">
                    <?php
                        $body = wpforo_content_filter( $body );
                        $body = preg_replace('#\[attach\][^\[\]]*\[\/attach\]#is', '', strip_tags($body));
                        wpforo_text($body, 200);
                    ?>
                    </td>
                  </tr>
              <?php endforeach ?>
        </table>
        <?php else: ?>
            <p class="wpf-p-error"><?php wpforo_phrase('No posts were found here') ?>  </p>
        <?php endif; ?>
      </div>
  <?php endif; ?>

    <div class="wpf-snavi">
        <?php WPF()->tpl->pagenavi($paged, $items_count, $args['row_count'], FALSE); ?>
    </div>

</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
