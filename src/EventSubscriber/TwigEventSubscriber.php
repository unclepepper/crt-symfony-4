<?php
namespace App\EventSubscriber;

 use App\Repository\BasketRepository;
 use App\Repository\ConferenceRepository;
 use Symfony\Component\EventDispatcher\EventSubscriberInterface;
 use Symfony\Component\HttpKernel\Event\ControllerEvent;
 use Twig\Environment;
 use App\Service\BasketTotalPosition;

 class TwigEventSubscriber implements EventSubscriberInterface
 {
     private $twig;
     private $totalPosition;

     public function __construct(Environment $twig, BasketTotalPosition $totalPosition)
     {
         $this->twig = $twig;
         $this->totalPosition = $totalPosition;
     }

     public function onKernelController(ControllerEvent $event)
     {
         
         $this->twig->addGlobal('count', $this->totalPosition->totalBasket());
     }

     public static function getSubscribedEvents()
     {
         return [
               'kernel.controller' => 'onKernelController',
          ];
     }
 }
