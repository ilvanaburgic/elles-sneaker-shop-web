<?php

require_once __DIR__ . '/BaseDao.class.php';

class OrderItemDao extends BaseDao
{

  public function __construct()
  {
    parent::__construct("order_items");
  }
}
