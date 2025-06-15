<?php
// Report all errors accept E_NOTICE
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL ^ (E_NOTICE | E_DEPRECATED));



// Database access credentials
define('DB_NAME', 'EllesSneakerShop');
define('DB_PORT', 3306);
define('DB_USER', 'root');
define('DB_PASS', '12nana123');
define('DB_HOST', '127.0.0.1');

// JWT Secret
define('JWT_SECRET', 'b3e28302fdc72b3aecde24d1849dbe55753e95617d8ac8e597d46726bcfeef61');