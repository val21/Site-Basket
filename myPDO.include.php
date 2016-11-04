<?php

require_once 'myPDO.class.php' ;

myPDO::setConfiguration('mysql:host=mysql;dbname=infs3_prj17;charset=utf8', 'infs3_prj17', 'basket17') ;

$pdo = myPDO::getInstance() ;

//myPDO::hasConfiguration();

/*
$stmt = $pdo->prepare(<<<SQL
    SELECT name
    FROM artist
    ORDER BY name
SQL
) ;

$stmt->execute() ;

while (($ligne = $stmt->fetch()) !== false) {
        echo "<p>{$ligne['name']}\n" ;
}
*/
