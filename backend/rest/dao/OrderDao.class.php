<?php

require_once __DIR__ . '/BaseDao.class.php';

class OrderDao extends BaseDao
{

  public function __construct()
  {
    parent::__construct("orders");
  }

  public function addOrder($order)
  {
    return $this->insert("orders", $order);
  }

  //to get all orders for specific user (with specific id) - to be able to view order history later
  public function getOrdersByUserId($user_id)
  {
    return $this->query("SELECT * FROM orders WHERE user_id = :user_id ORDER BY created_at DESC", ['user_id' => $user_id]);
  }

  //to be able to track orders by status later
  public function getOrderItemsByOrderId($order_id)
  {
    return $this->query("SELECT * FROM order_items WHERE order_id = :order_id", ['order_id' => $order_id]);
  }

}
