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
    public function addBasket(Request $request, EntityManagerInterface $entityManager, ProductRepository $doctrine):?int
    {
        if ($request->getMethod() == Request::METHOD_POST) {
            $quantity = $request->request->get('quantity');
            $product_id = $request->request->get('product_id');
            $price_product= $request->request->get('price_product');
            $product = $doctrine->findOneBy(['id' => $product_id]);
            
            $basket = (new Basket())
                ->setQuantity($quantity)
                ->setPriceOne($price_product)
                ->setPriceTotal($price_product * $quantity)
                ->setProductId($product)
                ;
        
            $entityManager->persist($basket);
            $entityManager->flush();
        }
        return $product_id;
    }
}
