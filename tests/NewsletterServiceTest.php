<?php

use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/../backend/rest/services/NewsletterService.class.php';

class NewsletterServiceTest extends TestCase {

  public function testSubscribeCallsDaoAdd() {
    $dummySubscriber = ['email' => 'test@example.com'];

    $mockDao = $this->createMock(NewsletterDao::class);
    $mockDao->expects($this->once())
            ->method('add')
            ->with($dummySubscriber)
            ->willReturn(['id' => 1, 'email' => 'test@example.com']);

    $service = new NewsletterService();

    $reflection = new ReflectionClass($service);
    $property = $reflection->getProperty('newsletter_dao');
    $property->setAccessible(true);
    $property->setValue($service, $mockDao);

    $result = $service->subscribe($dummySubscriber);
    $this->assertEquals(['id' => 1, 'email' => 'test@example.com'], $result);
  }
}
