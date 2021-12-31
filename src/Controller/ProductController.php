<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProductRepository;
use App\Repository\BasketRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Basket;
use App\Entity\Product;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use App\Service\BasketChangeProduct;
use App\Service\BasketCreateProduct;
use App\Service\BasketDeleteProduct;


class ProductController extends AbstractController
{
       
         
    #[Route('/product/{id}', name: 'product', requirements: ['id' => '\d+'])]
    public function index(ProductRepository $doctrine, $id): Response
    {
        $product = $doctrine->findOneBy(['id' => $id]);

        return $this->render('product/index.html.twig', [
            'product' => $product,
        ]);
    }
    
    #[Route('/product/addBasket', name: 'addBasket')]
    public function addBasket(BasketCreateProduct $basketCreate, Request $request, EntityManagerInterface $entityManager, ProductRepository $doctrine):Response
    {
        $product_id = $basketCreate->addBasket($request, $entityManager, $doctrine);
        return $this->redirectToRoute('product', ['id' => $product_id ]);
    }

    #[Route('/product/changeBasket', name: 'changeBasket')]
    public function changeBasket(BasketChangeProduct $basketChange, Request $request, EntityManagerInterface $entityManager, BasketRepository $doctrine):Response
    {
        $basketChange->changeBasket($request, $entityManager, $doctrine);
        return $this->redirectToRoute('basket');
    }

    #[Route('/product/deleteBasket/{id}', name: 'deleteBasket', requirements: ['id' => '\d+'])]
    public function deleteBasket(BasketDeleteProduct $basketDelete, EntityManagerInterface $entityManager, BasketRepository $doctrine, $id):Response
    {
        $basketDelete->deleteBasket($entityManager, $doctrine, $id);
        return $this->redirectToRoute('basket');
    }

       
    
    #[Route('/product/basket', name: 'basket')]
    public function basket(BasketRepository $doctrine): Response
    {
        $baskets = $doctrine->findAll();
        $title = 'Корзина';
        if (empty($baskets)) {
            $baskets = false;
            $title = 'Корзина пуста';
        }
       
       
        return $this->render(
            'basket/index.html.twig',
            [
              
                'baskets' => $baskets,
                'title' => $title,
               
            ]
        );
    }
}
