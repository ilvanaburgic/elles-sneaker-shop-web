<?php

require_once __DIR__ . '/../services/NewsletterService.class.php';

Flight::register('newsletterService', 'NewsletterService');

/**
 * @OA\Post(
 *      path="/subscribe",
 *      tags={"subscription"},
 *      summary="Subscribe to newsletter",
 *      description="Subscribes a user to the newsletter using their email address.",
 *      @OA\RequestBody(
 *          required=true,
 *          description="Email of the user to subscribe",
 *          @OA\MediaType(
 *              mediaType="application/json",
 *              @OA\Schema(
 *                  required={"email"},
 *                  @OA\Property(
 *                      property="email",
 *                      type="string",
 *                      format="email",
 *                      description="Email address of the subscriber"
 *                  )
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=200,
 *          description="Subscription successful.",
 *          @OA\JsonContent(
 *              type="object",
 *              @OA\Property(
 *                  property="message",
 *                  type="string",
 *                  example="Subscription successful."
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=400,
 *          description="Email is required",
 *          @OA\JsonContent(
 *              type="object",
 *              @OA\Property(
 *                  property="error",
 *                  type="string",
 *                  example="Email is required"
 *              )
 *          )
 *      )
 * )
 */
Flight::route('POST /subscribe', function () {

    $input_data = json_decode(file_get_contents('php://input'), true);

    if (!isset($input_data['email'])) {
        Flight::json(['error' => 'Email is required'], 400);
        return;
    }

    $subscriber = ['email' => $input_data['email']];

    Flight::newsletterService()->subscribe($subscriber);


    Flight::json([
        'message' => 'Subscription successful.'
    ]);
});