<?php
use \Firebase\JWT\JWT;
require_once __DIR__ . '/../services/LoginService.class.php';

Flight::register('login_service', 'LoginService');


/**
 * @OA\Post(
 *      path="/login",
 *      tags={"authentication"},
 *      summary="User login",
 *      description="Authenticates a user and returns a JWT on successful authentication.",
 *      @OA\RequestBody(
 *          required=true,
 *          description="User credentials needed for authentication",
 *          @OA\MediaType(
 *              mediaType="application/json",
 *              @OA\Schema(
 *                  type="object",
 *                  required={"email", "password"},
 *                  @OA\Property(
 *                      property="email",
 *                      type="string",
 *                      format="email",
 *                      example="user@example.com",
 *                      description="The email address of the user"
 *                  ),
 *                  @OA\Property(
 *                      property="password",
 *                      type="string",
 *                      format="password",
 *                      example="password123",
 *                      description="The password of the user"
 *                  )
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=200,
 *          description="Login successful",
 *          @OA\JsonContent(
 *              type="object",
 *              @OA\Property(
 *                  property="message",
 *                  type="string",
 *                  example="Login successful"
 *              ),
 *              @OA\Property(
 *                  property="token",
 *                  type="string",
 *                  example="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=400,
 *          description="Invalid input",
 *          @OA\JsonContent(
 *              type="object",
 *              @OA\Property(
 *                  property="message",
 *                  type="string",
 *                  example="Invalid email or password"
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=401,
 *          description="Unauthorized",
 *          @OA\JsonContent(
 *              type="object",
 *              @OA\Property(
 *                  property="message",
 *                  type="string",
 *                  example="Invalid credentials"
 *              )
 *          )
 *      )
 * )
 */
Flight::route('POST /login', function() {
    try {
        $data = json_decode(file_get_contents('php://input'), true);
        $email = $data['email'] ?? null;
        $password = $data['password'] ?? null;

        $user = Flight::login_service()->authenticate($email, $password);

        if (!$user) {
            Flight::json(["message" => "Invalid email or password"], 401);
            return;
        }

        // Secret key should be stored securely and should not be hardcoded in production

        // Prepare the token payload
        $payload = [
            "iss" => "YourIssuer", // Issuer of the token
            "iat" => time(), // Issued at: time when the token was generated
            "exp" => time() + 7200, // Expiring time: here set to 2 hours
            "sub" => $user['id'], // Subject of the token (typically the user ID)
            "email" => $user['email'] // Additional data
        ];

        // Encode the array to a JWT string
        $jwt = JWT::encode($payload, JWT_SECRET, 'HS256');

        // Return the JWT to the client
        Flight::json([
            "message" => "Login successful",
            "token" => $jwt
        ]);

    } catch (Exception $e) {
        Flight::json(["message" => $e->getMessage()], $e->getCode() == 401 ? 401 : 400);
    }
});