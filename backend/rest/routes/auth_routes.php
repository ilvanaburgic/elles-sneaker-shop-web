<?php

require_once __DIR__ . '/../services/AuthService.class.php';

Flight::set('auth_service', new AuthService());

Flight::group('/auth', function(){
  
});
