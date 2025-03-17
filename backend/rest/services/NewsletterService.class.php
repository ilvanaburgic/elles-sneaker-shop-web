<?php

require_once __DIR__ . '/../dao/NewsletterDao.class.php';

class NewsletterService
{
  private $newsletter_dao;

  public function __construct()
  {
    $this->newsletter_dao = new NewsletterDao();
  }

  public function subscribe($subscriber)
  {
    return $this->newsletter_dao->add($subscriber);
  }

  // Other service methods can go here, like unsubscribe, get subscribers, etc.
}
