<?php
require_once __DIR__ . '/../controllers/ReviewController.php';

$controller = new ReviewController();

if ($path === '/api/reviews' && $method === 'POST') {
    $controller->submitReview($request);
}

if ($path === '/api/reviews' && $method === 'GET' && isset($_GET['product_id'])) {
    $controller->getProductReviews($_GET['product_id']);
}
