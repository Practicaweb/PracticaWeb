<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'alumnos' );

/** MySQL database password */
define( 'DB_PASSWORD', 'P@ssw0rd' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'j^X% :2ZJ>ESM!uSQ-78KB5xNIFXQcN9Vu:+DEVy=PtLYZ1@tVT:x@fYik_hj34_' );
define( 'SECURE_AUTH_KEY',  'B@zkR30#dx3y9fZQ=ea7t+}P-*fwdmsQ=?e4B)rO?p_@YM~0W:0n9nWz^JYb@Q#j' );
define( 'LOGGED_IN_KEY',    ']T64I?-wx}V:?-We+SCF710vjM0t>0,J c3%o@V~mXu 6Yb!KD@(eOc{_~3vVds_' );
define( 'NONCE_KEY',        '~bx]J7AI-s.8sCiw*;f$LO_FeDF4LBx0v_rEdrW{}IoHHQ;bbJ!/=ENL$@#UfbmM' );
define( 'AUTH_SALT',        'cBP_[cHFy2inn82;)NMqL2@ZLKU#k%TvGH1^oZRgV(g/I`tkGVuTg8])PVmrUZg^' );
define( 'SECURE_AUTH_SALT', '.@4pX<FPFpemj%B)}<%!;wSojN|kcGQ%$W<-9ygYln4m12uunp_t=FwutTOZGFa%' );
define( 'LOGGED_IN_SALT',   ')0vEft,mAzz#moQGM%RBhV!Xa>vFc~39yOldAh*Q={>6vu~NVbm#KPiU{.vXU:jk' );
define( 'NONCE_SALT',       'w!Ls:zT1|6j@__Ja`!J4@Z}lpfokpu=(S%V2xTNQa5/puL`_H[+Sm|8*p:Izp3;E' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
