<%@page import="com.ignite.jdbcdao.Purchase_DetJdbcDao"%>
<%@page import="com.ignite.beans.Purchase_Det"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%  
   if(session.getAttribute("username")!=null){
   if(request.getMethod().equalsIgnoreCase("get")){
   	int pd_id = Integer.parseInt(request.getParameter("pd_id"));
   	Purchase_Det purchase_det = new Purchase_DetJdbcDao().find(pd_id);
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" type="text/css" href="css/page.css">
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Edit Purchase</title>
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
         <h2 align ="center">Edit Purchase Details </h2>
         <div class="row">
            <div class="col-25">
               <label for="country">Purchase Order</label>
            </div>
            <div class="col-75">
               <div class="col-65">
                  <input type="text" name="pd_order" placeholder="<%= purchase_det.getPd_order()%>" autofocus="autofocus" value required><br>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-25">
               <label for="ad_type">Purchase type</label>
            </div>
            <div class="col-75">
               <select id="pd_type" name="pd_type">
                  <option selected disabled hidden value="0"><%= purchase_det.getPd_type()%></options>
                  <option value="Laptop">Laptop</option>
                  <option value="Mobile Charger">Mobile Charger</option>
                  <option value="Printer Charger">Printer Charger</option>
                  <option value="Geo Magnetic Sensor â Ground">Geo Magnetic Sensor â Ground</option>
                  <option value="LoRaGetwaya Tata">LoRaGetwaya Tata</option>
                  <option value="Mobile Phone">Mobile Phone</option>
                  <option value="Laser Printer â Colour">Laser Printer â Colour</option>
                  <option value="Desktop">Laptop</option>
                  <option value="Thermal Printer">Laptop</option>
                  <option value="Lora Getaway - ICFOSS">Laptop</option>
               </select>
            </div>
         </div>
         <div class="row">
            <div class="col-25">
               <label for="country">Purchase Quantity</label>
            </div>
            <div class="col-75">
               <div class="col-65">
                  <input type="text" name="pd_qty" placeholder="<%= purchase_det.getPd_qty()%>" autofocus="autofocus" value required><br>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-25">
               <label for="country">Vendor Name</label>
            </div>
            <div class="col-75">
               <select id="pd_vendor" name="pd_vendor">
                  <option selected disabled hidden value="0"><%= purchase_det.getPd_vendor()%></options>
                  <option value="Samsung">Samsung</option>
                  <option value="MI">MI</option>
                  <option value="Vivo">Vivo</option>
                  <option value="GSoftland India">Softland India</option>
                  <option value="LoRaGetwayâ Tata">LoRaGetwayâ Tata</option>
                  <option value="Mobio">Mobio</option>
                  <option value="ICOFSS">ICOFSS</option>
                  <option value="WiFi solutions">WiFi solutions</option>
                  <option value="TTalent Services">Talent Services</option>
               </select>
            </div>
         </div>
         <div class="row">
            <div class="col-25">
               <label for="country">Order Date</label>
            </div>
            <div class="col-75">
               <div class="col-65">
                  <input type="date" name="pd_date" placeholder="mm/dd/yy" required><br><br>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-25">
               <label for="country">Delivery Date</label>
            </div>
            <div class="col-75">
               <div class="col-65">
                  <input type="date" name="pd_ddate" placeholder="mm/dd/yy" autofocus="autofocus"required><br><br>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-25">
               <label for="country">Purchase Status</label>
            </div>
            <div class="col-75">
               <select id="pd_status" name="pd_status">
                  <option selected disabled hidden selected="0"><%= purchase_det.getPd_status()%></options>
                  <option value="PO - Raised with Supplier">PO - Raised with Supplier</option>
                  <option value="Awaiting Delivery by Supplier">Awaiting Delivery by Supplier</option>
                  <option value="Consignment Received">Consignment Received</option>
                  <option value="Asset Details registered internally">Asset Details registered internally</option>
                  <option value="Asset Allocated to Resources">Asset Allocated to Resources</option>
                  <option value="Mobio">Mobio</option>
                  <option value="Identified Faulty">Identified Faulty</option>
                  <option value="Replaced - Repaired">Replaced - Repaired</option>
               </select>
            </div>
         </div>
         <div class="col" >
            <input type="submit" value="Update">
            <input type="reset" value="Cancel">
         </div>
      </div>
   </body>
</html>
<%
   }
   if(request.getMethod().equalsIgnoreCase("post")){
   	
   	%>
<jsp:useBean id="purchase_det" class="com.ignite.beans.Purchase_Det" scope="request"/>
<jsp:setProperty property="*" name="purchase_det"/>
<jsp:forward page="updatepurchase"/>
<%
   }
   }
   else{
   	response.sendRedirect("Login.jsp");
   }
   %>