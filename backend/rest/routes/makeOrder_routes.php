<?php

require_once __DIR__ . '/../services/OrderService.class.php';

Flight::register('orderService', 'OrderService');

/**
 * @OA\Post(
 *      path="/order",
 *      tags={"order"},
 *      summary="Create a new order",
 *      description="Creates a new order with user and items data.",
 *      @OA\RequestBody(
 *          required=true,
 *          description="User and items data needed to create the order",
 *          @OA\MediaType(
 *              mediaType="application/json",
 *              @OA\Schema(
 *                  required={"user","items"},
 *                  @OA\Property(
 *                      property="user",
 *                      type="object",
 *                      description="User details for the order",
 *                      @OA\Property(
 *                          property="id",
 *                          type="integer",
 *                          description="User ID"
 *                      ),
 *                      @OA\Property(
 *                          property="name",
 *                          type="string",
 *                          description="User's name"
 *                      ),
 *                      @OA\Property(
 *                          property="email",
 *                          type="string",
 *                          description="User's email"
 *                      ),
 *                  ),
 *                  @OA\Property(
 *                      property="items",
 *                      type="array",
 *                      description="List of items in the order",
 *                      @OA\Items(
 *                          type="object",
 *                          @OA\Property(
 *                              property="id",
 *                              type="integer",
 *                              description="Product ID"
 *                          ),
 *                          @OA\Property(
 *                              property="price",
 *                              type="integer",
 *                              description="Price of the product"
 *                          )
 *                      )
 *                  )
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=200,
 *          description="Order created successfully",
 *          @OA\JsonContent(
 *              type="object",
 *              @OA\Property(
 *                  property="success",
 *                  type="boolean",
 *                  example=true
 *              ),
 *              @OA\Property(
 *                  property="message",
 *                  type="string",
 *                  example="Order created successfully"
 *              ),
 *              @OA\Property(
 *                  property="order",
 *                  type="object",
 *                  description="Details of the created order"
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=400,
 *          description="Missing user or items data",
 *          @OA\JsonContent(
 *              type="object",
 *              @OA\Property(
 *                  property="error",
 *                  type="string",
 *                  example="Missing user or items data"
 *              )
 *          )
 *      )
 * )
 */
Flight::route('POST /order', function () {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);


    if (!isset($data['user']) || !isset($data['items'])) {
        Flight::json(['error' => 'Missing user or items data'], 400);
        return;
    }

    $order = Flight::orderService()->createOrderWithUser($data);

    Flight::json([
        'success' => true,
        'message' => 'Order created successfully',
        'order' => $order
    ]);
});
