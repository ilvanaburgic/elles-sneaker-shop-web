<?php
require_once __DIR__ . '/../services/ReviewService.php';

class ReviewController
{
    private $reviewService;

    public function __construct()
    {
        $this->reviewService = new ReviewService();
    }

    public function submitReview($request)
    {
        $this->reviewService->addReview($request);
        echo json_encode(['message' => 'Review submitted successfully']);
    }

    public function getProductReviews($productId)
    {
        $reviews = $this->reviewService->getReviewsByProduct($productId);
        echo json_encode($reviews);
    }
}
