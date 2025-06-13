<?php
use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/../backend/rest/services/ProductService.class.php';

class ProductServiceTest extends TestCase {
    private $service;

    protected function setUp(): void {
        $this->service = new ProductService();
    }

    public function testGetAllProducts() {
        $products = $this->service->get_all_products();
        $this->assertIsArray($products);
    }

    public function testAddProduct() {
        $newProduct = [
            'name' => 'Test Sneker',
            'price' => 199.99,
            'description' => 'Test Description',
            'image' => 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/IF0/IF0666-400/images/thumbs_900/IF0666-400_900_900px.jpg.webp',
            'brand' => 'TestBrand',
            'is_active' => 1
        ];

        $added = $this->service->add_product($newProduct);
        $this->assertIsArray($added);
        $this->assertArrayHasKey('id', $added);
        $this->assertEquals('Test Sneker', $added['name']);
    }

    public function testGetProductById() {
        $newProduct = [
            'name' => 'Test ID Sneaker',
            'price' => 123.45,
            'description' => 'Description for ID test',
            'image' => 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/IF0/IF0666-400/images/thumbs_900/IF0666-400_900_900px.jpg.webp',
            'brand' => 'IDBrand',
            'is_active' => 1
        ];
        $added = $this->service->add_product($newProduct);

        $product = $this->service->get_product_by_id($added['id']);
        $this->assertIsArray($product);
        $this->assertEquals($added['id'], $product['id']);
    }

    public function testUpdateProduct() {
        $newProduct = [
            'name' => 'Update Patika',
            'price' => 150.00,
            'description' => 'Opis prije updatea',
            'image' => 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/IF0/IF0666-400/images/thumbs_900/IF0666-400_900_900px.jpg.webp',
            'brand' => 'UpdateBrand',
            'is_active' => 1
        ];
        $added = $this->service->add_product($newProduct);

        $result = $this->service->update_product(
            $added['id'],
            'Update Done',
            149.99,
            'Description after update',
            1
        );
        $this->assertIsInt($result);
        $this->assertGreaterThanOrEqual(0, $result);
    }

    public function testDeleteProductById() {
        $newProduct = [
            'name' => 'Delete Patika',
            'price' => 111.11,
            'description' => 'Za brisanje',
            'image' => 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/IF0/IF0666-400/images/thumbs_900/IF0666-400_900_900px.jpg.webp',
            'brand' => 'DeleteBrand',
            'is_active' => 1
        ];
        $added = $this->service->add_product($newProduct);

        $deleted = $this->service->delete_product_by_id($added['id']);

        if ($deleted instanceof \PDOStatement) {
            $this->assertTrue($deleted->rowCount() >= 1);
        } else {
            $this->assertIsInt($deleted);
            $this->assertGreaterThanOrEqual(1, $deleted);
        }
    }
}
