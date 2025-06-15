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
  public function get_products($offset, $limit, $search, $order_column = 'name', $order_direction = 'ASC')
  {
    // Whitelist valid columns and directions to prevent SQL injection
    $allowed_columns = ['name', 'price'];
    $allowed_directions = ['ASC', 'DESC'];

    if (!in_array(strtolower($order_column), $allowed_columns)) {
      $order_column = 'name';
    }

    if (!in_array(strtoupper($order_direction), $allowed_directions)) {
      $order_direction = 'ASC';
    }

    $query = "SELECT * FROM products WHERE name LIKE :search ORDER BY $order_column $order_direction LIMIT :offset, :limit";

    $stmt = $this->connection->prepare($query);
    $stmt->bindValue(':search', '%' . $search . '%', PDO::PARAM_STR);
    $stmt->bindValue(':offset', (int) $offset, PDO::PARAM_INT);
    $stmt->bindValue(':limit', (int) $limit, PDO::PARAM_INT);

    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
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


  public function update_product($id, $name, $price, $description)
  {
    $sql = "UPDATE products SET name = :name, price = :price, description = :description WHERE id = :id";
    $stmt = $this->connection->prepare($sql);
    $stmt->execute(['name' => $name, 'price' => $price, 'description' => $description, 'id' => $id]);
    return $stmt->rowCount();
  }
}
