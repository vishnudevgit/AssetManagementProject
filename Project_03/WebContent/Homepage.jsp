<html>
   <link rel="stylesheet" type="text/css" href="css/page.css">
   <head>
      <title>navigation</title>
   </head>
   <body >
      <!-- style="background-color: #666;" -->
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
      <div class="bg-text">
         <h1>Welcome <%= session.getAttribute("username") %></h1>
      </div>
   </body>
</html>