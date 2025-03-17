<?php

require_once __DIR__ . '/../dao/UserDao.class.php';

class LoginService
{

  private $userDao;

  public function __construct()
  {
    $this->userDao = new UserDao();
  }

  public function authenticate($email, $password)
  {
    if (!$email || !$password) {
      throw new Exception("Both email and password are required");
    }

    $user = $this->userDao->getUserByEmail($email);
    if ($user && $password === $user['password']) {
      unset($user['password']); // Remove the password before returning the data
      return $user;
    }

    throw new Exception("Invalid credentials", 401);
  }
}
