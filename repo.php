<?php

/*

$link = mysqli_connect('localhost', 'root', '', 'repo');
if($link->connect_error){
   echo "Desconectado! Erro: " . $link->connect_error;
}else{
   echo "Conectado!<br>";
}




*/

  
      $conn = new PDO('mysql:host=localhost;dbname=repo','root', '');
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
      $data = $conn->query('SELECT * FROM trabalhos');
  
      $data->execute();

      $results = $data->fetchAll(PDO::FETCH_ASSOC);
      echo json_encode($results);


    
     /* $con=mysqli_connect('localhost','root','','repo');
      if (mysqli_connect_errno())
      {
      echo "Connection Error" . mysqli_connect_error();
      }
      $query = "SELECT * FROM trabalhos";
      $result = mysqli_query($con,$query);
      $querydata = array();

      while($data = mysqli_fetch_array($result)) {
      	$querydata[] = $data;
      }
      echo json_encode($querydata);   
      mysqli_close($con);*/
      ?>


