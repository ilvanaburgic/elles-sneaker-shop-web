<?php
require_once __DIR__ . '/../dao/ReviewDao.php';

class ReviewService
{
    private $reviewDao;

    public function __construct()
    {
        $this->reviewDao = new ReviewDao();
    }

    public function addReview($request)
    {
        $data = json_decode($request->getBody(), true);
        $productId = $data['product_id'];
        $rating = $data['rating'];
        $review = $data['review'];

        return $this->reviewDao->insertReview($productId, $rating, $review);
    }

    public function getReviewsByProduct($productId)
    {
        return $this->reviewDao->getReviewsByProduct($productId);
    }
}
