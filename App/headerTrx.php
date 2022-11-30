<?php
namespace OOP\App;

class headerTrx extends Database{
  public function all(){
    $statement = self::$conn->prepare("select * from header_trx");
    $statement->execute();
    print_r($statement);
    return $statement->fetchAll(\PDO::FETCH_OBJ);
  }

  public function findObj($id_hdr)
  {
  $statement = self::$conn->prepare("select * from header_trx where id_hdr=$id_hdr");
  $statement->execute();
  return $statement->fetch(\PDO::FETCH_OBJ);
  }

  public function findArr($id_hdr)
  {
    $statement = self::$conn->prepare("select * from header_trx where id_hdr=$id_hdr");
    $statement->execute();
    return $statement->fetch();
  }

  public function insert($data)
  {
    $statement = self::$conn->prepare(
    "insert into header_trx
    values
    (
    :id_hdr,
    :hdr_id_branch,
    :hdr_id_cashier,
    :date_time,
    :discount_total,
    :total,
    :total_price,
    :payment,
    :change_01,
    :created_at,
    :update_at)
    ");
    return $statement->execute($data);
  }

  public function update($data)
  {
    $statement = self::$conn->prepare(
    "update header_trx
    set
    hdr_id_branch=:hdr_id_branch,
    hdr_id_cashier=:hdr_id_cashier,
    date_time=:date_time,
    discount_total=:discount_total,
    total=:total,
    total_price=:total_price,
    payment=:payment,
    change_01=:change_01,
    created_at=:created_at,
    update_at=:update_at
    where id_hdr =:id_hdr
    ");
    return $statement->execute($data);
  }

  public function delete($data)
  {
    $statement = self::$conn->prepare(
    "delete from header_trx
    where id_hdr =:id_hdr
    ");
    return $statement->execute($data);
  }
}

try {
  $headerTrx = new headerTrx();
  // print_r($headerTrx->index());
  // $data = $headerTrx->findObj(1);
  // echo $data->date_time;
  // $data2 = $headerTrx->findArr(1);
  // echo $data2['date_time'];
  // // var_dump((object) $data2);

  // $insert = array (
  //   'id_hdr' => 5,
  //   'hdr_id_branch' => 4,
  //   'hdr_id_cashier' =>2,
  //   'date_time' => date('Y-m-d H:i:s'),
  //   'discount_total' => '20000',
  //   'total' => 5,
  //   'total_price' =>200000,
  //   'payment' => 250000,
  //   'change_01' => 50000,
  //   'create_at' => null,
  //   'update_at' => null
  // );
  // $headerTrx->insert($insert);

  // $update = array (
  //   'id_hdr' => 5,
  //   'hdr_id_branch' => 4,
  //   'hdr_id_cashier' =>2,
  //   'date_time' => date('Y-m-d H:i:s'),
  //   'discount_total' => '20000',
  //   'total' => 5,
  //   'total_price' =>999999,
  //   'payment' => 250000,
  //   'change_01' => 50000,
  //   'created_at' => null,
  //   'update_at' => null
  // );
  // $headerTrx->update($update);
  $delete = array (
    'id_hdr' => 5
  );
  $headerTrx->delete($delete);
}
catch (\Throwable $th)
{
  throw $th;
}