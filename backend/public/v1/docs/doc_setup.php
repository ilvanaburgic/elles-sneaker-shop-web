<?php

/**
 * @OA\Info(
 *   title="API",
 *   description="Elles Sneaker Shop API",
 *   version="1.0",
 *   @OA\Contact(
 *     email="ilvana.burgic@stu.ibu.edu.ba",
 *     name="Ilvana Burgic"
 *   )
 * ),
 * @OA\OpenApi(
 *   @OA\Server(
 *       url=BASE_URL
 *   )
 * )
 * @OA\SecurityScheme(
 *     securityScheme="ApiKey",
 *     type="apiKey",
 *     in="header",
 *     name="Authentication"
 * )
 */