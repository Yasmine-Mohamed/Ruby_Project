<?php

$output = file_get_contents('http://www.thomas-bayer.com/sqlrest/CUSTOMER/');

$convertedXML = simplexml_load_string($output);

//print data
echo "<ul>";
foreach($convertedXML as $key => $customer)
{
    echo '<li>' . $customer . '</li>';
}
echo "</ul>";
