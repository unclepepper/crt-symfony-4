<?php
namespace App\MessageHandler;

use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Messenger\Handler\MessageHandlerInterface;
use App\Message\ProductMessage;

class ProductMessageHandler implements MessageHandlerInterface
{
    private $em;
    private $productRepository;

    public function __construct(EntityManagerInterface $entityManager, ProductRepository $productRepository)
    {
        $this->em = $entityManager;
        $this->productRepository = $productRepository;
    }

    public function __invoke(ProductMessage $productMessage)
    {
        $product = $this->productRepository->find($productMessage->getId());

        if (!$product) {
            return;
        }
        $product->setIsShow(true);
        $this->em->flush();
    }
}
