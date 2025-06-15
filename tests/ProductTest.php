<?php
use PHPUnit\Framework\TestCase;
require_once __DIR__ . '/../utils/functions.php';

class ProductTest extends TestCase {
    public function testTotalPriceCalculation() {
        $result = calculateTotalPrice([10, 20, 30]);
        $this->assertEquals(60, $result);
    }

    public function testEmptyArrayReturnsZero() {
        $result = calculateTotalPrice([]);
        $this->assertEquals(0, $result);
    }

    public function testSingleItem() {
        $result = calculateTotalPrice([99.99]);
        $this->assertEquals(99.99, $result);
    }
}
