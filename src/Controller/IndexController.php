<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends AbstractController
{
    #[Route('/', name: 'homepage')]
    public function index(ProductRepository $doctrine): Response
    {
        
        $product = $doctrine->findAll();
        return $this->render('index/index.html.twig', [
            'product' => $product,
            
        ]);
    }
    
}
