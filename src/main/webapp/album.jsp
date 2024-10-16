<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="it.generationitaly.musicator.entity.Album"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Album</title>
		 <!-- Bootstrap css -->
 		 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      	 integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
		 <!-- Bs Icons -->
	     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
		 <!-- css locali -->
    	 <link rel="stylesheet" href="style2.css">
		<!-- Import Font Awesome -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	    <!-- Swiper css -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>
<%
List<Album> albums = (List<Album>) request.getAttribute("albums");
%>
<%@ include file="nav.jsp" %>

<div class="container">
<div class="container min-vh-10 d-flex  justify-content-center mt-5">
		
		<div class="input-group mb-3">
			<form action="ricerche_specifiche" method="get" class="input-group mb-3">
			  <input type="text" class="form-control" name="album" style="border-radius:30px" placeholder="Cerca il tuo album preferito" aria-label="Recipient's username" aria-describedby="button-addon2">
			 <!--   <button class="btn btn-outline-secondary" type="button" id="button-addon2">Cerca</button>-->
			 </form>
			</div>
		
		</div>
		
	
<div class="container min-vh-10 d-flex  justify-content-center mt-5">
<div class="row">
<div class="col-4">
 <% if (albums != null && !albums.isEmpty()){
for (Album album : albums){%> 
<div class="card"style="width: 18rem; ">
<img src="<%=album.getFoto() %>" class="card-img-top" alt="...">
 <div class="card-body">
 <a class="card-title h5" href="artista?id=<%= album.getId() %>"><%= album.getTitolo() %>
 
   <h5 style="text-align:center;" class="card-title"><%= album.getTitolo() %></h5>
   </a>
   <p style="color:black;text-align:center;" class="card-text "><%= album.getArtista() %></p>
   </div>
   
   </div>

<%} %>
<%}else{ %>
 <span>nessun brano</span>
 <%} %>

 
  
   
   
   
  </div>
  </div>
  
  </div>
  
  

<!--  
<div class="col-4">
<a style=" color:black;text-decoration:none;"href="dettaglio-album.jsp" >
<div class="card"style="width: 18rem; ">
  <img src="data:image/jpeg;base64,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" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 style="text-align:center" class="card-title"> Dangerous Woman </h5>
    <p style="color:black;text-align:center" class="card-text">Ariana Grande</p>
    </a>
  </div>
</div>
</div>
<div class="col-4">
<a style="color:black;text-decoration:none;"href="#" >
<div class="card"style="width: 18rem; ">
  <img src="data:image/jpeg;base64,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" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 style="text-align:center" class="card-title"> Lover </h5>
    <p style="color:black;text-align:center" class="card-text">Taylor Swift</p>
    </a>
  </div>
</div>
</div>
</div>
</div>
-->
</div>
<footer class="footer bg-light text-center py-3">
		        <div class="container">
		            <p class="text-muted">© 2024 Musicator. Tutti i diritti riservati.</p>
		        </div>
		    </footer>

				
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <!-- Swiper JS library -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <!-- headroom JS library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/headroom/0.12.0/headroom.min.js" integrity="sha512-9UsrKTYzS9smDm2E58MLs0ACtOki+UC4bBq4iK5wi7lJycwqcaiHxr1bdEsIVoK0l5STEzLUdYyDdFQ5OEjczw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- AOS JS library-->
    <!-- <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/3.0.0-beta.6/aos.js" integrity="sha512-tnNM6PPNOVfZ5sGPw6hThCrcUBeqt2mVEk3EAj8tCtuMHqbuVm5/HsZagrr8W2aaFE+6rKIByGwQbEnmodrYVg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- Script locali -->
    <script src="assets/javascript/bs5.js"></script>
	<!-- Bootstrap Js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.List" %>
<%@page import= "it.generationitaly.musicator.entity.Album" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Album</title>
		<link rel="stylesheet" type="text/css" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="style2.css">
		
			<style>
			.card {
				width: 18rem; 
				height: 20rem; 
				
			.card-img-top {
				height: 15rem; 
				object-fit: cover; 
			}
			.card-body {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
			}
		</style>
		
	</head>
	
	<body>
		<%List<Album> albums = (List<Album>) request.getAttribute("albums"); %>
		<%@ include file="nav.jsp" %>
		
		<div class="container min-vh-10 d-flex  justify-content-center mt-5">
		
			 <!-- Barra di Ricerca -->
			<div class="input-group mb-3">
			<form action="ricerche_specifiche" method="get" class="input-group mb-3">
			  <input type="text" class="form-control" name="album" style="border-radius:30px" placeholder="Cerca il tuo album preferito" aria-label="Recipient's username" aria-describedby="button-addon2">
			 <!--   <button class="btn btn-outline-secondary" type="button" id="button-addon2">Cerca</button>-->
			 </form>
			</div>
			<!-- Fine Barra di Ricerca -->	
		</div>
			
			<div class="container">
			<!-- inizio card -->
			<div class="row row-cols-1 row-cols-md-3 g-4">
			<%for(Album album : albums) {%>
			  <div class="col-md-4 d-flex justify-content-center mb-3">
			  
			    <div class="card">
			      <img src="<%= album.getFoto() %>" class="card-img-top" alt="..." >
			      <div class="card-body text-center">
			        <a style="text-decoration:none"class="card-title h5" href="album?id=<%= album.getId() %>"><%= album.getTitolo() %></a>
			      </div>
			    </div>
			  </div>
			  <%} %>
		</div>
		
		<%@ include file="footer.jsp" %>
		
		<script type="text/javascript" src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
	</body>
>>>>>>> branch 'master' of https://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@github.com/AleSasso06/Musicator
</html>