<?php 
namespace OOP\App;

class Database{
  public static $conn = null;
  protected static $username = 'root';
  protected static $password = '';
  protected static $hostname = 'localhost';
  protected static $dbname = 'staditek_02';

  public function __construct()
  {
    Database::setConnection();
  }

  public static function setConnection(){
    self::$conn = new \PDO(
      "mysql:host=".self::$hostname.";dbname=".
      self::$dbname,
      self::$username,
      self::$password
    );

    self::$conn->setAttribute(\PDO::ATTR_ERRMODE,
    \PDO::ERRMODE_EXCEPTION);
  }

  public static function setConnection2(){
    self::$conn = new \PDO(
      "mysql:host=".self::$hostname.";dbname=".
      self::$dbname,
      self::$username,
      self::$password
    );

    self::$conn->setAttribute(\PDO::ATTR_ERRMODE,
    \PDO::ERRMODE_EXCEPTION);
  }
}

