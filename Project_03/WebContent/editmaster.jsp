<%@page import="com.ignite.jdbcdao.Asset_MasterJdbcDao"%>
<%@page import="com.ignite.beans.Asset_Master"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%  
   if(session.getAttribute("username")!=null){
   if(request.getMethod().equalsIgnoreCase("get")){
   	int am_id = Integer.parseInt(request.getParameter("am_id"));
   	Asset_Master asset_master = new Asset_MasterJdbcDao().find(am_id);
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" type="text/css" href="css/page.css">
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Edit Master Details</title>
   </head>
   <body>
      <nav>
         <ul>
            <li class="dropdown">
               <a href="Homepage.jsp" class="dropbuton">Home</a>
               <div class="ddc">
                  <a href="##"></a>
                  <a href="###"></a>
               </div>
            </li>
            <li class="dropdown">
               <a href="#" class="dropbuton">Asset Management</a>
               <div class="ddc">
                  <a href="asset.jsp">Asset Details</a>                  
                  <a href="vendor.jsp">Vendor Creation</a>
                  <a href="Purchase.jsp">Purchase Order Creation</a>
                  <a href="asset_master.jsp">Asset Definition</a>
               </div>
            </li>
            <li class="logout">
               <a href="logout" class="dropbuton">Logout</a>
            </li>
         </ul>
      </nav>
      <div class="container" style="margin-top: 0px;">
         <form method="POST">
            <div class="row">
               <div class="col-25">
                  <label for="country">Select a Type</label>
               </div>
               <div class="col-75">
                  <Select name="am_type" size="1" id="am_type">
                     <option selected value="0" hidden disabled="disabled"><%= asset_master.getAm_type() %></option>
                     <option value="Mobile">Mobile</option>
                     <option value="Thermal Printer">Thermal Printer</option>
                     <option value="Sensor"> Sensor</option>
                     <option value="Gateway">Gateway</option>
                     <option value="Laptop">Laptop</option>
                     <option value="Boom Barrier">Boom Barrier</option>
                  </Select>
               </div>
            </div>
            <div class="row">
               <div class="col-25">
                  <label for="maker">Maker Name</label>
               </div>
               <div class="col-75">
                  <Select name="am_make" size="1" id="am_make">
                     <option selected value="0" hidden disabled="disabled"><%= asset_master.getAm_make() %></option>
                     <option value="Samsung">Samsung</option>
                     <option value="MI">MI</option>
                     <option value=" Vivo"> Vivo</option>
                     <option value="Softland India">Softland India</option>
                     <option value="Mobio">Mobio</option>
                     <option value="ICOFSS">ICOFSS</option>
                     <option value="WiFi solutions">WiFi solutions</option>
                     <option value="Talent Services">Talent Services</option>
                  </Select>
               </div>
            </div>
            <div class="row">
               <div class="col-25">
                  <label for="model">Model</label>
               </div>
               <div class="col-75">
                  <select id="am_model" name="am_model">
                     <option selected disabled value="0" hidden ><%= asset_master.getAm_model()%></option>
                     <option value="Laptop">Laptop</option>
                     <option value="Mobile Charger">Mobile Charger</option>
                     <option value="Printer Charger">Printer Charger</option>
                     <option value="Geo Magnetic Sensor – Ground">Geo Magnetic Sensor – Ground</option>
                     <option value="LoRaGetway– Tata">LoRaGetway– Tata</option>
                     <option value="Mobile Phone">Mobile Phone</option>
                     <option value="Laser Printer – Colour">Laser Printer – Colour</option>
                     <option value="Desktop">Laptop</option>
                     <option value="Thermal Printer">Laptop</option>
                     <option value="Lora Getaway - ICFOSS">Laptop</option>
                  </select>
               </div>
            </div>
            <div class="row">
               <div class="col-25">
                  <label for="slno">Serial number*</label>
               </div>
               <div class="col-75">
                  <input type="text" name="am_snumber" placeholder="<%= asset_master.getAm_snumber()%>" id="am_snumber" autofocus="autofocus" value required><br>
               </div>
            </div>
            <div class="row">
               <div class="col-25">
                  <label for="Makeyear">Make Year*</label>
               </div>
               <div class="col-75">
                  <input type="text" name="am_myear" id="am_myear" placeholder="<%= asset_master.getAm_myear()%>" autofocus="autofocus" value required><br>
               </div>
            </div>
            <div class="row">
               <div class="col-25">
                  <label for="country">Purchase Date</label>
               </div>
               <div class="col-75">
                  <input type="date" name="am_pdate" id="am_pdate" placeholder="<%= asset_master.getAm_pdate()%>" required><br><br>
               </div>
            </div>
            <div class="row">
               <div class="col-25">
                  <label for="warranty">Warranty months*</label>
               </div>
               <div class="col-75">
                  <input type="text" name="am_warranty" id="am_warranty" placeholder="<%= asset_master.getAm_warranty()%>" autofocus="autofocus" value required><br>
               </div>
            </div>
            <div class="row">
               <div class="col-25">
                  <label for="am_from">Warranty from</label>
               </div>
               <div class="col-75">
                  <input type="date" name="am_from" id="am_from" placeholder="mm/dd/yyyy" required><br><br>
               </div>
            </div>
            <div class="row">
               <div class="col-25">
                  <label for="am_to">Valid to</label>
               </div>
               <div class="col-75">
                  <input type="date" name="am_to" placeholder="mm/dd/yyyy" required><br><br>
                  <div class="col" style="width: 200%; margin-top: 35px;margin-left:500; height: 10px; ">
                     <input type="submit" value="Update">
                  </div>
               </div>
            </div>
         </form>
      </div>
   </body>
</html>
<%
   }
   if(request.getMethod().equalsIgnoreCase("post")){
   	
   	%>
<jsp:useBean id="asset_master" class="com.ignite.beans.Asset_Master" scope="request"/>
<jsp:setProperty property="*" name="asset_master"/>
<jsp:forward page="updatemaster"/>
<%
   }
   }
   else{
   	response.sendRedirect("Login.jsp");
   }
 %>