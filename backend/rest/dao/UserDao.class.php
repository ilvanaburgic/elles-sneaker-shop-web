<?php

require_once __DIR__ . '/BaseDao.class.php';

class UserDao extends BaseDao
{

  public function __construct()
  {
    parent::__construct("users");
  }
  /**
   * Retrieves a user by email.
   * @param $email The email of the user.
   * @return The user if found; null otherwise.
   */
  public function getUserByEmail($email)
  {
    return $this->query_unique("SELECT * FROM users WHERE email = :email", ['email' => $email]);
  }
}
