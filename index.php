<?php 
namespace OOP\App; 

require_once __DIR__ . '/vendor/autoload.php';
use OOP\App\headerTrxController;

 $controller = new headerTrxController;

 switch (@$_GET['page']){
  case 'show':
    $controller->show($_GET['id']);
    break;
    
    default:
    $controller->index();
    break;
 }