<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Basket;
use App\Entity\Product;
use App\Repository\BasketRepository;
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
    public function addBasket(Request $request, EntityManagerInterface $entityManager):Response
    {
      
        
        if ($request->getMethod() == Request::METHOD_POST){
            
            $quantity = $request->request->get('quantity');
            $product_id = $request->request->get('product_id');
            $price_product= $request->request->get('price_product');
            

            $basket = new Basket();
            $basket->setQuantity($quantity);
            $basket->setPriceOne($price_product);
            $basket->setPriceTotal($price_product * $quantity);
            
                     
        }
         $entityManager->persist($basket);
        $entityManager->flush($basket);
        return $this->redirectToRoute('product', ['id' => $product_id]);
        

        
    }

       
    
}
