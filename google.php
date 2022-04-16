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

?>

<!DOCTYPE html>
<html>
  <center>
    <header>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		
        <ul>
         <li><a class="links" href="#user"><button class="signbutton" type="button">Sign in</button></a></li>
           <li><a href="#grid"><img class="grid" src="navigation.webp" title="Google apps"></a></li>
          <li><a href="#images">Images</a></li>
          <li><a href="#gmail">Gmail</a></li>
          </ul>
          
          <style>
          
          ul {
  list-style-type: none;
  overflow: hidden;
}

li {
  float: right;
}

li a {
  color: #000;
  display: block;
  text-align: center;
  padding: 10px 10px;
  text-decoration: none;
  font-size:14px;
}
li a:hover {
  text-decoration: underline;
}
.grid{
  height:23px;
  position:relative;
  bottom:4px;
}
.signbutton{
  background-color: #4885ed;
  color: #fff;
  border:none;
  border-radius:3px;
  padding:7px 10px;
  position:relative;
  bottom:7px;
  font-weight:bold;
}
.logo{
  margin-top:80px;
  margin-bottom:20px;
}
.bar{
  margin:0 auto;
  width:575px;
  border-radius:30px;
  border:1px solid #dcdcdc;
}
.bar:hover{
  box-shadow: 1px 1px 8px 1px #dcdcdc;
}
.bar:focus-within{
  box-shadow: 1px 1px 8px 1px #dcdcdc;
  outline:none;
}
.searchbar{
  height:45px;
  border:none;
  width:500px;
  font-size:16px;
  outline: none;
  
}
.voice{
  height:20px;
  position:relative;
  top:5px;
  left:10px;
}
.buttons{
  margin-top:30px;
}
.button{
  background-color: #f5f5f5;
  border:none;
  color:#707070;
  font-size:15px;
  padding: 10px 20px;
  margin:5px;
  border-radius:4px;
  outline:none;
}
.button:hover{
  border: 1px solid #c8c8c8;
  padding: 9px 19px;
  color:#808080;
}
.button:focus{
  border:1px solid #4885ed;
  padding: 9px 19px;
}
          
          </style>
            
    </header>
    
 <form action="">
    
    <div class="logo">
      <img alt="Google" src="google.png">
    </div>
    <div class="bar">
      <input name="search" class="searchbar" type="text" title="Search" autofocus="autofocus">
    </div>
    <div class="buttons">
      <button class="button" type="submit">Google Search</button>
      <button class="button" type="button">I'm Feeling Lucky</button>
     </div>
     
 </form>  
   
  </body>

</html>
