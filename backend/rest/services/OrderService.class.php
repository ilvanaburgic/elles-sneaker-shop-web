<?php

require_once __DIR__ . '/../dao/OrderDao.class.php';
require_once __DIR__ . '/../dao/OrderItemDao.class.php';
require_once __DIR__ . '/../dao/UserDao.class.php';

class OrderService
{
  private $orderDao;
  private $orderItemDao;
  private $userDao;

  public function __construct()
  {
    $this->orderDao = new OrderDao();
    $this->orderItemDao = new OrderItemDao();
    $this->userDao = new UserDao();
  }

  public function createOrderWithUser($orderDetails)
  {
    $user = $this->userDao->getUserByEmail($orderDetails['user']['email']);

    // If user does not exist, create a new user
    if (!$user) {
      $user = [
        'email' => $orderDetails['user']['email'],
        'name' => $orderDetails['user']['name'],
        'password' => bin2hex(random_bytes(8)) // Generates a random password and hashes it
      ];
      $user = $this->userDao->add($user);
    }

    // Calculate the total price
    $totalPrice = array_reduce($orderDetails['items'], function ($carry, $item) {
      return $carry + (1 * $item['price']);
    }, 0);

    $order = [
      'user_id' => $user['id'],
      'total_price' => $totalPrice,
    ];
    $createdOrder = $this->orderDao->add($order);

    foreach ($orderDetails['items'] as $item) {
      $itemDetails = [
        'order_id' => $createdOrder['id'],
        'product_id' => $item['id'],
        'price_at_time_of_order' => $item['price'],
      ];
      $this->orderItemDao->add($itemDetails);
    }

    return ['order' => $createdOrder, 'user' => $user];
  }
}
