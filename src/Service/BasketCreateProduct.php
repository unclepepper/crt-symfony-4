<?php
namespace App\Service;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Basket;
use App\Entity\Product;
use App\Service\BasketChangeProduct;


class BasketCreateProduct
{
    private ProductRepository $doctrine;
    private EntityManagerInterface $entityManager;

    public function __construct(ProductRepository $doctrine, EntityManagerInterface $entityManager)
    {
        $this->doctrine = $doctrine;
        $this->entityManager = $entityManager;
    }
    public function addBasket(Request $request):?int
    {
        if ($request->getMethod() == Request::METHOD_POST) {
            $quantity = $request->request->get('quantity');
            $product_id = $request->request->get('product_id');
            $price_product= $request->request->get('price_product');
            $product = $this->doctrine->findOneBy(['id' => $product_id]);
            
            $basket = (new Basket())
                ->setQuantity($quantity)
                ->setPriceOne($price_product)
                ->setPriceTotal($price_product * $quantity)
                ->setProductId($product)
                ;
        
            $this->entityManager->persist($basket);
            $this->entityManager->flush();
        }
        return $product_id;
    }
}
