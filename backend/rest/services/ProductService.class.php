<?php

require_once __DIR__ . '/../dao/ProductDao.class.php';

class ProductService
{

      private $product_dao;

      public function __construct()
      {
            $this->product_dao = new ProductDao();
      }

      public function get_all_products()
      {
            return $this->product_dao->get();
      }

      public function add_product($product)
      {
            return $this->product_dao->add($product);
      }

      public function get_products($offset, $limit, $search, $order_column = 'name', $order_direction = 'ASC')
      {
            return $this->product_dao->get_products($offset, $limit, $search, $order_column, $order_direction);
      }
      public function count_products($search)
      {
            return $this->product_dao->count_products($search);
      }
      public function get_product_by_id($product_id)
      {
            return $this->product_dao->get_product_by_id($product_id);
      }

      public function delete_product_by_id($product_id)
      {
            return $this->product_dao->delete_product_by_id($product_id);
      }

      public function update_product($id, $name, $price, $description, $is_active = null)
      {
            return $this->product_dao->update_product($id, $name, $price, $description, $is_active);
      }

}