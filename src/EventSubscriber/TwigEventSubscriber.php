<?php
namespace App\EventSubscriber;

 use App\Repository\ConferenceRepository;
 use Symfony\Component\EventDispatcher\EventSubscriberInterface;
 use Symfony\Component\HttpKernel\Event\ControllerEvent;
 use Twig\Environment;



class TwigEventSubscriber implements EventSubscriberInterface
{
     private $twig;

     public function __construct(Environment $twig)
     {
          $this->twig = $twig;
     }

     public function onKernelController(ControllerEvent $event)
     {
          $this->twig->addGlobal('menu', [

          [
               'name' => 'Главная',
               'path' => 'index',
          ]
          ]);
     }

     public static function getSubscribedEvents()
     {
          return [
               'kernel.controller' => 'onKernelController',
          ];
     }

}