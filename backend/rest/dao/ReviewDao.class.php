<?php
require_once __DIR__ . '/BaseDao.class.php';

class ReviewDao extends BaseDao
{
    public function __construct()
    {
        parent::__construct("reviews");
    }

    public function insertReview($productId, $rating, $review)
    {
        $stmt = $this->connection->prepare("INSERT INTO reviews (product_id, rating, review_text) VALUES (?, ?, ?)");
        $stmt->execute([$productId, $rating, $review]);
    }

    public function getReviewsByProduct($productId)
    {
        $stmt = $this->connection->prepare("SELECT * FROM reviews WHERE product_id = ?");
        $stmt->execute([$productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}


