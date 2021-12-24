<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProductRepository;

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
}
