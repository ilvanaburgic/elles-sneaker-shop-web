<?php
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

require_once __DIR__ . '/../services/ProductService.class.php';


Flight::set('product_service', new ProductService());


/**
 * @OA\Get(
 *      path="/public/products",
 *      tags={"products"},
 *      summary="Get all products for user",
 *      @OA\Response(
 *           response=200,
 *           description="Array of all products in the databases"
 *      )
 * )
 */
Flight::route('GET /public/products', function () {
  $products = Flight::get('product_service')->get_all_products();

  header('Content-Type: application/json');

  Flight::json([
    'data' => $products,
  ], 200);
});




/**
 * @OA\Delete(
 *      path="/products/{product_id}",
 *      tags={"products"},
 *      summary="Delete product by id",
 *      security={
 *         {"ApiKey": {}}   
 *      },
 *      @OA\Response(
 *           response=200,
 *           description="Deleted product data or 500 status code exception otherwise"
 *      ),
 *      @OA\Parameter(@OA\Schema(type="number"), in="path", name="product_id", example="1", description="Product ID")
 * )
 */

 Flight::route('DELETE /products/@id', function ($id) {
  $product_service = Flight::get('product_service');
  $result = $product_service->delete_product_by_id($id);

  if ($result) {
      Flight::json(['message' => 'Product deleted successfully'], 200);
  } else {
      Flight::json(['message' => 'Product not found'], 404);
  }
})->addMiddleware('AuthMiddleware');


/**
 * @OA\Get(
 *      path="/products",
 *      tags={"products"},
 *      summary="Get all products for admin", 
 *       security={
 *          {"ApiKey": {}}   
 *      },
 *      @OA\Response(
 *           response=200,
 *           description="Array of all products in the databases"
 *      )
 * )
 */

 Flight::route('GET /products', function () {
  $products = Flight::get('product_service')->get_all_products();

  header('Content-Type: application/json');

  Flight::json([
    'data' => $products,
  ], 200);
})->addMiddleware('AuthMiddleware');

/**
 * @OA\Patch(
 *      path="/products/{product_id}",
 *      security={{"ApiKey":{}}},
 *      tags={"products"},
 *      summary="Update product by id",
 *      description="Updates a product's details by ID.",
 *      @OA\Parameter(
 *          name="product_id",
 *          in="path",
 *          required=true,
 *          @OA\Schema(
 *              type="integer"
 *          ),
 *          description="ID of the product to be updated"
 *      ),
 *      @OA\RequestBody(
 *          required=true,
 *          @OA\MediaType(
 *              mediaType="application/json",
 *              @OA\Schema(
 *                  type="object",
 *                  required={"name", "price", "description"},
 *                  @OA\Property(
 *                      property="name",
 *                      type="string",
 *                      description="Name of the product"
 *                  ),
 *                  @OA\Property(
 *                      property="price",
 *                      type="number",
 *                      format="float",
 *                      description="Price of the product"
 *                  ),
 *                  @OA\Property(
 *                      property="description",
 *                      type="string",
 *                      description="Description of the product"
 *                  )
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=200,
 *          description="Product updated successfully"
 *      ),
 *      @OA\Response(
 *          response=400,
 *          description="Invalid input"
 *      ),
 *      @OA\Response(
 *          response=404,
 *          description="Product not found"
 *      ),
 *      @OA\Response(
 *          response=500,
 *          description="Internal Server Error"
 *      )
 * )
 */
Flight::route('PATCH /products/@id', function ($id) {
  $data = json_decode(Flight::request()->getBody());
  if ($data) {
    $product_service = Flight::get('product_service');
    $result = $product_service->update_product($id, $data->name, $data->price, $data->description, isset($data->is_active) ? $data->is_active : null);
    if ($result) {
      Flight::json(['message' => 'Proizvod je uspješno ažuriran'], 200);
    } else {
      Flight::json(['message' => 'Ažuriranje proizvoda nije uspjelo'], 500);
    }
  } else {
    Flight::json(['message' => 'Neispravan unos'], 400);
  }
})->addMiddleware('AuthMiddleware');


/**
 * @OA\Post(
 *      path="/products",
 *      security={{"ApiKeyAuth":{}}},
 *      tags={"products"},
 *      summary="Add a new product",
 *      description="Creates a new product with the given details.",
 *      @OA\RequestBody(
 *          required=true,
 *          @OA\MediaType(
 *              mediaType="application/json",
 *              @OA\Schema(
 *                  type="object",
 *                  required={"name", "price", "description", "image", "brand"},
 *                  @OA\Property(
 *                      property="name",
 *                      type="string",
 *                      description="Name of the product"
 *                  ),
 *                  @OA\Property(
 *                      property="price",
 *                      type="number",
 *                      format="float",
 *                      description="Price of the product"
 *                  ),
 *                  @OA\Property(
 *                      property="description",
 *                      type="string",
 *                      description="Description of the product"
 *                  ),
 *                  @OA\Property(
 *                      property="image",
 *                      type="string",
 *                      description="URL of the product image"
 *                  ),
 *                  @OA\Property(
 *                      property="brand",
 *                      type="string",
 *                      description="Brand of the product"
 *                  )
 *              )
 *          )
 *      ),
 *      @OA\Response(
 *          response=200,
 *          description="Product added successfully"
 *      ),
 *      @OA\Response(
 *          response=400,
 *          description="Invalid input"
 *      ),
 *      @OA\Response(
 *          response=500,
 *          description="Internal Server Error"
 *      )
 * )
 */
Flight::route('POST /products', function() {
  $data = json_decode(Flight::request()->getBody(), true);
  if ($data && isset($data['name'], $data['price'], $data['description'], $data['image'], $data['brand'])) {
    $product_service = Flight::get('product_service');
    $result = $product_service->add_product($data);
    if ($result) {
      Flight::json(['message' => 'Product added successfully', 'product' => $result], 200);
    } else {
      Flight::json(['message' => 'Failed to add product'], 500);
    }
  } else {
    Flight::json(['message' => 'Invalid input'], 400);
  }
})->addMiddleware('AuthMiddleware');


/**
 * @OA\Get(
 *      path="/products/{product_id}",
 *      tags={"products"},
 *      summary="Get product by id",
 *      security={{"ApiKey": {}}},
 *      @OA\Response(
 *           response=200,
 *           description="Product details"
 *      ),
 *      @OA\Parameter(
 *           name="product_id",
 *           in="path",
 *           required=true,
 *           @OA\Schema(type="integer"),
 *           description="ID of the product"
 *      )
 * )
 */
Flight::route('GET /products/@id', function ($id) {
    $product_service = Flight::get('product_service');
    $product = $product_service->get_product_by_id($id);
    
    if ($product) {
        Flight::json(['data' => $product]);
    } else {
        Flight::halt(404, 'Product not found');
    }
})->addMiddleware('AuthMiddleware');

