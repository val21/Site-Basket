<?php

class User {

  $_id = null;
  $_email = null;
  $_pswd = null;
  $_lastName = null;
  $_firstName = null;

  // Niveau d'autorisation de l'utilisateur.
  $_autLvl = null;

public function __construct($email, $pswd, $lastName, $firstName){
  $this->_email = $email;
  $this->_pswd = $pswd;
  $this->_lastName = $lastName;
  $this->_firstName = $firstName;
}














}

?>
