 <%@page import="com.ignite.jdbcdao.Asset_MasterJdbcDao"%>
<%@page import="com.ignite.beans.Asset_Master"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%
	if (session.getAttribute("username") != null) {
		ArrayList<Asset_Master> asset_masters = (ArrayList)new Asset_MasterJdbcDao().findAll();
		if (request.getMethod().equalsIgnoreCase("get")) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/page.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Asset_master</title>
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
            
            <li class="dropdown" style="margin-left: 5%;">
            <!-- calling the user -->
                <a href="#" class="dropbuton">Welcome   <%= session.getAttribute("username") %></a>
            </li>
            <li class="dropdown" style="margin-left: 40%;">
                <a href="logout" class="dropbuton">Logout</a>
            </li>
        </ul>
    </nav>
    <div class="container" style="margin-top: 10px;">
  <form method="POST">
  
    <div class="row">
      <div class="col-25">
        <label for="country">Select a Type</label>
      </div>
      <div class="col-75">
      	<Select name="am_type" size="1" id="am_type">
    <option selected value="0" disabled="disabled">Select a Asset Type</option>
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
    <option selected value="0" disabled="disabled">Select a  Maker</option>
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
        <option selected disabled hidden>select</options>
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
    
       <input type="text" name="am_snumber" placeholder="Enter Serialno" id="am_snumber" autofocus="autofocus" value required><br>
        
        </div>
    </div>
    
    
     <div class="row">
      <div class="col-25">
        <label for="Makeyear">Make Year*</label>
      </div>
      <div class="col-75">
    
       <input type="text" name="am_myear" id="am_myear" placeholder="Enter Year of model" autofocus="autofocus" value required><br>
        
        </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="country">Purchase Date</label>
      </div>
      <div class="col-75">
      
       <input type="date" name="am_pdate" id="am_pdate" placeholder="mm/dd/yyyy" required><br><br>
        
        </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="warranty">Warranty months*</label>
      </div>
      <div class="col-75">
    
       <input type="text" name="am_warranty" id="am_warranty" placeholder="Enter no of yearsof warranty" autofocus="autofocus" value required><br>
        
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
    <input type="submit" value="Submit">
 	</div>
    
        </div>
        
        
        
        
    </div>
    </form>
		</div>
		
		   
		
		
		
<div class="container" style="margin-top: 5px" style="margin-left:5px" style="margin-right:5px">
<div align="center">
	<h2>List of Assets</h2>
	<table border="1" cellpadding="1" cellspacing="0" align="center">
		<tr>
			<th>id</th>
			<th>Type</th>
			<th>Maker</th>
			<th>Model</th>
			<th>Slno</th>
			<th>Year</th>
			<th>PurchaseDate</th>
			<th>Warranty Years</th>
			<th>Warranty From</th>
			<th>Warranty To</th>
			<th>Operation</th>
		</tr>
		<%
	for(Asset_Master asset_master : asset_masters){
	%>
	
	<tr>
	<td><%= asset_master.getAm_id() %></td>
	<td><%= asset_master.getAm_type() %></td>
	<td><%= asset_master.getAm_make() %></td>
	<td><%= asset_master.getAm_model() %></td>
	<td><%= asset_master.getAm_snumber() %></td>
	<td><%= asset_master.getAm_myear() %></td>
	<td><%= asset_master.getAm_pdate() %></td>
	<td><%= asset_master.getAm_warranty() %></td>
	<td><%= asset_master.getAm_from() %></td>
	<td><%= asset_master.getAm_to() %></td>
	<td>
	<a href="editmaster.jsp?am_id=<%=asset_master.getAm_id()%>">Edit</a> |
	<a href="deletemaster?am_id=<%=asset_master.getAm_id()%>">Delete</a>
    </td>
	</tr>
	<%
	}
	%>
	</table>
</div>
</div>


</body>
</html>
<%
		} 
	if (request.getMethod().equalsIgnoreCase("POST")) {  
		%>
		<jsp:useBean id="asset_master" class="com.ignite.beans.Asset_Master" scope="request"/>
		<jsp:setProperty property="*" name="asset_master"/>
		<jsp:forward page="asset_maste"/>
		
		<%
	}
	}
	else { 
		response.sendRedirect("Login.jsp");
	}
	%>