<?php

require_once __DIR__ . '/BaseDao.class.php';

class ProductDao extends BaseDao
{

  public function __construct()
  {
    parent::__construct("products");
  }

  public function add($product)
  {
    return $this->insert('products', $product);
  }
  public function get_products($offset, $limit, $search, $order_column, $order_direction)
  {
    $query = "SELECT * 
              FROM products
              WHERE LOWER(name) LIKE CONCAT('%', :search, '%') OR LOWER(description) LIKE CONCAT('%', :search, '%')
              ORDER BY {$order_column} {$order_direction}
              LIMIT {$offset}, {$limit}";
    return $this->query($query, ['search' => strtolower($search)]);
  }
  public function count_products($search)
  {
    $query = "SELECT COUNT(*) AS count 
              FROM products
              WHERE LOWER(name) LIKE CONCAT('%', :search, '%') OR LOWER(description) LIKE CONCAT('%', :search, '%')";
    return $this->query_unique($query, ['search' => strtolower($search)]);
  }
  public function get()
  {
    return $this->get_all(0, 100000);
  }
  public function get_product_by_id($product_id)
  {
    return $this->query_unique("SELECT * FROM products WHERE id = :id", ["id" => $product_id]);
  }

  public function delete_product_by_id($product_id)
  {
    return $this->execute("DELETE FROM products WHERE id = :id", ["id" => $product_id]);
  }


public function update_product($id, $name, $price, $description, $is_active = null) {
  $sql = "UPDATE products SET name = :name, price = :price, description = :description";
  $params = ['name' => $name, 'price' => $price, 'description' => $description, 'id' => $id];

  if ($is_active !== null) {
    $sql .= ", is_active = :is_active";
    $params['is_active'] = $is_active;
  }

  $sql .= " WHERE id = :id";
  
  $stmt = $this->connection->prepare($sql);
  $stmt->execute($params);
  return $stmt->rowCount();
}

}
