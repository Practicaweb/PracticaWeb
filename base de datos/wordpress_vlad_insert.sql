-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2019 at 11:40 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un comentarista de WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-08-14 14:52:39', '2019-08-14 12:52:39', 'Hola, esto es un comentario.\nPara empezar a moderar, editar y borrar comentarios, por favor, visita la pantalla de comentarios en el escritorio.\nLos avatares de los comentaristas provienen de <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://127.0.0.1', 'yes'),
(2, 'home', 'http://127.0.0.1', 'yes'),
(3, 'blogname', 'Cripto_altramuz', 'yes'),
(4, 'blogdescription', 'Otro sitio realizado con WordPress', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'criptoaltramuz@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:95:{s:21:\"(community(?:/|$).*)$\";s:20:\"index.php?page_id=21\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:32:\"(.?.+?)/edit-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&edit-password=$matches[3]\";s:31:\"(.?.+?)/edit-profile(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-profile=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:30:\"(.?.+?)/user-logout(/(.*))?/?$\";s:54:\"index.php?pagename=$matches[1]&user-logout=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:61:\"advanced-nocaptcha-recaptcha/advanced-nocaptcha-recaptcha.php\";i:1;s:39:\"user-registration/user-registration.php\";i:2;s:17:\"wpforo/wpforo.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'primer', 'yes'),
(41, 'stylesheet', 'lyrical', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', 'Europe/Madrid', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:79:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:24:\"manage_user_registration\";b:1;s:22:\"edit_user_registration\";b:1;s:22:\"read_user_registration\";b:1;s:24:\"delete_user_registration\";b:1;s:23:\"edit_user_registrations\";b:1;s:30:\"edit_others_user_registrations\";b:1;s:26:\"publish_user_registrations\";b:1;s:31:\"read_private_user_registrations\";b:1;s:25:\"delete_user_registrations\";b:1;s:33:\"delete_private_user_registrations\";b:1;s:35:\"delete_published_user_registrations\";b:1;s:32:\"delete_others_user_registrations\";b:1;s:31:\"edit_private_user_registrations\";b:1;s:33:\"edit_published_user_registrations\";b:1;s:30:\"manage_user_registration_terms\";b:1;s:28:\"edit_user_registration_terms\";b:1;s:30:\"delete_user_registration_terms\";b:1;s:30:\"assign_user_registration_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'es_ES', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:4:\"hero\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'cron', 'a:5:{i:1566985960;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1566996760;a:4:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1566996801;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1566996803;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'recovery_keys', 'a:0:{}', 'yes'),
(117, 'theme_mods_twentynineteen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1566304207;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(132, 'can_compress_scripts', '1', 'no'),
(161, 'recently_activated', 'a:1:{s:47:\"really-simple-captcha/really-simple-captcha.php\";i:1566385165;}', 'yes'),
(184, 'current_theme', 'Lyrical', 'yes'),
(185, 'theme_mods_lyrical', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:11:\"wpforo-menu\";i:2;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(186, 'theme_switched', '', 'yes'),
(187, 'widget_primer-hero-text', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(195, 'anr_admin_options', 'a:16:{s:7:\"version\";s:3:\"5.5\";s:15:\"captcha_version\";s:2:\"v3\";s:8:\"site_key\";s:40:\"6Lc1GbQUAAAAAAdg_vtTAs39D9pWyfvFiFQb2Tks\";s:10:\"secret_key\";s:40:\"6Lc1GbQUAAAAAHC9xeqs1vZ3QB5fh_pMldf_7CgK\";s:13:\"enabled_forms\";a:6:{i:0;s:0:\"\";i:1;s:5:\"login\";i:2;s:12:\"registration\";i:3;s:13:\"lost_password\";i:4;s:14:\"reset_password\";i:5;s:7:\"comment\";}s:13:\"error_message\";s:30:\"Please solve Captcha correctly\";s:8:\"language\";s:0:\"\";s:5:\"theme\";s:5:\"light\";s:4:\"size\";s:6:\"normal\";s:5:\"badge\";s:11:\"bottomright\";s:18:\"failed_login_allow\";i:0;s:14:\"v3_script_load\";s:9:\"all_pages\";s:5:\"score\";s:3:\"0.5\";s:13:\"loggedin_hide\";s:1:\"1\";s:10:\"remove_css\";s:0:\"\";s:5:\"no_js\";s:0:\"\";}', 'yes'),
(203, 'user_registration_general_setting_login_options', 'default', 'yes'),
(204, 'user_registration_general_setting_disabled_user_roles', 'a:1:{i:0;s:10:\"subscriber\";}', 'yes'),
(205, 'user_registration_general_setting_uninstall_option', 'no', 'yes'),
(206, 'user_registration_myaccount_page_id', '6', 'yes'),
(207, 'user_registration_my_account_layout', 'horizontal', 'yes'),
(208, 'user_registration_myaccount_edit_profile_endpoint', 'edit-profile', 'yes'),
(209, 'user_registration_myaccount_change_password_endpoint', 'edit-password', 'yes'),
(210, 'user_registration_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(211, 'user_registration_logout_endpoint', 'user-logout', 'yes'),
(212, 'user_registration_integration_setting_recaptcha_version', 'v3', 'yes'),
(213, 'user_registration_integration_setting_recaptcha_site_key', '', 'yes'),
(214, 'user_registration_integration_setting_recaptcha_site_secret', '', 'yes'),
(215, 'user_registration_integration_setting_recaptcha_site_key_v3', '6Lc1GbQUAAAAAAdg_vtTAs39D9pWyfvFiFQb2Tks', 'yes'),
(216, 'user_registration_integration_setting_recaptcha_site_secret_v3', '6Lc1GbQUAAAAAHC9xeqs1vZ3QB5fh_pMldf_7CgK', 'yes'),
(217, 'user_registration_email_setting_disable_email', 'no', 'no'),
(218, 'user_registration_email_from_name', 'Cripto_altramuz', 'no'),
(219, 'user_registration_email_from_address', 'criptoaltramuz@gmail.com', 'no'),
(220, 'user_registration_default_form_page_id', '5', 'yes'),
(223, 'user_registration_version', '1.6.3', 'yes'),
(224, 'user_registration_db_version', '1.6.3', 'yes'),
(225, 'user_registration_activated', '2019-08-20', 'yes'),
(226, 'user_registration_admin_notices', 'a:0:{}', 'yes'),
(227, 'user_registration_registration_page_id', '7', 'yes'),
(230, 'new_admin_email', 'criptoaltramuz@gmail.com', 'yes'),
(238, 'user_registration_login_options_form_template', 'default', 'yes'),
(239, 'user_registration_login_options_remember_me', 'yes', 'yes'),
(240, 'user_registration_login_option_hide_show_password', 'no', 'yes'),
(241, 'user_registration_login_options_lost_password', 'yes', 'yes'),
(242, 'user_registration_login_options_enable_recaptcha', 'yes', 'yes'),
(243, 'user_registration_general_setting_registration_url_options', '', 'yes'),
(244, 'user_registration_general_setting_registration_label', 'Not a member yet? Register now.', 'yes'),
(245, 'user_registration_login_options_prevent_core_login', 'no', 'yes'),
(272, '_transient_timeout_ur_addons_sections', '1566990395', 'no'),
(273, '_transient_ur_addons_sections', 'O:8:\"stdClass\":1:{s:14:\"all_extensions\";O:8:\"stdClass\":2:{s:5:\"title\";s:14:\"All Extensions\";s:8:\"endpoint\";s:113:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/all_extensions.json\";}}', 'no'),
(274, '_transient_timeout_ur_addons_section_all_extensions', '1566990396', 'no'),
(275, '_transient_ur_addons_section_all_extensions', 'O:8:\"stdClass\":1:{s:8:\"products\";a:13:{i:0;O:8:\"stdClass\":4:{s:5:\"title\";s:11:\"File Upload\";s:5:\"image\";s:109:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/file.png\";s:7:\"excerpt\";s:232:\"File Upload addon for User Registration plugin allows you to create upload field in your registration form. You can use this field on your registration forms allowing your users to upload important files, documents, images and more.\";s:4:\"link\";s:163:\"https://wpeverest.com/wordpress-plugins/user-registration/file-upload/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-file-upload\";}i:1;O:8:\"stdClass\":4:{s:5:\"title\";s:14:\"Social Connect\";s:5:\"image\";s:111:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/social.png\";s:7:\"excerpt\";s:242:\"Signing up made easier and faster! With this addon you can make your users register to your site with social platforms like Facebook, Twitter, Google+, LinkedIn or others. Users details will be automatically pulled from their social profiles.\";s:4:\"link\";s:169:\"https://wpeverest.com/wordpress-plugins/user-registration/social-connect/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-social-connect\";}i:2;O:8:\"stdClass\":4:{s:5:\"title\";s:9:\"MailChimp\";s:5:\"image\";s:114:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/mailchimp.png\";s:7:\"excerpt\";s:203:\"MailChimp add-on of User Registration plugin synchronizes your mailChimp account with User Registration plugin and automatically subscribes your site users to your mailchimp mailing list on registration.\";s:4:\"link\";s:159:\"https://wpeverest.com/wordpress-plugins/user-registration/mailchimp/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-mailchimp\";}i:3;O:8:\"stdClass\":4:{s:5:\"title\";s:23:\"WooCommerce Integration\";s:5:\"image\";s:118:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/woo-extension.png\";s:7:\"excerpt\";s:148:\"Integrates WooCommerce plugin with your user-registration and allows you to manage user billing, shipping, orders via user registration account page\";s:4:\"link\";s:163:\"https://wpeverest.com/wordpress-plugins/user-registration/woocommerce/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-woocommerce\";}i:4;O:8:\"stdClass\":4:{s:5:\"title\";s:19:\"Content Restriction\";s:5:\"image\";s:124:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/content-restriction.png\";s:7:\"excerpt\";s:152:\"Content Restriction addon allows you to restrict full or partial content from page, post to only logged in users or logged in users with specific roles.\";s:4:\"link\";s:179:\"https://wpeverest.com/wordpress-plugins/user-registration/content-restriction/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-content-restriction\";}i:5;O:8:\"stdClass\":4:{s:5:\"title\";s:15:\"Advanced Fields\";s:5:\"image\";s:120:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/advanced-fields.png\";s:7:\"excerpt\";s:213:\"Advanced Fields provides you with additional advanced fields like Section Title, Custom HTML, Phone, Time Picker and WYSIWYG Fields. These fields will allow you to create more complex registration forms with ease.\";s:4:\"link\";s:171:\"https://wpeverest.com/wordpress-plugins/user-registration/advanced-fields/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-advanced-fields\";}i:6;O:8:\"stdClass\":4:{s:5:\"title\";s:17:\"Conditional Logic\";s:5:\"image\";s:122:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/conditional-logic.jpg\";s:7:\"excerpt\";s:227:\"Conditional Logic allows you to create more dynamic forms based on user input. You can now show or hide specific fields based on the users other input in the form. A field hide or show based on on multiple conditions fulfilled.\";s:4:\"link\";s:175:\"https://wpeverest.com/wordpress-plugins/user-registration/conditional-logic/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-conditional-logic\";}i:7;O:8:\"stdClass\":4:{s:5:\"title\";s:15:\"Profile Connect\";s:5:\"image\";s:120:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/profile-connect.png\";s:7:\"excerpt\";s:211:\"Connect your old users i.e users created via some other plugins, default WordPress registration form to user registration forms. Allows both individual as well as bulk connection of users to any particular form.\";s:4:\"link\";s:171:\"https://wpeverest.com/wordpress-plugins/user-registration/profile-connect/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-profile-connect\";}i:8;O:8:\"stdClass\":4:{s:5:\"title\";s:19:\"PDF Form Submission\";s:5:\"image\";s:124:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/pdf-form-submission.png\";s:7:\"excerpt\";s:217:\"PDF Form Submission addon allows to export registration form data in pdf form. PDF are great way to record, print and share with your team members. Automatically attachs the pdf to emails send to your users and admin.\";s:4:\"link\";s:179:\"https://wpeverest.com/wordpress-plugins/user-registration/pdf-form-submission/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-pdf-form-submission\";}i:9;O:8:\"stdClass\":4:{s:5:\"title\";s:14:\"PayPal Payment\";s:5:\"image\";s:119:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/payment-paypal.png\";s:7:\"excerpt\";s:174:\"Integrates PayPal into your forms for registration fee payments, donations, and more. set either predefined, user defined or hidden amount on the form as per the requirement.\";s:4:\"link\";s:163:\"https://wpeverest.com/wordpress-plugins/user-registration/payments/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-paypal-payment\";}i:10;O:8:\"stdClass\":4:{s:5:\"title\";s:11:\"Geolocation\";s:5:\"image\";s:116:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/geolocation.jpg\";s:7:\"excerpt\";s:187:\"Allows you to collect geo location data from users who registered on your site. Information like Country, City, Zip Code, Latitude/Longitude and location map for the user will accessible.\";s:4:\"link\";s:163:\"https://wpeverest.com/wordpress-plugins/user-registration/geolocation/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-geolocation\";}i:11;O:8:\"stdClass\":4:{s:5:\"title\";s:9:\"LearnDash\";s:5:\"image\";s:114:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/learndash.png\";s:7:\"excerpt\";s:125:\"Allows you to view user’s registered learndash courses, automatically enroll users to specified learndash courses and more.\";s:4:\"link\";s:159:\"https://wpeverest.com/wordpress-plugins/user-registration/learndash/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-learndash\";}i:12;O:8:\"stdClass\":4:{s:5:\"title\";s:12:\"Invite Codes\";s:5:\"image\";s:117:\"https://raw.githubusercontent.com/wpeverest/extensions-json/master/user-registration/sections/images/invite-codes.png\";s:7:\"excerpt\";s:198:\" Allows you to restrict the registration on your site to users with invite Codes only. You can create a single or multiple invitation code, set expiry date, usage limit per invitation code and more.\";s:4:\"link\";s:165:\"https://wpeverest.com/wordpress-plugins/user-registration/invite-codes/?utm_source=dashboard_extenstion&utm_medium=banner&utm_campaign=user-registration-invite-codes\";}}}', 'no'),
(296, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/es_ES/wordpress-5.2.2.zip\";s:6:\"locale\";s:5:\"es_ES\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/es_ES/wordpress-5.2.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.2\";s:7:\"version\";s:5:\"5.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1566984378;s:15:\"version_checked\";s:5:\"5.2.2\";s:12:\"translations\";a:0:{}}', 'no'),
(297, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1566984382;s:7:\"checked\";a:5:{s:61:\"advanced-nocaptcha-recaptcha/advanced-nocaptcha-recaptcha.php\";s:3:\"5.5\";s:19:\"akismet/akismet.php\";s:5:\"4.1.2\";s:9:\"hello.php\";s:5:\"1.7.2\";s:39:\"user-registration/user-registration.php\";s:5:\"1.6.3\";s:17:\"wpforo/wpforo.php\";s:5:\"1.6.2\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:5:{s:61:\"advanced-nocaptcha-recaptcha/advanced-nocaptcha-recaptcha.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:42:\"w.org/plugins/advanced-nocaptcha-recaptcha\";s:4:\"slug\";s:28:\"advanced-nocaptcha-recaptcha\";s:6:\"plugin\";s:61:\"advanced-nocaptcha-recaptcha/advanced-nocaptcha-recaptcha.php\";s:11:\"new_version\";s:3:\"5.5\";s:3:\"url\";s:59:\"https://wordpress.org/plugins/advanced-nocaptcha-recaptcha/\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/plugin/advanced-nocaptcha-recaptcha.5.5.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:81:\"https://ps.w.org/advanced-nocaptcha-recaptcha/assets/icon-128x128.jpg?rev=1146799\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:83:\"https://ps.w.org/advanced-nocaptcha-recaptcha/assets/banner-772x250.jpg?rev=1146799\";}s:11:\"banners_rtl\";a:0:{}}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:39:\"user-registration/user-registration.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:31:\"w.org/plugins/user-registration\";s:4:\"slug\";s:17:\"user-registration\";s:6:\"plugin\";s:39:\"user-registration/user-registration.php\";s:11:\"new_version\";s:5:\"1.6.3\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/user-registration/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/user-registration.1.6.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/user-registration/assets/icon-256x256.png?rev=2141788\";s:2:\"1x\";s:70:\"https://ps.w.org/user-registration/assets/icon-128x128.png?rev=2141788\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/user-registration/assets/banner-772x250.png?rev=2141793\";}s:11:\"banners_rtl\";a:0:{}}s:17:\"wpforo/wpforo.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:20:\"w.org/plugins/wpforo\";s:4:\"slug\";s:6:\"wpforo\";s:6:\"plugin\";s:17:\"wpforo/wpforo.php\";s:11:\"new_version\";s:5:\"1.6.2\";s:3:\"url\";s:37:\"https://wordpress.org/plugins/wpforo/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/wpforo.1.6.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/wpforo/assets/icon-256x256.png?rev=2121644\";s:2:\"1x\";s:59:\"https://ps.w.org/wpforo/assets/icon-128x128.png?rev=1443649\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:62:\"https://ps.w.org/wpforo/assets/banner-1544x500.png?rev=1743533\";s:2:\"1x\";s:61:\"https://ps.w.org/wpforo/assets/banner-772x250.png?rev=1743533\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(298, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1566984382;s:7:\"checked\";a:5:{s:7:\"lyrical\";s:5:\"1.1.3\";s:6:\"primer\";s:5:\"1.8.7\";s:14:\"twentynineteen\";s:3:\"1.4\";s:15:\"twentyseventeen\";s:3:\"2.2\";s:13:\"twentysixteen\";s:3:\"2.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(299, 'wpforo_stat', 'a:9:{s:6:\"forums\";s:1:\"3\";s:6:\"topics\";s:1:\"0\";s:5:\"posts\";s:1:\"0\";s:7:\"members\";s:1:\"1\";s:20:\"online_members_count\";s:1:\"1\";s:15:\"last_post_title\";s:0:\"\";s:13:\"last_post_url\";s:0:\"\";s:19:\"newest_member_dname\";s:7:\"alumnos\";s:25:\"newest_member_profile_url\";s:43:\"http://127.0.0.1/community/profile/alumnos/\";}', 'yes'),
(300, 'wpforo_count_per_page', '10', 'yes'),
(301, 'wpforo_member_options', 'a:16:{s:18:\"custom_title_is_on\";i:1;s:13:\"default_title\";s:6:\"Member\";s:16:\"members_per_page\";i:15;s:21:\"online_status_timeout\";i:240;s:13:\"url_structure\";s:8:\"nicename\";s:11:\"search_type\";s:6:\"search\";s:9:\"login_url\";s:0:\"\";s:12:\"register_url\";s:0:\"\";s:17:\"lost_password_url\";s:0:\"\";s:24:\"redirect_url_after_login\";s:0:\"\";s:27:\"redirect_url_after_register\";s:0:\"\";s:33:\"redirect_url_after_confirm_sbscrb\";s:0:\"\";s:15:\"rating_title_ug\";a:5:{i:1;s:1:\"0\";i:5;s:1:\"1\";i:4;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"1\";}s:15:\"rating_badge_ug\";a:5:{i:1;s:1:\"1\";i:5;s:1:\"1\";i:4;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";}s:15:\"title_usergroup\";a:5:{i:1;s:1:\"1\";i:5;s:1:\"1\";i:4;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"0\";}s:22:\"title_second_usergroup\";a:5:{i:1;s:1:\"0\";i:5;s:1:\"0\";i:4;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"1\";}}', 'yes'),
(302, 'wpforo_pageid', '21', 'yes'),
(303, 'wpforo_use_home_url', '0', 'yes'),
(304, 'wpforo_permastruct', 'community', 'yes'),
(305, 'wpforo_url', 'http://127.0.0.1/community/', 'yes'),
(306, 'wpforo_general_options', 'a:3:{s:5:\"title\";s:20:\"Cripto_altramuz Foro\";s:11:\"description\";s:23:\"Cripto_altramuz General\";s:4:\"lang\";s:1:\"1\";}', 'yes'),
(307, 'wpforo_version', '1.6.2', 'yes'),
(308, 'widget_wpforo_widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(309, 'widget_wpforo_widget_online_members', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(310, 'widget_wpforo_widget_recent_topics', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(311, 'widget_wpforo_widget_recent_replies', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(312, 'widget_wpforo_widget_tags', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(315, 'wpforo_version_db', '1.6.2', 'yes'),
(316, 'wpforo-addon-note-dismissed', 'Embeds,Polls,MyCRED Integration,User Custom Fields,Advanced Attachments,Private Messages,\"Forum - Blog\" Cross Posting,Ads Manager,', 'yes'),
(317, 'wpforo-addon-note-first', 'true', 'yes'),
(339, '_site_transient_timeout_browser_e52f651ddcacf6f7bb95771b08d4a266', '1567079142', 'no'),
(340, '_site_transient_browser_e52f651ddcacf6f7bb95771b08d4a266', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:11:\"78.0.3879.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(341, '_site_transient_timeout_php_check_78e1776a2900a8656cebe7d7ea2a07cc', '1567079142', 'no'),
(342, '_site_transient_php_check_78e1776a2900a8656cebe7d7ea2a07cc', 'a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(398, '_transient_timeout_wpforo_get_phrases_b9fafd99f7', '1567070777', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(399, '_transient_wpforo_get_phrases_b9fafd99f7', 'a:650:{i:0;a:5:{s:8:\"phraseid\";s:1:\"1\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"%s and %s liked\";s:12:\"phrase_value\";s:15:\"%s and %s liked\";s:7:\"package\";s:6:\"wpforo\";}i:1;a:5:{s:8:\"phraseid\";s:1:\"2\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"%s liked\";s:12:\"phrase_value\";s:8:\"%s liked\";s:7:\"package\";s:6:\"wpforo\";}i:2;a:5:{s:8:\"phraseid\";s:1:\"3\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"%s, %s and %s liked\";s:12:\"phrase_value\";s:19:\"%s, %s and %s liked\";s:7:\"package\";s:6:\"wpforo\";}i:3;a:5:{s:8:\"phraseid\";s:1:\"4\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:30:\"%s, %s, %s and %d people liked\";s:12:\"phrase_value\";s:30:\"%s, %s, %s and %d people liked\";s:7:\"package\";s:6:\"wpforo\";}i:4;a:5:{s:8:\"phraseid\";s:1:\"5\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"AOL IM\";s:12:\"phrase_value\";s:6:\"AOL IM\";s:7:\"package\";s:6:\"wpforo\";}i:5;a:5:{s:8:\"phraseid\";s:1:\"6\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"About Me\";s:12:\"phrase_value\";s:8:\"About Me\";s:7:\"package\";s:6:\"wpforo\";}i:6;a:5:{s:8:\"phraseid\";s:1:\"7\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Access add error\";s:12:\"phrase_value\";s:16:\"Access add error\";s:7:\"package\";s:6:\"wpforo\";}i:7;a:5:{s:8:\"phraseid\";s:1:\"8\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Access delete error\";s:12:\"phrase_value\";s:19:\"Access delete error\";s:7:\"package\";s:6:\"wpforo\";}i:8;a:5:{s:8:\"phraseid\";s:1:\"9\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Access edit error\";s:12:\"phrase_value\";s:17:\"Access edit error\";s:7:\"package\";s:6:\"wpforo\";}i:9;a:5:{s:8:\"phraseid\";s:2:\"10\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Access successfully deleted\";s:12:\"phrase_value\";s:27:\"Access successfully deleted\";s:7:\"package\";s:6:\"wpforo\";}i:10;a:5:{s:8:\"phraseid\";s:2:\"11\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Account\";s:12:\"phrase_value\";s:7:\"Account\";s:7:\"package\";s:6:\"wpforo\";}i:11;a:5:{s:8:\"phraseid\";s:2:\"12\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Activity\";s:12:\"phrase_value\";s:8:\"Activity\";s:7:\"package\";s:6:\"wpforo\";}i:12;a:5:{s:8:\"phraseid\";s:2:\"13\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:34:\"Add Topic error: No forum selected\";s:12:\"phrase_value\";s:34:\"Add Topic error: No forum selected\";s:7:\"package\";s:6:\"wpforo\";}i:13;a:5:{s:8:\"phraseid\";s:2:\"14\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Add a comment\";s:12:\"phrase_value\";s:13:\"Add a comment\";s:7:\"package\";s:6:\"wpforo\";}i:14;a:5:{s:8:\"phraseid\";s:2:\"15\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Add topic\";s:12:\"phrase_value\";s:9:\"Add topic\";s:7:\"package\";s:6:\"wpforo\";}i:15;a:5:{s:8:\"phraseid\";s:2:\"16\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"All Checked topics successfully deleted\";s:12:\"phrase_value\";s:39:\"All Checked topics successfully deleted\";s:7:\"package\";s:6:\"wpforo\";}i:16;a:5:{s:8:\"phraseid\";s:2:\"17\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Answer\";s:12:\"phrase_value\";s:6:\"Answer\";s:7:\"package\";s:6:\"wpforo\";}i:17;a:5:{s:8:\"phraseid\";s:2:\"18\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Answer to\";s:12:\"phrase_value\";s:9:\"Answer to\";s:7:\"package\";s:6:\"wpforo\";}i:18;a:5:{s:8:\"phraseid\";s:2:\"19\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Answers\";s:12:\"phrase_value\";s:7:\"Answers\";s:7:\"package\";s:6:\"wpforo\";}i:19;a:5:{s:8:\"phraseid\";s:2:\"20\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Any Date\";s:12:\"phrase_value\";s:8:\"Any Date\";s:7:\"package\";s:6:\"wpforo\";}i:20;a:5:{s:8:\"phraseid\";s:2:\"21\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Ascending order\";s:12:\"phrase_value\";s:15:\"Ascending order\";s:7:\"package\";s:6:\"wpforo\";}i:21;a:5:{s:8:\"phraseid\";s:2:\"22\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Attach file:\";s:12:\"phrase_value\";s:12:\"Attach file:\";s:7:\"package\";s:6:\"wpforo\";}i:22;a:5:{s:8:\"phraseid\";s:2:\"23\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Avatar\";s:12:\"phrase_value\";s:6:\"Avatar\";s:7:\"package\";s:6:\"wpforo\";}i:23;a:5:{s:8:\"phraseid\";s:2:\"24\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Can\'t add forum\";s:12:\"phrase_value\";s:15:\"Can\'t add forum\";s:7:\"package\";s:6:\"wpforo\";}i:24;a:5:{s:8:\"phraseid\";s:2:\"25\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"Can\'t add new language\";s:12:\"phrase_value\";s:22:\"Can\'t add new language\";s:7:\"package\";s:6:\"wpforo\";}i:25;a:5:{s:8:\"phraseid\";s:2:\"26\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Can\'t delete this Usergroup\";s:12:\"phrase_value\";s:27:\"Can\'t delete this Usergroup\";s:7:\"package\";s:6:\"wpforo\";}i:26;a:5:{s:8:\"phraseid\";s:2:\"27\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Can\'t send confirmation email\";s:12:\"phrase_value\";s:29:\"Can\'t send confirmation email\";s:7:\"package\";s:6:\"wpforo\";}i:27;a:5:{s:8:\"phraseid\";s:2:\"28\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"Can\'t send report email\";s:12:\"phrase_value\";s:23:\"Can\'t send report email\";s:7:\"package\";s:6:\"wpforo\";}i:28;a:5:{s:8:\"phraseid\";s:2:\"29\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:28:\"Can\'t subscribe to this item\";s:12:\"phrase_value\";s:28:\"Can\'t subscribe to this item\";s:7:\"package\";s:6:\"wpforo\";}i:29;a:5:{s:8:\"phraseid\";s:2:\"30\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:40:\"Can\'t write a post: This topic is closed\";s:12:\"phrase_value\";s:40:\"Can\'t write a post: This topic is closed\";s:7:\"package\";s:6:\"wpforo\";}i:30;a:5:{s:8:\"phraseid\";s:2:\"31\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Can`t upload file\";s:12:\"phrase_value\";s:17:\"Can`t upload file\";s:7:\"package\";s:6:\"wpforo\";}i:31;a:5:{s:8:\"phraseid\";s:2:\"32\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Cannot update forum hierarchy\";s:12:\"phrase_value\";s:29:\"Cannot update forum hierarchy\";s:7:\"package\";s:6:\"wpforo\";}i:32;a:5:{s:8:\"phraseid\";s:2:\"33\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"Cannot update post data\";s:12:\"phrase_value\";s:23:\"Cannot update post data\";s:7:\"package\";s:6:\"wpforo\";}i:33;a:5:{s:8:\"phraseid\";s:2:\"34\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Change password\";s:12:\"phrase_value\";s:15:\"Change password\";s:7:\"package\";s:6:\"wpforo\";}i:34;a:5:{s:8:\"phraseid\";s:2:\"35\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Choose Target Forum\";s:12:\"phrase_value\";s:19:\"Choose Target Forum\";s:7:\"package\";s:6:\"wpforo\";}i:35;a:5:{s:8:\"phraseid\";s:2:\"36\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Comments\";s:12:\"phrase_value\";s:8:\"Comments\";s:7:\"package\";s:6:\"wpforo\";}i:36;a:5:{s:8:\"phraseid\";s:2:\"37\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"Confirm my subscription\";s:12:\"phrase_value\";s:23:\"Confirm my subscription\";s:7:\"package\";s:6:\"wpforo\";}i:37;a:5:{s:8:\"phraseid\";s:2:\"38\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"Could not be unsubscribe from this item\";s:12:\"phrase_value\";s:39:\"Could not be unsubscribe from this item\";s:7:\"package\";s:6:\"wpforo\";}i:38;a:5:{s:8:\"phraseid\";s:2:\"39\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"Date\";s:12:\"phrase_value\";s:4:\"Date\";s:7:\"package\";s:6:\"wpforo\";}i:39;a:5:{s:8:\"phraseid\";s:2:\"40\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Delete\";s:12:\"phrase_value\";s:6:\"Delete\";s:7:\"package\";s:6:\"wpforo\";}i:40;a:5:{s:8:\"phraseid\";s:2:\"41\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Descending order\";s:12:\"phrase_value\";s:16:\"Descending order\";s:7:\"package\";s:6:\"wpforo\";}i:41;a:5:{s:8:\"phraseid\";s:2:\"42\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Display Name\";s:12:\"phrase_value\";s:12:\"Display Name\";s:7:\"package\";s:6:\"wpforo\";}i:42;a:5:{s:8:\"phraseid\";s:2:\"43\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"Edit\";s:12:\"phrase_value\";s:4:\"Edit\";s:7:\"package\";s:6:\"wpforo\";}i:43;a:5:{s:8:\"phraseid\";s:2:\"44\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Edited: \";s:12:\"phrase_value\";s:8:\"Edited: \";s:7:\"package\";s:6:\"wpforo\";}i:44;a:5:{s:8:\"phraseid\";s:2:\"45\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Email\";s:12:\"phrase_value\";s:5:\"Email\";s:7:\"package\";s:6:\"wpforo\";}i:45;a:5:{s:8:\"phraseid\";s:2:\"46\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:44:\"Email address exists. Please insert another.\";s:12:\"phrase_value\";s:44:\"Email address exists. Please insert another.\";s:7:\"package\";s:6:\"wpforo\";}i:46;a:5:{s:8:\"phraseid\";s:2:\"47\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Enter title here\";s:12:\"phrase_value\";s:16:\"Enter title here\";s:7:\"package\";s:6:\"wpforo\";}i:47;a:5:{s:8:\"phraseid\";s:2:\"48\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"Error: Forum is not found\";s:12:\"phrase_value\";s:25:\"Error: Forum is not found\";s:7:\"package\";s:6:\"wpforo\";}i:48;a:5:{s:8:\"phraseid\";s:2:\"49\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"Error: No topic selected\";s:12:\"phrase_value\";s:24:\"Error: No topic selected\";s:7:\"package\";s:6:\"wpforo\";}i:49;a:5:{s:8:\"phraseid\";s:2:\"50\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"Error: Topic is not found\";s:12:\"phrase_value\";s:25:\"Error: Topic is not found\";s:7:\"package\";s:6:\"wpforo\";}i:50;a:5:{s:8:\"phraseid\";s:2:\"51\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:41:\"Error: please insert some text to report.\";s:12:\"phrase_value\";s:41:\"Error: please insert some text to report.\";s:7:\"package\";s:6:\"wpforo\";}i:51;a:5:{s:8:\"phraseid\";s:2:\"52\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Facebook\";s:12:\"phrase_value\";s:8:\"Facebook\";s:7:\"package\";s:6:\"wpforo\";}i:52;a:5:{s:8:\"phraseid\";s:2:\"53\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:28:\"Failed to write file to disk\";s:12:\"phrase_value\";s:28:\"Failed to write file to disk\";s:7:\"package\";s:6:\"wpforo\";}i:53;a:5:{s:8:\"phraseid\";s:2:\"54\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Features successfully updated\";s:12:\"phrase_value\";s:29:\"Features successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:54;a:5:{s:8:\"phraseid\";s:2:\"55\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:61:\"Features successfully updated, but previous value not changed\";s:12:\"phrase_value\";s:61:\"Features successfully updated, but previous value not changed\";s:7:\"package\";s:6:\"wpforo\";}i:55;a:5:{s:8:\"phraseid\";s:2:\"56\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"File type is not allowed\";s:12:\"phrase_value\";s:24:\"File type is not allowed\";s:7:\"package\";s:6:\"wpforo\";}i:56;a:5:{s:8:\"phraseid\";s:2:\"57\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:32:\"File upload stopped by extension\";s:12:\"phrase_value\";s:32:\"File upload stopped by extension\";s:7:\"package\";s:6:\"wpforo\";}i:57;a:5:{s:8:\"phraseid\";s:2:\"58\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Find Posts by User\";s:12:\"phrase_value\";s:18:\"Find Posts by User\";s:7:\"package\";s:6:\"wpforo\";}i:58;a:5:{s:8:\"phraseid\";s:2:\"59\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Find Topics Started by User\";s:12:\"phrase_value\";s:27:\"Find Topics Started by User\";s:7:\"package\";s:6:\"wpforo\";}i:59;a:5:{s:8:\"phraseid\";s:2:\"60\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"First post and replies\";s:12:\"phrase_value\";s:22:\"First post and replies\";s:7:\"package\";s:6:\"wpforo\";}i:60;a:5:{s:8:\"phraseid\";s:2:\"61\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Forum\";s:12:\"phrase_value\";s:5:\"Forum\";s:7:\"package\";s:6:\"wpforo\";}i:61;a:5:{s:8:\"phraseid\";s:2:\"62\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Forum - Login\";s:12:\"phrase_value\";s:13:\"Forum - Login\";s:7:\"package\";s:6:\"wpforo\";}i:62;a:5:{s:8:\"phraseid\";s:2:\"63\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"Forum - Page Not Found\";s:12:\"phrase_value\";s:22:\"Forum - Page Not Found\";s:7:\"package\";s:6:\"wpforo\";}i:63;a:5:{s:8:\"phraseid\";s:2:\"64\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"Forum - Registration\";s:12:\"phrase_value\";s:20:\"Forum - Registration\";s:7:\"package\";s:6:\"wpforo\";}i:64;a:5:{s:8:\"phraseid\";s:2:\"65\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:35:\"Forum Base URL successfully updated\";s:12:\"phrase_value\";s:35:\"Forum Base URL successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:65;a:5:{s:8:\"phraseid\";s:2:\"66\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Forum Home\";s:12:\"phrase_value\";s:10:\"Forum Home\";s:7:\"package\";s:6:\"wpforo\";}i:66;a:5:{s:8:\"phraseid\";s:2:\"67\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Forum Members\";s:12:\"phrase_value\";s:13:\"Forum Members\";s:7:\"package\";s:6:\"wpforo\";}i:67;a:5:{s:8:\"phraseid\";s:2:\"68\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Forum Profile\";s:12:\"phrase_value\";s:13:\"Forum Profile\";s:7:\"package\";s:6:\"wpforo\";}i:68;a:5:{s:8:\"phraseid\";s:2:\"69\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Forum RSS Feed\";s:12:\"phrase_value\";s:14:\"Forum RSS Feed\";s:7:\"package\";s:6:\"wpforo\";}i:69;a:5:{s:8:\"phraseid\";s:2:\"70\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Forum Statistics\";s:12:\"phrase_value\";s:16:\"Forum Statistics\";s:7:\"package\";s:6:\"wpforo\";}i:70;a:5:{s:8:\"phraseid\";s:2:\"71\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"Forum deleting error\";s:12:\"phrase_value\";s:20:\"Forum deleting error\";s:7:\"package\";s:6:\"wpforo\";}i:71;a:5:{s:8:\"phraseid\";s:2:\"72\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:36:\"Forum hierarchy successfully updated\";s:12:\"phrase_value\";s:36:\"Forum hierarchy successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:72;a:5:{s:8:\"phraseid\";s:2:\"73\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Forum is empty\";s:12:\"phrase_value\";s:14:\"Forum is empty\";s:7:\"package\";s:6:\"wpforo\";}i:73;a:5:{s:8:\"phraseid\";s:2:\"74\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:28:\"Forum is successfully merged\";s:12:\"phrase_value\";s:28:\"Forum is successfully merged\";s:7:\"package\";s:6:\"wpforo\";}i:74;a:5:{s:8:\"phraseid\";s:2:\"75\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Forum merging error\";s:12:\"phrase_value\";s:19:\"Forum merging error\";s:7:\"package\";s:6:\"wpforo\";}i:75;a:5:{s:8:\"phraseid\";s:2:\"76\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:34:\"Forum options successfully updated\";s:12:\"phrase_value\";s:34:\"Forum options successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:76;a:5:{s:8:\"phraseid\";s:2:\"77\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:66:\"Forum options successfully updated, but previous value not changed\";s:12:\"phrase_value\";s:66:\"Forum options successfully updated, but previous value not changed\";s:7:\"package\";s:6:\"wpforo\";}i:77;a:5:{s:8:\"phraseid\";s:2:\"78\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"Forum successfully updated\";s:12:\"phrase_value\";s:26:\"Forum successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:78;a:5:{s:8:\"phraseid\";s:2:\"79\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Forum update error\";s:12:\"phrase_value\";s:18:\"Forum update error\";s:7:\"package\";s:6:\"wpforo\";}i:79;a:5:{s:8:\"phraseid\";s:2:\"80\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Forums\";s:12:\"phrase_value\";s:6:\"Forums\";s:7:\"package\";s:6:\"wpforo\";}i:80;a:5:{s:8:\"phraseid\";s:2:\"81\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:36:\"General options successfully updated\";s:12:\"phrase_value\";s:36:\"General options successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:81;a:5:{s:8:\"phraseid\";s:2:\"82\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Group\";s:12:\"phrase_value\";s:5:\"Group\";s:7:\"package\";s:6:\"wpforo\";}i:82;a:5:{s:8:\"phraseid\";s:2:\"83\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Google+\";s:12:\"phrase_value\";s:7:\"Google+\";s:7:\"package\";s:6:\"wpforo\";}i:83;a:5:{s:8:\"phraseid\";s:2:\"84\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Guest\";s:12:\"phrase_value\";s:5:\"Guest\";s:7:\"package\";s:6:\"wpforo\";}i:84;a:5:{s:8:\"phraseid\";s:2:\"85\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"ICQ\";s:12:\"phrase_value\";s:3:\"ICQ\";s:7:\"package\";s:6:\"wpforo\";}i:85;a:5:{s:8:\"phraseid\";s:2:\"86\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:30:\"Illegal character in username.\";s:12:\"phrase_value\";s:30:\"Illegal character in username.\";s:7:\"package\";s:6:\"wpforo\";}i:86;a:5:{s:8:\"phraseid\";s:2:\"87\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Insert member name or email\";s:12:\"phrase_value\";s:27:\"Insert member name or email\";s:7:\"package\";s:6:\"wpforo\";}i:87;a:5:{s:8:\"phraseid\";s:2:\"88\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"Insert your Email address.\";s:12:\"phrase_value\";s:26:\"Insert your Email address.\";s:7:\"package\";s:6:\"wpforo\";}i:88;a:5:{s:8:\"phraseid\";s:2:\"89\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Invalid Email address\";s:12:\"phrase_value\";s:21:\"Invalid Email address\";s:7:\"package\";s:6:\"wpforo\";}i:89;a:5:{s:8:\"phraseid\";s:2:\"90\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Invalid request!\";s:12:\"phrase_value\";s:16:\"Invalid request!\";s:7:\"package\";s:6:\"wpforo\";}i:90;a:5:{s:8:\"phraseid\";s:2:\"91\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Joined\";s:12:\"phrase_value\";s:6:\"Joined\";s:7:\"package\";s:6:\"wpforo\";}i:91;a:5:{s:8:\"phraseid\";s:2:\"92\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Last 24 hours\";s:12:\"phrase_value\";s:13:\"Last 24 hours\";s:7:\"package\";s:6:\"wpforo\";}i:92;a:5:{s:8:\"phraseid\";s:2:\"93\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Last 3 Months\";s:12:\"phrase_value\";s:13:\"Last 3 Months\";s:7:\"package\";s:6:\"wpforo\";}i:93;a:5:{s:8:\"phraseid\";s:2:\"94\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Last 6 Months\";s:12:\"phrase_value\";s:13:\"Last 6 Months\";s:7:\"package\";s:6:\"wpforo\";}i:94;a:5:{s:8:\"phraseid\";s:2:\"95\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Last Active\";s:12:\"phrase_value\";s:11:\"Last Active\";s:7:\"package\";s:6:\"wpforo\";}i:95;a:5:{s:8:\"phraseid\";s:2:\"96\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Last Month\";s:12:\"phrase_value\";s:10:\"Last Month\";s:7:\"package\";s:6:\"wpforo\";}i:96;a:5:{s:8:\"phraseid\";s:2:\"97\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Last Post\";s:12:\"phrase_value\";s:9:\"Last Post\";s:7:\"package\";s:6:\"wpforo\";}i:97;a:5:{s:8:\"phraseid\";s:2:\"98\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Last Post Info\";s:12:\"phrase_value\";s:14:\"Last Post Info\";s:7:\"package\";s:6:\"wpforo\";}i:98;a:5:{s:8:\"phraseid\";s:2:\"99\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Last Week\";s:12:\"phrase_value\";s:9:\"Last Week\";s:7:\"package\";s:6:\"wpforo\";}i:99;a:5:{s:8:\"phraseid\";s:3:\"100\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Last Year ago\";s:12:\"phrase_value\";s:13:\"Last Year ago\";s:7:\"package\";s:6:\"wpforo\";}i:100;a:5:{s:8:\"phraseid\";s:3:\"101\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Last post by %s\";s:12:\"phrase_value\";s:15:\"Last post by %s\";s:7:\"package\";s:6:\"wpforo\";}i:101;a:5:{s:8:\"phraseid\";s:3:\"102\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Latest Post\";s:12:\"phrase_value\";s:11:\"Latest Post\";s:7:\"package\";s:6:\"wpforo\";}i:102;a:5:{s:8:\"phraseid\";s:3:\"103\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Leave a reply\";s:12:\"phrase_value\";s:13:\"Leave a reply\";s:7:\"package\";s:6:\"wpforo\";}i:103;a:5:{s:8:\"phraseid\";s:3:\"104\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:54:\"Length must be between 3 characters and 15 characters.\";s:12:\"phrase_value\";s:54:\"Length must be between 3 characters and 15 characters.\";s:7:\"package\";s:6:\"wpforo\";}i:104;a:5:{s:8:\"phraseid\";s:3:\"105\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Liked\";s:12:\"phrase_value\";s:5:\"Liked\";s:7:\"package\";s:6:\"wpforo\";}i:105;a:5:{s:8:\"phraseid\";s:3:\"106\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Location\";s:12:\"phrase_value\";s:8:\"Location\";s:7:\"package\";s:6:\"wpforo\";}i:106;a:5:{s:8:\"phraseid\";s:3:\"107\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Login\";s:12:\"phrase_value\";s:5:\"Login\";s:7:\"package\";s:6:\"wpforo\";}i:107;a:5:{s:8:\"phraseid\";s:3:\"108\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Logout\";s:12:\"phrase_value\";s:6:\"Logout\";s:7:\"package\";s:6:\"wpforo\";}i:108;a:5:{s:8:\"phraseid\";s:3:\"109\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Lost your password?\";s:12:\"phrase_value\";s:19:\"Lost your password?\";s:7:\"package\";s:6:\"wpforo\";}i:109;a:5:{s:8:\"phraseid\";s:3:\"110\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"MSN\";s:12:\"phrase_value\";s:3:\"MSN\";s:7:\"package\";s:6:\"wpforo\";}i:110;a:5:{s:8:\"phraseid\";s:3:\"111\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:28:\"Maximum allowed file size is\";s:12:\"phrase_value\";s:28:\"Maximum allowed file size is\";s:7:\"package\";s:6:\"wpforo\";}i:111;a:5:{s:8:\"phraseid\";s:3:\"112\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Member Activity\";s:12:\"phrase_value\";s:15:\"Member Activity\";s:7:\"package\";s:6:\"wpforo\";}i:112;a:5:{s:8:\"phraseid\";s:3:\"113\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Member Information\";s:12:\"phrase_value\";s:18:\"Member Information\";s:7:\"package\";s:6:\"wpforo\";}i:113;a:5:{s:8:\"phraseid\";s:3:\"114\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Member Rating\";s:12:\"phrase_value\";s:13:\"Member Rating\";s:7:\"package\";s:6:\"wpforo\";}i:114;a:5:{s:8:\"phraseid\";s:3:\"115\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Member Rating Badge\";s:12:\"phrase_value\";s:19:\"Member Rating Badge\";s:7:\"package\";s:6:\"wpforo\";}i:115;a:5:{s:8:\"phraseid\";s:3:\"116\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:35:\"Member options successfully updated\";s:12:\"phrase_value\";s:35:\"Member options successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:116;a:5:{s:8:\"phraseid\";s:3:\"117\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:67:\"Member options successfully updated, but previous value not changed\";s:12:\"phrase_value\";s:67:\"Member options successfully updated, but previous value not changed\";s:7:\"package\";s:6:\"wpforo\";}i:117;a:5:{s:8:\"phraseid\";s:3:\"118\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Members\";s:12:\"phrase_value\";s:7:\"Members\";s:7:\"package\";s:6:\"wpforo\";}i:118;a:5:{s:8:\"phraseid\";s:3:\"119\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Members not found\";s:12:\"phrase_value\";s:17:\"Members not found\";s:7:\"package\";s:6:\"wpforo\";}i:119;a:5:{s:8:\"phraseid\";s:3:\"120\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Message has been sent\";s:12:\"phrase_value\";s:21:\"Message has been sent\";s:7:\"package\";s:6:\"wpforo\";}i:120;a:5:{s:8:\"phraseid\";s:3:\"121\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Messages\";s:12:\"phrase_value\";s:8:\"Messages\";s:7:\"package\";s:6:\"wpforo\";}i:121;a:5:{s:8:\"phraseid\";s:3:\"122\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"Missing a temporary folder\";s:12:\"phrase_value\";s:26:\"Missing a temporary folder\";s:7:\"package\";s:6:\"wpforo\";}i:122;a:5:{s:8:\"phraseid\";s:3:\"123\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"Move\";s:12:\"phrase_value\";s:4:\"Move\";s:7:\"package\";s:6:\"wpforo\";}i:123;a:5:{s:8:\"phraseid\";s:3:\"124\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Move Topic\";s:12:\"phrase_value\";s:10:\"Move Topic\";s:7:\"package\";s:6:\"wpforo\";}i:124;a:5:{s:8:\"phraseid\";s:3:\"125\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Must be minimum 6 characters.\";s:12:\"phrase_value\";s:29:\"Must be minimum 6 characters.\";s:7:\"package\";s:6:\"wpforo\";}i:125;a:5:{s:8:\"phraseid\";s:3:\"126\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"My Profile\";s:12:\"phrase_value\";s:10:\"My Profile\";s:7:\"package\";s:6:\"wpforo\";}i:126;a:5:{s:8:\"phraseid\";s:3:\"127\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:75:\"New language successfully added and changed wpforo language to new language\";s:12:\"phrase_value\";s:75:\"New language successfully added and changed wpforo language to new language\";s:7:\"package\";s:6:\"wpforo\";}i:127;a:5:{s:8:\"phraseid\";s:3:\"128\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"No Posts found for update\";s:12:\"phrase_value\";s:25:\"No Posts found for update\";s:7:\"package\";s:6:\"wpforo\";}i:128;a:5:{s:8:\"phraseid\";s:3:\"129\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:34:\"No activity found for this member.\";s:12:\"phrase_value\";s:34:\"No activity found for this member.\";s:7:\"package\";s:6:\"wpforo\";}i:129;a:5:{s:8:\"phraseid\";s:3:\"130\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"No file was uploaded\";s:12:\"phrase_value\";s:20:\"No file was uploaded\";s:7:\"package\";s:6:\"wpforo\";}i:130;a:5:{s:8:\"phraseid\";s:3:\"131\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"No forums were found here.\";s:12:\"phrase_value\";s:26:\"No forums were found here.\";s:7:\"package\";s:6:\"wpforo\";}i:131;a:5:{s:8:\"phraseid\";s:3:\"132\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"No online members at the moment\";s:12:\"phrase_value\";s:31:\"No online members at the moment\";s:7:\"package\";s:6:\"wpforo\";}i:132;a:5:{s:8:\"phraseid\";s:3:\"133\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"No subscriptions found for this member.\";s:12:\"phrase_value\";s:39:\"No subscriptions found for this member.\";s:7:\"package\";s:6:\"wpforo\";}i:133;a:5:{s:8:\"phraseid\";s:3:\"134\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"No topics were found here\";s:12:\"phrase_value\";s:25:\"No topics were found here\";s:7:\"package\";s:6:\"wpforo\";}i:134;a:5:{s:8:\"phraseid\";s:3:\"135\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Occupation\";s:12:\"phrase_value\";s:10:\"Occupation\";s:7:\"package\";s:6:\"wpforo\";}i:135;a:5:{s:8:\"phraseid\";s:3:\"136\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Offline\";s:12:\"phrase_value\";s:7:\"Offline\";s:7:\"package\";s:6:\"wpforo\";}i:136;a:5:{s:8:\"phraseid\";s:3:\"137\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Online\";s:12:\"phrase_value\";s:6:\"Online\";s:7:\"package\";s:6:\"wpforo\";}i:137;a:5:{s:8:\"phraseid\";s:3:\"138\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:43:\"Oops! The page you requested was not found!\";s:12:\"phrase_value\";s:43:\"Oops! The page you requested was not found!\";s:7:\"package\";s:6:\"wpforo\";}i:138;a:5:{s:8:\"phraseid\";s:3:\"139\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Our newest member\";s:12:\"phrase_value\";s:17:\"Our newest member\";s:7:\"package\";s:6:\"wpforo\";}i:139;a:5:{s:8:\"phraseid\";s:3:\"140\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"Page\";s:12:\"phrase_value\";s:4:\"Page\";s:7:\"package\";s:6:\"wpforo\";}i:140;a:5:{s:8:\"phraseid\";s:3:\"141\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Password\";s:12:\"phrase_value\";s:8:\"Password\";s:7:\"package\";s:6:\"wpforo\";}i:141;a:5:{s:8:\"phraseid\";s:3:\"142\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:63:\"Password length must be between 6 characters and 20 characters.\";s:12:\"phrase_value\";s:63:\"Password length must be between 6 characters and 20 characters.\";s:7:\"package\";s:6:\"wpforo\";}i:142;a:5:{s:8:\"phraseid\";s:3:\"143\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Password mismatch.\";s:12:\"phrase_value\";s:18:\"Password mismatch.\";s:7:\"package\";s:6:\"wpforo\";}i:143;a:5:{s:8:\"phraseid\";s:3:\"144\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Permission denied\";s:12:\"phrase_value\";s:17:\"Permission denied\";s:7:\"package\";s:6:\"wpforo\";}i:144;a:5:{s:8:\"phraseid\";s:3:\"145\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"Permission denied for add forum\";s:12:\"phrase_value\";s:31:\"Permission denied for add forum\";s:7:\"package\";s:6:\"wpforo\";}i:145;a:5:{s:8:\"phraseid\";s:3:\"146\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:34:\"Permission denied for delete forum\";s:12:\"phrase_value\";s:34:\"Permission denied for delete forum\";s:7:\"package\";s:6:\"wpforo\";}i:146;a:5:{s:8:\"phraseid\";s:3:\"147\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:32:\"Permission denied for edit forum\";s:12:\"phrase_value\";s:32:\"Permission denied for edit forum\";s:7:\"package\";s:6:\"wpforo\";}i:147;a:5:{s:8:\"phraseid\";s:3:\"148\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:33:\"Permission denied for this action\";s:12:\"phrase_value\";s:33:\"Permission denied for this action\";s:7:\"package\";s:6:\"wpforo\";}i:148;a:5:{s:8:\"phraseid\";s:3:\"149\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Phrase add error\";s:12:\"phrase_value\";s:16:\"Phrase add error\";s:7:\"package\";s:6:\"wpforo\";}i:149;a:5:{s:8:\"phraseid\";s:3:\"150\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Phrase adding error\";s:12:\"phrase_value\";s:19:\"Phrase adding error\";s:7:\"package\";s:6:\"wpforo\";}i:150;a:5:{s:8:\"phraseid\";s:3:\"151\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"Phrase successfully added\";s:12:\"phrase_value\";s:25:\"Phrase successfully added\";s:7:\"package\";s:6:\"wpforo\";}i:151;a:5:{s:8:\"phraseid\";s:3:\"152\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Phrase successfully updates\";s:12:\"phrase_value\";s:27:\"Phrase successfully updates\";s:7:\"package\";s:6:\"wpforo\";}i:152;a:5:{s:8:\"phraseid\";s:3:\"153\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Phrase update error\";s:12:\"phrase_value\";s:19:\"Phrase update error\";s:7:\"package\";s:6:\"wpforo\";}i:153;a:5:{s:8:\"phraseid\";s:3:\"154\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Please %s or %s\";s:12:\"phrase_value\";s:15:\"Please %s or %s\";s:7:\"package\";s:6:\"wpforo\";}i:154;a:5:{s:8:\"phraseid\";s:3:\"155\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:30:\"Please insert required fields!\";s:12:\"phrase_value\";s:30:\"Please insert required fields!\";s:7:\"package\";s:6:\"wpforo\";}i:155;a:5:{s:8:\"phraseid\";s:3:\"156\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Post Title\";s:12:\"phrase_value\";s:10:\"Post Title\";s:7:\"package\";s:6:\"wpforo\";}i:156;a:5:{s:8:\"phraseid\";s:3:\"157\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Post delete error\";s:12:\"phrase_value\";s:17:\"Post delete error\";s:7:\"package\";s:6:\"wpforo\";}i:157;a:5:{s:8:\"phraseid\";s:3:\"158\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Post link\";s:12:\"phrase_value\";s:9:\"Post link\";s:7:\"package\";s:6:\"wpforo\";}i:158;a:5:{s:8:\"phraseid\";s:3:\"159\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:33:\"Post options successfully updated\";s:12:\"phrase_value\";s:33:\"Post options successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:159;a:5:{s:8:\"phraseid\";s:3:\"160\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:65:\"Post options successfully updated, but previous value not changed\";s:12:\"phrase_value\";s:65:\"Post options successfully updated, but previous value not changed\";s:7:\"package\";s:6:\"wpforo\";}i:160;a:5:{s:8:\"phraseid\";s:3:\"161\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Posted\";s:12:\"phrase_value\";s:6:\"Posted\";s:7:\"package\";s:6:\"wpforo\";}i:161;a:5:{s:8:\"phraseid\";s:3:\"162\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Posted by\";s:12:\"phrase_value\";s:9:\"Posted by\";s:7:\"package\";s:6:\"wpforo\";}i:162;a:5:{s:8:\"phraseid\";s:3:\"163\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Posts\";s:12:\"phrase_value\";s:5:\"Posts\";s:7:\"package\";s:6:\"wpforo\";}i:163;a:5:{s:8:\"phraseid\";s:3:\"164\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Powered by\";s:12:\"phrase_value\";s:10:\"Powered by\";s:7:\"package\";s:6:\"wpforo\";}i:164;a:5:{s:8:\"phraseid\";s:3:\"165\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Question Comments\";s:12:\"phrase_value\";s:17:\"Question Comments\";s:7:\"package\";s:6:\"wpforo\";}i:165;a:5:{s:8:\"phraseid\";s:3:\"166\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Questions\";s:12:\"phrase_value\";s:9:\"Questions\";s:7:\"package\";s:6:\"wpforo\";}i:166;a:5:{s:8:\"phraseid\";s:3:\"167\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Quote\";s:12:\"phrase_value\";s:5:\"Quote\";s:7:\"package\";s:6:\"wpforo\";}i:167;a:5:{s:8:\"phraseid\";s:3:\"168\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:2:\"RE\";s:12:\"phrase_value\";s:2:\"RE\";s:7:\"package\";s:6:\"wpforo\";}i:168;a:5:{s:8:\"phraseid\";s:3:\"169\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"REPLY:\";s:12:\"phrase_value\";s:6:\"REPLY:\";s:7:\"package\";s:6:\"wpforo\";}i:169;a:5:{s:8:\"phraseid\";s:3:\"170\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"RSS\";s:12:\"phrase_value\";s:3:\"RSS\";s:7:\"package\";s:6:\"wpforo\";}i:170;a:5:{s:8:\"phraseid\";s:3:\"171\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Rating\";s:12:\"phrase_value\";s:6:\"Rating\";s:7:\"package\";s:6:\"wpforo\";}i:171;a:5:{s:8:\"phraseid\";s:3:\"172\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Rating Badge\";s:12:\"phrase_value\";s:12:\"Rating Badge\";s:7:\"package\";s:6:\"wpforo\";}i:172;a:5:{s:8:\"phraseid\";s:3:\"173\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Received Likes\";s:12:\"phrase_value\";s:14:\"Received Likes\";s:7:\"package\";s:6:\"wpforo\";}i:173;a:5:{s:8:\"phraseid\";s:3:\"174\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Recent Questions\";s:12:\"phrase_value\";s:16:\"Recent Questions\";s:7:\"package\";s:6:\"wpforo\";}i:174;a:5:{s:8:\"phraseid\";s:3:\"175\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Recent Topics\";s:12:\"phrase_value\";s:13:\"Recent Topics\";s:7:\"package\";s:6:\"wpforo\";}i:175;a:5:{s:8:\"phraseid\";s:3:\"176\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Register\";s:12:\"phrase_value\";s:8:\"Register\";s:7:\"package\";s:6:\"wpforo\";}i:176;a:5:{s:8:\"phraseid\";s:3:\"177\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Registered date\";s:12:\"phrase_value\";s:15:\"Registered date\";s:7:\"package\";s:6:\"wpforo\";}i:177;a:5:{s:8:\"phraseid\";s:3:\"178\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Registration Error\";s:12:\"phrase_value\";s:18:\"Registration Error\";s:7:\"package\";s:6:\"wpforo\";}i:178;a:5:{s:8:\"phraseid\";s:3:\"179\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Relevancy\";s:12:\"phrase_value\";s:9:\"Relevancy\";s:7:\"package\";s:6:\"wpforo\";}i:179;a:5:{s:8:\"phraseid\";s:3:\"180\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Remember Me\";s:12:\"phrase_value\";s:11:\"Remember Me\";s:7:\"package\";s:6:\"wpforo\";}i:180;a:5:{s:8:\"phraseid\";s:3:\"181\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Replies\";s:12:\"phrase_value\";s:7:\"Replies\";s:7:\"package\";s:6:\"wpforo\";}i:181;a:5:{s:8:\"phraseid\";s:3:\"182\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Replies not found\";s:12:\"phrase_value\";s:17:\"Replies not found\";s:7:\"package\";s:6:\"wpforo\";}i:182;a:5:{s:8:\"phraseid\";s:3:\"183\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Reply\";s:12:\"phrase_value\";s:5:\"Reply\";s:7:\"package\";s:6:\"wpforo\";}i:183;a:5:{s:8:\"phraseid\";s:3:\"184\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Reply request error\";s:12:\"phrase_value\";s:19:\"Reply request error\";s:7:\"package\";s:6:\"wpforo\";}i:184;a:5:{s:8:\"phraseid\";s:3:\"185\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Report\";s:12:\"phrase_value\";s:6:\"Report\";s:7:\"package\";s:6:\"wpforo\";}i:185;a:5:{s:8:\"phraseid\";s:3:\"186\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"Report to Administration\";s:12:\"phrase_value\";s:24:\"Report to Administration\";s:7:\"package\";s:6:\"wpforo\";}i:186;a:5:{s:8:\"phraseid\";s:3:\"187\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Result Info\";s:12:\"phrase_value\";s:11:\"Result Info\";s:7:\"package\";s:6:\"wpforo\";}i:187;a:5:{s:8:\"phraseid\";s:3:\"188\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"Save\";s:12:\"phrase_value\";s:4:\"Save\";s:7:\"package\";s:6:\"wpforo\";}i:188;a:5:{s:8:\"phraseid\";s:3:\"189\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Save Changes\";s:12:\"phrase_value\";s:12:\"Save Changes\";s:7:\"package\";s:6:\"wpforo\";}i:189;a:5:{s:8:\"phraseid\";s:3:\"190\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Search\";s:12:\"phrase_value\";s:6:\"Search\";s:7:\"package\";s:6:\"wpforo\";}i:190;a:5:{s:8:\"phraseid\";s:3:\"191\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Search Entire Posts\";s:12:\"phrase_value\";s:19:\"Search Entire Posts\";s:7:\"package\";s:6:\"wpforo\";}i:191;a:5:{s:8:\"phraseid\";s:3:\"192\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Search Phrase\";s:12:\"phrase_value\";s:13:\"Search Phrase\";s:7:\"package\";s:6:\"wpforo\";}i:192;a:5:{s:8:\"phraseid\";s:3:\"193\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Search Titles Only\";s:12:\"phrase_value\";s:18:\"Search Titles Only\";s:7:\"package\";s:6:\"wpforo\";}i:193;a:5:{s:8:\"phraseid\";s:3:\"194\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Search Type\";s:12:\"phrase_value\";s:11:\"Search Type\";s:7:\"package\";s:6:\"wpforo\";}i:194;a:5:{s:8:\"phraseid\";s:3:\"195\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Search in Forums\";s:12:\"phrase_value\";s:16:\"Search in Forums\";s:7:\"package\";s:6:\"wpforo\";}i:195;a:5:{s:8:\"phraseid\";s:3:\"196\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Search in date period\";s:12:\"phrase_value\";s:21:\"Search in date period\";s:7:\"package\";s:6:\"wpforo\";}i:196;a:5:{s:8:\"phraseid\";s:3:\"197\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Search result for\";s:12:\"phrase_value\";s:17:\"Search result for\";s:7:\"package\";s:6:\"wpforo\";}i:197;a:5:{s:8:\"phraseid\";s:3:\"198\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Search...\";s:12:\"phrase_value\";s:9:\"Search...\";s:7:\"package\";s:6:\"wpforo\";}i:198;a:5:{s:8:\"phraseid\";s:3:\"199\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Select Page\";s:12:\"phrase_value\";s:11:\"Select Page\";s:7:\"package\";s:6:\"wpforo\";}i:199;a:5:{s:8:\"phraseid\";s:3:\"200\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Send Report\";s:12:\"phrase_value\";s:11:\"Send Report\";s:7:\"package\";s:6:\"wpforo\";}i:200;a:5:{s:8:\"phraseid\";s:3:\"201\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Set Topic Sticky\";s:12:\"phrase_value\";s:16:\"Set Topic Sticky\";s:7:\"package\";s:6:\"wpforo\";}i:201;a:5:{s:8:\"phraseid\";s:3:\"202\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Shop Account\";s:12:\"phrase_value\";s:12:\"Shop Account\";s:7:\"package\";s:6:\"wpforo\";}i:202;a:5:{s:8:\"phraseid\";s:3:\"203\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Sign In\";s:12:\"phrase_value\";s:7:\"Sign In\";s:7:\"package\";s:6:\"wpforo\";}i:203;a:5:{s:8:\"phraseid\";s:3:\"204\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Signature\";s:12:\"phrase_value\";s:9:\"Signature\";s:7:\"package\";s:6:\"wpforo\";}i:204;a:5:{s:8:\"phraseid\";s:3:\"205\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Site Profile\";s:12:\"phrase_value\";s:12:\"Site Profile\";s:7:\"package\";s:6:\"wpforo\";}i:205;a:5:{s:8:\"phraseid\";s:3:\"206\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Skype\";s:12:\"phrase_value\";s:5:\"Skype\";s:7:\"package\";s:6:\"wpforo\";}i:206;a:5:{s:8:\"phraseid\";s:3:\"207\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Social Networks\";s:12:\"phrase_value\";s:15:\"Social Networks\";s:7:\"package\";s:6:\"wpforo\";}i:207;a:5:{s:8:\"phraseid\";s:3:\"208\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:34:\"Something wrong with profile data.\";s:12:\"phrase_value\";s:34:\"Something wrong with profile data.\";s:7:\"package\";s:6:\"wpforo\";}i:208;a:5:{s:8:\"phraseid\";s:3:\"209\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:38:\"Sorry, something wrong with your data.\";s:12:\"phrase_value\";s:38:\"Sorry, something wrong with your data.\";s:7:\"package\";s:6:\"wpforo\";}i:209;a:5:{s:8:\"phraseid\";s:3:\"210\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"Sort Search Results by\";s:12:\"phrase_value\";s:22:\"Sort Search Results by\";s:7:\"package\";s:6:\"wpforo\";}i:210;a:5:{s:8:\"phraseid\";s:3:\"211\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Specify avatar by URL\";s:12:\"phrase_value\";s:21:\"Specify avatar by URL\";s:7:\"package\";s:6:\"wpforo\";}i:211;a:5:{s:8:\"phraseid\";s:3:\"212\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Subforums\";s:12:\"phrase_value\";s:9:\"Subforums\";s:7:\"package\";s:6:\"wpforo\";}i:212;a:5:{s:8:\"phraseid\";s:3:\"213\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"Subscribe for new replies\";s:12:\"phrase_value\";s:25:\"Subscribe for new replies\";s:7:\"package\";s:6:\"wpforo\";}i:213;a:5:{s:8:\"phraseid\";s:3:\"214\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"Subscribe for new topics\";s:12:\"phrase_value\";s:24:\"Subscribe for new topics\";s:7:\"package\";s:6:\"wpforo\";}i:214;a:5:{s:8:\"phraseid\";s:3:\"215\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:38:\"Subscribe options successfully updated\";s:12:\"phrase_value\";s:38:\"Subscribe options successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:215;a:5:{s:8:\"phraseid\";s:3:\"216\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:70:\"Subscribe options successfully updated, but previous value not changed\";s:12:\"phrase_value\";s:70:\"Subscribe options successfully updated, but previous value not changed\";s:7:\"package\";s:6:\"wpforo\";}i:216;a:5:{s:8:\"phraseid\";s:3:\"217\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Subscriptions\";s:12:\"phrase_value\";s:13:\"Subscriptions\";s:7:\"package\";s:6:\"wpforo\";}i:217;a:5:{s:8:\"phraseid\";s:3:\"218\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Success!\";s:12:\"phrase_value\";s:8:\"Success!\";s:7:\"package\";s:6:\"wpforo\";}i:218;a:5:{s:8:\"phraseid\";s:3:\"219\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:100:\"Success! Thank you. Please check your email and click confirmation link below to complete this step.\";s:12:\"phrase_value\";s:100:\"Success! Thank you. Please check your email and click confirmation link below to complete this step.\";s:7:\"package\";s:6:\"wpforo\";}i:219;a:5:{s:8:\"phraseid\";s:3:\"220\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"Successfully updated\";s:12:\"phrase_value\";s:20:\"Successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:220;a:5:{s:8:\"phraseid\";s:3:\"221\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Successfully voted\";s:12:\"phrase_value\";s:18:\"Successfully voted\";s:7:\"package\";s:6:\"wpforo\";}i:221;a:5:{s:8:\"phraseid\";s:3:\"222\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:89:\"The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form\";s:12:\"phrase_value\";s:89:\"The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form\";s:7:\"package\";s:6:\"wpforo\";}i:222;a:5:{s:8:\"phraseid\";s:3:\"223\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:70:\"The uploaded file exceeds the upload_max_filesize directive in php.ini\";s:12:\"phrase_value\";s:70:\"The uploaded file exceeds the upload_max_filesize directive in php.ini\";s:7:\"package\";s:6:\"wpforo\";}i:223;a:5:{s:8:\"phraseid\";s:3:\"224\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:33:\"The uploaded file size is too big\";s:12:\"phrase_value\";s:33:\"The uploaded file size is too big\";s:7:\"package\";s:6:\"wpforo\";}i:224;a:5:{s:8:\"phraseid\";s:3:\"225\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:45:\"The uploaded file was only partially uploaded\";s:12:\"phrase_value\";s:45:\"The uploaded file was only partially uploaded\";s:7:\"package\";s:6:\"wpforo\";}i:225;a:5:{s:8:\"phraseid\";s:3:\"226\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:34:\"Theme options successfully updated\";s:12:\"phrase_value\";s:34:\"Theme options successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:226;a:5:{s:8:\"phraseid\";s:3:\"227\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:64:\"This email address is already registered. Please insert another.\";s:12:\"phrase_value\";s:64:\"This email address is already registered. Please insert another.\";s:7:\"package\";s:6:\"wpforo\";}i:227;a:5:{s:8:\"phraseid\";s:3:\"228\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:30:\"This post successfully deleted\";s:12:\"phrase_value\";s:30:\"This post successfully deleted\";s:7:\"package\";s:6:\"wpforo\";}i:228;a:5:{s:8:\"phraseid\";s:3:\"229\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"This post successfully edited\";s:12:\"phrase_value\";s:29:\"This post successfully edited\";s:7:\"package\";s:6:\"wpforo\";}i:229;a:5:{s:8:\"phraseid\";s:3:\"230\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"This topic successfully deleted\";s:12:\"phrase_value\";s:31:\"This topic successfully deleted\";s:7:\"package\";s:6:\"wpforo\";}i:230;a:5:{s:8:\"phraseid\";s:3:\"231\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Timezone\";s:12:\"phrase_value\";s:8:\"Timezone\";s:7:\"package\";s:6:\"wpforo\";}i:231;a:5:{s:8:\"phraseid\";s:3:\"232\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Title\";s:12:\"phrase_value\";s:5:\"Title\";s:7:\"package\";s:6:\"wpforo\";}i:232;a:5:{s:8:\"phraseid\";s:3:\"233\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Topic Move Error\";s:12:\"phrase_value\";s:16:\"Topic Move Error\";s:7:\"package\";s:6:\"wpforo\";}i:233;a:5:{s:8:\"phraseid\";s:3:\"234\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Topic RSS Feed\";s:12:\"phrase_value\";s:14:\"Topic RSS Feed\";s:7:\"package\";s:6:\"wpforo\";}i:234;a:5:{s:8:\"phraseid\";s:3:\"235\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Topic Title\";s:12:\"phrase_value\";s:11:\"Topic Title\";s:7:\"package\";s:6:\"wpforo\";}i:235;a:5:{s:8:\"phraseid\";s:3:\"236\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Topic add error\";s:12:\"phrase_value\";s:15:\"Topic add error\";s:7:\"package\";s:6:\"wpforo\";}i:236;a:5:{s:8:\"phraseid\";s:3:\"237\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Topic delete error\";s:12:\"phrase_value\";s:18:\"Topic delete error\";s:7:\"package\";s:6:\"wpforo\";}i:237;a:5:{s:8:\"phraseid\";s:3:\"238\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Topic edit error\";s:12:\"phrase_value\";s:16:\"Topic edit error\";s:7:\"package\";s:6:\"wpforo\";}i:238;a:5:{s:8:\"phraseid\";s:3:\"239\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Topic not found.\";s:12:\"phrase_value\";s:16:\"Topic not found.\";s:7:\"package\";s:6:\"wpforo\";}i:239;a:5:{s:8:\"phraseid\";s:3:\"240\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"Topic successfully moved\";s:12:\"phrase_value\";s:24:\"Topic successfully moved\";s:7:\"package\";s:6:\"wpforo\";}i:240;a:5:{s:8:\"phraseid\";s:3:\"241\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"Topic successfully updated\";s:12:\"phrase_value\";s:26:\"Topic successfully updated\";s:7:\"package\";s:6:\"wpforo\";}i:241;a:5:{s:8:\"phraseid\";s:3:\"242\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Topics\";s:12:\"phrase_value\";s:6:\"Topics\";s:7:\"package\";s:6:\"wpforo\";}i:242;a:5:{s:8:\"phraseid\";s:3:\"243\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Topics delete error\";s:12:\"phrase_value\";s:19:\"Topics delete error\";s:7:\"package\";s:6:\"wpforo\";}i:243;a:5:{s:8:\"phraseid\";s:3:\"244\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Twitter\";s:12:\"phrase_value\";s:7:\"Twitter\";s:7:\"package\";s:6:\"wpforo\";}i:244;a:5:{s:8:\"phraseid\";s:3:\"245\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"Unknown upload error\";s:12:\"phrase_value\";s:20:\"Unknown upload error\";s:7:\"package\";s:6:\"wpforo\";}i:245;a:5:{s:8:\"phraseid\";s:3:\"246\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Unsubscribe\";s:12:\"phrase_value\";s:11:\"Unsubscribe\";s:7:\"package\";s:6:\"wpforo\";}i:246;a:5:{s:8:\"phraseid\";s:3:\"247\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Upload an avatar\";s:12:\"phrase_value\";s:16:\"Upload an avatar\";s:7:\"package\";s:6:\"wpforo\";}i:247;a:5:{s:8:\"phraseid\";s:3:\"248\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:104:\"Use comments to ask for more information or suggest improvements. Avoid answering questions in comments.\";s:12:\"phrase_value\";s:104:\"Use comments to ask for more information or suggest improvements. Avoid answering questions in comments.\";s:7:\"package\";s:6:\"wpforo\";}i:248;a:5:{s:8:\"phraseid\";s:3:\"249\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"User\";s:12:\"phrase_value\";s:4:\"User\";s:7:\"package\";s:6:\"wpforo\";}i:249;a:5:{s:8:\"phraseid\";s:3:\"250\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"User Group\";s:12:\"phrase_value\";s:10:\"User Group\";s:7:\"package\";s:6:\"wpforo\";}i:250;a:5:{s:8:\"phraseid\";s:3:\"251\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"User delete error\";s:12:\"phrase_value\";s:17:\"User delete error\";s:7:\"package\";s:6:\"wpforo\";}i:251;a:5:{s:8:\"phraseid\";s:3:\"252\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"User group add error\";s:12:\"phrase_value\";s:20:\"User group add error\";s:7:\"package\";s:6:\"wpforo\";}i:252;a:5:{s:8:\"phraseid\";s:3:\"253\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"User group edit error\";s:12:\"phrase_value\";s:21:\"User group edit error\";s:7:\"package\";s:6:\"wpforo\";}i:253;a:5:{s:8:\"phraseid\";s:3:\"254\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"User group successfully added\";s:12:\"phrase_value\";s:29:\"User group successfully added\";s:7:\"package\";s:6:\"wpforo\";}i:254;a:5:{s:8:\"phraseid\";s:3:\"255\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:30:\"User group successfully edited\";s:12:\"phrase_value\";s:30:\"User group successfully edited\";s:7:\"package\";s:6:\"wpforo\";}i:255;a:5:{s:8:\"phraseid\";s:3:\"256\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:37:\"User successfully deleted from wpforo\";s:12:\"phrase_value\";s:37:\"User successfully deleted from wpforo\";s:7:\"package\";s:6:\"wpforo\";}i:256;a:5:{s:8:\"phraseid\";s:3:\"257\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:40:\"Usergroup has been successfully deleted.\";s:12:\"phrase_value\";s:40:\"Usergroup has been successfully deleted.\";s:7:\"package\";s:6:\"wpforo\";}i:257;a:5:{s:8:\"phraseid\";s:3:\"258\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:115:\"Usergroup has been successfully deleted. All users of this usergroup have been moved to the usergroup you\'ve chosen\";s:12:\"phrase_value\";s:115:\"Usergroup has been successfully deleted. All users of this usergroup have been moved to the usergroup you\'ve chosen\";s:7:\"package\";s:6:\"wpforo\";}i:258;a:5:{s:8:\"phraseid\";s:3:\"259\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Username\";s:12:\"phrase_value\";s:8:\"Username\";s:7:\"package\";s:6:\"wpforo\";}i:259;a:5:{s:8:\"phraseid\";s:3:\"260\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"Username exists. Please insert another.\";s:12:\"phrase_value\";s:39:\"Username exists. Please insert another.\";s:7:\"package\";s:6:\"wpforo\";}i:260;a:5:{s:8:\"phraseid\";s:3:\"261\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Username is missed.\";s:12:\"phrase_value\";s:19:\"Username is missed.\";s:7:\"package\";s:6:\"wpforo\";}i:261;a:5:{s:8:\"phraseid\";s:3:\"262\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:63:\"Username length must be between 3 characters and 15 characters.\";s:12:\"phrase_value\";s:63:\"Username length must be between 3 characters and 15 characters.\";s:7:\"package\";s:6:\"wpforo\";}i:262;a:5:{s:8:\"phraseid\";s:3:\"263\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"View entire post\";s:12:\"phrase_value\";s:16:\"View entire post\";s:7:\"package\";s:6:\"wpforo\";}i:263;a:5:{s:8:\"phraseid\";s:3:\"264\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"View the latest post\";s:12:\"phrase_value\";s:20:\"View the latest post\";s:7:\"package\";s:6:\"wpforo\";}i:264;a:5:{s:8:\"phraseid\";s:3:\"265\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Views\";s:12:\"phrase_value\";s:5:\"Views\";s:7:\"package\";s:6:\"wpforo\";}i:265;a:5:{s:8:\"phraseid\";s:3:\"266\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Votes\";s:12:\"phrase_value\";s:5:\"Votes\";s:7:\"package\";s:6:\"wpforo\";}i:266;a:5:{s:8:\"phraseid\";s:3:\"267\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Website\";s:12:\"phrase_value\";s:7:\"Website\";s:7:\"package\";s:6:\"wpforo\";}i:267;a:5:{s:8:\"phraseid\";s:3:\"268\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"Welcome to our Community!\";s:12:\"phrase_value\";s:25:\"Welcome to our Community!\";s:7:\"package\";s:6:\"wpforo\";}i:268;a:5:{s:8:\"phraseid\";s:3:\"269\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"Wordpress avatar system\";s:12:\"phrase_value\";s:23:\"Wordpress avatar system\";s:7:\"package\";s:6:\"wpforo\";}i:269;a:5:{s:8:\"phraseid\";s:3:\"270\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Working\";s:12:\"phrase_value\";s:7:\"Working\";s:7:\"package\";s:6:\"wpforo\";}i:270;a:5:{s:8:\"phraseid\";s:3:\"271\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Write message\";s:12:\"phrase_value\";s:13:\"Write message\";s:7:\"package\";s:6:\"wpforo\";}i:271;a:5:{s:8:\"phraseid\";s:3:\"272\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Wrong post data\";s:12:\"phrase_value\";s:15:\"Wrong post data\";s:7:\"package\";s:6:\"wpforo\";}i:272;a:5:{s:8:\"phraseid\";s:3:\"273\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Yahoo\";s:12:\"phrase_value\";s:5:\"Yahoo\";s:7:\"package\";s:6:\"wpforo\";}i:273;a:5:{s:8:\"phraseid\";s:3:\"274\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"You\";s:12:\"phrase_value\";s:3:\"You\";s:7:\"package\";s:6:\"wpforo\";}i:274;a:5:{s:8:\"phraseid\";s:3:\"275\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"You are already voted this post\";s:12:\"phrase_value\";s:31:\"You are already voted this post\";s:7:\"package\";s:6:\"wpforo\";}i:275;a:5:{s:8:\"phraseid\";s:3:\"276\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:36:\"You can go to %s page or Search here\";s:12:\"phrase_value\";s:36:\"You can go to %s page or Search here\";s:7:\"package\";s:6:\"wpforo\";}i:276;a:5:{s:8:\"phraseid\";s:3:\"277\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:37:\"You have been successfully subscribed\";s:12:\"phrase_value\";s:37:\"You have been successfully subscribed\";s:7:\"package\";s:6:\"wpforo\";}i:277;a:5:{s:8:\"phraseid\";s:3:\"278\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"You have been successfully unsubscribed\";s:12:\"phrase_value\";s:39:\"You have been successfully unsubscribed\";s:7:\"package\";s:6:\"wpforo\";}i:278;a:5:{s:8:\"phraseid\";s:3:\"279\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:41:\"You have no permission to edit this topic\";s:12:\"phrase_value\";s:41:\"You have no permission to edit this topic\";s:7:\"package\";s:6:\"wpforo\";}i:279;a:5:{s:8:\"phraseid\";s:3:\"280\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:54:\"You don\'t have permission to create post in this forum\";s:12:\"phrase_value\";s:54:\"You don\'t have permission to create post in this forum\";s:7:\"package\";s:6:\"wpforo\";}i:280;a:5:{s:8:\"phraseid\";s:3:\"281\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:57:\"You don\'t have permission to create topic into this forum\";s:12:\"phrase_value\";s:57:\"You don\'t have permission to create topic into this forum\";s:7:\"package\";s:6:\"wpforo\";}i:281;a:5:{s:8:\"phraseid\";s:3:\"282\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:56:\"You don\'t have permission to delete post from this forum\";s:12:\"phrase_value\";s:56:\"You don\'t have permission to delete post from this forum\";s:7:\"package\";s:6:\"wpforo\";}i:282;a:5:{s:8:\"phraseid\";s:3:\"283\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:57:\"You don\'t have permission to delete topic from this forum\";s:12:\"phrase_value\";s:57:\"You don\'t have permission to delete topic from this forum\";s:7:\"package\";s:6:\"wpforo\";}i:283;a:5:{s:8:\"phraseid\";s:3:\"284\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:54:\"You don\'t have permission to edit post from this forum\";s:12:\"phrase_value\";s:54:\"You don\'t have permission to edit post from this forum\";s:7:\"package\";s:6:\"wpforo\";}i:284;a:5:{s:8:\"phraseid\";s:3:\"285\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"You successfully replied\";s:12:\"phrase_value\";s:24:\"You successfully replied\";s:7:\"package\";s:6:\"wpforo\";}i:285;a:5:{s:8:\"phraseid\";s:3:\"286\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Your Answer\";s:12:\"phrase_value\";s:11:\"Your Answer\";s:7:\"package\";s:6:\"wpforo\";}i:286;a:5:{s:8:\"phraseid\";s:3:\"287\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Your forum successfully added\";s:12:\"phrase_value\";s:29:\"Your forum successfully added\";s:7:\"package\";s:6:\"wpforo\";}i:287;a:5:{s:8:\"phraseid\";s:3:\"288\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"Your forum successfully deleted\";s:12:\"phrase_value\";s:31:\"Your forum successfully deleted\";s:7:\"package\";s:6:\"wpforo\";}i:288;a:5:{s:8:\"phraseid\";s:3:\"289\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:49:\"Your profile data have been successfully updated.\";s:12:\"phrase_value\";s:49:\"Your profile data have been successfully updated.\";s:7:\"package\";s:6:\"wpforo\";}i:289;a:5:{s:8:\"phraseid\";s:3:\"290\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:54:\"Your subscription for this item could not be confirmed\";s:12:\"phrase_value\";s:54:\"Your subscription for this item could not be confirmed\";s:7:\"package\";s:6:\"wpforo\";}i:290;a:5:{s:8:\"phraseid\";s:3:\"291\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Your topic successfully added\";s:12:\"phrase_value\";s:29:\"Your topic successfully added\";s:7:\"package\";s:6:\"wpforo\";}i:291;a:5:{s:8:\"phraseid\";s:3:\"292\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"add\";s:12:\"phrase_value\";s:3:\"add\";s:7:\"package\";s:6:\"wpforo\";}i:292;a:5:{s:8:\"phraseid\";s:3:\"293\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"add_new\";s:12:\"phrase_value\";s:7:\"add_new\";s:7:\"package\";s:6:\"wpforo\";}i:293;a:5:{s:8:\"phraseid\";s:3:\"294\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"%s ago\";s:12:\"phrase_value\";s:6:\"%s ago\";s:7:\"package\";s:6:\"wpforo\";}i:294;a:5:{s:8:\"phraseid\";s:3:\"295\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:2:\"by\";s:12:\"phrase_value\";s:2:\"by\";s:7:\"package\";s:6:\"wpforo\";}i:295;a:5:{s:8:\"phraseid\";s:3:\"296\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"by %s\";s:12:\"phrase_value\";s:5:\"by %s\";s:7:\"package\";s:6:\"wpforo\";}i:296;a:5:{s:8:\"phraseid\";s:3:\"297\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"confirm password\";s:12:\"phrase_value\";s:16:\"confirm password\";s:7:\"package\";s:6:\"wpforo\";}i:297;a:5:{s:8:\"phraseid\";s:3:\"298\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"edit profile\";s:12:\"phrase_value\";s:12:\"edit profile\";s:7:\"package\";s:6:\"wpforo\";}i:298;a:5:{s:8:\"phraseid\";s:3:\"299\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"edit user\";s:12:\"phrase_value\";s:9:\"edit user\";s:7:\"package\";s:6:\"wpforo\";}i:299;a:5:{s:8:\"phraseid\";s:3:\"300\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"matches\";s:12:\"phrase_value\";s:7:\"matches\";s:7:\"package\";s:6:\"wpforo\";}i:300;a:5:{s:8:\"phraseid\";s:3:\"301\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"new password\";s:12:\"phrase_value\";s:12:\"new password\";s:7:\"package\";s:6:\"wpforo\";}i:301;a:5:{s:8:\"phraseid\";s:3:\"302\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"new password again\";s:12:\"phrase_value\";s:18:\"new password again\";s:7:\"package\";s:6:\"wpforo\";}i:302;a:5:{s:8:\"phraseid\";s:3:\"303\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"next\";s:12:\"phrase_value\";s:4:\"next\";s:7:\"package\";s:6:\"wpforo\";}i:303;a:5:{s:8:\"phraseid\";s:3:\"304\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"old password\";s:12:\"phrase_value\";s:12:\"old password\";s:7:\"package\";s:6:\"wpforo\";}i:304;a:5:{s:8:\"phraseid\";s:3:\"305\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"phrase_key\";s:12:\"phrase_value\";s:10:\"phrase_key\";s:7:\"package\";s:6:\"wpforo\";}i:305;a:5:{s:8:\"phraseid\";s:3:\"306\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"phrase_value\";s:12:\"phrase_value\";s:12:\"phrase_value\";s:7:\"package\";s:6:\"wpforo\";}i:306;a:5:{s:8:\"phraseid\";s:3:\"307\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"prev\";s:12:\"phrase_value\";s:4:\"prev\";s:7:\"package\";s:6:\"wpforo\";}i:307;a:5:{s:8:\"phraseid\";s:3:\"308\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"update\";s:12:\"phrase_value\";s:6:\"update\";s:7:\"package\";s:6:\"wpforo\";}i:308;a:5:{s:8:\"phraseid\";s:3:\"309\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"view\";s:12:\"phrase_value\";s:4:\"view\";s:7:\"package\";s:6:\"wpforo\";}i:309;a:5:{s:8:\"phraseid\";s:3:\"310\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"view all posts\";s:12:\"phrase_value\";s:14:\"view all posts\";s:7:\"package\";s:6:\"wpforo\";}i:310;a:5:{s:8:\"phraseid\";s:3:\"311\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"view all questions\";s:12:\"phrase_value\";s:18:\"view all questions\";s:7:\"package\";s:6:\"wpforo\";}i:311;a:5:{s:8:\"phraseid\";s:3:\"312\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"view all topics\";s:12:\"phrase_value\";s:15:\"view all topics\";s:7:\"package\";s:6:\"wpforo\";}i:312;a:5:{s:8:\"phraseid\";s:3:\"313\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"wpForo Navigation\";s:12:\"phrase_value\";s:17:\"wpForo Navigation\";s:7:\"package\";s:6:\"wpforo\";}i:313;a:5:{s:8:\"phraseid\";s:3:\"314\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"{number}B\";s:12:\"phrase_value\";s:9:\"{number}B\";s:7:\"package\";s:6:\"wpforo\";}i:314;a:5:{s:8:\"phraseid\";s:3:\"315\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"{number}K\";s:12:\"phrase_value\";s:9:\"{number}K\";s:7:\"package\";s:6:\"wpforo\";}i:315;a:5:{s:8:\"phraseid\";s:3:\"316\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"{number}M\";s:12:\"phrase_value\";s:9:\"{number}M\";s:7:\"package\";s:6:\"wpforo\";}i:316;a:5:{s:8:\"phraseid\";s:3:\"317\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"{number}T\";s:12:\"phrase_value\";s:9:\"{number}T\";s:7:\"package\";s:6:\"wpforo\";}i:317;a:5:{s:8:\"phraseid\";s:3:\"318\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"like\";s:12:\"phrase_value\";s:4:\"Like\";s:7:\"package\";s:6:\"wpforo\";}i:318;a:5:{s:8:\"phraseid\";s:3:\"319\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"unlike\";s:12:\"phrase_value\";s:6:\"Unlike\";s:7:\"package\";s:6:\"wpforo\";}i:319;a:5:{s:8:\"phraseid\";s:3:\"320\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"sticky\";s:12:\"phrase_value\";s:6:\"Sticky\";s:7:\"package\";s:6:\"wpforo\";}i:320;a:5:{s:8:\"phraseid\";s:3:\"321\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"unsticky\";s:12:\"phrase_value\";s:8:\"Unsticky\";s:7:\"package\";s:6:\"wpforo\";}i:321;a:5:{s:8:\"phraseid\";s:3:\"322\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"close\";s:12:\"phrase_value\";s:5:\"Close\";s:7:\"package\";s:6:\"wpforo\";}i:322;a:5:{s:8:\"phraseid\";s:3:\"323\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"open\";s:12:\"phrase_value\";s:4:\"Open\";s:7:\"package\";s:6:\"wpforo\";}i:323;a:5:{s:8:\"phraseid\";s:3:\"324\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Topic Icons\";s:12:\"phrase_value\";s:11:\"Topic Icons\";s:7:\"package\";s:6:\"wpforo\";}i:324;a:5:{s:8:\"phraseid\";s:3:\"325\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Replied\";s:12:\"phrase_value\";s:7:\"Replied\";s:7:\"package\";s:6:\"wpforo\";}i:325;a:5:{s:8:\"phraseid\";s:3:\"326\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Active\";s:12:\"phrase_value\";s:6:\"Active\";s:7:\"package\";s:6:\"wpforo\";}i:326;a:5:{s:8:\"phraseid\";s:3:\"327\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"Hot\";s:12:\"phrase_value\";s:3:\"Hot\";s:7:\"package\";s:6:\"wpforo\";}i:327;a:5:{s:8:\"phraseid\";s:3:\"328\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Solved\";s:12:\"phrase_value\";s:6:\"Solved\";s:7:\"package\";s:6:\"wpforo\";}i:328;a:5:{s:8:\"phraseid\";s:3:\"329\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Unsolved\";s:12:\"phrase_value\";s:8:\"Unsolved\";s:7:\"package\";s:6:\"wpforo\";}i:329;a:5:{s:8:\"phraseid\";s:3:\"330\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Closed\";s:12:\"phrase_value\";s:6:\"Closed\";s:7:\"package\";s:6:\"wpforo\";}i:330;a:5:{s:8:\"phraseid\";s:3:\"331\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Old password is wrong\";s:12:\"phrase_value\";s:21:\"Old password is wrong\";s:7:\"package\";s:6:\"wpforo\";}i:331;a:5:{s:8:\"phraseid\";s:3:\"332\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"New Passwords do not match\";s:12:\"phrase_value\";s:26:\"New Passwords do not match\";s:7:\"package\";s:6:\"wpforo\";}i:332;a:5:{s:8:\"phraseid\";s:3:\"333\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Forum Members List\";s:12:\"phrase_value\";s:18:\"Forum Members List\";s:7:\"package\";s:6:\"wpforo\";}i:333;a:5:{s:8:\"phraseid\";s:3:\"334\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:32:\"are you sure you want to delete?\";s:12:\"phrase_value\";s:32:\"are you sure you want to delete?\";s:7:\"package\";s:6:\"wpforo\";}i:334;a:5:{s:8:\"phraseid\";s:3:\"335\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Admin\";s:12:\"phrase_value\";s:5:\"Admin\";s:7:\"package\";s:6:\"wpforo\";}i:335;a:5:{s:8:\"phraseid\";s:3:\"336\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Moderator\";s:12:\"phrase_value\";s:9:\"Moderator\";s:7:\"package\";s:6:\"wpforo\";}i:336;a:5:{s:8:\"phraseid\";s:3:\"337\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Registered\";s:12:\"phrase_value\";s:10:\"Registered\";s:7:\"package\";s:6:\"wpforo\";}i:337;a:5:{s:8:\"phraseid\";s:3:\"338\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Customer\";s:12:\"phrase_value\";s:8:\"Customer\";s:7:\"package\";s:6:\"wpforo\";}i:338;a:5:{s:8:\"phraseid\";s:3:\"339\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Profile\";s:12:\"phrase_value\";s:7:\"Profile\";s:7:\"package\";s:6:\"wpforo\";}i:339;a:5:{s:8:\"phraseid\";s:3:\"340\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:60:\"Incorrect file format. Allowed formats: jpeg, jpg, png, gif.\";s:12:\"phrase_value\";s:60:\"Incorrect file format. Allowed formats: jpeg, jpg, png, gif.\";s:7:\"package\";s:6:\"wpforo\";}i:340;a:5:{s:8:\"phraseid\";s:3:\"341\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"User registration is disabled\";s:12:\"phrase_value\";s:29:\"User registration is disabled\";s:7:\"package\";s:6:\"wpforo\";}i:341;a:5:{s:8:\"phraseid\";s:3:\"342\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Attachment removed\";s:12:\"phrase_value\";s:18:\"Attachment removed\";s:7:\"package\";s:6:\"wpforo\";}i:342;a:5:{s:8:\"phraseid\";s:3:\"343\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Forum Posts\";s:12:\"phrase_value\";s:11:\"Forum Posts\";s:7:\"package\";s:6:\"wpforo\";}i:343;a:5:{s:8:\"phraseid\";s:3:\"344\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Blog Posts\";s:12:\"phrase_value\";s:10:\"Blog Posts\";s:7:\"package\";s:6:\"wpforo\";}i:344;a:5:{s:8:\"phraseid\";s:3:\"345\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Blog Comments\";s:12:\"phrase_value\";s:13:\"Blog Comments\";s:7:\"package\";s:6:\"wpforo\";}i:345;a:5:{s:8:\"phraseid\";s:3:\"346\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Welcome back %s!\";s:12:\"phrase_value\";s:16:\"Welcome back %s!\";s:7:\"package\";s:6:\"wpforo\";}i:346;a:5:{s:8:\"phraseid\";s:3:\"347\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Member Profile\";s:12:\"phrase_value\";s:14:\"Member Profile\";s:7:\"package\";s:6:\"wpforo\";}i:347;a:5:{s:8:\"phraseid\";s:3:\"348\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Member\";s:12:\"phrase_value\";s:6:\"Member\";s:7:\"package\";s:6:\"wpforo\";}i:348;a:5:{s:8:\"phraseid\";s:3:\"349\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"private\";s:12:\"phrase_value\";s:7:\"Private\";s:7:\"package\";s:6:\"wpforo\";}i:349;a:5:{s:8:\"phraseid\";s:3:\"350\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"public\";s:12:\"phrase_value\";s:6:\"Public\";s:7:\"package\";s:6:\"wpforo\";}i:350;a:5:{s:8:\"phraseid\";s:3:\"351\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Private Topic\";s:12:\"phrase_value\";s:13:\"Private Topic\";s:7:\"package\";s:6:\"wpforo\";}i:351;a:5:{s:8:\"phraseid\";s:3:\"352\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:55:\"Only Admins and Moderators can see your private topics.\";s:12:\"phrase_value\";s:55:\"Only Admins and Moderators can see your private topics.\";s:7:\"package\";s:6:\"wpforo\";}i:352;a:5:{s:8:\"phraseid\";s:3:\"353\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"Forum ID is not detected\";s:12:\"phrase_value\";s:24:\"Forum ID is not detected\";s:7:\"package\";s:6:\"wpforo\";}i:353;a:5:{s:8:\"phraseid\";s:3:\"354\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"You are not permitted to subscribe here\";s:12:\"phrase_value\";s:39:\"You are not permitted to subscribe here\";s:7:\"package\";s:6:\"wpforo\";}i:354;a:5:{s:8:\"phraseid\";s:3:\"355\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"Subscribe to this topic\";s:12:\"phrase_value\";s:23:\"Subscribe to this topic\";s:7:\"package\";s:6:\"wpforo\";}i:355;a:5:{s:8:\"phraseid\";s:3:\"356\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Awaiting moderation\";s:12:\"phrase_value\";s:19:\"Awaiting moderation\";s:7:\"package\";s:6:\"wpforo\";}i:356;a:5:{s:8:\"phraseid\";s:3:\"357\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Topic first post not found.\";s:12:\"phrase_value\";s:27:\"Topic first post not found.\";s:7:\"package\";s:6:\"wpforo\";}i:357;a:5:{s:8:\"phraseid\";s:3:\"358\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:32:\"Topic first post data not found.\";s:12:\"phrase_value\";s:32:\"Topic first post data not found.\";s:7:\"package\";s:6:\"wpforo\";}i:358;a:5:{s:8:\"phraseid\";s:3:\"359\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Done!\";s:12:\"phrase_value\";s:5:\"Done!\";s:7:\"package\";s:6:\"wpforo\";}i:359;a:5:{s:8:\"phraseid\";s:3:\"360\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"unapproved\";s:12:\"phrase_value\";s:10:\"unapproved\";s:7:\"package\";s:6:\"wpforo\";}i:360;a:5:{s:8:\"phraseid\";s:3:\"361\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:44:\"You are not allowed to attach this file type\";s:12:\"phrase_value\";s:44:\"You are not allowed to attach this file type\";s:7:\"package\";s:6:\"wpforo\";}i:361;a:5:{s:8:\"phraseid\";s:3:\"362\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Post is empty\";s:12:\"phrase_value\";s:13:\"Post is empty\";s:7:\"package\";s:6:\"wpforo\";}i:362;a:5:{s:8:\"phraseid\";s:3:\"363\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"removed link\";s:12:\"phrase_value\";s:12:\"removed link\";s:7:\"package\";s:6:\"wpforo\";}i:363;a:5:{s:8:\"phraseid\";s:3:\"364\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Submit\";s:12:\"phrase_value\";s:6:\"Submit\";s:7:\"package\";s:6:\"wpforo\";}i:364;a:5:{s:8:\"phraseid\";s:3:\"365\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Usergroup\";s:12:\"phrase_value\";s:9:\"Usergroup\";s:7:\"package\";s:6:\"wpforo\";}i:365;a:5:{s:8:\"phraseid\";s:3:\"366\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Rating Title\";s:12:\"phrase_value\";s:12:\"Rating Title\";s:7:\"package\";s:6:\"wpforo\";}i:366;a:5:{s:8:\"phraseid\";s:3:\"367\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"User Title\";s:12:\"phrase_value\";s:10:\"User Title\";s:7:\"package\";s:6:\"wpforo\";}i:367;a:5:{s:8:\"phraseid\";s:3:\"368\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"approved\";s:12:\"phrase_value\";s:8:\"Approved\";s:7:\"package\";s:6:\"wpforo\";}i:368;a:5:{s:8:\"phraseid\";s:3:\"369\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"approve\";s:12:\"phrase_value\";s:7:\"Approve\";s:7:\"package\";s:6:\"wpforo\";}i:369;a:5:{s:8:\"phraseid\";s:3:\"370\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"unapprove\";s:12:\"phrase_value\";s:9:\"unapprove\";s:7:\"package\";s:6:\"wpforo\";}i:370;a:5:{s:8:\"phraseid\";s:3:\"371\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"--- Choose ---\";s:12:\"phrase_value\";s:14:\"--- Choose ---\";s:7:\"package\";s:6:\"wpforo\";}i:371;a:5:{s:8:\"phraseid\";s:3:\"372\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"New\";s:12:\"phrase_value\";s:3:\"New\";s:7:\"package\";s:6:\"wpforo\";}i:372;a:5:{s:8:\"phraseid\";s:3:\"373\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Required field\";s:12:\"phrase_value\";s:14:\"Required field\";s:7:\"package\";s:6:\"wpforo\";}i:373;a:5:{s:8:\"phraseid\";s:3:\"374\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Add Reply\";s:12:\"phrase_value\";s:9:\"Add Reply\";s:7:\"package\";s:6:\"wpforo\";}i:374;a:5:{s:8:\"phraseid\";s:3:\"375\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Forums RSS Feed\";s:12:\"phrase_value\";s:15:\"Forums RSS Feed\";s:7:\"package\";s:6:\"wpforo\";}i:375;a:5:{s:8:\"phraseid\";s:3:\"376\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Topics RSS Feed\";s:12:\"phrase_value\";s:15:\"Topics RSS Feed\";s:7:\"package\";s:6:\"wpforo\";}i:376;a:5:{s:8:\"phraseid\";s:3:\"377\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Find a member\";s:12:\"phrase_value\";s:13:\"Find a member\";s:7:\"package\";s:6:\"wpforo\";}i:377;a:5:{s:8:\"phraseid\";s:3:\"378\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"Display Name or Nicename\";s:12:\"phrase_value\";s:24:\"Display Name or Nicename\";s:7:\"package\";s:6:\"wpforo\";}i:378;a:5:{s:8:\"phraseid\";s:3:\"379\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Reset Search\";s:12:\"phrase_value\";s:12:\"Reset Search\";s:7:\"package\";s:6:\"wpforo\";}i:379;a:5:{s:8:\"phraseid\";s:3:\"380\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Reset Result\";s:12:\"phrase_value\";s:12:\"Reset Result\";s:7:\"package\";s:6:\"wpforo\";}i:380;a:5:{s:8:\"phraseid\";s:3:\"381\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Recently Added\";s:12:\"phrase_value\";s:12:\"Recent Posts\";s:7:\"package\";s:6:\"wpforo\";}i:381;a:5:{s:8:\"phraseid\";s:3:\"382\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Recent Posts\";s:12:\"phrase_value\";s:12:\"Recent Posts\";s:7:\"package\";s:6:\"wpforo\";}i:382;a:5:{s:8:\"phraseid\";s:3:\"383\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"No posts were found here\";s:12:\"phrase_value\";s:24:\"No posts were found here\";s:7:\"package\";s:6:\"wpforo\";}i:383;a:5:{s:8:\"phraseid\";s:3:\"384\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"forum link\";s:12:\"phrase_value\";s:10:\"forum link\";s:7:\"package\";s:6:\"wpforo\";}i:384;a:5:{s:8:\"phraseid\";s:3:\"385\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"in forum\";s:12:\"phrase_value\";s:8:\"in forum\";s:7:\"package\";s:6:\"wpforo\";}i:385;a:5:{s:8:\"phraseid\";s:3:\"386\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:91:\"After registration you will receive an email confirmation with a link to set a new password\";s:12:\"phrase_value\";s:91:\"After registration you will receive an email confirmation with a link to set a new password\";s:7:\"package\";s:6:\"wpforo\";}i:386;a:5:{s:8:\"phraseid\";s:3:\"387\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:228:\"You can mention a person using @nicename in post content to send that person an email message. When you post a topic or reply, forum sends an email message to the user letting them know that they have been mentioned on the post.\";s:12:\"phrase_value\";s:228:\"You can mention a person using @nicename in post content to send that person an email message. When you post a topic or reply, forum sends an email message to the user letting them know that they have been mentioned on the post.\";s:7:\"package\";s:6:\"wpforo\";}i:387;a:5:{s:8:\"phraseid\";s:3:\"388\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"View entire topic\";s:12:\"phrase_value\";s:17:\"View entire topic\";s:7:\"package\";s:6:\"wpforo\";}i:388;a:5:{s:8:\"phraseid\";s:3:\"389\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Author Name\";s:12:\"phrase_value\";s:11:\"Author Name\";s:7:\"package\";s:6:\"wpforo\";}i:389;a:5:{s:8:\"phraseid\";s:3:\"390\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Your name\";s:12:\"phrase_value\";s:9:\"Your name\";s:7:\"package\";s:6:\"wpforo\";}i:390;a:5:{s:8:\"phraseid\";s:3:\"391\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Author Email\";s:12:\"phrase_value\";s:12:\"Author Email\";s:7:\"package\";s:6:\"wpforo\";}i:391;a:5:{s:8:\"phraseid\";s:3:\"392\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Your email\";s:12:\"phrase_value\";s:10:\"Your email\";s:7:\"package\";s:6:\"wpforo\";}i:392;a:5:{s:8:\"phraseid\";s:3:\"393\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:53:\"Your topic successfully added and awaiting moderation\";s:12:\"phrase_value\";s:53:\"Your topic successfully added and awaiting moderation\";s:7:\"package\";s:6:\"wpforo\";}i:393;a:5:{s:8:\"phraseid\";s:3:\"394\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:37:\"You are not allowed to edit this post\";s:12:\"phrase_value\";s:37:\"You are not allowed to edit this post\";s:7:\"package\";s:6:\"wpforo\";}i:394;a:5:{s:8:\"phraseid\";s:3:\"395\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:36:\"Google reCAPTCHA verification failed\";s:12:\"phrase_value\";s:36:\"Google reCAPTCHA verification failed\";s:7:\"package\";s:6:\"wpforo\";}i:395;a:5:{s:8:\"phraseid\";s:3:\"396\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:44:\"ERROR: Can\'t connect to Google reCAPTCHA API\";s:12:\"phrase_value\";s:44:\"ERROR: Can\'t connect to Google reCAPTCHA API\";s:7:\"package\";s:6:\"wpforo\";}i:396;a:5:{s:8:\"phraseid\";s:3:\"397\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Welcome!\";s:12:\"phrase_value\";s:8:\"Welcome!\";s:7:\"package\";s:6:\"wpforo\";}i:397;a:5:{s:8:\"phraseid\";s:3:\"398\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Join us today!\";s:12:\"phrase_value\";s:14:\"Join us today!\";s:7:\"package\";s:6:\"wpforo\";}i:398;a:5:{s:8:\"phraseid\";s:3:\"399\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:98:\"Enter your email address or username and we\'ll send you a link you can use to pick a new password.\";s:12:\"phrase_value\";s:98:\"Enter your email address or username and we\'ll send you a link you can use to pick a new password.\";s:7:\"package\";s:6:\"wpforo\";}i:399;a:5:{s:8:\"phraseid\";s:3:\"400\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:36:\"Please Insert Your Email or Username\";s:12:\"phrase_value\";s:36:\"Please Insert Your Email or Username\";s:7:\"package\";s:6:\"wpforo\";}i:400;a:5:{s:8:\"phraseid\";s:3:\"401\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Reset Password\";s:12:\"phrase_value\";s:14:\"Reset Password\";s:7:\"package\";s:6:\"wpforo\";}i:401;a:5:{s:8:\"phraseid\";s:3:\"402\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Forgot Your Password?\";s:12:\"phrase_value\";s:21:\"Forgot Your Password?\";s:7:\"package\";s:6:\"wpforo\";}i:402;a:5:{s:8:\"phraseid\";s:3:\"403\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"%s created a new topic %s\";s:12:\"phrase_value\";s:25:\"%s created a new topic %s\";s:7:\"package\";s:6:\"wpforo\";}i:403;a:5:{s:8:\"phraseid\";s:3:\"404\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"%s replied to the topic %s\";s:12:\"phrase_value\";s:26:\"%s replied to the topic %s\";s:7:\"package\";s:6:\"wpforo\";}i:404;a:5:{s:8:\"phraseid\";s:3:\"405\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"%s liked forum post %s\";s:12:\"phrase_value\";s:22:\"%s liked forum post %s\";s:7:\"package\";s:6:\"wpforo\";}i:405;a:5:{s:8:\"phraseid\";s:3:\"406\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Read more\";s:12:\"phrase_value\";s:9:\"Read more\";s:7:\"package\";s:6:\"wpforo\";}i:406;a:5:{s:8:\"phraseid\";s:3:\"407\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Forum topic\";s:12:\"phrase_value\";s:11:\"Forum topic\";s:7:\"package\";s:6:\"wpforo\";}i:407;a:5:{s:8:\"phraseid\";s:3:\"408\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Forum post\";s:12:\"phrase_value\";s:10:\"Forum post\";s:7:\"package\";s:6:\"wpforo\";}i:408;a:5:{s:8:\"phraseid\";s:3:\"409\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Forum post like\";s:12:\"phrase_value\";s:15:\"Forum post like\";s:7:\"package\";s:6:\"wpforo\";}i:409;a:5:{s:8:\"phraseid\";s:3:\"410\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Tools\";s:12:\"phrase_value\";s:5:\"Tools\";s:7:\"package\";s:6:\"wpforo\";}i:410;a:5:{s:8:\"phraseid\";s:3:\"411\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Target Topic URL\";s:12:\"phrase_value\";s:16:\"Target Topic URL\";s:7:\"package\";s:6:\"wpforo\";}i:411;a:5:{s:8:\"phraseid\";s:3:\"412\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"Target Topic not found\";s:12:\"phrase_value\";s:22:\"Target Topic not found\";s:7:\"package\";s:6:\"wpforo\";}i:412;a:5:{s:8:\"phraseid\";s:3:\"413\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Merge Topics\";s:12:\"phrase_value\";s:12:\"Merge Topics\";s:7:\"package\";s:6:\"wpforo\";}i:413;a:5:{s:8:\"phraseid\";s:3:\"414\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Split Topic\";s:12:\"phrase_value\";s:11:\"Split Topic\";s:7:\"package\";s:6:\"wpforo\";}i:414;a:5:{s:8:\"phraseid\";s:3:\"415\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:87:\"Please copy the target topic URL from browser address bar and paste in the field below.\";s:12:\"phrase_value\";s:87:\"Please copy the target topic URL from browser address bar and paste in the field below.\";s:7:\"package\";s:6:\"wpforo\";}i:415;a:5:{s:8:\"phraseid\";s:3:\"416\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:238:\"All posts will be merged and displayed (ordered) in target topic according to posts dates. If you want to append merged posts to the end of the target topic you should allow to update posts dates to current date by check the option below.\";s:12:\"phrase_value\";s:238:\"All posts will be merged and displayed (ordered) in target topic according to posts dates. If you want to append merged posts to the end of the target topic you should allow to update posts dates to current date by check the option below.\";s:7:\"package\";s:6:\"wpforo\";}i:416;a:5:{s:8:\"phraseid\";s:3:\"417\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:86:\"Update post dates (current date) to allow append posts to the end of the target topic.\";s:12:\"phrase_value\";s:86:\"Update post dates (current date) to allow append posts to the end of the target topic.\";s:7:\"package\";s:6:\"wpforo\";}i:417;a:5:{s:8:\"phraseid\";s:3:\"418\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:43:\"Update post titles with target topic title.\";s:12:\"phrase_value\";s:43:\"Update post titles with target topic title.\";s:7:\"package\";s:6:\"wpforo\";}i:418;a:5:{s:8:\"phraseid\";s:3:\"419\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:82:\"Topics once merged cannot be unmerged. This topic URL will no longer be available.\";s:12:\"phrase_value\";s:82:\"Topics once merged cannot be unmerged. This topic URL will no longer be available.\";s:7:\"package\";s:6:\"wpforo\";}i:419;a:5:{s:8:\"phraseid\";s:3:\"420\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Create New Topic\";s:12:\"phrase_value\";s:16:\"Create New Topic\";s:7:\"package\";s:6:\"wpforo\";}i:420;a:5:{s:8:\"phraseid\";s:3:\"421\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:90:\"Create new topic with split posts. The first post of new topic becomes the earliest reply.\";s:12:\"phrase_value\";s:90:\"Create new topic with split posts. The first post of new topic becomes the earliest reply.\";s:7:\"package\";s:6:\"wpforo\";}i:421;a:5:{s:8:\"phraseid\";s:3:\"422\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"New Topic Title\";s:12:\"phrase_value\";s:15:\"New Topic Title\";s:7:\"package\";s:6:\"wpforo\";}i:422;a:5:{s:8:\"phraseid\";s:3:\"423\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"New Topic Forum\";s:12:\"phrase_value\";s:15:\"New Topic Forum\";s:7:\"package\";s:6:\"wpforo\";}i:423;a:5:{s:8:\"phraseid\";s:3:\"424\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Select Posts to Split\";s:12:\"phrase_value\";s:21:\"Select Posts to Split\";s:7:\"package\";s:6:\"wpforo\";}i:424;a:5:{s:8:\"phraseid\";s:3:\"425\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:91:\"Topic once split cannot be unsplit. The first post of new topic becomes the earliest reply.\";s:12:\"phrase_value\";s:91:\"Topic once split cannot be unsplit. The first post of new topic becomes the earliest reply.\";s:7:\"package\";s:6:\"wpforo\";}i:425;a:5:{s:8:\"phraseid\";s:3:\"426\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Merge\";s:12:\"phrase_value\";s:5:\"Merge\";s:7:\"package\";s:6:\"wpforo\";}i:426;a:5:{s:8:\"phraseid\";s:3:\"427\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Split\";s:12:\"phrase_value\";s:5:\"Split\";s:7:\"package\";s:6:\"wpforo\";}i:427;a:5:{s:8:\"phraseid\";s:3:\"428\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Move Reply\";s:12:\"phrase_value\";s:10:\"Move Reply\";s:7:\"package\";s:6:\"wpforo\";}i:428;a:5:{s:8:\"phraseid\";s:3:\"429\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:124:\"This action changes topic URL. Once the topic is moved to other forum the old URL of this topic will no longer be available.\";s:12:\"phrase_value\";s:124:\"This action changes topic URL. Once the topic is moved to other forum the old URL of this topic will no longer be available.\";s:7:\"package\";s:6:\"wpforo\";}i:429;a:5:{s:8:\"phraseid\";s:3:\"430\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:38:\"The time to edit this topic is expired\";s:12:\"phrase_value\";s:38:\"The time to edit this topic is expired\";s:7:\"package\";s:6:\"wpforo\";}i:430;a:5:{s:8:\"phraseid\";s:3:\"431\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:41:\"The time to delete this topic is expired.\";s:12:\"phrase_value\";s:93:\"The time to delete this topic is expired. Please contact to forum administrator to delete it.\";s:7:\"package\";s:6:\"wpforo\";}i:431;a:5:{s:8:\"phraseid\";s:3:\"432\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:38:\"The time to edit this post is expired.\";s:12:\"phrase_value\";s:38:\"The time to edit this post is expired.\";s:7:\"package\";s:6:\"wpforo\";}i:432;a:5:{s:8:\"phraseid\";s:3:\"433\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:40:\"The time to delete this post is expired.\";s:12:\"phrase_value\";s:40:\"The time to delete this post is expired.\";s:7:\"package\";s:6:\"wpforo\";}i:433;a:5:{s:8:\"phraseid\";s:3:\"434\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:51:\"Please contact to forum administrator to delete it.\";s:12:\"phrase_value\";s:51:\"Please contact to forum administrator to delete it.\";s:7:\"package\";s:6:\"wpforo\";}i:434;a:5:{s:8:\"phraseid\";s:3:\"435\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:49:\"Please contact to forum administrator to edit it.\";s:12:\"phrase_value\";s:49:\"Please contact to forum administrator to edit it.\";s:7:\"package\";s:6:\"wpforo\";}i:435;a:5:{s:8:\"phraseid\";s:3:\"436\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:51:\"Read more about Facebook public_profile properties.\";s:12:\"phrase_value\";s:51:\"Read more about Facebook public_profile properties.\";s:7:\"package\";s:6:\"wpforo\";}i:436;a:5:{s:8:\"phraseid\";s:3:\"437\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"forum privacy policy\";s:12:\"phrase_value\";s:20:\"forum privacy policy\";s:7:\"package\";s:6:\"wpforo\";}i:437;a:5:{s:8:\"phraseid\";s:3:\"438\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:32:\"I have read and agree to the %s.\";s:12:\"phrase_value\";s:32:\"I have read and agree to the %s.\";s:7:\"package\";s:6:\"wpforo\";}i:438;a:5:{s:8:\"phraseid\";s:3:\"439\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:40:\"Click to open forum privacy policy below\";s:12:\"phrase_value\";s:40:\"Click to open forum privacy policy below\";s:7:\"package\";s:6:\"wpforo\";}i:439;a:5:{s:8:\"phraseid\";s:3:\"440\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"I agree\";s:12:\"phrase_value\";s:7:\"I agree\";s:7:\"package\";s:6:\"wpforo\";}i:440;a:5:{s:8:\"phraseid\";s:3:\"441\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"I do not agree. Take me away from here.\";s:12:\"phrase_value\";s:39:\"I do not agree. Take me away from here.\";s:7:\"package\";s:6:\"wpforo\";}i:441;a:5:{s:8:\"phraseid\";s:3:\"442\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"forum rules\";s:12:\"phrase_value\";s:11:\"forum rules\";s:7:\"package\";s:6:\"wpforo\";}i:442;a:5:{s:8:\"phraseid\";s:3:\"443\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:41:\"I have read and agree to abide by the %s.\";s:12:\"phrase_value\";s:41:\"I have read and agree to abide by the %s.\";s:7:\"package\";s:6:\"wpforo\";}i:443;a:5:{s:8:\"phraseid\";s:3:\"444\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"Click to open forum rules below\";s:12:\"phrase_value\";s:31:\"Click to open forum rules below\";s:7:\"package\";s:6:\"wpforo\";}i:444;a:5:{s:8:\"phraseid\";s:3:\"445\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"I agree to these rules\";s:12:\"phrase_value\";s:22:\"I agree to these rules\";s:7:\"package\";s:6:\"wpforo\";}i:445;a:5:{s:8:\"phraseid\";s:3:\"446\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:54:\"I do not agree to these rules. Take me away from here.\";s:12:\"phrase_value\";s:54:\"I do not agree to these rules. Take me away from here.\";s:7:\"package\";s:6:\"wpforo\";}i:446;a:5:{s:8:\"phraseid\";s:3:\"447\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"the website\";s:12:\"phrase_value\";s:11:\"the website\";s:7:\"package\";s:6:\"wpforo\";}i:447;a:5:{s:8:\"phraseid\";s:3:\"448\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:28:\"I have read and agree to the\";s:12:\"phrase_value\";s:28:\"I have read and agree to the\";s:7:\"package\";s:6:\"wpforo\";}i:448;a:5:{s:8:\"phraseid\";s:3:\"449\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:167:\"I have read and agree to %s privacy policy. For more information, please check our privacy policy, where you\'ll get more info on where, how and why we store your data.\";s:12:\"phrase_value\";s:167:\"I have read and agree to %s privacy policy. For more information, please check our privacy policy, where you\'ll get more info on where, how and why we store your data.\";s:7:\"package\";s:6:\"wpforo\";}i:449;a:5:{s:8:\"phraseid\";s:3:\"450\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Terms\";s:12:\"phrase_value\";s:5:\"Terms\";s:7:\"package\";s:6:\"wpforo\";}i:450;a:5:{s:8:\"phraseid\";s:3:\"451\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Privacy Policy\";s:12:\"phrase_value\";s:14:\"Privacy Policy\";s:7:\"package\";s:6:\"wpforo\";}i:451;a:5:{s:8:\"phraseid\";s:3:\"452\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"and\";s:12:\"phrase_value\";s:3:\"and\";s:7:\"package\";s:6:\"wpforo\";}i:452;a:5:{s:8:\"phraseid\";s:3:\"453\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:71:\"I agree to receive an email confirmation with a link to set a password.\";s:12:\"phrase_value\";s:71:\"I agree to receive an email confirmation with a link to set a password.\";s:7:\"package\";s:6:\"wpforo\";}i:453;a:5:{s:8:\"phraseid\";s:3:\"454\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Contact Us\";s:12:\"phrase_value\";s:10:\"Contact Us\";s:7:\"package\";s:6:\"wpforo\";}i:454;a:5:{s:8:\"phraseid\";s:3:\"455\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"Contact the forum administrator\";s:12:\"phrase_value\";s:31:\"Contact the forum administrator\";s:7:\"package\";s:6:\"wpforo\";}i:455;a:5:{s:8:\"phraseid\";s:3:\"456\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Share:\";s:12:\"phrase_value\";s:6:\"Share:\";s:7:\"package\";s:6:\"wpforo\";}i:456;a:5:{s:8:\"phraseid\";s:3:\"457\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Share\";s:12:\"phrase_value\";s:5:\"Share\";s:7:\"package\";s:6:\"wpforo\";}i:457;a:5:{s:8:\"phraseid\";s:3:\"458\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Share this post\";s:12:\"phrase_value\";s:15:\"Share this post\";s:7:\"package\";s:6:\"wpforo\";}i:458;a:5:{s:8:\"phraseid\";s:3:\"459\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:332:\"When you login first time using Facebook Login button, we collect your account %s information shared by Facebook, based on your privacy settings. We also get your email address to automatically create a forum account for you. Once your account is created, you\'ll be logged-in to this account and you\'ll receive a confirmation email.\";s:12:\"phrase_value\";s:332:\"When you login first time using Facebook Login button, we collect your account %s information shared by Facebook, based on your privacy settings. We also get your email address to automatically create a forum account for you. Once your account is created, you\'ll be logged-in to this account and you\'ll receive a confirmation email.\";s:7:\"package\";s:6:\"wpforo\";}i:459;a:5:{s:8:\"phraseid\";s:3:\"460\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:105:\"I allow to create an account based on my Facebook public profile information and send confirmation email.\";s:12:\"phrase_value\";s:105:\"I allow to create an account based on my Facebook public profile information and send confirmation email.\";s:7:\"package\";s:6:\"wpforo\";}i:460;a:5:{s:8:\"phraseid\";s:3:\"461\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"Facebook Login Information\";s:12:\"phrase_value\";s:26:\"Facebook Login Information\";s:7:\"package\";s:6:\"wpforo\";}i:461;a:5:{s:8:\"phraseid\";s:3:\"462\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Share to Facebook\";s:12:\"phrase_value\";s:17:\"Share to Facebook\";s:7:\"package\";s:6:\"wpforo\";}i:462;a:5:{s:8:\"phraseid\";s:3:\"463\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Tweet this post\";s:12:\"phrase_value\";s:15:\"Tweet this post\";s:7:\"package\";s:6:\"wpforo\";}i:463;a:5:{s:8:\"phraseid\";s:3:\"464\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Tweet\";s:12:\"phrase_value\";s:5:\"Tweet\";s:7:\"package\";s:6:\"wpforo\";}i:464;a:5:{s:8:\"phraseid\";s:3:\"465\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Share to Google+\";s:12:\"phrase_value\";s:16:\"Share to Google+\";s:7:\"package\";s:6:\"wpforo\";}i:465;a:5:{s:8:\"phraseid\";s:3:\"466\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Share to VK\";s:12:\"phrase_value\";s:11:\"Share to VK\";s:7:\"package\";s:6:\"wpforo\";}i:466;a:5:{s:8:\"phraseid\";s:3:\"467\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Share to OK\";s:12:\"phrase_value\";s:11:\"Share to OK\";s:7:\"package\";s:6:\"wpforo\";}i:467;a:5:{s:8:\"phraseid\";s:3:\"468\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"Update Subscriptions\";s:12:\"phrase_value\";s:20:\"Update Subscriptions\";s:7:\"package\";s:6:\"wpforo\";}i:468;a:5:{s:8:\"phraseid\";s:3:\"469\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:37:\"Subscribe to all new topics and posts\";s:12:\"phrase_value\";s:37:\"Subscribe to all new topics and posts\";s:7:\"package\";s:6:\"wpforo\";}i:469;a:5:{s:8:\"phraseid\";s:3:\"470\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Subscribe to all new topics\";s:12:\"phrase_value\";s:27:\"Subscribe to all new topics\";s:7:\"package\";s:6:\"wpforo\";}i:470;a:5:{s:8:\"phraseid\";s:3:\"471\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"Subscription Manager\";s:12:\"phrase_value\";s:20:\"Subscription Manager\";s:7:\"package\";s:6:\"wpforo\";}i:471;a:5:{s:8:\"phraseid\";s:3:\"472\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"topics and posts\";s:12:\"phrase_value\";s:16:\"topics and posts\";s:7:\"package\";s:6:\"wpforo\";}i:472;a:5:{s:8:\"phraseid\";s:3:\"473\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"No data submitted\";s:12:\"phrase_value\";s:17:\"No data submitted\";s:7:\"package\";s:6:\"wpforo\";}i:473;a:5:{s:8:\"phraseid\";s:3:\"474\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"User profile fields not found\";s:12:\"phrase_value\";s:29:\"User profile fields not found\";s:7:\"package\";s:6:\"wpforo\";}i:474;a:5:{s:8:\"phraseid\";s:3:\"475\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"field is required\";s:12:\"phrase_value\";s:17:\"field is required\";s:7:\"package\";s:6:\"wpforo\";}i:475;a:5:{s:8:\"phraseid\";s:3:\"476\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"field value must be at least %d\";s:12:\"phrase_value\";s:31:\"field value must be at least %d\";s:7:\"package\";s:6:\"wpforo\";}i:476;a:5:{s:8:\"phraseid\";s:3:\"477\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:37:\"field value cannot be greater than %d\";s:12:\"phrase_value\";s:37:\"field value cannot be greater than %d\";s:7:\"package\";s:6:\"wpforo\";}i:477;a:5:{s:8:\"phraseid\";s:3:\"478\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:43:\"field length must be at least %d characters\";s:12:\"phrase_value\";s:43:\"field length must be at least %d characters\";s:7:\"package\";s:6:\"wpforo\";}i:478;a:5:{s:8:\"phraseid\";s:3:\"479\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:49:\"field length cannot be greater than %d characters\";s:12:\"phrase_value\";s:50:\"field length can not be greater than %d characters\";s:7:\"package\";s:6:\"wpforo\";}i:479;a:5:{s:8:\"phraseid\";s:3:\"480\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:30:\"field value is not a valid URL\";s:12:\"phrase_value\";s:30:\"field value is not a valid URL\";s:7:\"package\";s:6:\"wpforo\";}i:480;a:5:{s:8:\"phraseid\";s:3:\"481\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"file type is not detected\";s:12:\"phrase_value\";s:25:\"file type is not detected\";s:7:\"package\";s:6:\"wpforo\";}i:481;a:5:{s:8:\"phraseid\";s:3:\"482\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"file type %s is not allowed\";s:12:\"phrase_value\";s:27:\"file type %s is not allowed\";s:7:\"package\";s:6:\"wpforo\";}i:482;a:5:{s:8:\"phraseid\";s:3:\"483\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"file is too large\";s:12:\"phrase_value\";s:17:\"file is too large\";s:7:\"package\";s:6:\"wpforo\";}i:483;a:5:{s:8:\"phraseid\";s:3:\"484\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:49:\"Success! Please check your mail for confirmation.\";s:12:\"phrase_value\";s:49:\"Success! Please check your mail for confirmation.\";s:7:\"package\";s:6:\"wpforo\";}i:484;a:5:{s:8:\"phraseid\";s:3:\"485\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:64:\"Username length must be between %d characters and %d characters.\";s:12:\"phrase_value\";s:64:\"Username length must be between %d characters and %d characters.\";s:7:\"package\";s:6:\"wpforo\";}i:485;a:5:{s:8:\"phraseid\";s:3:\"486\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:30:\"User registration is disabled.\";s:12:\"phrase_value\";s:30:\"User registration is disabled.\";s:7:\"package\";s:6:\"wpforo\";}i:486;a:5:{s:8:\"phraseid\";s:3:\"487\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:51:\"Avatar image is too big maximum allowed size is 2MB\";s:12:\"phrase_value\";s:51:\"Avatar image is too big maximum allowed size is 2MB\";s:7:\"package\";s:6:\"wpforo\";}i:487;a:5:{s:8:\"phraseid\";s:3:\"488\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:57:\"One of the selected Usergroups cannot be set as Secondary\";s:12:\"phrase_value\";s:57:\"One of the selected Usergroups cannot be set as Secondary\";s:7:\"package\";s:6:\"wpforo\";}i:488;a:5:{s:8:\"phraseid\";s:3:\"489\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:51:\"The selected Usergroup is not found in allowed list\";s:12:\"phrase_value\";s:51:\"The selected Usergroup is not found in allowed list\";s:7:\"package\";s:6:\"wpforo\";}i:489;a:5:{s:8:\"phraseid\";s:3:\"490\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:36:\"The selected Usergroup cannot be set\";s:12:\"phrase_value\";s:36:\"The selected Usergroup cannot be set\";s:7:\"package\";s:6:\"wpforo\";}i:490;a:5:{s:8:\"phraseid\";s:3:\"491\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:48:\"Admin and Moderator Usergroups are not permitted\";s:12:\"phrase_value\";s:48:\"Admin and Moderator Usergroups are not permitted\";s:7:\"package\";s:6:\"wpforo\";}i:491;a:5:{s:8:\"phraseid\";s:3:\"492\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:46:\"You have no permission to edit Usergroup field\";s:12:\"phrase_value\";s:46:\"You have no permission to edit Usergroup field\";s:7:\"package\";s:6:\"wpforo\";}i:492;a:5:{s:8:\"phraseid\";s:3:\"493\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:55:\"This nickname is already in use. Please insert another.\";s:12:\"phrase_value\";s:55:\"This nickname is already in use. Please insert another.\";s:7:\"package\";s:6:\"wpforo\";}i:493;a:5:{s:8:\"phraseid\";s:3:\"494\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"Nickname validation failed\";s:12:\"phrase_value\";s:26:\"Nickname validation failed\";s:7:\"package\";s:6:\"wpforo\";}i:494;a:5:{s:8:\"phraseid\";s:3:\"495\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:59:\"Numerical nicknames are not allowed. Please insert another.\";s:12:\"phrase_value\";s:59:\"Numerical nicknames are not allowed. Please insert another.\";s:7:\"package\";s:6:\"wpforo\";}i:495;a:5:{s:8:\"phraseid\";s:3:\"496\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:34:\"Maximum allowed file size is %s MB\";s:12:\"phrase_value\";s:34:\"Maximum allowed file size is %s MB\";s:7:\"package\";s:6:\"wpforo\";}i:496;a:5:{s:8:\"phraseid\";s:3:\"497\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:63:\"This email address is already registered. Please insert another\";s:12:\"phrase_value\";s:63:\"This email address is already registered. Please insert another\";s:7:\"package\";s:6:\"wpforo\";}i:497;a:5:{s:8:\"phraseid\";s:3:\"498\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"Allowed file types: %s\";s:12:\"phrase_value\";s:22:\"Allowed file types: %s\";s:7:\"package\";s:6:\"wpforo\";}i:498;a:5:{s:8:\"phraseid\";s:3:\"499\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Form name not found\";s:12:\"phrase_value\";s:19:\"Form name not found\";s:7:\"package\";s:6:\"wpforo\";}i:499;a:5:{s:8:\"phraseid\";s:3:\"500\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"Form template not found\";s:12:\"phrase_value\";s:23:\"Form template not found\";s:7:\"package\";s:6:\"wpforo\";}i:500;a:5:{s:8:\"phraseid\";s:3:\"501\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:28:\"Profile updated successfully\";s:12:\"phrase_value\";s:28:\"Profile updated successfully\";s:7:\"package\";s:6:\"wpforo\";}i:501;a:5:{s:8:\"phraseid\";s:3:\"502\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"User data update failed\";s:12:\"phrase_value\";s:23:\"User data update failed\";s:7:\"package\";s:6:\"wpforo\";}i:502;a:5:{s:8:\"phraseid\";s:3:\"503\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"User profile update failed\";s:12:\"phrase_value\";s:26:\"User profile update failed\";s:7:\"package\";s:6:\"wpforo\";}i:503;a:5:{s:8:\"phraseid\";s:3:\"504\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"User custom field update failed\";s:12:\"phrase_value\";s:31:\"User custom field update failed\";s:7:\"package\";s:6:\"wpforo\";}i:504;a:5:{s:8:\"phraseid\";s:3:\"505\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:49:\"Sorry, there was an error uploading attached file\";s:12:\"phrase_value\";s:49:\"Sorry, there was an error uploading attached file\";s:7:\"package\";s:6:\"wpforo\";}i:505;a:5:{s:8:\"phraseid\";s:3:\"506\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Edit Topic\";s:12:\"phrase_value\";s:10:\"Edit Topic\";s:7:\"package\";s:6:\"wpforo\";}i:506;a:5:{s:8:\"phraseid\";s:3:\"507\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:32:\"This topic was modified %s by %s\";s:12:\"phrase_value\";s:32:\"This topic was modified %s by %s\";s:7:\"package\";s:6:\"wpforo\";}i:507;a:5:{s:8:\"phraseid\";s:3:\"508\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Edit Post\";s:12:\"phrase_value\";s:9:\"Edit Post\";s:7:\"package\";s:6:\"wpforo\";}i:508;a:5:{s:8:\"phraseid\";s:3:\"509\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"This post was modified %s by %s\";s:12:\"phrase_value\";s:31:\"This post was modified %s by %s\";s:7:\"package\";s:6:\"wpforo\";}i:509;a:5:{s:8:\"phraseid\";s:3:\"510\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Topics Started\";s:12:\"phrase_value\";s:14:\"Topics Started\";s:7:\"package\";s:6:\"wpforo\";}i:510;a:5:{s:8:\"phraseid\";s:3:\"511\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Replies Created\";s:12:\"phrase_value\";s:15:\"Replies Created\";s:7:\"package\";s:6:\"wpforo\";}i:511;a:5:{s:8:\"phraseid\";s:3:\"512\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Liked Posts\";s:12:\"phrase_value\";s:11:\"Liked Posts\";s:7:\"package\";s:6:\"wpforo\";}i:512;a:5:{s:8:\"phraseid\";s:3:\"513\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Topic link\";s:12:\"phrase_value\";s:10:\"Topic link\";s:7:\"package\";s:6:\"wpforo\";}i:513;a:5:{s:8:\"phraseid\";s:3:\"514\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"Forum Topics Started\";s:12:\"phrase_value\";s:20:\"Forum Topics Started\";s:7:\"package\";s:6:\"wpforo\";}i:514;a:5:{s:8:\"phraseid\";s:3:\"515\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Forum Replies Created\";s:12:\"phrase_value\";s:21:\"Forum Replies Created\";s:7:\"package\";s:6:\"wpforo\";}i:515;a:5:{s:8:\"phraseid\";s:3:\"516\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Liked Forum Posts\";s:12:\"phrase_value\";s:17:\"Liked Forum Posts\";s:7:\"package\";s:6:\"wpforo\";}i:516;a:5:{s:8:\"phraseid\";s:3:\"517\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Forum Subscriptions\";s:12:\"phrase_value\";s:19:\"Forum Subscriptions\";s:7:\"package\";s:6:\"wpforo\";}i:517;a:5:{s:8:\"phraseid\";s:3:\"518\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:55:\"Start typing tags here (maximum %d tags are allowed)...\";s:12:\"phrase_value\";s:55:\"Start typing tags here (maximum %d tags are allowed)...\";s:7:\"package\";s:6:\"wpforo\";}i:518;a:5:{s:8:\"phraseid\";s:3:\"519\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Topic Tag\";s:12:\"phrase_value\";s:9:\"Topic Tag\";s:7:\"package\";s:6:\"wpforo\";}i:519;a:5:{s:8:\"phraseid\";s:3:\"520\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Topic Tags\";s:12:\"phrase_value\";s:10:\"Topic Tags\";s:7:\"package\";s:6:\"wpforo\";}i:520;a:5:{s:8:\"phraseid\";s:3:\"521\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Separate tags using a comma\";s:12:\"phrase_value\";s:27:\"Separate tags using a comma\";s:7:\"package\";s:6:\"wpforo\";}i:521;a:5:{s:8:\"phraseid\";s:3:\"522\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"Tags\";s:12:\"phrase_value\";s:4:\"Tags\";s:7:\"package\";s:6:\"wpforo\";}i:522;a:5:{s:8:\"phraseid\";s:3:\"523\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Find Topics by Tags\";s:12:\"phrase_value\";s:19:\"Find Topics by Tags\";s:7:\"package\";s:6:\"wpforo\";}i:523;a:5:{s:8:\"phraseid\";s:3:\"524\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Related Topics\";s:12:\"phrase_value\";s:14:\"Related Topics\";s:7:\"package\";s:6:\"wpforo\";}i:524;a:5:{s:8:\"phraseid\";s:3:\"525\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Next Topic\";s:12:\"phrase_value\";s:10:\"Next Topic\";s:7:\"package\";s:6:\"wpforo\";}i:525;a:5:{s:8:\"phraseid\";s:3:\"526\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Previous Topic\";s:12:\"phrase_value\";s:14:\"Previous Topic\";s:7:\"package\";s:6:\"wpforo\";}i:526;a:5:{s:8:\"phraseid\";s:3:\"527\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"All forum topics\";s:12:\"phrase_value\";s:16:\"All forum topics\";s:7:\"package\";s:6:\"wpforo\";}i:527;a:5:{s:8:\"phraseid\";s:3:\"528\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"No tags found\";s:12:\"phrase_value\";s:13:\"No tags found\";s:7:\"package\";s:6:\"wpforo\";}i:528;a:5:{s:8:\"phraseid\";s:3:\"529\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:30:\"Forum contains no unread posts\";s:12:\"phrase_value\";s:30:\"Forum contains no unread posts\";s:7:\"package\";s:6:\"wpforo\";}i:529;a:5:{s:8:\"phraseid\";s:3:\"530\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"Forum contains unread posts\";s:12:\"phrase_value\";s:27:\"Forum contains unread posts\";s:7:\"package\";s:6:\"wpforo\";}i:530;a:5:{s:8:\"phraseid\";s:3:\"531\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Mark all read\";s:12:\"phrase_value\";s:13:\"Mark all read\";s:7:\"package\";s:6:\"wpforo\";}i:531;a:5:{s:8:\"phraseid\";s:3:\"532\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Not Replied\";s:12:\"phrase_value\";s:11:\"Not Replied\";s:7:\"package\";s:6:\"wpforo\";}i:532;a:5:{s:8:\"phraseid\";s:3:\"533\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:17:\"Tags are disabled\";s:12:\"phrase_value\";s:17:\"Tags are disabled\";s:7:\"package\";s:6:\"wpforo\";}i:533;a:5:{s:8:\"phraseid\";s:3:\"534\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Unread Posts\";s:12:\"phrase_value\";s:12:\"Unread Posts\";s:7:\"package\";s:6:\"wpforo\";}i:534;a:5:{s:8:\"phraseid\";s:3:\"535\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:26:\"No unread posts were found\";s:12:\"phrase_value\";s:26:\"No unread posts were found\";s:7:\"package\";s:6:\"wpforo\";}i:535;a:5:{s:8:\"phraseid\";s:3:\"536\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Ask a question\";s:12:\"phrase_value\";s:14:\"Ask a question\";s:7:\"package\";s:6:\"wpforo\";}i:536;a:5:{s:8:\"phraseid\";s:3:\"537\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Your question\";s:12:\"phrase_value\";s:13:\"Your question\";s:7:\"package\";s:6:\"wpforo\";}i:537;a:5:{s:8:\"phraseid\";s:3:\"538\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Question Tags\";s:12:\"phrase_value\";s:13:\"Question Tags\";s:7:\"package\";s:6:\"wpforo\";}i:538;a:5:{s:8:\"phraseid\";s:3:\"539\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:67:\"This topic doesn\'t exist or you don\'t have permissions to see that.\";s:12:\"phrase_value\";s:67:\"This topic doesn\'t exist or you don\'t have permissions to see that.\";s:7:\"package\";s:6:\"wpforo\";}i:539;a:5:{s:8:\"phraseid\";s:3:\"540\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"%d user ( %s )\";s:12:\"phrase_value\";s:14:\"%d user ( %s )\";s:7:\"package\";s:6:\"wpforo\";}i:540;a:5:{s:8:\"phraseid\";s:3:\"541\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"%d users ( %s )\";s:12:\"phrase_value\";s:15:\"%d users ( %s )\";s:7:\"package\";s:6:\"wpforo\";}i:541;a:5:{s:8:\"phraseid\";s:3:\"542\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Recently viewed by users: %s.\";s:12:\"phrase_value\";s:29:\"Recently viewed by users: %s.\";s:7:\"package\";s:6:\"wpforo\";}i:542;a:5:{s:8:\"phraseid\";s:3:\"543\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"%s guest\";s:12:\"phrase_value\";s:8:\"%s guest\";s:7:\"package\";s:6:\"wpforo\";}i:543;a:5:{s:8:\"phraseid\";s:3:\"544\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"%s guests\";s:12:\"phrase_value\";s:9:\"%s guests\";s:7:\"package\";s:6:\"wpforo\";}i:544;a:5:{s:8:\"phraseid\";s:3:\"545\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"%d times\";s:12:\"phrase_value\";s:8:\"%d times\";s:7:\"package\";s:6:\"wpforo\";}i:545;a:5:{s:8:\"phraseid\";s:3:\"546\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:38:\"Currently viewing this topic %s %s %s.\";s:12:\"phrase_value\";s:38:\"Currently viewing this topic %s %s %s.\";s:7:\"package\";s:6:\"wpforo\";}i:546;a:5:{s:8:\"phraseid\";s:3:\"547\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Forum Icons\";s:12:\"phrase_value\";s:11:\"Forum Icons\";s:7:\"package\";s:6:\"wpforo\";}i:547;a:5:{s:8:\"phraseid\";s:3:\"548\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"(%d viewing)\";s:12:\"phrase_value\";s:12:\"(%d viewing)\";s:7:\"package\";s:6:\"wpforo\";}i:548;a:5:{s:8:\"phraseid\";s:3:\"549\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"View all tags (%d)\";s:12:\"phrase_value\";s:18:\"View all tags (%d)\";s:7:\"package\";s:6:\"wpforo\";}i:549;a:5:{s:8:\"phraseid\";s:3:\"550\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:11:\"Topic reply\";s:12:\"phrase_value\";s:11:\"Topic reply\";s:7:\"package\";s:6:\"wpforo\";}i:550;a:5:{s:8:\"phraseid\";s:3:\"551\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"You have %d new replies\";s:12:\"phrase_value\";s:23:\"You have %d new replies\";s:7:\"package\";s:6:\"wpforo\";}i:551;a:5:{s:8:\"phraseid\";s:3:\"552\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"You have %d new reply to %2$s from %3$s\";s:12:\"phrase_value\";s:39:\"You have %d new reply to %2$s from %3$s\";s:7:\"package\";s:6:\"wpforo\";}i:552;a:5:{s:8:\"phraseid\";s:3:\"553\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"You have %d new reply to %s\";s:12:\"phrase_value\";s:27:\"You have %d new reply to %s\";s:7:\"package\";s:6:\"wpforo\";}i:553;a:5:{s:8:\"phraseid\";s:3:\"554\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:35:\"Are you sure you wanted to do that?\";s:12:\"phrase_value\";s:35:\"Are you sure you wanted to do that?\";s:7:\"package\";s:6:\"wpforo\";}i:554;a:5:{s:8:\"phraseid\";s:3:\"555\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:63:\"You do not have permission to mark notifications for that user.\";s:12:\"phrase_value\";s:63:\"You do not have permission to mark notifications for that user.\";s:7:\"package\";s:6:\"wpforo\";}i:555;a:5:{s:8:\"phraseid\";s:3:\"556\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:25:\"Tools: Move, Split, Merge\";s:12:\"phrase_value\";s:25:\"Tools: Move, Split, Merge\";s:7:\"package\";s:6:\"wpforo\";}i:556;a:5:{s:8:\"phraseid\";s:3:\"557\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Hide Replies\";s:12:\"phrase_value\";s:12:\"Hide replies\";s:7:\"package\";s:6:\"wpforo\";}i:557;a:5:{s:8:\"phraseid\";s:3:\"558\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Show Replies\";s:12:\"phrase_value\";s:12:\"Show replies\";s:7:\"package\";s:6:\"wpforo\";}i:558;a:5:{s:8:\"phraseid\";s:3:\"559\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"No threads found\";s:12:\"phrase_value\";s:16:\"No threads found\";s:7:\"package\";s:6:\"wpforo\";}i:559;a:5:{s:8:\"phraseid\";s:3:\"560\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Most Voted\";s:12:\"phrase_value\";s:10:\"Most Voted\";s:7:\"package\";s:6:\"wpforo\";}i:560;a:5:{s:8:\"phraseid\";s:3:\"561\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Most Commented\";s:12:\"phrase_value\";s:14:\"Most Commented\";s:7:\"package\";s:6:\"wpforo\";}i:561;a:5:{s:8:\"phraseid\";s:3:\"562\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Newest\";s:12:\"phrase_value\";s:6:\"Newest\";s:7:\"package\";s:6:\"wpforo\";}i:562;a:5:{s:8:\"phraseid\";s:3:\"563\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Oldest\";s:12:\"phrase_value\";s:6:\"Oldest\";s:7:\"package\";s:6:\"wpforo\";}i:563;a:5:{s:8:\"phraseid\";s:3:\"564\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"%d Answers\";s:12:\"phrase_value\";s:10:\"%d Answers\";s:7:\"package\";s:6:\"wpforo\";}i:564;a:5:{s:8:\"phraseid\";s:3:\"565\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"%d Answer\";s:12:\"phrase_value\";s:9:\"%d Answer\";s:7:\"package\";s:6:\"wpforo\";}i:565;a:5:{s:8:\"phraseid\";s:3:\"566\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Reply with quote\";s:12:\"phrase_value\";s:16:\"Reply with quote\";s:7:\"package\";s:6:\"wpforo\";}i:566;a:5:{s:8:\"phraseid\";s:3:\"567\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Leave a comment\";s:12:\"phrase_value\";s:15:\"Leave a comment\";s:7:\"package\";s:6:\"wpforo\";}i:567;a:5:{s:8:\"phraseid\";s:3:\"568\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:57:\"I allow to create an account and send confirmation email.\";s:12:\"phrase_value\";s:57:\"I allow to create an account and send confirmation email.\";s:7:\"package\";s:6:\"wpforo\";}i:568;a:5:{s:8:\"phraseid\";s:3:\"569\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"Google reCAPTCHA data are not submitted\";s:12:\"phrase_value\";s:39:\"Google reCAPTCHA data are not submitted\";s:7:\"package\";s:6:\"wpforo\";}i:569;a:5:{s:8:\"phraseid\";s:3:\"570\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Delete this file\";s:12:\"phrase_value\";s:16:\"Delete this file\";s:7:\"package\";s:6:\"wpforo\";}i:570;a:5:{s:8:\"phraseid\";s:3:\"571\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:42:\"Are you sure you want to delete this file?\";s:12:\"phrase_value\";s:42:\"Are you sure you want to delete this file?\";s:7:\"package\";s:6:\"wpforo\";}i:571;a:5:{s:8:\"phraseid\";s:3:\"572\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"Specify avatar by URL:\";s:12:\"phrase_value\";s:22:\"Specify avatar by URL:\";s:7:\"package\";s:6:\"wpforo\";}i:572;a:5:{s:8:\"phraseid\";s:3:\"573\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:84:\"ERROR: invalid_username. Sorry, that username is not allowed. Please insert another.\";s:12:\"phrase_value\";s:84:\"ERROR: invalid_username. Sorry, that username is not allowed. Please insert another.\";s:7:\"package\";s:6:\"wpforo\";}i:573;a:5:{s:8:\"phraseid\";s:3:\"574\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:64:\"Password length must be between %d characters and %d characters.\";s:12:\"phrase_value\";s:64:\"Password length must be between %d characters and %d characters.\";s:7:\"package\";s:6:\"wpforo\";}i:574;a:5:{s:8:\"phraseid\";s:3:\"575\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:59:\"This nickname is already registered. Please insert another.\";s:12:\"phrase_value\";s:59:\"This nickname is already registered. Please insert another.\";s:7:\"package\";s:6:\"wpforo\";}i:575;a:5:{s:8:\"phraseid\";s:3:\"576\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:50:\"Avatar image is too big maximum allowed size is %s\";s:12:\"phrase_value\";s:50:\"Avatar image is too big maximum allowed size is %s\";s:7:\"package\";s:6:\"wpforo\";}i:576;a:5:{s:8:\"phraseid\";s:3:\"577\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Userid is wrong\";s:12:\"phrase_value\";s:15:\"Userid is wrong\";s:7:\"package\";s:6:\"wpforo\";}i:577;a:5:{s:8:\"phraseid\";s:3:\"578\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Password successfully changed\";s:12:\"phrase_value\";s:29:\"Password successfully changed\";s:7:\"package\";s:6:\"wpforo\";}i:578;a:5:{s:8:\"phraseid\";s:3:\"579\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:36:\"User successfully banned from wpforo\";s:12:\"phrase_value\";s:36:\"User successfully banned from wpforo\";s:7:\"package\";s:6:\"wpforo\";}i:579;a:5:{s:8:\"phraseid\";s:3:\"580\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"User ban action error\";s:12:\"phrase_value\";s:21:\"User ban action error\";s:7:\"package\";s:6:\"wpforo\";}i:580;a:5:{s:8:\"phraseid\";s:3:\"581\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:38:\"User successfully unbanned from wpforo\";s:12:\"phrase_value\";s:38:\"User successfully unbanned from wpforo\";s:7:\"package\";s:6:\"wpforo\";}i:581;a:5:{s:8:\"phraseid\";s:3:\"582\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:23:\"User unban action error\";s:12:\"phrase_value\";s:23:\"User unban action error\";s:7:\"package\";s:6:\"wpforo\";}i:582;a:5:{s:8:\"phraseid\";s:3:\"583\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:9:\"Anonymous\";s:12:\"phrase_value\";s:9:\"Anonymous\";s:7:\"package\";s:6:\"wpforo\";}i:583;a:5:{s:8:\"phraseid\";s:3:\"584\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Nickname\";s:12:\"phrase_value\";s:8:\"Nickname\";s:7:\"package\";s:6:\"wpforo\";}i:584;a:5:{s:8:\"phraseid\";s:3:\"585\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:22:\"URL Address Identifier\";s:12:\"phrase_value\";s:22:\"URL Address Identifier\";s:7:\"package\";s:6:\"wpforo\";}i:585;a:5:{s:8:\"phraseid\";s:3:\"586\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"User Groups Secondary\";s:12:\"phrase_value\";s:21:\"User Groups Secondary\";s:7:\"package\";s:6:\"wpforo\";}i:586;a:5:{s:8:\"phraseid\";s:3:\"587\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"Email has been confirmed\";s:12:\"phrase_value\";s:24:\"Email has been confirmed\";s:7:\"package\";s:6:\"wpforo\";}i:587;a:5:{s:8:\"phraseid\";s:3:\"588\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Email confirm error\";s:12:\"phrase_value\";s:19:\"Email confirm error\";s:7:\"package\";s:6:\"wpforo\";}i:588;a:5:{s:8:\"phraseid\";s:3:\"589\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"You are posting too quickly. Slow down.\";s:12:\"phrase_value\";s:39:\"You are posting too quickly. Slow down.\";s:7:\"package\";s:6:\"wpforo\";}i:589;a:5:{s:8:\"phraseid\";s:3:\"590\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:41:\"Function wpforo_thread_reply() not found.\";s:12:\"phrase_value\";s:41:\"Function wpforo_thread_reply() not found.\";s:7:\"package\";s:6:\"wpforo\";}i:590;a:5:{s:8:\"phraseid\";s:3:\"591\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"error: Change Status action\";s:12:\"phrase_value\";s:27:\"error: Change Status action\";s:7:\"package\";s:6:\"wpforo\";}i:591;a:5:{s:8:\"phraseid\";s:3:\"592\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Select Forum\";s:12:\"phrase_value\";s:12:\"Select Forum\";s:7:\"package\";s:6:\"wpforo\";}i:592;a:5:{s:8:\"phraseid\";s:3:\"593\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Write here . . .\";s:12:\"phrase_value\";s:16:\"Write here . . .\";s:7:\"package\";s:6:\"wpforo\";}i:593;a:5:{s:8:\"phraseid\";s:3:\"594\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Cancel\";s:12:\"phrase_value\";s:6:\"Cancel\";s:7:\"package\";s:6:\"wpforo\";}i:594;a:5:{s:8:\"phraseid\";s:3:\"595\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:44:\"You do not have permission to view this page\";s:12:\"phrase_value\";s:44:\"You do not have permission to view this page\";s:7:\"package\";s:6:\"wpforo\";}i:595;a:5:{s:8:\"phraseid\";s:3:\"596\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Data merging error\";s:12:\"phrase_value\";s:18:\"Data merging error\";s:7:\"package\";s:6:\"wpforo\";}i:596;a:5:{s:8:\"phraseid\";s:3:\"597\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:28:\"Please select a target forum\";s:12:\"phrase_value\";s:28:\"Please select a target forum\";s:7:\"package\";s:6:\"wpforo\";}i:597;a:5:{s:8:\"phraseid\";s:3:\"598\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"Please insert required fields\";s:12:\"phrase_value\";s:29:\"Please insert required fields\";s:7:\"package\";s:6:\"wpforo\";}i:598;a:5:{s:8:\"phraseid\";s:3:\"599\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:40:\"Please select at least one post to split\";s:12:\"phrase_value\";s:40:\"Please select at least one post to split\";s:7:\"package\";s:6:\"wpforo\";}i:599;a:5:{s:8:\"phraseid\";s:3:\"600\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Topic splitting error\";s:12:\"phrase_value\";s:21:\"Topic splitting error\";s:7:\"package\";s:6:\"wpforo\";}i:600;a:5:{s:8:\"phraseid\";s:3:\"601\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"Status changing error\";s:12:\"phrase_value\";s:21:\"Status changing error\";s:7:\"package\";s:6:\"wpforo\";}i:601;a:5:{s:8:\"phraseid\";s:3:\"602\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Repeat new password\";s:12:\"phrase_value\";s:19:\"Repeat new password\";s:7:\"package\";s:6:\"wpforo\";}i:602;a:5:{s:8:\"phraseid\";s:3:\"603\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"%s posted a new topic %s\";s:12:\"phrase_value\";s:24:\"%s posted a new topic %s\";s:7:\"package\";s:6:\"wpforo\";}i:603;a:5:{s:8:\"phraseid\";s:3:\"604\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Created by %s\";s:12:\"phrase_value\";s:13:\"Created by %s\";s:7:\"package\";s:6:\"wpforo\";}i:604;a:5:{s:8:\"phraseid\";s:3:\"605\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Last reply by %s\";s:12:\"phrase_value\";s:16:\"Last reply by %s\";s:7:\"package\";s:6:\"wpforo\";}i:605;a:5:{s:8:\"phraseid\";s:3:\"606\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Reply to\";s:12:\"phrase_value\";s:8:\"Reply to\";s:7:\"package\";s:6:\"wpforo\";}i:606;a:5:{s:8:\"phraseid\";s:3:\"607\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Topic Author\";s:12:\"phrase_value\";s:12:\"Topic Author\";s:7:\"package\";s:6:\"wpforo\";}i:607;a:5:{s:8:\"phraseid\";s:3:\"608\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Reply by\";s:12:\"phrase_value\";s:8:\"Reply by\";s:7:\"package\";s:6:\"wpforo\";}i:608;a:5:{s:8:\"phraseid\";s:3:\"609\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"All \";s:12:\"phrase_value\";s:4:\"All \";s:7:\"package\";s:6:\"wpforo\";}i:609;a:5:{s:8:\"phraseid\";s:3:\"610\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Deleted\";s:12:\"phrase_value\";s:7:\"Deleted\";s:7:\"package\";s:6:\"wpforo\";}i:610;a:5:{s:8:\"phraseid\";s:3:\"611\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:20:\"404 - Page not found\";s:12:\"phrase_value\";s:20:\"404 - Page not found\";s:7:\"package\";s:6:\"wpforo\";}i:611;a:5:{s:8:\"phraseid\";s:3:\"612\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"About\";s:12:\"phrase_value\";s:5:\"About\";s:7:\"package\";s:6:\"wpforo\";}i:612;a:5:{s:8:\"phraseid\";s:3:\"613\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"action error\";s:12:\"phrase_value\";s:12:\"action error\";s:7:\"package\";s:6:\"wpforo\";}i:613;a:5:{s:8:\"phraseid\";s:3:\"614\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"post not found\";s:12:\"phrase_value\";s:14:\"post not found\";s:7:\"package\";s:6:\"wpforo\";}i:614;a:5:{s:8:\"phraseid\";s:3:\"615\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"done\";s:12:\"phrase_value\";s:4:\"done\";s:7:\"package\";s:6:\"wpforo\";}i:615;a:5:{s:8:\"phraseid\";s:3:\"616\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"topic not found\";s:12:\"phrase_value\";s:15:\"topic not found\";s:7:\"package\";s:6:\"wpforo\";}i:616;a:5:{s:8:\"phraseid\";s:3:\"617\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"wrong data\";s:12:\"phrase_value\";s:10:\"wrong data\";s:7:\"package\";s:6:\"wpforo\";}i:617;a:5:{s:8:\"phraseid\";s:3:\"618\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:39:\"all topics has been loaded in this list\";s:12:\"phrase_value\";s:39:\"all topics has been loaded in this list\";s:7:\"package\";s:6:\"wpforo\";}i:618;a:5:{s:8:\"phraseid\";s:3:\"619\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"Attachment\";s:12:\"phrase_value\";s:10:\"Attachment\";s:7:\"package\";s:6:\"wpforo\";}i:619;a:5:{s:8:\"phraseid\";s:3:\"620\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"The key is expired\";s:12:\"phrase_value\";s:18:\"The key is expired\";s:7:\"package\";s:6:\"wpforo\";}i:620;a:5:{s:8:\"phraseid\";s:3:\"621\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"The key is invalid\";s:12:\"phrase_value\";s:18:\"The key is invalid\";s:7:\"package\";s:6:\"wpforo\";}i:621;a:5:{s:8:\"phraseid\";s:3:\"622\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:19:\"Email has been sent\";s:12:\"phrase_value\";s:19:\"Email has been sent\";s:7:\"package\";s:6:\"wpforo\";}i:622;a:5:{s:8:\"phraseid\";s:3:\"623\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:27:\"The password reset mismatch\";s:12:\"phrase_value\";s:27:\"The password reset mismatch\";s:7:\"package\";s:6:\"wpforo\";}i:623;a:5:{s:8:\"phraseid\";s:3:\"624\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:24:\"The password reset empty\";s:12:\"phrase_value\";s:24:\"The password reset empty\";s:7:\"package\";s:6:\"wpforo\";}i:624;a:5:{s:8:\"phraseid\";s:3:\"625\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:29:\"The password has been changed\";s:12:\"phrase_value\";s:29:\"The password has been changed\";s:7:\"package\";s:6:\"wpforo\";}i:625;a:5:{s:8:\"phraseid\";s:3:\"626\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Invalid request.\";s:12:\"phrase_value\";s:16:\"Invalid request.\";s:7:\"package\";s:6:\"wpforo\";}i:626;a:5:{s:8:\"phraseid\";s:3:\"627\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:82:\"You have been banned. Please contact to forum administrators for more information.\";s:12:\"phrase_value\";s:82:\"You have been banned. Please contact to forum administrators for more information.\";s:7:\"package\";s:6:\"wpforo\";}i:627;a:5:{s:8:\"phraseid\";s:3:\"628\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:67:\"Topic are private, please register or login for further information\";s:12:\"phrase_value\";s:67:\"Topic are private, please register or login for further information\";s:7:\"package\";s:6:\"wpforo\";}i:628;a:5:{s:8:\"phraseid\";s:3:\"629\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:4:\"More\";s:12:\"phrase_value\";s:4:\"More\";s:7:\"package\";s:6:\"wpforo\";}i:629;a:5:{s:8:\"phraseid\";s:3:\"630\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:40:\"expand to show all comments on this post\";s:12:\"phrase_value\";s:40:\"expand to show all comments on this post\";s:7:\"package\";s:6:\"wpforo\";}i:630;a:5:{s:8:\"phraseid\";s:3:\"631\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:21:\"show %d more comments\";s:12:\"phrase_value\";s:21:\"show %d more comments\";s:7:\"package\";s:6:\"wpforo\";}i:631;a:5:{s:8:\"phraseid\";s:3:\"632\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Threads\";s:12:\"phrase_value\";s:7:\"Threads\";s:7:\"package\";s:6:\"wpforo\";}i:632;a:5:{s:8:\"phraseid\";s:3:\"633\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:31:\"No forum found in this category\";s:12:\"phrase_value\";s:31:\"No forum found in this category\";s:7:\"package\";s:6:\"wpforo\";}i:633;a:5:{s:8:\"phraseid\";s:3:\"634\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:7:\"Popular\";s:12:\"phrase_value\";s:7:\"Popular\";s:7:\"package\";s:6:\"wpforo\";}i:634;a:5:{s:8:\"phraseid\";s:3:\"635\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"Resolved\";s:12:\"phrase_value\";s:8:\"Resolved\";s:7:\"package\";s:6:\"wpforo\";}i:635;a:5:{s:8:\"phraseid\";s:3:\"636\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:6:\"Status\";s:12:\"phrase_value\";s:6:\"Status\";s:7:\"package\";s:6:\"wpforo\";}i:636;a:5:{s:8:\"phraseid\";s:3:\"637\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:5:\"Users\";s:12:\"phrase_value\";s:5:\"Users\";s:7:\"package\";s:6:\"wpforo\";}i:637;a:5:{s:8:\"phraseid\";s:3:\"638\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Load More Topics\";s:12:\"phrase_value\";s:16:\"Load More Topics\";s:7:\"package\";s:6:\"wpforo\";}i:638;a:5:{s:8:\"phraseid\";s:3:\"639\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:12:\"Reset Fields\";s:12:\"phrase_value\";s:12:\"Reset Fields\";s:7:\"package\";s:6:\"wpforo\";}i:639;a:5:{s:8:\"phraseid\";s:3:\"640\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:18:\"Not Replied Topics\";s:12:\"phrase_value\";s:18:\"Not Replied Topics\";s:7:\"package\";s:6:\"wpforo\";}i:640;a:5:{s:8:\"phraseid\";s:3:\"641\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Solved Topics\";s:12:\"phrase_value\";s:13:\"Solved Topics\";s:7:\"package\";s:6:\"wpforo\";}i:641;a:5:{s:8:\"phraseid\";s:3:\"642\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Unsolved Topics\";s:12:\"phrase_value\";s:15:\"Unsolved Topics\";s:7:\"package\";s:6:\"wpforo\";}i:642;a:5:{s:8:\"phraseid\";s:3:\"643\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Closed Topics\";s:12:\"phrase_value\";s:13:\"Closed Topics\";s:7:\"package\";s:6:\"wpforo\";}i:643;a:5:{s:8:\"phraseid\";s:3:\"644\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:13:\"Sticky Topics\";s:12:\"phrase_value\";s:13:\"Sticky Topics\";s:7:\"package\";s:6:\"wpforo\";}i:644;a:5:{s:8:\"phraseid\";s:3:\"645\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:14:\"Private Topics\";s:12:\"phrase_value\";s:14:\"Private Topics\";s:7:\"package\";s:6:\"wpforo\";}i:645;a:5:{s:8:\"phraseid\";s:3:\"646\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:16:\"Unapproved Posts\";s:12:\"phrase_value\";s:16:\"Unapproved Posts\";s:7:\"package\";s:6:\"wpforo\";}i:646;a:5:{s:8:\"phraseid\";s:3:\"647\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:3:\"Tag\";s:12:\"phrase_value\";s:3:\"Tag\";s:7:\"package\";s:6:\"wpforo\";}i:647;a:5:{s:8:\"phraseid\";s:3:\"648\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:10:\"%s Replies\";s:12:\"phrase_value\";s:10:\"%s Replies\";s:7:\"package\";s:6:\"wpforo\";}i:648;a:5:{s:8:\"phraseid\";s:3:\"649\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:8:\"%s Reply\";s:12:\"phrase_value\";s:8:\"%s Reply\";s:7:\"package\";s:6:\"wpforo\";}i:649;a:5:{s:8:\"phraseid\";s:3:\"650\";s:6:\"langid\";s:1:\"1\";s:10:\"phrase_key\";s:15:\"Quote this text\";s:12:\"phrase_value\";s:16:\"Quote this text\n\";s:7:\"package\";s:6:\"wpforo\";}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(400, '_transient_is_multi_author', '0', 'yes'),
(401, '_transient_primer_has_active_categories', '', 'yes'),
(403, '_site_transient_timeout_theme_roots', '1566986181', 'no'),
(404, '_site_transient_theme_roots', 'a:5:{s:7:\"lyrical\";s:7:\"/themes\";s:6:\"primer\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, 'user_registration_form_setting_default_user_role', 'subscriber'),
(4, 5, 'user_registration_form_setting_enable_strong_password', 'yes'),
(5, 5, 'user_registration_form_setting_minimum_password_strength', '3'),
(6, 5, 'user_registration_form_setting_redirect_options', ''),
(7, 5, 'user_registration_form_setting_form_submit_label', 'Submit'),
(8, 5, 'user_registration_form_setting_enable_recaptcha_support', 'yes'),
(9, 5, 'user_registration_form_template', 'Default'),
(10, 5, 'user_registration_form_custom_class', ''),
(11, 8, 'user_registration_form_setting_default_user_role', 'subscriber'),
(12, 8, 'user_registration_form_setting_enable_strong_password', 'yes'),
(13, 8, 'user_registration_form_setting_minimum_password_strength', '0'),
(14, 8, 'user_registration_form_setting_redirect_options', ''),
(15, 8, 'user_registration_form_setting_form_submit_label', 'Completar registro'),
(16, 8, 'user_registration_form_setting_enable_recaptcha_support', 'yes'),
(17, 8, 'user_registration_form_template', 'Default'),
(18, 8, 'user_registration_form_custom_class', ''),
(19, 5, '_wp_trash_meta_status', 'publish'),
(20, 5, '_wp_trash_meta_time', '1566385627'),
(21, 5, '_wp_desired_post_slug', 'default-form'),
(22, 7, '_edit_lock', '1566388712:1'),
(23, 7, '_edit_last', '1'),
(24, 11, '_menu_item_type', 'custom'),
(25, 11, '_menu_item_menu_item_parent', '0'),
(26, 11, '_menu_item_object_id', '11'),
(27, 11, '_menu_item_object', 'custom'),
(28, 11, '_menu_item_target', ''),
(29, 11, '_menu_item_classes', 'a:1:{i:0;s:11:\"wpforo-home\";}'),
(30, 11, '_menu_item_xfn', ''),
(31, 11, '_menu_item_url', '/%wpforo-home%/'),
(32, 12, '_menu_item_type', 'custom'),
(33, 12, '_menu_item_menu_item_parent', '0'),
(34, 12, '_menu_item_object_id', '12'),
(35, 12, '_menu_item_object', 'custom'),
(36, 12, '_menu_item_target', ''),
(37, 12, '_menu_item_classes', 'a:1:{i:0;s:14:\"wpforo-members\";}'),
(38, 12, '_menu_item_xfn', ''),
(39, 12, '_menu_item_url', '/%wpforo-members%/'),
(40, 13, '_menu_item_type', 'custom'),
(41, 13, '_menu_item_menu_item_parent', '0'),
(42, 13, '_menu_item_object_id', '13'),
(43, 13, '_menu_item_object', 'custom'),
(44, 13, '_menu_item_target', ''),
(45, 13, '_menu_item_classes', 'a:1:{i:0;s:13:\"wpforo-recent\";}'),
(46, 13, '_menu_item_xfn', ''),
(47, 13, '_menu_item_url', '/%wpforo-recent%/'),
(48, 14, '_menu_item_type', 'custom'),
(49, 14, '_menu_item_menu_item_parent', '0'),
(50, 14, '_menu_item_object_id', '14'),
(51, 14, '_menu_item_object', 'custom'),
(52, 14, '_menu_item_target', ''),
(53, 14, '_menu_item_classes', 'a:1:{i:0;s:14:\"wpforo-profile\";}'),
(54, 14, '_menu_item_xfn', ''),
(55, 14, '_menu_item_url', '/%wpforo-profile-home%/'),
(56, 15, '_menu_item_type', 'custom'),
(57, 15, '_menu_item_menu_item_parent', '14'),
(58, 15, '_menu_item_object_id', '15'),
(59, 15, '_menu_item_object', 'custom'),
(60, 15, '_menu_item_target', ''),
(61, 15, '_menu_item_classes', 'a:1:{i:0;s:22:\"wpforo-profile-account\";}'),
(62, 15, '_menu_item_xfn', ''),
(63, 15, '_menu_item_url', '/%wpforo-profile-account%/'),
(64, 16, '_menu_item_type', 'custom'),
(65, 16, '_menu_item_menu_item_parent', '14'),
(66, 16, '_menu_item_object_id', '16'),
(67, 16, '_menu_item_object', 'custom'),
(68, 16, '_menu_item_target', ''),
(69, 16, '_menu_item_classes', 'a:1:{i:0;s:23:\"wpforo-profile-activity\";}'),
(70, 16, '_menu_item_xfn', ''),
(71, 16, '_menu_item_url', '/%wpforo-profile-activity%/'),
(72, 17, '_menu_item_type', 'custom'),
(73, 17, '_menu_item_menu_item_parent', '14'),
(74, 17, '_menu_item_object_id', '17'),
(75, 17, '_menu_item_object', 'custom'),
(76, 17, '_menu_item_target', ''),
(77, 17, '_menu_item_classes', 'a:1:{i:0;s:28:\"wpforo-profile-subscriptions\";}'),
(78, 17, '_menu_item_xfn', ''),
(79, 17, '_menu_item_url', '/%wpforo-profile-subscriptions%/'),
(80, 18, '_menu_item_type', 'custom'),
(81, 18, '_menu_item_menu_item_parent', '0'),
(82, 18, '_menu_item_object_id', '18'),
(83, 18, '_menu_item_object', 'custom'),
(84, 18, '_menu_item_target', ''),
(85, 18, '_menu_item_classes', 'a:1:{i:0;s:15:\"wpforo-register\";}'),
(86, 18, '_menu_item_xfn', ''),
(87, 18, '_menu_item_url', '/%wpforo-register%/'),
(88, 19, '_menu_item_type', 'custom'),
(89, 19, '_menu_item_menu_item_parent', '0'),
(90, 19, '_menu_item_object_id', '19'),
(91, 19, '_menu_item_object', 'custom'),
(92, 19, '_menu_item_target', ''),
(93, 19, '_menu_item_classes', 'a:1:{i:0;s:12:\"wpforo-login\";}'),
(94, 19, '_menu_item_xfn', ''),
(95, 19, '_menu_item_url', '/%wpforo-login%/'),
(96, 20, '_menu_item_type', 'custom'),
(97, 20, '_menu_item_menu_item_parent', '0'),
(98, 20, '_menu_item_object_id', '20'),
(99, 20, '_menu_item_object', 'custom'),
(100, 20, '_menu_item_target', ''),
(101, 20, '_menu_item_classes', 'a:1:{i:0;s:13:\"wpforo-logout\";}'),
(102, 20, '_menu_item_xfn', ''),
(103, 20, '_menu_item_url', '/%wpforo-logout%/'),
(104, 21, '_edit_lock', '1566392074:1'),
(105, 21, '_edit_last', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-08-14 14:52:39', '2019-08-14 12:52:39', '<!-- wp:paragraph -->\n<p>Bienvenido a WordPress. Esta es tu primera entrada. Edítala o bórrala, ¡luego empieza a escribir!</p>\n<!-- /wp:paragraph -->', '¡Hola, mundo!', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2019-08-14 14:52:39', '2019-08-14 12:52:39', '', 0, 'http://127.0.0.1/?p=1', 0, 'post', '', 1),
(2, 1, '2019-08-14 14:52:39', '2019-08-14 12:52:39', '<!-- wp:paragraph -->\n<p>Esta es una página de ejemplo. Es diferente a una entrada del blog porque permanecerá en un solo lugar y aparecerá en la navegación de tu sitio (en la mayoría de los temas). La mayoría de las personas comienzan con una página «Acerca de» que les presenta a los visitantes potenciales del sitio. Podrías decir algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>¡Bienvenido! Soy camarero de día, aspirante a actor de noche y esta es mi web. Vivo en Mairena del Alcor, tengo un perro que se llama Firulais y me gusta el rebujito. (Y las tardes largas con café).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>…o algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La empresa «Mariscos Recio» fue fundada por Antonio Recio Mata. Empezó siendo una pequeña empresa que suministraba marisco a hoteles y restaurantes, pero poco a poco se ha ido transformando en un gran imperio. Mariscos Recio, el mar al mejor precio.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Como nuevo usuario de WordPress, deberías ir a <a href=\"http://127.0.0.1/wp-admin/\">tu escritorio</a> para borrar esta página y crear nuevas páginas para tu contenido. ¡Pásalo bien!</p>\n<!-- /wp:paragraph -->', 'Página de ejemplo', '', 'publish', 'closed', 'open', '', 'pagina-ejemplo', '', '', '2019-08-14 14:52:39', '2019-08-14 12:52:39', '', 0, 'http://127.0.0.1/?page_id=2', 0, 'page', '', 0),
(3, 1, '2019-08-14 14:52:39', '2019-08-14 12:52:39', '<!-- wp:heading --><h2>Quiénes somos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>La dirección de nuestra web es: http://127.0.0.1.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué datos personales recogemos y por qué los recogemos</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comentarios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Cuando los visitantes dejan comentarios en la web, recopilamos los datos que se muestran en el formulario de comentarios, así como la dirección IP del visitante y la cadena de agentes de usuario del navegador para ayudar a la detección de spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Una cadena anónima creada a partir de tu dirección de correo electrónico (también llamada hash) puede ser proporcionada al servicio de Gravatar para ver si la estás usando. La política de privacidad del servicio Gravatar está disponible aquí: https://automattic.com/privacy/. Después de la aprobación de tu comentario, la imagen de tu perfil es visible para el público en el contexto de su comentario.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Medios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si subes imágenes a la web deberías evitar subir imágenes con datos de ubicación (GPS EXIF) incluidos. Los visitantes de la web pueden descargar y extraer cualquier dato de localización de las imágenes de la web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Formularios de contacto</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejas un comentario en nuestro sitio puedes elegir guardar tu nombre, dirección de correo electrónico y web en cookies. Esto es para tu comodidad, para que no tengas que volver a rellenar tus datos cuando dejes otro comentario. Estas cookies tendrán una duración de un año.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si tienes una cuenta y te conectas a este sitio, instalaremos una cookie temporal para determinar si tu navegador acepta cookies. Esta cookie no contiene datos personales y se elimina al cerrar el navegador.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Cuando inicias sesión, también instalaremos varias cookies para guardar tu información de inicio de sesión y tus opciones de visualización de pantalla. Las cookies de inicio de sesión duran dos días, y las cookies de opciones de pantalla duran un año. Si seleccionas &quot;Recordarme&quot;, tu inicio de sesión perdurará durante dos semanas. Si sales de tu cuenta, las cookies de inicio de sesión se eliminarán.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si editas o publicas un artículo se guardará una cookie adicional en tu navegador. Esta cookie no incluye datos personales y simplemente indica el ID del artículo que acabas de editar. Caduca después de 1 día.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contenido incrustado de otros sitios web</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Los artículos de este sitio pueden incluir contenido incrustado (por ejemplo, vídeos, imágenes, artículos, etc.). El contenido incrustado de otras web se comporta exactamente de la misma manera que si el visitante hubiera visitado la otra web.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Estas web pueden recopilar datos sobre ti, utilizar cookies, incrustar un seguimiento adicional de terceros, y supervisar tu interacción con ese contenido incrustado, incluido el seguimiento de tu interacción con el contenido incrustado si tienes una cuenta y estás conectado a esa web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analítica</h3><!-- /wp:heading --><!-- wp:heading --><h2>Con quién compartimos tus datos</h2><!-- /wp:heading --><!-- wp:heading --><h2>Cuánto tiempo conservamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejas un comentario, el comentario y sus metadatos se conservan indefinidamente. Esto es para que podamos reconocer y aprobar comentarios sucesivos automáticamente en lugar de mantenerlos en una cola de moderación.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>De los usuarios que se registran en nuestra web (si los hay), también almacenamos la información personal que proporcionan en su perfil de usuario. Todos los usuarios pueden ver, editar o eliminar su información personal en cualquier momento (excepto que no pueden cambiar su nombre de usuario). Los administradores de la web también pueden ver y editar esa información.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué derechos tienes sobre tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si tienes una cuenta o has dejado comentarios en esta web, puedes solicitar recibir un archivo de exportación de los datos personales que tenemos sobre ti, incluyendo cualquier dato que nos hayas proporcionado. También puedes solicitar que eliminemos cualquier dato personal que tengamos sobre ti. Esto no incluye ningún dato que estemos obligados a conservar con fines administrativos, legales o de seguridad.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Dónde enviamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Los comentarios de los visitantes puede que los revise un servicio de detección automática de spam.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Tu información de contacto</h2><!-- /wp:heading --><!-- wp:heading --><h2>Información adicional</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cómo protegemos tus datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué procedimientos utilizamos contra las brechas de datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>De qué terceros recibimos datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué tipo de toma de decisiones automatizada y/o perfilado hacemos con los datos del usuario</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Requerimientos regulatorios de revelación de información del sector</h3><!-- /wp:heading -->', 'Política de privacidad', '', 'draft', 'closed', 'open', '', 'politica-privacidad', '', '', '2019-08-14 14:52:39', '2019-08-14 12:52:39', '', 0, 'http://127.0.0.1/?page_id=3', 0, 'page', '', 0),
(5, 1, '2019-08-20 14:49:37', '2019-08-20 12:49:37', '[[[{\"field_key\":\"user_login\",\"general_setting\":{\"label\":\"Username\",\"description\":\"\",\"field_name\":\"user_login\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}},{\"field_key\":\"user_pass\",\"general_setting\":{\"label\":\"User Password\",\"description\":\"\",\"field_name\":\"user_pass\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}},{\"field_key\":\"user_email\",\"general_setting\":{\"label\":\"User Email\",\"description\":\"\",\"field_name\":\"user_email\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}},{\"field_key\":\"user_confirm_password\",\"general_setting\":{\"label\":\"Confirm Password\",\"description\":\"\",\"field_name\":\"user_confirm_password\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}}],[],[]]]', 'Default form', '', 'trash', 'closed', 'closed', '', 'default-form__trashed', '', '', '2019-08-21 13:07:07', '2019-08-21 11:07:07', '', 0, 'http://127.0.0.1/?post_type=user_registration&#038;p=5', 0, 'user_registration', '', 0),
(6, 1, '2019-08-20 14:41:09', '2019-08-20 12:41:09', '[user_registration_my_account]', 'My Account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2019-08-20 14:41:09', '2019-08-20 12:41:09', '', 0, 'http://127.0.0.1/my-account/', 0, 'page', '', 0),
(7, 1, '2019-08-20 14:41:09', '2019-08-20 12:41:09', '[user_registration_form id=\"8\"]', 'Registro', '', 'publish', 'closed', 'closed', '', 'registration', '', '', '2019-08-21 13:09:52', '2019-08-21 11:09:52', '', 0, 'http://127.0.0.1/registration/', 0, 'page', '', 0),
(8, 1, '2019-08-21 13:19:37', '2019-08-21 11:19:37', '[[[{\"field_key\":\"user_login\",\"general_setting\":{\"label\":\"Nombre de usuario\",\"description\":\"\",\"field_name\":\"user_login\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}},{\"field_key\":\"user_email\",\"general_setting\":{\"label\":\"Correo electrónico\",\"description\":\"\",\"field_name\":\"user_email\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}},{\"field_key\":\"user_confirm_email\",\"general_setting\":{\"label\":\"Confirma correo electrónico\",\"description\":\"\",\"field_name\":\"user_confirm_email\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}},{\"field_key\":\"user_pass\",\"general_setting\":{\"label\":\"Contraseña\",\"description\":\"\",\"field_name\":\"user_pass\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}},{\"field_key\":\"user_confirm_password\",\"general_setting\":{\"label\":\"Confirma contraseña\",\"description\":\"\",\"field_name\":\"user_confirm_password\",\"placeholder\":\"\",\"required\":\"yes\",\"hide_label\":\"no\"},\"advance_setting\":{\"custom_class\":\"\"}}]]]', 'Registro', '', 'publish', 'closed', 'closed', '', 'registro', '', '', '2019-08-21 13:19:37', '2019-08-21 11:19:37', '', 0, 'http://127.0.0.1/?post_type=user_registration&#038;p=8', 0, 'user_registration', '', 0),
(9, 1, '2019-08-21 13:09:43', '2019-08-21 11:09:43', '[user_registration_form id=\"8\"]', 'Registration', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2019-08-21 13:09:43', '2019-08-21 11:09:43', '', 7, 'http://127.0.0.1/2019/08/21/7-revision-v1/', 0, 'revision', '', 0),
(10, 1, '2019-08-21 13:09:52', '2019-08-21 11:09:52', '[user_registration_form id=\"8\"]', 'Registro', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2019-08-21 13:09:52', '2019-08-21 11:09:52', '', 7, 'http://127.0.0.1/2019/08/21/7-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Foros', '', 'publish', 'closed', 'closed', '', 'foros', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/foros/', 0, 'nav_menu_item', '', 0),
(12, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Miembros', '', 'publish', 'closed', 'closed', '', 'miembros', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/miembros/', 2, 'nav_menu_item', '', 0),
(13, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Últimos Mensajes', '', 'publish', 'closed', 'closed', '', 'ultimos-mensajes', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/ultimos-mensajes/', 3, 'nav_menu_item', '', 0),
(14, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Mi Perfil', '', 'publish', 'closed', 'closed', '', 'mi-perfil', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/mi-perfil/', 4, 'nav_menu_item', '', 0),
(15, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Cuenta', '', 'publish', 'closed', 'closed', '', 'cuenta', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/cuenta/', 1, 'nav_menu_item', '', 0),
(16, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Actividad', '', 'publish', 'closed', 'closed', '', 'actividad', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/actividad/', 1, 'nav_menu_item', '', 0),
(17, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Suscripciones', '', 'publish', 'closed', 'closed', '', 'suscripciones', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/suscripciones/', 2, 'nav_menu_item', '', 0),
(18, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Registro', '', 'publish', 'closed', 'closed', '', 'registro', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/registro/', 8, 'nav_menu_item', '', 0),
(19, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Iniciar Sesión', '', 'publish', 'closed', 'closed', '', 'iniciar-sesion', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/iniciar-sesion/', 9, 'nav_menu_item', '', 0),
(20, 1, '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 'Salir', '', 'publish', 'closed', 'closed', '', 'salir', '', '', '2019-08-21 14:32:41', '2019-08-21 12:32:41', '', 0, 'http://127.0.0.1/2019/08/21/salir/', 10, 'nav_menu_item', '', 0),
(21, 1, '2019-08-21 12:32:41', '2019-08-21 12:32:41', '[wpforo]', 'Foro', '', 'publish', 'close', 'close', '', 'community', '', '', '2019-08-21 14:54:33', '2019-08-21 12:54:33', '', 0, 'http://127.0.0.1/community/', 0, 'page', '', 0),
(22, 1, '2019-08-21 14:47:42', '2019-08-21 12:47:42', '[wpforo]', 'Foro', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2019-08-21 14:47:42', '2019-08-21 12:47:42', '', 21, 'http://127.0.0.1/2019/08/21/21-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2019-08-21 14:49:17', '2019-08-21 12:49:17', '[wpforo]', '', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2019-08-21 14:49:17', '2019-08-21 12:49:17', '', 21, 'http://127.0.0.1/2019/08/21/21-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2019-08-21 14:54:33', '2019-08-21 12:54:33', '[wpforo]', 'Foro', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2019-08-21 14:54:33', '2019-08-21 12:54:33', '', 21, 'http://127.0.0.1/2019/08/21/21-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2019-08-23 09:13:34', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-08-23 09:13:34', '0000-00-00 00:00:00', '', 0, 'http://127.0.0.1/?p=26', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sin categoría', 'sin-categoria', 0),
(2, 'Panel wpForo', 'panel-wpforo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(11, 2, 0),
(12, 2, 0),
(13, 2, 0),
(14, 2, 0),
(15, 2, 0),
(16, 2, 0),
(17, 2, 0),
(18, 2, 0),
(19, 2, 0),
(20, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'alumnos'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:5:{s:64:\"b6bb555b3b6276e77cd69885bbbfb19e87b72cef56cf03d01e2ea411210cdfc4\";a:4:{s:10:\"expiration\";i:1566476848;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:128:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3872.0 Safari/537.36 Edg/78.0.244.0\";s:5:\"login\";i:1566304048;}s:64:\"88b156c543f29e6d4c42e002c6e5f1b4027106bf283e569205aecc8310ad5347\";a:4:{s:10:\"expiration\";i:1567513678;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:128:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3872.0 Safari/537.36 Edg/78.0.244.0\";s:5:\"login\";i:1566304078;}s:64:\"eadf1373d7c270bd1250818a9a66e838909f825be539defd5213dc93befd690d\";a:4:{s:10:\"expiration\";i:1567593162;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:128:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3872.0 Safari/537.36 Edg/78.0.244.0\";s:5:\"login\";i:1566383562;}s:64:\"f9ce89921e8cfeb7d6a942d800a9abf9d59a19537366f072ff28378e0f14435d\";a:4:{s:10:\"expiration\";i:1567596356;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:128:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3872.0 Safari/537.36 Edg/78.0.244.0\";s:5:\"login\";i:1566386756;}s:64:\"0241411fb1ebb05c0dbbb625eb8f9103cc27dca11bb8cf2bc6fbc1f04afee57b\";a:4:{s:10:\"expiration\";i:1566562929;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:128:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3872.0 Safari/537.36 Edg/78.0.244.0\";s:5:\"login\";i:1566390129;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '26'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(35, 1, '_wpf_member_obj', 'a:53:{s:2:\"ID\";s:1:\"1\";s:10:\"user_login\";s:7:\"alumnos\";s:9:\"user_pass\";s:34:\"$P$Bp3CT3Y2gGBCp3VH5MSrJQ7KwlJEIr/\";s:13:\"user_nicename\";s:7:\"alumnos\";s:10:\"user_email\";s:24:\"criptoaltramuz@gmail.com\";s:8:\"user_url\";s:0:\"\";s:15:\"user_registered\";s:19:\"2019-08-14 12:52:39\";s:19:\"user_activation_key\";s:0:\"\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:7:\"alumnos\";s:6:\"userid\";s:1:\"1\";s:5:\"title\";s:6:\"Member\";s:8:\"username\";s:7:\"alumnos\";s:7:\"groupid\";s:1:\"1\";s:5:\"posts\";s:1:\"0\";s:9:\"questions\";s:1:\"0\";s:7:\"answers\";s:1:\"0\";s:8:\"comments\";s:1:\"0\";s:4:\"site\";s:0:\"\";s:3:\"icq\";N;s:3:\"aim\";N;s:5:\"yahoo\";N;s:3:\"msn\";N;s:8:\"facebook\";N;s:7:\"twitter\";N;s:5:\"gtalk\";N;s:5:\"skype\";N;s:6:\"avatar\";N;s:9:\"signature\";N;s:5:\"about\";s:0:\"\";s:10:\"occupation\";N;s:8:\"location\";N;s:10:\"last_login\";s:19:\"2019-08-14 12:52:39\";s:11:\"online_time\";s:10:\"1566390761\";s:4:\"rank\";s:1:\"0\";s:4:\"like\";s:1:\"0\";s:6:\"status\";s:6:\"active\";s:8:\"timezone\";s:0:\"\";s:18:\"is_email_confirmed\";s:1:\"0\";s:16:\"secondary_groups\";N;s:6:\"fields\";N;s:4:\"name\";s:5:\"Admin\";s:4:\"cans\";s:607:\"a:33:{s:2:\"mf\";s:1:\"1\";s:2:\"ms\";s:1:\"1\";s:2:\"mt\";s:1:\"1\";s:2:\"vm\";s:1:\"1\";s:3:\"aum\";s:1:\"1\";s:3:\"vmg\";s:1:\"1\";s:2:\"mp\";s:1:\"1\";s:3:\"mth\";s:1:\"1\";s:2:\"em\";s:1:\"1\";s:2:\"bm\";s:1:\"1\";s:2:\"dm\";s:1:\"1\";s:3:\"aup\";s:1:\"1\";s:9:\"view_stat\";s:1:\"1\";s:4:\"vmem\";s:1:\"1\";s:4:\"vprf\";s:1:\"1\";s:4:\"vpra\";s:1:\"1\";s:4:\"vprs\";s:1:\"1\";s:3:\"upa\";s:1:\"1\";s:3:\"ups\";s:1:\"1\";s:2:\"va\";s:1:\"1\";s:3:\"vmu\";s:1:\"1\";s:3:\"vmm\";s:1:\"1\";s:3:\"vmt\";s:1:\"1\";s:4:\"vmct\";s:1:\"1\";s:3:\"vmr\";s:1:\"1\";s:3:\"vmw\";s:1:\"1\";s:4:\"vmsn\";s:1:\"1\";s:4:\"vmrd\";s:1:\"1\";s:3:\"vml\";s:1:\"1\";s:3:\"vmo\";s:1:\"1\";s:3:\"vms\";s:1:\"1\";s:4:\"vmam\";s:1:\"1\";s:4:\"vwpm\";s:1:\"1\";}\";s:11:\"description\";s:0:\"\";s:6:\"utitle\";s:5:\"Admin\";s:4:\"role\";s:13:\"administrator\";s:6:\"access\";s:4:\"full\";s:5:\"color\";s:7:\"#FF3333\";s:7:\"visible\";s:1:\"1\";s:9:\"secondary\";s:1:\"0\";s:9:\"groupname\";s:5:\"Admin\";s:11:\"profile_url\";s:43:\"http://127.0.0.1/community/profile/alumnos/\";s:4:\"stat\";a:14:{s:6:\"points\";i:0;s:6:\"rating\";i:0;s:14:\"rating_procent\";i:0;s:5:\"color\";s:7:\"#d2d2d2\";s:5:\"badge\";s:16:\"far fa-star-half\";s:5:\"posts\";i:0;s:6:\"topics\";i:0;s:9:\"questions\";i:0;s:7:\"answers\";i:0;s:17:\"question_comments\";i:0;s:5:\"likes\";i:0;s:5:\"liked\";i:0;s:5:\"title\";s:10:\"New Member\";s:4:\"rank\";i:0;}}'),
(36, 1, 'closedpostboxes_page', 'a:1:{i:0;s:23:\"primer-layouts-meta-box\";}'),
(37, 1, 'metaboxhidden_page', 'a:0:{}'),
(38, 1, 'nav_menu_recently_edited', '2'),
(39, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(40, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'alumnos', '$P$Bp3CT3Y2gGBCp3VH5MSrJQ7KwlJEIr/', 'alumnos', 'criptoaltramuz@gmail.com', '', '2019-08-14 12:52:39', '', 0, 'alumnos');

-- --------------------------------------------------------

--
-- Table structure for table `wp_user_registration_sessions`
--

CREATE TABLE IF NOT EXISTS `wp_user_registration_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_accesses`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_accesses` (
  `accessid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `access` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cans` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'forum permissions',
  PRIMARY KEY (`accessid`),
  UNIQUE KEY `access` (`access`(191))
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wpforo_accesses`
--

INSERT INTO `wp_wpforo_accesses` (`accessid`, `access`, `title`, `cans`) VALUES
(1, 'no_access', 'No access', 'a:35:{s:2:\"vf\";i:0;s:2:\"ct\";i:0;s:2:\"vt\";i:0;s:2:\"et\";i:0;s:2:\"dt\";i:0;s:2:\"cr\";i:0;s:2:\"vr\";i:0;s:2:\"er\";i:0;s:2:\"dr\";i:0;s:3:\"tag\";i:0;s:3:\"eot\";i:0;s:3:\"eor\";i:0;s:3:\"dot\";i:0;s:3:\"dor\";i:0;s:2:\"sb\";i:0;s:1:\"l\";i:0;s:1:\"r\";i:0;s:1:\"s\";i:0;s:2:\"au\";i:0;s:1:\"p\";i:0;s:2:\"op\";i:0;s:2:\"vp\";i:0;s:2:\"sv\";i:0;s:3:\"osv\";i:0;s:1:\"v\";i:0;s:1:\"a\";i:0;s:2:\"va\";i:0;s:2:\"at\";i:0;s:3:\"oat\";i:0;s:3:\"aot\";i:0;s:3:\"cot\";i:0;s:2:\"mt\";i:0;s:3:\"ccp\";i:0;s:3:\"cvp\";i:0;s:4:\"cvpr\";i:0;}'),
(2, 'read_only', 'Read only access', 'a:35:{s:2:\"vf\";i:1;s:2:\"ct\";i:0;s:2:\"vt\";i:1;s:2:\"et\";i:0;s:2:\"dt\";i:0;s:2:\"cr\";i:0;s:2:\"vr\";i:1;s:2:\"er\";i:0;s:2:\"dr\";i:0;s:3:\"tag\";i:0;s:3:\"eot\";i:0;s:3:\"eor\";i:0;s:3:\"dot\";i:0;s:3:\"dor\";i:0;s:2:\"sb\";i:1;s:1:\"l\";i:0;s:1:\"r\";i:0;s:1:\"s\";i:0;s:2:\"au\";i:0;s:1:\"p\";i:0;s:2:\"op\";i:0;s:2:\"vp\";i:0;s:2:\"sv\";i:0;s:3:\"osv\";i:0;s:1:\"v\";i:0;s:1:\"a\";i:0;s:2:\"va\";i:1;s:2:\"at\";i:0;s:3:\"oat\";i:0;s:3:\"aot\";i:0;s:3:\"cot\";i:0;s:2:\"mt\";i:0;s:3:\"ccp\";i:0;s:3:\"cvp\";i:0;s:4:\"cvpr\";i:1;}'),
(3, 'standard', 'Standard access', 'a:35:{s:2:\"vf\";i:1;s:2:\"ct\";i:1;s:2:\"vt\";i:1;s:2:\"et\";i:0;s:2:\"dt\";i:0;s:2:\"cr\";i:1;s:2:\"vr\";i:1;s:2:\"er\";i:0;s:2:\"dr\";i:0;s:3:\"tag\";i:1;s:3:\"eot\";i:1;s:3:\"eor\";i:1;s:3:\"dot\";i:1;s:3:\"dor\";i:1;s:2:\"sb\";i:1;s:1:\"l\";i:1;s:1:\"r\";i:1;s:1:\"s\";i:0;s:2:\"au\";i:0;s:1:\"p\";i:0;s:2:\"op\";i:1;s:2:\"vp\";i:0;s:2:\"sv\";i:0;s:3:\"osv\";i:1;s:1:\"v\";i:1;s:1:\"a\";i:1;s:2:\"va\";i:1;s:2:\"at\";i:0;s:3:\"oat\";i:1;s:3:\"aot\";i:1;s:3:\"cot\";i:0;s:2:\"mt\";i:0;s:3:\"ccp\";i:1;s:3:\"cvp\";i:1;s:4:\"cvpr\";i:1;}'),
(4, 'moderator', 'Moderator access', 'a:35:{s:2:\"vf\";i:1;s:2:\"ct\";i:1;s:2:\"vt\";i:1;s:2:\"et\";i:1;s:2:\"dt\";i:1;s:2:\"cr\";i:1;s:2:\"vr\";i:1;s:2:\"er\";i:1;s:2:\"dr\";i:1;s:3:\"tag\";i:1;s:3:\"eot\";i:1;s:3:\"eor\";i:1;s:3:\"dot\";i:1;s:3:\"dor\";i:1;s:2:\"sb\";i:1;s:1:\"l\";i:1;s:1:\"r\";i:1;s:1:\"s\";i:1;s:2:\"au\";i:1;s:1:\"p\";i:1;s:2:\"op\";i:1;s:2:\"vp\";i:1;s:2:\"sv\";i:1;s:3:\"osv\";i:1;s:1:\"v\";i:1;s:1:\"a\";i:1;s:2:\"va\";i:1;s:2:\"at\";i:1;s:3:\"oat\";i:1;s:3:\"aot\";i:1;s:3:\"cot\";i:1;s:2:\"mt\";i:1;s:3:\"ccp\";i:1;s:3:\"cvp\";i:1;s:4:\"cvpr\";i:1;}'),
(5, 'full', 'Full access', 'a:35:{s:2:\"vf\";i:1;s:2:\"ct\";i:1;s:2:\"vt\";i:1;s:2:\"et\";i:1;s:2:\"dt\";i:1;s:2:\"cr\";i:1;s:2:\"vr\";i:1;s:2:\"er\";i:1;s:2:\"dr\";i:1;s:3:\"tag\";i:1;s:3:\"eot\";i:1;s:3:\"eor\";i:1;s:3:\"dot\";i:1;s:3:\"dor\";i:1;s:2:\"sb\";i:1;s:1:\"l\";i:1;s:1:\"r\";i:1;s:1:\"s\";i:1;s:2:\"au\";i:1;s:1:\"p\";i:1;s:2:\"op\";i:1;s:2:\"vp\";i:1;s:2:\"sv\";i:1;s:3:\"osv\";i:1;s:1:\"v\";i:1;s:1:\"a\";i:1;s:2:\"va\";i:1;s:2:\"at\";i:1;s:3:\"oat\";i:1;s:3:\"aot\";i:1;s:3:\"cot\";i:1;s:2:\"mt\";i:1;s:3:\"ccp\";i:1;s:3:\"cvp\";i:1;s:4:\"cvpr\";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_activity`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_activity` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemid` bigint(20) UNSIGNED NOT NULL,
  `itemtype` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemid_second` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `userid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `type_objid_objtype` (`type`,`itemid`,`itemtype`),
  KEY `type_objid_objtype_userid` (`type`,`itemid`,`itemtype`,`userid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_forums`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_forums` (
  `forumid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_topicid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_postid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_userid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `topics` int(11) NOT NULL DEFAULT 0,
  `posts` int(11) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_cat` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `cat_layout` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`forumid`),
  UNIQUE KEY `UNIQUE SLUG` (`slug`(191)),
  KEY `order` (`order`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `last_postid` (`last_postid`),
  KEY `is_cat` (`is_cat`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wpforo_forums`
--

INSERT INTO `wp_wpforo_forums` (`forumid`, `title`, `slug`, `description`, `parentid`, `icon`, `last_topicid`, `last_postid`, `last_userid`, `last_post_date`, `topics`, `posts`, `permissions`, `meta_key`, `meta_desc`, `status`, `is_cat`, `cat_layout`, `order`, `color`) VALUES
(1, 'Foro principal', 'inicio', '', 0, 'fas fa-comments', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 'a:5:{i:1;s:4:\"full\";i:2;s:9:\"moderator\";i:3;s:8:\"standard\";i:4;s:9:\"read_only\";i:5;s:8:\"standard\";}', '', '', 1, 1, 2, 1, '#666666'),
(5, 'Criptografía', 'criptografia', 'Criptografía y relacionados directamente', 1, 'fas fa-comments', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 'a:5:{i:1;s:4:\"full\";i:2;s:9:\"moderator\";i:3;s:8:\"standard\";i:4;s:9:\"read_only\";i:5;s:8:\"standard\";}', '', '', 1, 0, 2, 2, '#340752'),
(3, 'Off topic', 'off-topic', 'Temas no relacionados con la criptología', 1, 'fas fa-comments', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 'a:5:{i:1;s:4:\"full\";i:2;s:9:\"moderator\";i:3;s:8:\"standard\";i:4;s:9:\"read_only\";i:5;s:8:\"standard\";}', '', '', 1, 0, 2, 3, '#D7161C'),
(4, 'Interno (privado)', 'apo', 'Foro interno de los creadores (acceso restringido)', 1, 'fas fa-comments', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 'a:5:{i:1;s:4:\"full\";i:2;s:9:\"moderator\";i:3;s:9:\"no_access\";i:4;s:9:\"no_access\";i:5;s:9:\"no_access\";}', '', '', 1, 0, 2, 4, '#75FDEA');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_languages`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_languages` (
  `langid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`langid`),
  UNIQUE KEY `UNIQUE language name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wpforo_languages`
--

INSERT INTO `wp_wpforo_languages` (`langid`, `name`) VALUES
(1, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_likes`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_likes` (
  `likeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` int(10) UNSIGNED NOT NULL,
  `postid` int(10) UNSIGNED NOT NULL,
  `post_userid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`likeid`),
  UNIQUE KEY `userid` (`userid`,`postid`),
  KEY `post_userid` (`post_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_phrases`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_phrases` (
  `phraseid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `langid` int(10) UNSIGNED NOT NULL,
  `phrase_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phrase_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `package` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'wpforo',
  PRIMARY KEY (`phraseid`),
  UNIQUE KEY `lng_and_key_uniq` (`langid`,`phrase_key`(191)),
  KEY `langid` (`langid`),
  KEY `phrase_key` (`phrase_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wpforo_phrases`
--

INSERT INTO `wp_wpforo_phrases` (`phraseid`, `langid`, `phrase_key`, `phrase_value`, `package`) VALUES
(1, 1, '%s and %s liked', '%s and %s liked', 'wpforo'),
(2, 1, '%s liked', '%s liked', 'wpforo'),
(3, 1, '%s, %s and %s liked', '%s, %s and %s liked', 'wpforo'),
(4, 1, '%s, %s, %s and %d people liked', '%s, %s, %s and %d people liked', 'wpforo'),
(5, 1, 'AOL IM', 'AOL IM', 'wpforo'),
(6, 1, 'About Me', 'About Me', 'wpforo'),
(7, 1, 'Access add error', 'Access add error', 'wpforo'),
(8, 1, 'Access delete error', 'Access delete error', 'wpforo'),
(9, 1, 'Access edit error', 'Access edit error', 'wpforo'),
(10, 1, 'Access successfully deleted', 'Access successfully deleted', 'wpforo'),
(11, 1, 'Account', 'Account', 'wpforo'),
(12, 1, 'Activity', 'Activity', 'wpforo'),
(13, 1, 'Add Topic error: No forum selected', 'Add Topic error: No forum selected', 'wpforo'),
(14, 1, 'Add a comment', 'Add a comment', 'wpforo'),
(15, 1, 'Add topic', 'Add topic', 'wpforo'),
(16, 1, 'All Checked topics successfully deleted', 'All Checked topics successfully deleted', 'wpforo'),
(17, 1, 'Answer', 'Answer', 'wpforo'),
(18, 1, 'Answer to', 'Answer to', 'wpforo'),
(19, 1, 'Answers', 'Answers', 'wpforo'),
(20, 1, 'Any Date', 'Any Date', 'wpforo'),
(21, 1, 'Ascending order', 'Ascending order', 'wpforo'),
(22, 1, 'Attach file:', 'Attach file:', 'wpforo'),
(23, 1, 'Avatar', 'Avatar', 'wpforo'),
(24, 1, 'Can\'t add forum', 'Can\'t add forum', 'wpforo'),
(25, 1, 'Can\'t add new language', 'Can\'t add new language', 'wpforo'),
(26, 1, 'Can\'t delete this Usergroup', 'Can\'t delete this Usergroup', 'wpforo'),
(27, 1, 'Can\'t send confirmation email', 'Can\'t send confirmation email', 'wpforo'),
(28, 1, 'Can\'t send report email', 'Can\'t send report email', 'wpforo'),
(29, 1, 'Can\'t subscribe to this item', 'Can\'t subscribe to this item', 'wpforo'),
(30, 1, 'Can\'t write a post: This topic is closed', 'Can\'t write a post: This topic is closed', 'wpforo'),
(31, 1, 'Can`t upload file', 'Can`t upload file', 'wpforo'),
(32, 1, 'Cannot update forum hierarchy', 'Cannot update forum hierarchy', 'wpforo'),
(33, 1, 'Cannot update post data', 'Cannot update post data', 'wpforo'),
(34, 1, 'Change password', 'Change password', 'wpforo'),
(35, 1, 'Choose Target Forum', 'Choose Target Forum', 'wpforo'),
(36, 1, 'Comments', 'Comments', 'wpforo'),
(37, 1, 'Confirm my subscription', 'Confirm my subscription', 'wpforo'),
(38, 1, 'Could not be unsubscribe from this item', 'Could not be unsubscribe from this item', 'wpforo'),
(39, 1, 'Date', 'Date', 'wpforo'),
(40, 1, 'Delete', 'Delete', 'wpforo'),
(41, 1, 'Descending order', 'Descending order', 'wpforo'),
(42, 1, 'Display Name', 'Display Name', 'wpforo'),
(43, 1, 'Edit', 'Edit', 'wpforo'),
(44, 1, 'Edited: ', 'Edited: ', 'wpforo'),
(45, 1, 'Email', 'Email', 'wpforo'),
(46, 1, 'Email address exists. Please insert another.', 'Email address exists. Please insert another.', 'wpforo'),
(47, 1, 'Enter title here', 'Enter title here', 'wpforo'),
(48, 1, 'Error: Forum is not found', 'Error: Forum is not found', 'wpforo'),
(49, 1, 'Error: No topic selected', 'Error: No topic selected', 'wpforo'),
(50, 1, 'Error: Topic is not found', 'Error: Topic is not found', 'wpforo'),
(51, 1, 'Error: please insert some text to report.', 'Error: please insert some text to report.', 'wpforo'),
(52, 1, 'Facebook', 'Facebook', 'wpforo'),
(53, 1, 'Failed to write file to disk', 'Failed to write file to disk', 'wpforo'),
(54, 1, 'Features successfully updated', 'Features successfully updated', 'wpforo'),
(55, 1, 'Features successfully updated, but previous value not changed', 'Features successfully updated, but previous value not changed', 'wpforo'),
(56, 1, 'File type is not allowed', 'File type is not allowed', 'wpforo'),
(57, 1, 'File upload stopped by extension', 'File upload stopped by extension', 'wpforo'),
(58, 1, 'Find Posts by User', 'Find Posts by User', 'wpforo'),
(59, 1, 'Find Topics Started by User', 'Find Topics Started by User', 'wpforo'),
(60, 1, 'First post and replies', 'First post and replies', 'wpforo'),
(61, 1, 'Forum', 'Forum', 'wpforo'),
(62, 1, 'Forum - Login', 'Forum - Login', 'wpforo'),
(63, 1, 'Forum - Page Not Found', 'Forum - Page Not Found', 'wpforo'),
(64, 1, 'Forum - Registration', 'Forum - Registration', 'wpforo'),
(65, 1, 'Forum Base URL successfully updated', 'Forum Base URL successfully updated', 'wpforo'),
(66, 1, 'Forum Home', 'Forum Home', 'wpforo'),
(67, 1, 'Forum Members', 'Forum Members', 'wpforo'),
(68, 1, 'Forum Profile', 'Forum Profile', 'wpforo'),
(69, 1, 'Forum RSS Feed', 'Forum RSS Feed', 'wpforo'),
(70, 1, 'Forum Statistics', 'Forum Statistics', 'wpforo'),
(71, 1, 'Forum deleting error', 'Forum deleting error', 'wpforo'),
(72, 1, 'Forum hierarchy successfully updated', 'Forum hierarchy successfully updated', 'wpforo'),
(73, 1, 'Forum is empty', 'Forum is empty', 'wpforo'),
(74, 1, 'Forum is successfully merged', 'Forum is successfully merged', 'wpforo'),
(75, 1, 'Forum merging error', 'Forum merging error', 'wpforo'),
(76, 1, 'Forum options successfully updated', 'Forum options successfully updated', 'wpforo'),
(77, 1, 'Forum options successfully updated, but previous value not changed', 'Forum options successfully updated, but previous value not changed', 'wpforo'),
(78, 1, 'Forum successfully updated', 'Forum successfully updated', 'wpforo'),
(79, 1, 'Forum update error', 'Forum update error', 'wpforo'),
(80, 1, 'Forums', 'Forums', 'wpforo'),
(81, 1, 'General options successfully updated', 'General options successfully updated', 'wpforo'),
(82, 1, 'Group', 'Group', 'wpforo'),
(83, 1, 'Google+', 'Google+', 'wpforo'),
(84, 1, 'Guest', 'Guest', 'wpforo'),
(85, 1, 'ICQ', 'ICQ', 'wpforo'),
(86, 1, 'Illegal character in username.', 'Illegal character in username.', 'wpforo'),
(87, 1, 'Insert member name or email', 'Insert member name or email', 'wpforo'),
(88, 1, 'Insert your Email address.', 'Insert your Email address.', 'wpforo'),
(89, 1, 'Invalid Email address', 'Invalid Email address', 'wpforo'),
(90, 1, 'Invalid request!', 'Invalid request!', 'wpforo'),
(91, 1, 'Joined', 'Joined', 'wpforo'),
(92, 1, 'Last 24 hours', 'Last 24 hours', 'wpforo'),
(93, 1, 'Last 3 Months', 'Last 3 Months', 'wpforo'),
(94, 1, 'Last 6 Months', 'Last 6 Months', 'wpforo'),
(95, 1, 'Last Active', 'Last Active', 'wpforo'),
(96, 1, 'Last Month', 'Last Month', 'wpforo'),
(97, 1, 'Last Post', 'Last Post', 'wpforo'),
(98, 1, 'Last Post Info', 'Last Post Info', 'wpforo'),
(99, 1, 'Last Week', 'Last Week', 'wpforo'),
(100, 1, 'Last Year ago', 'Last Year ago', 'wpforo'),
(101, 1, 'Last post by %s', 'Last post by %s', 'wpforo'),
(102, 1, 'Latest Post', 'Latest Post', 'wpforo'),
(103, 1, 'Leave a reply', 'Leave a reply', 'wpforo'),
(104, 1, 'Length must be between 3 characters and 15 characters.', 'Length must be between 3 characters and 15 characters.', 'wpforo'),
(105, 1, 'Liked', 'Liked', 'wpforo'),
(106, 1, 'Location', 'Location', 'wpforo'),
(107, 1, 'Login', 'Login', 'wpforo'),
(108, 1, 'Logout', 'Logout', 'wpforo'),
(109, 1, 'Lost your password?', 'Lost your password?', 'wpforo'),
(110, 1, 'MSN', 'MSN', 'wpforo'),
(111, 1, 'Maximum allowed file size is', 'Maximum allowed file size is', 'wpforo'),
(112, 1, 'Member Activity', 'Member Activity', 'wpforo'),
(113, 1, 'Member Information', 'Member Information', 'wpforo'),
(114, 1, 'Member Rating', 'Member Rating', 'wpforo'),
(115, 1, 'Member Rating Badge', 'Member Rating Badge', 'wpforo'),
(116, 1, 'Member options successfully updated', 'Member options successfully updated', 'wpforo'),
(117, 1, 'Member options successfully updated, but previous value not changed', 'Member options successfully updated, but previous value not changed', 'wpforo'),
(118, 1, 'Members', 'Members', 'wpforo'),
(119, 1, 'Members not found', 'Members not found', 'wpforo'),
(120, 1, 'Message has been sent', 'Message has been sent', 'wpforo'),
(121, 1, 'Messages', 'Messages', 'wpforo'),
(122, 1, 'Missing a temporary folder', 'Missing a temporary folder', 'wpforo'),
(123, 1, 'Move', 'Move', 'wpforo'),
(124, 1, 'Move Topic', 'Move Topic', 'wpforo'),
(125, 1, 'Must be minimum 6 characters.', 'Must be minimum 6 characters.', 'wpforo'),
(126, 1, 'My Profile', 'My Profile', 'wpforo'),
(127, 1, 'New language successfully added and changed wpforo language to new language', 'New language successfully added and changed wpforo language to new language', 'wpforo'),
(128, 1, 'No Posts found for update', 'No Posts found for update', 'wpforo'),
(129, 1, 'No activity found for this member.', 'No activity found for this member.', 'wpforo'),
(130, 1, 'No file was uploaded', 'No file was uploaded', 'wpforo'),
(131, 1, 'No forums were found here.', 'No forums were found here.', 'wpforo'),
(132, 1, 'No online members at the moment', 'No online members at the moment', 'wpforo'),
(133, 1, 'No subscriptions found for this member.', 'No subscriptions found for this member.', 'wpforo'),
(134, 1, 'No topics were found here', 'No topics were found here', 'wpforo'),
(135, 1, 'Occupation', 'Occupation', 'wpforo'),
(136, 1, 'Offline', 'Offline', 'wpforo'),
(137, 1, 'Online', 'Online', 'wpforo'),
(138, 1, 'Oops! The page you requested was not found!', 'Oops! The page you requested was not found!', 'wpforo'),
(139, 1, 'Our newest member', 'Our newest member', 'wpforo'),
(140, 1, 'Page', 'Page', 'wpforo'),
(141, 1, 'Password', 'Password', 'wpforo'),
(142, 1, 'Password length must be between 6 characters and 20 characters.', 'Password length must be between 6 characters and 20 characters.', 'wpforo'),
(143, 1, 'Password mismatch.', 'Password mismatch.', 'wpforo'),
(144, 1, 'Permission denied', 'Permission denied', 'wpforo'),
(145, 1, 'Permission denied for add forum', 'Permission denied for add forum', 'wpforo'),
(146, 1, 'Permission denied for delete forum', 'Permission denied for delete forum', 'wpforo'),
(147, 1, 'Permission denied for edit forum', 'Permission denied for edit forum', 'wpforo'),
(148, 1, 'Permission denied for this action', 'Permission denied for this action', 'wpforo'),
(149, 1, 'Phrase add error', 'Phrase add error', 'wpforo'),
(150, 1, 'Phrase adding error', 'Phrase adding error', 'wpforo'),
(151, 1, 'Phrase successfully added', 'Phrase successfully added', 'wpforo'),
(152, 1, 'Phrase successfully updates', 'Phrase successfully updates', 'wpforo'),
(153, 1, 'Phrase update error', 'Phrase update error', 'wpforo'),
(154, 1, 'Please %s or %s', 'Please %s or %s', 'wpforo'),
(155, 1, 'Please insert required fields!', 'Please insert required fields!', 'wpforo'),
(156, 1, 'Post Title', 'Post Title', 'wpforo'),
(157, 1, 'Post delete error', 'Post delete error', 'wpforo'),
(158, 1, 'Post link', 'Post link', 'wpforo'),
(159, 1, 'Post options successfully updated', 'Post options successfully updated', 'wpforo'),
(160, 1, 'Post options successfully updated, but previous value not changed', 'Post options successfully updated, but previous value not changed', 'wpforo'),
(161, 1, 'Posted', 'Posted', 'wpforo'),
(162, 1, 'Posted by', 'Posted by', 'wpforo'),
(163, 1, 'Posts', 'Posts', 'wpforo'),
(164, 1, 'Powered by', 'Powered by', 'wpforo'),
(165, 1, 'Question Comments', 'Question Comments', 'wpforo'),
(166, 1, 'Questions', 'Questions', 'wpforo'),
(167, 1, 'Quote', 'Quote', 'wpforo'),
(168, 1, 'RE', 'RE', 'wpforo'),
(169, 1, 'REPLY:', 'REPLY:', 'wpforo'),
(170, 1, 'RSS', 'RSS', 'wpforo'),
(171, 1, 'Rating', 'Rating', 'wpforo'),
(172, 1, 'Rating Badge', 'Rating Badge', 'wpforo'),
(173, 1, 'Received Likes', 'Received Likes', 'wpforo'),
(174, 1, 'Recent Questions', 'Recent Questions', 'wpforo'),
(175, 1, 'Recent Topics', 'Recent Topics', 'wpforo'),
(176, 1, 'Register', 'Register', 'wpforo'),
(177, 1, 'Registered date', 'Registered date', 'wpforo'),
(178, 1, 'Registration Error', 'Registration Error', 'wpforo'),
(179, 1, 'Relevancy', 'Relevancy', 'wpforo'),
(180, 1, 'Remember Me', 'Remember Me', 'wpforo'),
(181, 1, 'Replies', 'Replies', 'wpforo'),
(182, 1, 'Replies not found', 'Replies not found', 'wpforo'),
(183, 1, 'Reply', 'Reply', 'wpforo'),
(184, 1, 'Reply request error', 'Reply request error', 'wpforo'),
(185, 1, 'Report', 'Report', 'wpforo'),
(186, 1, 'Report to Administration', 'Report to Administration', 'wpforo'),
(187, 1, 'Result Info', 'Result Info', 'wpforo'),
(188, 1, 'Save', 'Save', 'wpforo'),
(189, 1, 'Save Changes', 'Save Changes', 'wpforo'),
(190, 1, 'Search', 'Search', 'wpforo'),
(191, 1, 'Search Entire Posts', 'Search Entire Posts', 'wpforo'),
(192, 1, 'Search Phrase', 'Search Phrase', 'wpforo'),
(193, 1, 'Search Titles Only', 'Search Titles Only', 'wpforo'),
(194, 1, 'Search Type', 'Search Type', 'wpforo'),
(195, 1, 'Search in Forums', 'Search in Forums', 'wpforo'),
(196, 1, 'Search in date period', 'Search in date period', 'wpforo'),
(197, 1, 'Search result for', 'Search result for', 'wpforo'),
(198, 1, 'Search...', 'Search...', 'wpforo'),
(199, 1, 'Select Page', 'Select Page', 'wpforo'),
(200, 1, 'Send Report', 'Send Report', 'wpforo'),
(201, 1, 'Set Topic Sticky', 'Set Topic Sticky', 'wpforo'),
(202, 1, 'Shop Account', 'Shop Account', 'wpforo'),
(203, 1, 'Sign In', 'Sign In', 'wpforo'),
(204, 1, 'Signature', 'Signature', 'wpforo'),
(205, 1, 'Site Profile', 'Site Profile', 'wpforo'),
(206, 1, 'Skype', 'Skype', 'wpforo'),
(207, 1, 'Social Networks', 'Social Networks', 'wpforo'),
(208, 1, 'Something wrong with profile data.', 'Something wrong with profile data.', 'wpforo'),
(209, 1, 'Sorry, something wrong with your data.', 'Sorry, something wrong with your data.', 'wpforo'),
(210, 1, 'Sort Search Results by', 'Sort Search Results by', 'wpforo'),
(211, 1, 'Specify avatar by URL', 'Specify avatar by URL', 'wpforo'),
(212, 1, 'Subforums', 'Subforums', 'wpforo'),
(213, 1, 'Subscribe for new replies', 'Subscribe for new replies', 'wpforo'),
(214, 1, 'Subscribe for new topics', 'Subscribe for new topics', 'wpforo'),
(215, 1, 'Subscribe options successfully updated', 'Subscribe options successfully updated', 'wpforo'),
(216, 1, 'Subscribe options successfully updated, but previous value not changed', 'Subscribe options successfully updated, but previous value not changed', 'wpforo'),
(217, 1, 'Subscriptions', 'Subscriptions', 'wpforo'),
(218, 1, 'Success!', 'Success!', 'wpforo'),
(219, 1, 'Success! Thank you. Please check your email and click confirmation link below to complete this step.', 'Success! Thank you. Please check your email and click confirmation link below to complete this step.', 'wpforo'),
(220, 1, 'Successfully updated', 'Successfully updated', 'wpforo'),
(221, 1, 'Successfully voted', 'Successfully voted', 'wpforo'),
(222, 1, 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form', 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form', 'wpforo'),
(223, 1, 'The uploaded file exceeds the upload_max_filesize directive in php.ini', 'The uploaded file exceeds the upload_max_filesize directive in php.ini', 'wpforo'),
(224, 1, 'The uploaded file size is too big', 'The uploaded file size is too big', 'wpforo'),
(225, 1, 'The uploaded file was only partially uploaded', 'The uploaded file was only partially uploaded', 'wpforo'),
(226, 1, 'Theme options successfully updated', 'Theme options successfully updated', 'wpforo'),
(227, 1, 'This email address is already registered. Please insert another.', 'This email address is already registered. Please insert another.', 'wpforo'),
(228, 1, 'This post successfully deleted', 'This post successfully deleted', 'wpforo'),
(229, 1, 'This post successfully edited', 'This post successfully edited', 'wpforo'),
(230, 1, 'This topic successfully deleted', 'This topic successfully deleted', 'wpforo'),
(231, 1, 'Timezone', 'Timezone', 'wpforo'),
(232, 1, 'Title', 'Title', 'wpforo'),
(233, 1, 'Topic Move Error', 'Topic Move Error', 'wpforo'),
(234, 1, 'Topic RSS Feed', 'Topic RSS Feed', 'wpforo'),
(235, 1, 'Topic Title', 'Topic Title', 'wpforo'),
(236, 1, 'Topic add error', 'Topic add error', 'wpforo'),
(237, 1, 'Topic delete error', 'Topic delete error', 'wpforo'),
(238, 1, 'Topic edit error', 'Topic edit error', 'wpforo'),
(239, 1, 'Topic not found.', 'Topic not found.', 'wpforo'),
(240, 1, 'Topic successfully moved', 'Topic successfully moved', 'wpforo'),
(241, 1, 'Topic successfully updated', 'Topic successfully updated', 'wpforo'),
(242, 1, 'Topics', 'Topics', 'wpforo'),
(243, 1, 'Topics delete error', 'Topics delete error', 'wpforo'),
(244, 1, 'Twitter', 'Twitter', 'wpforo'),
(245, 1, 'Unknown upload error', 'Unknown upload error', 'wpforo'),
(246, 1, 'Unsubscribe', 'Unsubscribe', 'wpforo'),
(247, 1, 'Upload an avatar', 'Upload an avatar', 'wpforo'),
(248, 1, 'Use comments to ask for more information or suggest improvements. Avoid answering questions in comments.', 'Use comments to ask for more information or suggest improvements. Avoid answering questions in comments.', 'wpforo'),
(249, 1, 'User', 'User', 'wpforo'),
(250, 1, 'User Group', 'User Group', 'wpforo'),
(251, 1, 'User delete error', 'User delete error', 'wpforo'),
(252, 1, 'User group add error', 'User group add error', 'wpforo'),
(253, 1, 'User group edit error', 'User group edit error', 'wpforo'),
(254, 1, 'User group successfully added', 'User group successfully added', 'wpforo'),
(255, 1, 'User group successfully edited', 'User group successfully edited', 'wpforo'),
(256, 1, 'User successfully deleted from wpforo', 'User successfully deleted from wpforo', 'wpforo'),
(257, 1, 'Usergroup has been successfully deleted.', 'Usergroup has been successfully deleted.', 'wpforo'),
(258, 1, 'Usergroup has been successfully deleted. All users of this usergroup have been moved to the usergroup you\'ve chosen', 'Usergroup has been successfully deleted. All users of this usergroup have been moved to the usergroup you\'ve chosen', 'wpforo'),
(259, 1, 'Username', 'Username', 'wpforo'),
(260, 1, 'Username exists. Please insert another.', 'Username exists. Please insert another.', 'wpforo'),
(261, 1, 'Username is missed.', 'Username is missed.', 'wpforo'),
(262, 1, 'Username length must be between 3 characters and 15 characters.', 'Username length must be between 3 characters and 15 characters.', 'wpforo'),
(263, 1, 'View entire post', 'View entire post', 'wpforo'),
(264, 1, 'View the latest post', 'View the latest post', 'wpforo'),
(265, 1, 'Views', 'Views', 'wpforo'),
(266, 1, 'Votes', 'Votes', 'wpforo'),
(267, 1, 'Website', 'Website', 'wpforo'),
(268, 1, 'Welcome to our Community!', 'Welcome to our Community!', 'wpforo'),
(269, 1, 'Wordpress avatar system', 'Wordpress avatar system', 'wpforo'),
(270, 1, 'Working', 'Working', 'wpforo'),
(271, 1, 'Write message', 'Write message', 'wpforo'),
(272, 1, 'Wrong post data', 'Wrong post data', 'wpforo'),
(273, 1, 'Yahoo', 'Yahoo', 'wpforo'),
(274, 1, 'You', 'You', 'wpforo'),
(275, 1, 'You are already voted this post', 'You are already voted this post', 'wpforo'),
(276, 1, 'You can go to %s page or Search here', 'You can go to %s page or Search here', 'wpforo'),
(277, 1, 'You have been successfully subscribed', 'You have been successfully subscribed', 'wpforo'),
(278, 1, 'You have been successfully unsubscribed', 'You have been successfully unsubscribed', 'wpforo'),
(279, 1, 'You have no permission to edit this topic', 'You have no permission to edit this topic', 'wpforo'),
(280, 1, 'You don\'t have permission to create post in this forum', 'You don\'t have permission to create post in this forum', 'wpforo'),
(281, 1, 'You don\'t have permission to create topic into this forum', 'You don\'t have permission to create topic into this forum', 'wpforo'),
(282, 1, 'You don\'t have permission to delete post from this forum', 'You don\'t have permission to delete post from this forum', 'wpforo'),
(283, 1, 'You don\'t have permission to delete topic from this forum', 'You don\'t have permission to delete topic from this forum', 'wpforo'),
(284, 1, 'You don\'t have permission to edit post from this forum', 'You don\'t have permission to edit post from this forum', 'wpforo'),
(285, 1, 'You successfully replied', 'You successfully replied', 'wpforo'),
(286, 1, 'Your Answer', 'Your Answer', 'wpforo'),
(287, 1, 'Your forum successfully added', 'Your forum successfully added', 'wpforo'),
(288, 1, 'Your forum successfully deleted', 'Your forum successfully deleted', 'wpforo'),
(289, 1, 'Your profile data have been successfully updated.', 'Your profile data have been successfully updated.', 'wpforo'),
(290, 1, 'Your subscription for this item could not be confirmed', 'Your subscription for this item could not be confirmed', 'wpforo'),
(291, 1, 'Your topic successfully added', 'Your topic successfully added', 'wpforo'),
(292, 1, 'add', 'add', 'wpforo'),
(293, 1, 'add_new', 'add_new', 'wpforo'),
(294, 1, '%s ago', '%s ago', 'wpforo'),
(295, 1, 'by', 'by', 'wpforo'),
(296, 1, 'by %s', 'by %s', 'wpforo'),
(297, 1, 'confirm password', 'confirm password', 'wpforo'),
(298, 1, 'edit profile', 'edit profile', 'wpforo'),
(299, 1, 'edit user', 'edit user', 'wpforo'),
(300, 1, 'matches', 'matches', 'wpforo'),
(301, 1, 'new password', 'new password', 'wpforo'),
(302, 1, 'new password again', 'new password again', 'wpforo'),
(303, 1, 'next', 'next', 'wpforo'),
(304, 1, 'old password', 'old password', 'wpforo'),
(305, 1, 'phrase_key', 'phrase_key', 'wpforo'),
(306, 1, 'phrase_value', 'phrase_value', 'wpforo'),
(307, 1, 'prev', 'prev', 'wpforo'),
(308, 1, 'update', 'update', 'wpforo'),
(309, 1, 'view', 'view', 'wpforo'),
(310, 1, 'view all posts', 'view all posts', 'wpforo'),
(311, 1, 'view all questions', 'view all questions', 'wpforo'),
(312, 1, 'view all topics', 'view all topics', 'wpforo'),
(313, 1, 'wpForo Navigation', 'wpForo Navigation', 'wpforo'),
(314, 1, '{number}B', '{number}B', 'wpforo'),
(315, 1, '{number}K', '{number}K', 'wpforo'),
(316, 1, '{number}M', '{number}M', 'wpforo'),
(317, 1, '{number}T', '{number}T', 'wpforo'),
(318, 1, 'like', 'Like', 'wpforo'),
(319, 1, 'unlike', 'Unlike', 'wpforo'),
(320, 1, 'sticky', 'Sticky', 'wpforo'),
(321, 1, 'unsticky', 'Unsticky', 'wpforo'),
(322, 1, 'close', 'Close', 'wpforo'),
(323, 1, 'open', 'Open', 'wpforo'),
(324, 1, 'Topic Icons', 'Topic Icons', 'wpforo'),
(325, 1, 'Replied', 'Replied', 'wpforo'),
(326, 1, 'Active', 'Active', 'wpforo'),
(327, 1, 'Hot', 'Hot', 'wpforo'),
(328, 1, 'Solved', 'Solved', 'wpforo'),
(329, 1, 'Unsolved', 'Unsolved', 'wpforo'),
(330, 1, 'Closed', 'Closed', 'wpforo'),
(331, 1, 'Old password is wrong', 'Old password is wrong', 'wpforo'),
(332, 1, 'New Passwords do not match', 'New Passwords do not match', 'wpforo'),
(333, 1, 'Forum Members List', 'Forum Members List', 'wpforo'),
(334, 1, 'are you sure you want to delete?', 'are you sure you want to delete?', 'wpforo'),
(335, 1, 'Admin', 'Admin', 'wpforo'),
(336, 1, 'Moderator', 'Moderator', 'wpforo'),
(337, 1, 'Registered', 'Registered', 'wpforo'),
(338, 1, 'Customer', 'Customer', 'wpforo'),
(339, 1, 'Profile', 'Profile', 'wpforo'),
(340, 1, 'Incorrect file format. Allowed formats: jpeg, jpg, png, gif.', 'Incorrect file format. Allowed formats: jpeg, jpg, png, gif.', 'wpforo'),
(341, 1, 'User registration is disabled', 'User registration is disabled', 'wpforo'),
(342, 1, 'Attachment removed', 'Attachment removed', 'wpforo'),
(343, 1, 'Forum Posts', 'Forum Posts', 'wpforo'),
(344, 1, 'Blog Posts', 'Blog Posts', 'wpforo'),
(345, 1, 'Blog Comments', 'Blog Comments', 'wpforo'),
(346, 1, 'Welcome back %s!', 'Welcome back %s!', 'wpforo'),
(347, 1, 'Member Profile', 'Member Profile', 'wpforo'),
(348, 1, 'Member', 'Member', 'wpforo'),
(349, 1, 'private', 'Private', 'wpforo'),
(350, 1, 'public', 'Public', 'wpforo'),
(351, 1, 'Private Topic', 'Private Topic', 'wpforo'),
(352, 1, 'Only Admins and Moderators can see your private topics.', 'Only Admins and Moderators can see your private topics.', 'wpforo'),
(353, 1, 'Forum ID is not detected', 'Forum ID is not detected', 'wpforo'),
(354, 1, 'You are not permitted to subscribe here', 'You are not permitted to subscribe here', 'wpforo'),
(355, 1, 'Subscribe to this topic', 'Subscribe to this topic', 'wpforo'),
(356, 1, 'Awaiting moderation', 'Awaiting moderation', 'wpforo'),
(357, 1, 'Topic first post not found.', 'Topic first post not found.', 'wpforo'),
(358, 1, 'Topic first post data not found.', 'Topic first post data not found.', 'wpforo'),
(359, 1, 'Done!', 'Done!', 'wpforo'),
(360, 1, 'unapproved', 'unapproved', 'wpforo'),
(361, 1, 'You are not allowed to attach this file type', 'You are not allowed to attach this file type', 'wpforo'),
(362, 1, 'Post is empty', 'Post is empty', 'wpforo'),
(363, 1, 'removed link', 'removed link', 'wpforo'),
(364, 1, 'Submit', 'Submit', 'wpforo'),
(365, 1, 'Usergroup', 'Usergroup', 'wpforo'),
(366, 1, 'Rating Title', 'Rating Title', 'wpforo'),
(367, 1, 'User Title', 'User Title', 'wpforo'),
(368, 1, 'approved', 'Approved', 'wpforo'),
(369, 1, 'approve', 'Approve', 'wpforo'),
(370, 1, 'unapprove', 'unapprove', 'wpforo'),
(371, 1, '--- Choose ---', '--- Choose ---', 'wpforo'),
(372, 1, 'New', 'New', 'wpforo'),
(373, 1, 'Required field', 'Required field', 'wpforo'),
(374, 1, 'Add Reply', 'Add Reply', 'wpforo'),
(375, 1, 'Forums RSS Feed', 'Forums RSS Feed', 'wpforo'),
(376, 1, 'Topics RSS Feed', 'Topics RSS Feed', 'wpforo'),
(377, 1, 'Find a member', 'Find a member', 'wpforo'),
(378, 1, 'Display Name or Nicename', 'Display Name or Nicename', 'wpforo'),
(379, 1, 'Reset Search', 'Reset Search', 'wpforo'),
(380, 1, 'Reset Result', 'Reset Result', 'wpforo'),
(381, 1, 'Recently Added', 'Recent Posts', 'wpforo'),
(382, 1, 'Recent Posts', 'Recent Posts', 'wpforo'),
(383, 1, 'No posts were found here', 'No posts were found here', 'wpforo'),
(384, 1, 'forum link', 'forum link', 'wpforo'),
(385, 1, 'in forum', 'in forum', 'wpforo'),
(386, 1, 'After registration you will receive an email confirmation with a link to set a new password', 'After registration you will receive an email confirmation with a link to set a new password', 'wpforo'),
(387, 1, 'You can mention a person using @nicename in post content to send that person an email message. When you post a topic or reply, forum sends an email message to the user letting them know that they have been mentioned on the post.', 'You can mention a person using @nicename in post content to send that person an email message. When you post a topic or reply, forum sends an email message to the user letting them know that they have been mentioned on the post.', 'wpforo'),
(388, 1, 'View entire topic', 'View entire topic', 'wpforo'),
(389, 1, 'Author Name', 'Author Name', 'wpforo'),
(390, 1, 'Your name', 'Your name', 'wpforo'),
(391, 1, 'Author Email', 'Author Email', 'wpforo'),
(392, 1, 'Your email', 'Your email', 'wpforo'),
(393, 1, 'Your topic successfully added and awaiting moderation', 'Your topic successfully added and awaiting moderation', 'wpforo'),
(394, 1, 'You are not allowed to edit this post', 'You are not allowed to edit this post', 'wpforo'),
(395, 1, 'Google reCAPTCHA verification failed', 'Google reCAPTCHA verification failed', 'wpforo'),
(396, 1, 'ERROR: Can\'t connect to Google reCAPTCHA API', 'ERROR: Can\'t connect to Google reCAPTCHA API', 'wpforo'),
(397, 1, 'Welcome!', 'Welcome!', 'wpforo'),
(398, 1, 'Join us today!', 'Join us today!', 'wpforo'),
(399, 1, 'Enter your email address or username and we\'ll send you a link you can use to pick a new password.', 'Enter your email address or username and we\'ll send you a link you can use to pick a new password.', 'wpforo'),
(400, 1, 'Please Insert Your Email or Username', 'Please Insert Your Email or Username', 'wpforo'),
(401, 1, 'Reset Password', 'Reset Password', 'wpforo'),
(402, 1, 'Forgot Your Password?', 'Forgot Your Password?', 'wpforo'),
(403, 1, '%s created a new topic %s', '%s created a new topic %s', 'wpforo'),
(404, 1, '%s replied to the topic %s', '%s replied to the topic %s', 'wpforo'),
(405, 1, '%s liked forum post %s', '%s liked forum post %s', 'wpforo'),
(406, 1, 'Read more', 'Read more', 'wpforo'),
(407, 1, 'Forum topic', 'Forum topic', 'wpforo'),
(408, 1, 'Forum post', 'Forum post', 'wpforo'),
(409, 1, 'Forum post like', 'Forum post like', 'wpforo'),
(410, 1, 'Tools', 'Tools', 'wpforo'),
(411, 1, 'Target Topic URL', 'Target Topic URL', 'wpforo'),
(412, 1, 'Target Topic not found', 'Target Topic not found', 'wpforo'),
(413, 1, 'Merge Topics', 'Merge Topics', 'wpforo'),
(414, 1, 'Split Topic', 'Split Topic', 'wpforo'),
(415, 1, 'Please copy the target topic URL from browser address bar and paste in the field below.', 'Please copy the target topic URL from browser address bar and paste in the field below.', 'wpforo'),
(416, 1, 'All posts will be merged and displayed (ordered) in target topic according to posts dates. If you want to append merged posts to the end of the target topic you should allow to update posts dates to current date by check the option below.', 'All posts will be merged and displayed (ordered) in target topic according to posts dates. If you want to append merged posts to the end of the target topic you should allow to update posts dates to current date by check the option below.', 'wpforo'),
(417, 1, 'Update post dates (current date) to allow append posts to the end of the target topic.', 'Update post dates (current date) to allow append posts to the end of the target topic.', 'wpforo'),
(418, 1, 'Update post titles with target topic title.', 'Update post titles with target topic title.', 'wpforo'),
(419, 1, 'Topics once merged cannot be unmerged. This topic URL will no longer be available.', 'Topics once merged cannot be unmerged. This topic URL will no longer be available.', 'wpforo'),
(420, 1, 'Create New Topic', 'Create New Topic', 'wpforo'),
(421, 1, 'Create new topic with split posts. The first post of new topic becomes the earliest reply.', 'Create new topic with split posts. The first post of new topic becomes the earliest reply.', 'wpforo'),
(422, 1, 'New Topic Title', 'New Topic Title', 'wpforo'),
(423, 1, 'New Topic Forum', 'New Topic Forum', 'wpforo'),
(424, 1, 'Select Posts to Split', 'Select Posts to Split', 'wpforo'),
(425, 1, 'Topic once split cannot be unsplit. The first post of new topic becomes the earliest reply.', 'Topic once split cannot be unsplit. The first post of new topic becomes the earliest reply.', 'wpforo'),
(426, 1, 'Merge', 'Merge', 'wpforo'),
(427, 1, 'Split', 'Split', 'wpforo'),
(428, 1, 'Move Reply', 'Move Reply', 'wpforo'),
(429, 1, 'This action changes topic URL. Once the topic is moved to other forum the old URL of this topic will no longer be available.', 'This action changes topic URL. Once the topic is moved to other forum the old URL of this topic will no longer be available.', 'wpforo'),
(430, 1, 'The time to edit this topic is expired', 'The time to edit this topic is expired', 'wpforo'),
(431, 1, 'The time to delete this topic is expired.', 'The time to delete this topic is expired. Please contact to forum administrator to delete it.', 'wpforo'),
(432, 1, 'The time to edit this post is expired.', 'The time to edit this post is expired.', 'wpforo'),
(433, 1, 'The time to delete this post is expired.', 'The time to delete this post is expired.', 'wpforo'),
(434, 1, 'Please contact to forum administrator to delete it.', 'Please contact to forum administrator to delete it.', 'wpforo'),
(435, 1, 'Please contact to forum administrator to edit it.', 'Please contact to forum administrator to edit it.', 'wpforo'),
(436, 1, 'Read more about Facebook public_profile properties.', 'Read more about Facebook public_profile properties.', 'wpforo'),
(437, 1, 'forum privacy policy', 'forum privacy policy', 'wpforo'),
(438, 1, 'I have read and agree to the %s.', 'I have read and agree to the %s.', 'wpforo'),
(439, 1, 'Click to open forum privacy policy below', 'Click to open forum privacy policy below', 'wpforo'),
(440, 1, 'I agree', 'I agree', 'wpforo'),
(441, 1, 'I do not agree. Take me away from here.', 'I do not agree. Take me away from here.', 'wpforo'),
(442, 1, 'forum rules', 'forum rules', 'wpforo'),
(443, 1, 'I have read and agree to abide by the %s.', 'I have read and agree to abide by the %s.', 'wpforo'),
(444, 1, 'Click to open forum rules below', 'Click to open forum rules below', 'wpforo'),
(445, 1, 'I agree to these rules', 'I agree to these rules', 'wpforo'),
(446, 1, 'I do not agree to these rules. Take me away from here.', 'I do not agree to these rules. Take me away from here.', 'wpforo'),
(447, 1, 'the website', 'the website', 'wpforo'),
(448, 1, 'I have read and agree to the', 'I have read and agree to the', 'wpforo'),
(449, 1, 'I have read and agree to %s privacy policy. For more information, please check our privacy policy, where you\'ll get more info on where, how and why we store your data.', 'I have read and agree to %s privacy policy. For more information, please check our privacy policy, where you\'ll get more info on where, how and why we store your data.', 'wpforo'),
(450, 1, 'Terms', 'Terms', 'wpforo'),
(451, 1, 'Privacy Policy', 'Privacy Policy', 'wpforo'),
(452, 1, 'and', 'and', 'wpforo'),
(453, 1, 'I agree to receive an email confirmation with a link to set a password.', 'I agree to receive an email confirmation with a link to set a password.', 'wpforo'),
(454, 1, 'Contact Us', 'Contact Us', 'wpforo'),
(455, 1, 'Contact the forum administrator', 'Contact the forum administrator', 'wpforo'),
(456, 1, 'Share:', 'Share:', 'wpforo'),
(457, 1, 'Share', 'Share', 'wpforo'),
(458, 1, 'Share this post', 'Share this post', 'wpforo'),
(459, 1, 'When you login first time using Facebook Login button, we collect your account %s information shared by Facebook, based on your privacy settings. We also get your email address to automatically create a forum account for you. Once your account is created, you\'ll be logged-in to this account and you\'ll receive a confirmation email.', 'When you login first time using Facebook Login button, we collect your account %s information shared by Facebook, based on your privacy settings. We also get your email address to automatically create a forum account for you. Once your account is created, you\'ll be logged-in to this account and you\'ll receive a confirmation email.', 'wpforo'),
(460, 1, 'I allow to create an account based on my Facebook public profile information and send confirmation email.', 'I allow to create an account based on my Facebook public profile information and send confirmation email.', 'wpforo'),
(461, 1, 'Facebook Login Information', 'Facebook Login Information', 'wpforo'),
(462, 1, 'Share to Facebook', 'Share to Facebook', 'wpforo'),
(463, 1, 'Tweet this post', 'Tweet this post', 'wpforo'),
(464, 1, 'Tweet', 'Tweet', 'wpforo'),
(465, 1, 'Share to Google+', 'Share to Google+', 'wpforo'),
(466, 1, 'Share to VK', 'Share to VK', 'wpforo'),
(467, 1, 'Share to OK', 'Share to OK', 'wpforo'),
(468, 1, 'Update Subscriptions', 'Update Subscriptions', 'wpforo'),
(469, 1, 'Subscribe to all new topics and posts', 'Subscribe to all new topics and posts', 'wpforo'),
(470, 1, 'Subscribe to all new topics', 'Subscribe to all new topics', 'wpforo'),
(471, 1, 'Subscription Manager', 'Subscription Manager', 'wpforo'),
(472, 1, 'topics and posts', 'topics and posts', 'wpforo'),
(473, 1, 'No data submitted', 'No data submitted', 'wpforo'),
(474, 1, 'User profile fields not found', 'User profile fields not found', 'wpforo'),
(475, 1, 'field is required', 'field is required', 'wpforo'),
(476, 1, 'field value must be at least %d', 'field value must be at least %d', 'wpforo'),
(477, 1, 'field value cannot be greater than %d', 'field value cannot be greater than %d', 'wpforo'),
(478, 1, 'field length must be at least %d characters', 'field length must be at least %d characters', 'wpforo'),
(479, 1, 'field length cannot be greater than %d characters', 'field length can not be greater than %d characters', 'wpforo'),
(480, 1, 'field value is not a valid URL', 'field value is not a valid URL', 'wpforo'),
(481, 1, 'file type is not detected', 'file type is not detected', 'wpforo'),
(482, 1, 'file type %s is not allowed', 'file type %s is not allowed', 'wpforo'),
(483, 1, 'file is too large', 'file is too large', 'wpforo'),
(484, 1, 'Success! Please check your mail for confirmation.', 'Success! Please check your mail for confirmation.', 'wpforo'),
(485, 1, 'Username length must be between %d characters and %d characters.', 'Username length must be between %d characters and %d characters.', 'wpforo'),
(486, 1, 'User registration is disabled.', 'User registration is disabled.', 'wpforo'),
(487, 1, 'Avatar image is too big maximum allowed size is 2MB', 'Avatar image is too big maximum allowed size is 2MB', 'wpforo'),
(488, 1, 'One of the selected Usergroups cannot be set as Secondary', 'One of the selected Usergroups cannot be set as Secondary', 'wpforo'),
(489, 1, 'The selected Usergroup is not found in allowed list', 'The selected Usergroup is not found in allowed list', 'wpforo'),
(490, 1, 'The selected Usergroup cannot be set', 'The selected Usergroup cannot be set', 'wpforo'),
(491, 1, 'Admin and Moderator Usergroups are not permitted', 'Admin and Moderator Usergroups are not permitted', 'wpforo'),
(492, 1, 'You have no permission to edit Usergroup field', 'You have no permission to edit Usergroup field', 'wpforo'),
(493, 1, 'This nickname is already in use. Please insert another.', 'This nickname is already in use. Please insert another.', 'wpforo'),
(494, 1, 'Nickname validation failed', 'Nickname validation failed', 'wpforo'),
(495, 1, 'Numerical nicknames are not allowed. Please insert another.', 'Numerical nicknames are not allowed. Please insert another.', 'wpforo'),
(496, 1, 'Maximum allowed file size is %s MB', 'Maximum allowed file size is %s MB', 'wpforo'),
(497, 1, 'This email address is already registered. Please insert another', 'This email address is already registered. Please insert another', 'wpforo'),
(498, 1, 'Allowed file types: %s', 'Allowed file types: %s', 'wpforo'),
(499, 1, 'Form name not found', 'Form name not found', 'wpforo'),
(500, 1, 'Form template not found', 'Form template not found', 'wpforo'),
(501, 1, 'Profile updated successfully', 'Profile updated successfully', 'wpforo'),
(502, 1, 'User data update failed', 'User data update failed', 'wpforo'),
(503, 1, 'User profile update failed', 'User profile update failed', 'wpforo'),
(504, 1, 'User custom field update failed', 'User custom field update failed', 'wpforo'),
(505, 1, 'Sorry, there was an error uploading attached file', 'Sorry, there was an error uploading attached file', 'wpforo'),
(506, 1, 'Edit Topic', 'Edit Topic', 'wpforo'),
(507, 1, 'This topic was modified %s by %s', 'This topic was modified %s by %s', 'wpforo'),
(508, 1, 'Edit Post', 'Edit Post', 'wpforo'),
(509, 1, 'This post was modified %s by %s', 'This post was modified %s by %s', 'wpforo'),
(510, 1, 'Topics Started', 'Topics Started', 'wpforo'),
(511, 1, 'Replies Created', 'Replies Created', 'wpforo'),
(512, 1, 'Liked Posts', 'Liked Posts', 'wpforo'),
(513, 1, 'Topic link', 'Topic link', 'wpforo'),
(514, 1, 'Forum Topics Started', 'Forum Topics Started', 'wpforo'),
(515, 1, 'Forum Replies Created', 'Forum Replies Created', 'wpforo'),
(516, 1, 'Liked Forum Posts', 'Liked Forum Posts', 'wpforo'),
(517, 1, 'Forum Subscriptions', 'Forum Subscriptions', 'wpforo'),
(518, 1, 'Start typing tags here (maximum %d tags are allowed)...', 'Start typing tags here (maximum %d tags are allowed)...', 'wpforo'),
(519, 1, 'Topic Tag', 'Topic Tag', 'wpforo'),
(520, 1, 'Topic Tags', 'Topic Tags', 'wpforo'),
(521, 1, 'Separate tags using a comma', 'Separate tags using a comma', 'wpforo'),
(522, 1, 'Tags', 'Tags', 'wpforo'),
(523, 1, 'Find Topics by Tags', 'Find Topics by Tags', 'wpforo'),
(524, 1, 'Related Topics', 'Related Topics', 'wpforo'),
(525, 1, 'Next Topic', 'Next Topic', 'wpforo'),
(526, 1, 'Previous Topic', 'Previous Topic', 'wpforo'),
(527, 1, 'All forum topics', 'All forum topics', 'wpforo'),
(528, 1, 'No tags found', 'No tags found', 'wpforo'),
(529, 1, 'Forum contains no unread posts', 'Forum contains no unread posts', 'wpforo'),
(530, 1, 'Forum contains unread posts', 'Forum contains unread posts', 'wpforo'),
(531, 1, 'Mark all read', 'Mark all read', 'wpforo'),
(532, 1, 'Not Replied', 'Not Replied', 'wpforo'),
(533, 1, 'Tags are disabled', 'Tags are disabled', 'wpforo'),
(534, 1, 'Unread Posts', 'Unread Posts', 'wpforo'),
(535, 1, 'No unread posts were found', 'No unread posts were found', 'wpforo'),
(536, 1, 'Ask a question', 'Ask a question', 'wpforo'),
(537, 1, 'Your question', 'Your question', 'wpforo'),
(538, 1, 'Question Tags', 'Question Tags', 'wpforo'),
(539, 1, 'This topic doesn\'t exist or you don\'t have permissions to see that.', 'This topic doesn\'t exist or you don\'t have permissions to see that.', 'wpforo'),
(540, 1, '%d user ( %s )', '%d user ( %s )', 'wpforo'),
(541, 1, '%d users ( %s )', '%d users ( %s )', 'wpforo'),
(542, 1, 'Recently viewed by users: %s.', 'Recently viewed by users: %s.', 'wpforo'),
(543, 1, '%s guest', '%s guest', 'wpforo'),
(544, 1, '%s guests', '%s guests', 'wpforo'),
(545, 1, '%d times', '%d times', 'wpforo'),
(546, 1, 'Currently viewing this topic %s %s %s.', 'Currently viewing this topic %s %s %s.', 'wpforo'),
(547, 1, 'Forum Icons', 'Forum Icons', 'wpforo'),
(548, 1, '(%d viewing)', '(%d viewing)', 'wpforo'),
(549, 1, 'View all tags (%d)', 'View all tags (%d)', 'wpforo'),
(550, 1, 'Topic reply', 'Topic reply', 'wpforo'),
(551, 1, 'You have %d new replies', 'You have %d new replies', 'wpforo'),
(552, 1, 'You have %d new reply to %2$s from %3$s', 'You have %d new reply to %2$s from %3$s', 'wpforo'),
(553, 1, 'You have %d new reply to %s', 'You have %d new reply to %s', 'wpforo'),
(554, 1, 'Are you sure you wanted to do that?', 'Are you sure you wanted to do that?', 'wpforo'),
(555, 1, 'You do not have permission to mark notifications for that user.', 'You do not have permission to mark notifications for that user.', 'wpforo'),
(556, 1, 'Tools: Move, Split, Merge', 'Tools: Move, Split, Merge', 'wpforo'),
(557, 1, 'Hide Replies', 'Hide replies', 'wpforo'),
(558, 1, 'Show Replies', 'Show replies', 'wpforo'),
(559, 1, 'No threads found', 'No threads found', 'wpforo'),
(560, 1, 'Most Voted', 'Most Voted', 'wpforo'),
(561, 1, 'Most Commented', 'Most Commented', 'wpforo'),
(562, 1, 'Newest', 'Newest', 'wpforo'),
(563, 1, 'Oldest', 'Oldest', 'wpforo'),
(564, 1, '%d Answers', '%d Answers', 'wpforo'),
(565, 1, '%d Answer', '%d Answer', 'wpforo'),
(566, 1, 'Reply with quote', 'Reply with quote', 'wpforo'),
(567, 1, 'Leave a comment', 'Leave a comment', 'wpforo'),
(568, 1, 'I allow to create an account and send confirmation email.', 'I allow to create an account and send confirmation email.', 'wpforo'),
(569, 1, 'Google reCAPTCHA data are not submitted', 'Google reCAPTCHA data are not submitted', 'wpforo'),
(570, 1, 'Delete this file', 'Delete this file', 'wpforo'),
(571, 1, 'Are you sure you want to delete this file?', 'Are you sure you want to delete this file?', 'wpforo'),
(572, 1, 'Specify avatar by URL:', 'Specify avatar by URL:', 'wpforo'),
(573, 1, 'ERROR: invalid_username. Sorry, that username is not allowed. Please insert another.', 'ERROR: invalid_username. Sorry, that username is not allowed. Please insert another.', 'wpforo'),
(574, 1, 'Password length must be between %d characters and %d characters.', 'Password length must be between %d characters and %d characters.', 'wpforo'),
(575, 1, 'This nickname is already registered. Please insert another.', 'This nickname is already registered. Please insert another.', 'wpforo'),
(576, 1, 'Avatar image is too big maximum allowed size is %s', 'Avatar image is too big maximum allowed size is %s', 'wpforo'),
(577, 1, 'Userid is wrong', 'Userid is wrong', 'wpforo'),
(578, 1, 'Password successfully changed', 'Password successfully changed', 'wpforo'),
(579, 1, 'User successfully banned from wpforo', 'User successfully banned from wpforo', 'wpforo'),
(580, 1, 'User ban action error', 'User ban action error', 'wpforo'),
(581, 1, 'User successfully unbanned from wpforo', 'User successfully unbanned from wpforo', 'wpforo'),
(582, 1, 'User unban action error', 'User unban action error', 'wpforo'),
(583, 1, 'Anonymous', 'Anonymous', 'wpforo'),
(584, 1, 'Nickname', 'Nickname', 'wpforo'),
(585, 1, 'URL Address Identifier', 'URL Address Identifier', 'wpforo'),
(586, 1, 'User Groups Secondary', 'User Groups Secondary', 'wpforo'),
(587, 1, 'Email has been confirmed', 'Email has been confirmed', 'wpforo'),
(588, 1, 'Email confirm error', 'Email confirm error', 'wpforo'),
(589, 1, 'You are posting too quickly. Slow down.', 'You are posting too quickly. Slow down.', 'wpforo'),
(590, 1, 'Function wpforo_thread_reply() not found.', 'Function wpforo_thread_reply() not found.', 'wpforo'),
(591, 1, 'error: Change Status action', 'error: Change Status action', 'wpforo'),
(592, 1, 'Select Forum', 'Select Forum', 'wpforo'),
(593, 1, 'Write here . . .', 'Write here . . .', 'wpforo'),
(594, 1, 'Cancel', 'Cancel', 'wpforo'),
(595, 1, 'You do not have permission to view this page', 'You do not have permission to view this page', 'wpforo'),
(596, 1, 'Data merging error', 'Data merging error', 'wpforo'),
(597, 1, 'Please select a target forum', 'Please select a target forum', 'wpforo'),
(598, 1, 'Please insert required fields', 'Please insert required fields', 'wpforo'),
(599, 1, 'Please select at least one post to split', 'Please select at least one post to split', 'wpforo'),
(600, 1, 'Topic splitting error', 'Topic splitting error', 'wpforo'),
(601, 1, 'Status changing error', 'Status changing error', 'wpforo'),
(602, 1, 'Repeat new password', 'Repeat new password', 'wpforo'),
(603, 1, '%s posted a new topic %s', '%s posted a new topic %s', 'wpforo'),
(604, 1, 'Created by %s', 'Created by %s', 'wpforo'),
(605, 1, 'Last reply by %s', 'Last reply by %s', 'wpforo'),
(606, 1, 'Reply to', 'Reply to', 'wpforo'),
(607, 1, 'Topic Author', 'Topic Author', 'wpforo'),
(608, 1, 'Reply by', 'Reply by', 'wpforo'),
(609, 1, 'All ', 'All ', 'wpforo'),
(610, 1, 'Deleted', 'Deleted', 'wpforo'),
(611, 1, '404 - Page not found', '404 - Page not found', 'wpforo'),
(612, 1, 'About', 'About', 'wpforo'),
(613, 1, 'action error', 'action error', 'wpforo'),
(614, 1, 'post not found', 'post not found', 'wpforo'),
(615, 1, 'done', 'done', 'wpforo'),
(616, 1, 'topic not found', 'topic not found', 'wpforo'),
(617, 1, 'wrong data', 'wrong data', 'wpforo'),
(618, 1, 'all topics has been loaded in this list', 'all topics has been loaded in this list', 'wpforo'),
(619, 1, 'Attachment', 'Attachment', 'wpforo'),
(620, 1, 'The key is expired', 'The key is expired', 'wpforo'),
(621, 1, 'The key is invalid', 'The key is invalid', 'wpforo'),
(622, 1, 'Email has been sent', 'Email has been sent', 'wpforo'),
(623, 1, 'The password reset mismatch', 'The password reset mismatch', 'wpforo'),
(624, 1, 'The password reset empty', 'The password reset empty', 'wpforo'),
(625, 1, 'The password has been changed', 'The password has been changed', 'wpforo'),
(626, 1, 'Invalid request.', 'Invalid request.', 'wpforo'),
(627, 1, 'You have been banned. Please contact to forum administrators for more information.', 'You have been banned. Please contact to forum administrators for more information.', 'wpforo'),
(628, 1, 'Topic are private, please register or login for further information', 'Topic are private, please register or login for further information', 'wpforo'),
(629, 1, 'More', 'More', 'wpforo'),
(630, 1, 'expand to show all comments on this post', 'expand to show all comments on this post', 'wpforo'),
(631, 1, 'show %d more comments', 'show %d more comments', 'wpforo'),
(632, 1, 'Threads', 'Threads', 'wpforo'),
(633, 1, 'No forum found in this category', 'No forum found in this category', 'wpforo'),
(634, 1, 'Popular', 'Popular', 'wpforo'),
(635, 1, 'Resolved', 'Resolved', 'wpforo'),
(636, 1, 'Status', 'Status', 'wpforo'),
(637, 1, 'Users', 'Users', 'wpforo'),
(638, 1, 'Load More Topics', 'Load More Topics', 'wpforo'),
(639, 1, 'Reset Fields', 'Reset Fields', 'wpforo'),
(640, 1, 'Not Replied Topics', 'Not Replied Topics', 'wpforo'),
(641, 1, 'Solved Topics', 'Solved Topics', 'wpforo'),
(642, 1, 'Unsolved Topics', 'Unsolved Topics', 'wpforo'),
(643, 1, 'Closed Topics', 'Closed Topics', 'wpforo'),
(644, 1, 'Sticky Topics', 'Sticky Topics', 'wpforo'),
(645, 1, 'Private Topics', 'Private Topics', 'wpforo'),
(646, 1, 'Unapproved Posts', 'Unapproved Posts', 'wpforo'),
(647, 1, 'Tag', 'Tag', 'wpforo'),
(648, 1, '%s Replies', '%s Replies', 'wpforo'),
(649, 1, '%s Reply', '%s Reply', 'wpforo'),
(650, 1, 'Quote this text', 'Quote this text\n', 'wpforo');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_posts`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_posts` (
  `postid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parentid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `forumid` int(10) UNSIGNED NOT NULL,
  `topicid` bigint(20) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `likes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `votes` int(11) NOT NULL DEFAULT 0,
  `is_answer` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_first_post` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `root` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `topicid` (`topicid`),
  KEY `forumid` (`forumid`),
  KEY `userid` (`userid`),
  KEY `created` (`created`),
  KEY `parentid` (`parentid`),
  KEY `is_answer` (`is_answer`),
  KEY `is_first_post` (`is_first_post`),
  KEY `status` (`status`),
  KEY `email` (`email`),
  KEY `is_private` (`private`),
  KEY `root` (`root`),
  KEY `forumid_status` (`forumid`,`status`),
  KEY `topicid_status` (`topicid`,`status`),
  KEY `topicid_solved` (`topicid`,`is_answer`),
  KEY `topicid_parentid` (`topicid`,`parentid`),
  KEY `forumid_status_private` (`forumid`,`status`,`private`),
  KEY `forumid_answer_first` (`forumid`,`is_answer`,`is_first_post`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_profiles`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_profiles` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupid` int(10) UNSIGNED NOT NULL,
  `posts` int(11) NOT NULL DEFAULT 0,
  `questions` int(11) NOT NULL DEFAULT 0,
  `answers` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) NOT NULL DEFAULT 0,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icq` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aim` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yahoo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gtalk` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online_time` int(10) UNSIGNED DEFAULT NULL,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `like` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT 'active' COMMENT 'active, blocked, trashed, spamer',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `secondary_groups` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fields` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `groupid` (`groupid`),
  KEY `online_time` (`online_time`),
  KEY `posts` (`posts`),
  KEY `status` (`status`),
  KEY `is_email_confirmed` (`is_email_confirmed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wpforo_profiles`
--

INSERT INTO `wp_wpforo_profiles` (`userid`, `title`, `username`, `groupid`, `posts`, `questions`, `answers`, `comments`, `site`, `icq`, `aim`, `yahoo`, `msn`, `facebook`, `twitter`, `gtalk`, `skype`, `avatar`, `signature`, `about`, `occupation`, `location`, `last_login`, `online_time`, `rank`, `like`, `status`, `timezone`, `is_email_confirmed`, `secondary_groups`, `fields`) VALUES
(1, 'Member', 'alumnos', 1, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-08-14 12:52:39', 1566564547, 0, 0, 'active', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_subscribes`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_subscribes` (
  `subid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmkey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `user_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subid`),
  UNIQUE KEY `fld_group_unq` (`itemid`,`type`,`userid`,`user_email`),
  UNIQUE KEY `confirmkey` (`confirmkey`),
  KEY `itemid_2` (`itemid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_tags`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_tags` (
  `tagid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`tagid`),
  UNIQUE KEY `tag` (`tag`(190)),
  KEY `prefix` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_topics`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_topics` (
  `topicid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `forumid` int(10) UNSIGNED NOT NULL,
  `first_postid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_post` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `posts` int(11) NOT NULL DEFAULT 0,
  `votes` int(11) NOT NULL DEFAULT 0,
  `answers` int(11) NOT NULL DEFAULT 0,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `solved` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `has_attach` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `private` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prefix` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`topicid`),
  UNIQUE KEY `slug` (`slug`(191)),
  KEY `forumid` (`forumid`),
  KEY `first_postid` (`first_postid`),
  KEY `created` (`created`),
  KEY `modified` (`modified`),
  KEY `last_post` (`last_post`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `email` (`email`),
  KEY `solved` (`solved`),
  KEY `is_private` (`private`),
  KEY `own_private` (`userid`,`private`),
  KEY `forumid_status` (`forumid`,`status`),
  KEY `forumid_status_private` (`forumid`,`status`,`private`),
  KEY `prefix` (`prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_usergroups`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_usergroups` (
  `groupid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cans` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'board permissions',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `access` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `secondary` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`groupid`),
  UNIQUE KEY `UNIQUE_GROUP_NAME` (`name`(191)),
  KEY `visible` (`visible`),
  KEY `secondary` (`secondary`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wpforo_usergroups`
--

INSERT INTO `wp_wpforo_usergroups` (`groupid`, `name`, `cans`, `description`, `utitle`, `role`, `access`, `color`, `visible`, `secondary`) VALUES
(1, 'Admin', 'a:33:{s:2:\"mf\";s:1:\"1\";s:2:\"ms\";s:1:\"1\";s:2:\"mt\";s:1:\"1\";s:2:\"vm\";s:1:\"1\";s:3:\"aum\";s:1:\"1\";s:3:\"vmg\";s:1:\"1\";s:2:\"mp\";s:1:\"1\";s:3:\"mth\";s:1:\"1\";s:2:\"em\";s:1:\"1\";s:2:\"bm\";s:1:\"1\";s:2:\"dm\";s:1:\"1\";s:3:\"aup\";s:1:\"1\";s:9:\"view_stat\";s:1:\"1\";s:4:\"vmem\";s:1:\"1\";s:4:\"vprf\";s:1:\"1\";s:4:\"vpra\";s:1:\"1\";s:4:\"vprs\";s:1:\"1\";s:3:\"upa\";s:1:\"1\";s:3:\"ups\";s:1:\"1\";s:2:\"va\";s:1:\"1\";s:3:\"vmu\";s:1:\"1\";s:3:\"vmm\";s:1:\"1\";s:3:\"vmt\";s:1:\"1\";s:4:\"vmct\";s:1:\"1\";s:3:\"vmr\";s:1:\"1\";s:3:\"vmw\";s:1:\"1\";s:4:\"vmsn\";s:1:\"1\";s:4:\"vmrd\";s:1:\"1\";s:3:\"vml\";s:1:\"1\";s:3:\"vmo\";s:1:\"1\";s:3:\"vms\";s:1:\"1\";s:4:\"vmam\";s:1:\"1\";s:4:\"vwpm\";s:1:\"1\";}', '', 'Admin', 'administrator', 'full', '#FF3333', 1, 0),
(2, 'Moderator', 'a:33:{s:2:\"mf\";s:1:\"0\";s:2:\"ms\";s:1:\"0\";s:2:\"mt\";s:1:\"0\";s:2:\"vm\";s:1:\"0\";s:3:\"aum\";s:1:\"1\";s:3:\"vmg\";s:1:\"0\";s:2:\"mp\";s:1:\"0\";s:3:\"mth\";s:1:\"0\";s:2:\"em\";s:1:\"0\";s:2:\"bm\";s:1:\"1\";s:2:\"dm\";s:1:\"1\";s:3:\"aup\";s:1:\"1\";s:9:\"view_stat\";s:1:\"1\";s:4:\"vmem\";s:1:\"1\";s:4:\"vprf\";s:1:\"1\";s:4:\"vpra\";s:1:\"1\";s:4:\"vprs\";s:1:\"1\";s:3:\"upa\";s:1:\"1\";s:3:\"ups\";s:1:\"1\";s:2:\"va\";s:1:\"1\";s:3:\"vmu\";s:1:\"0\";s:3:\"vmm\";s:1:\"1\";s:3:\"vmt\";s:1:\"1\";s:4:\"vmct\";s:1:\"1\";s:3:\"vmr\";s:1:\"1\";s:3:\"vmw\";s:1:\"1\";s:4:\"vmsn\";s:1:\"1\";s:4:\"vmrd\";s:1:\"1\";s:3:\"vml\";s:1:\"1\";s:3:\"vmo\";s:1:\"1\";s:3:\"vms\";s:1:\"1\";s:4:\"vmam\";s:1:\"1\";s:4:\"vwpm\";s:1:\"1\";}', '', 'Moderator', 'editor', 'moderator', '#0066FF', 1, 0),
(3, 'Registered', 'a:33:{s:2:\"mf\";s:1:\"0\";s:2:\"ms\";s:1:\"0\";s:2:\"mt\";s:1:\"0\";s:2:\"vm\";s:1:\"0\";s:3:\"aum\";s:1:\"0\";s:3:\"vmg\";s:1:\"0\";s:2:\"mp\";s:1:\"0\";s:3:\"mth\";s:1:\"0\";s:2:\"em\";s:1:\"0\";s:2:\"bm\";s:1:\"0\";s:2:\"dm\";s:1:\"0\";s:3:\"aup\";s:1:\"1\";s:9:\"view_stat\";s:1:\"1\";s:4:\"vmem\";s:1:\"1\";s:4:\"vprf\";s:1:\"1\";s:4:\"vpra\";s:1:\"1\";s:4:\"vprs\";s:1:\"0\";s:3:\"upa\";s:1:\"1\";s:3:\"ups\";s:1:\"1\";s:2:\"va\";s:1:\"1\";s:3:\"vmu\";s:1:\"0\";s:3:\"vmm\";s:1:\"0\";s:3:\"vmt\";s:1:\"1\";s:4:\"vmct\";s:1:\"1\";s:3:\"vmr\";s:1:\"1\";s:3:\"vmw\";s:1:\"1\";s:4:\"vmsn\";s:1:\"1\";s:4:\"vmrd\";s:1:\"1\";s:3:\"vml\";s:1:\"1\";s:3:\"vmo\";s:1:\"1\";s:3:\"vms\";s:1:\"1\";s:4:\"vmam\";s:1:\"1\";s:4:\"vwpm\";s:1:\"1\";}', '', 'Registered', 'subscriber', 'standard', '', 1, 1),
(4, 'Guest', 'a:33:{s:2:\"mf\";s:1:\"0\";s:2:\"ms\";s:1:\"0\";s:2:\"mt\";s:1:\"0\";s:2:\"vm\";s:1:\"0\";s:3:\"aum\";s:1:\"0\";s:3:\"vmg\";s:1:\"0\";s:2:\"mp\";s:1:\"0\";s:3:\"mth\";s:1:\"0\";s:2:\"em\";s:1:\"0\";s:2:\"bm\";s:1:\"0\";s:2:\"dm\";s:1:\"0\";s:3:\"aup\";s:1:\"0\";s:9:\"view_stat\";s:1:\"1\";s:4:\"vmem\";s:1:\"1\";s:4:\"vprf\";s:1:\"1\";s:4:\"vpra\";s:1:\"1\";s:4:\"vprs\";s:1:\"0\";s:3:\"upa\";s:1:\"0\";s:3:\"ups\";s:1:\"0\";s:2:\"va\";s:1:\"1\";s:3:\"vmu\";s:1:\"0\";s:3:\"vmm\";s:1:\"0\";s:3:\"vmt\";s:1:\"1\";s:4:\"vmct\";s:1:\"1\";s:3:\"vmr\";s:1:\"1\";s:3:\"vmw\";s:1:\"0\";s:4:\"vmsn\";s:1:\"1\";s:4:\"vmrd\";s:1:\"1\";s:3:\"vml\";s:1:\"1\";s:3:\"vmo\";s:1:\"1\";s:3:\"vms\";s:1:\"1\";s:4:\"vmam\";s:1:\"1\";s:4:\"vwpm\";s:1:\"0\";}', '', 'Guest', '', 'read_only', '#222222', 0, 0),
(5, 'Customer', 'a:33:{s:2:\"mf\";s:1:\"0\";s:2:\"ms\";s:1:\"0\";s:2:\"mt\";s:1:\"0\";s:2:\"vm\";s:1:\"0\";s:3:\"aum\";s:1:\"0\";s:3:\"vmg\";s:1:\"0\";s:2:\"mp\";s:1:\"0\";s:3:\"mth\";s:1:\"0\";s:2:\"em\";s:1:\"0\";s:2:\"bm\";s:1:\"0\";s:2:\"dm\";s:1:\"0\";s:3:\"aup\";s:1:\"0\";s:9:\"view_stat\";s:1:\"1\";s:4:\"vmem\";s:1:\"1\";s:4:\"vprf\";s:1:\"1\";s:4:\"vpra\";s:1:\"1\";s:4:\"vprs\";s:1:\"0\";s:3:\"upa\";s:1:\"1\";s:3:\"ups\";s:1:\"1\";s:2:\"va\";s:1:\"1\";s:3:\"vmu\";s:1:\"0\";s:3:\"vmm\";s:1:\"0\";s:3:\"vmt\";s:1:\"1\";s:4:\"vmct\";s:1:\"1\";s:3:\"vmr\";s:1:\"1\";s:3:\"vmw\";s:1:\"1\";s:4:\"vmsn\";s:1:\"1\";s:4:\"vmrd\";s:1:\"1\";s:3:\"vml\";s:1:\"1\";s:3:\"vmo\";s:1:\"1\";s:3:\"vms\";s:1:\"1\";s:4:\"vmam\";s:1:\"1\";s:4:\"vwpm\";s:1:\"1\";}', '', 'Customer', 'customer', 'standard', '#993366', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_views`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_views` (
  `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` int(10) UNSIGNED NOT NULL,
  `topicid` int(10) UNSIGNED NOT NULL,
  `created` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`vid`),
  UNIQUE KEY `user_topic` (`userid`,`topicid`),
  KEY `userid` (`userid`),
  KEY `topicid` (`topicid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_visits`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_visits` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `forumid` int(10) UNSIGNED NOT NULL,
  `topicid` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tracking` (`userid`,`ip`,`forumid`,`topicid`),
  KEY `userid` (`userid`),
  KEY `forumid` (`forumid`),
  KEY `topicid` (`topicid`),
  KEY `time` (`time`),
  KEY `ip` (`ip`),
  KEY `time_forumid` (`time`,`forumid`),
  KEY `time_topicid` (`time`,`topicid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wpforo_visits`
--

INSERT INTO `wp_wpforo_visits` (`id`, `userid`, `name`, `ip`, `time`, `forumid`, `topicid`) VALUES
(1, 1, 'alumnos', '', 1566391793, 0, 0),
(5, 0, '', 'f528764d624db12', 1566476097, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpforo_votes`
--

CREATE TABLE IF NOT EXISTS `wp_wpforo_votes` (
  `voteid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` int(10) UNSIGNED NOT NULL,
  `postid` int(10) UNSIGNED NOT NULL,
  `reaction` tinyint(4) NOT NULL DEFAULT 1,
  `post_userid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`voteid`),
  UNIQUE KEY `unique_vote` (`userid`,`postid`,`reaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_wpforo_posts`
--
ALTER TABLE `wp_wpforo_posts` ADD FULLTEXT KEY `title` (`title`);
ALTER TABLE `wp_wpforo_posts` ADD FULLTEXT KEY `body` (`body`);
ALTER TABLE `wp_wpforo_posts` ADD FULLTEXT KEY `title_plus_body` (`title`,`body`);

--
-- Indexes for table `wp_wpforo_topics`
--
ALTER TABLE `wp_wpforo_topics` ADD FULLTEXT KEY `title` (`title`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
