<?php
namespace OOP\App;

class headerTrxController{

  public $header;

  public function __construct()
  {
   $this->header= new headerTrx(); 
  }

  public function index(){
    print_r($this->header->all());
  }

  public function show($id)
  {
    echo json_encode($this->header->findArr($id));
  }

  public function add()
  {
     $insert = array (
    'id_hdr' => 5,
    'hdr_id_branch' => 4,
    'hdr_id_cashier' =>2,
    'date_time' => date('Y-m-d H:i:s'),
    'discount_total' => '20000',
    'total' => 5,
    'total_price' =>200000,
    'payment' => 250000,
    'change_01' => 50000,
    'create_at' => null,
    'update_at' => null
  );
    print_r($this->header->insert($insert));
  }

  public function update($id)
  {
    $update = array (
    'id_hdr' => 5,
    'hdr_id_branch' => 4,
    'hdr_id_cashier' =>2,
    'date_time' => date('Y-m-d H:i:s'),
    'discount_total' => '20000',
    'total' => 5,
    'total_price' =>999999,
    'payment' => 250000,
    'change_01' => 50000,
    'created_at' => null,
    'update_at' => null
  );
    print_r($this->header->insert($update,$id));
  }

  public function delete($id)
  {
    // $delete = array (
    //   'id_hdr' => 5
    // );
    // print_r($this->header->delete($delete));
    print_r($this->header->delete($id));

  }
}