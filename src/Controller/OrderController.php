<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Order;
use App\Form\OrderType;
use App\Repository\BasketRepository;

class OrderController extends AbstractController
{
    #[Route('/order', name: 'order')]
    public function index(BasketRepository $basketDoctrine): Response
    {
        $baskets = $basketDoctrine->findAll();
        $order = new Order();
        $form = $this->createForm(OrderType::class, $order);
       
        return $this->render('order/index.html.twig', [
            'form' => $form->createView(),
            'baskets' => $baskets,
        ]);
    }
    
}
