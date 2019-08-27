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
define( 'AUTH_KEY',         '5{i.6#23dp5`SFv%2V.OC!!w_iXHbZy,:oZ.sEYV=DKsO#KAzkfx36j^_UeoDOu@' );
define( 'SECURE_AUTH_KEY',  'R1@uRD.6Ms8OS`@{JWS]Eth8Zt!(>o(|u|?(=%7d=zQ4*#:w}dn}RM=lJ$Z_LH+j' );
define( 'LOGGED_IN_KEY',    'S%5Xz{M0S=wr_Lcr>?$j}KW:>xS^O/VEVjr:B=5qEN=ig?K/DN-75suHS&fNj[r9' );
define( 'NONCE_KEY',        'Yu|~+^}4U}/4<M(cLCz.:+&u-`X$d:qOz/y|Am5LTj?$OGG9 A.D-?dI!(}=j%BD' );
define( 'AUTH_SALT',        'A#Xtl->]!RgnK9(_uZ7TyN|w,cOS%m_aS:{Rwi_MsI6cBri#yjoR75,[.w2cKCpN' );
define( 'SECURE_AUTH_SALT', 'X:|Wt&95A9RA3KE{Ec){M {G@[iZTJ+?ss;ECU7zfIFsnO3y9ylq^[j@IbR0S2p)' );
define( 'LOGGED_IN_SALT',   '}L,`HIp!V|dl.b.?I]q6m`aSwbtvzLgOu*IxRMUrh&_v0+#4{>4sFxxFPl_-uE|:' );
define( 'NONCE_SALT',       'SE+j~@[0}#Ee<=_nWy3tS=S^nhk<V1u{-$7?_FaRwwV.E[KNiK<d=*kzb`vh_} i' );

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
