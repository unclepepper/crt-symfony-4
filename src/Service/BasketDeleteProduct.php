<?php
namespace App\Service;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\BasketRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Basket;
use App\Entity\Product;

class BasketDeleteProduct
{
    public function deleteBasket(EntityManagerInterface $entityManager, BasketRepository $doctrine, $id):void
    {
        $basket= $doctrine->findOneBy(['id' => $id]);

        $entityManager->remove($basket);
        $entityManager->flush();
    }
}
