<?php

require_once 'connexion.php';

$email = 'azerty@gmail.com';
$mdp = 'azerty';
$co = connexion($email, $mdp);
$res = 'false';
    if($co[0] == $email && $co[1] == $mdp){
        $res = 'true';
    }
echo $res;
    