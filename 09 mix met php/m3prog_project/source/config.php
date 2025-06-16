<?php

$file = "../.env";
if(! file_exists($file))
{

    die("geen .env bestand gevonden");
}

$envSettings = parse_ini_file($file);

define('DB_SCHEMA_NAME',(isset($envSettings['DB_SCHEMA_NAME'])) ? $envSettings['DB_SCHEMA_NAME']:"not set");
define('DB_USER',(isset($envSettings['DB_USER'])) ? $envSettings['DB_USER']:"not set");
define('DB_PASSWORD',(isset($envSettings['DB_PASSWORD'])) ? $envSettings['DB_PASSWORD']:"not set");
define('DB_HOST',(isset($envSettings['DB_HOST'])) ? $envSettings['DB_HOST']:"not set");