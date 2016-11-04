<?php

require_once 'myPDO.include.php';

function connexion($email, $mdp){
    $pdo = myPDO::getInstance() ;
    $stmt = $pdo->prepare(<<<SQL
          SELECT EMAIL, MDP, IDUSER
          FROM UTILISATEUR
          WHERE EMAIL = :email
            AND MDP = :mdp
            AND IDUSER = IDUSER
SQL
  );
    $stmt->setFetchMode(PDO::FETCH_CLASS, "Connexion");
      $stmt->execute(array(":email" => $email, ":mdp" => $mdp)) ;
      $res = $stmt->fetch();
      if($res == false){
          //throw new Exception("inexistant");
      }
      return $res;
}
