<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.musicator.entity.*"%>
<%@ page import ="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Musicator - Album</title>
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
	    
	    <style>
        /* Imposta una larghezza fissa per tutte le card */
        .song-card {
            width: 550px; /* Definisci una larghezza fissa per garantire uniformità */
            opacity: 0.7;
            transition: opacity 0.5s ease;
        }

        .card-body {
            text-align: center; /* Allinea il testo al centro */
        }

        .btn-play {
            font-size: 1.5rem;
            color: #C2185B;
        }

        /* Aggiungi margine negativo per alzare l'immagine */
        .album-img {
            margin-top: -50px;
        }

        /* Centra il titolo */
        .album-title {
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="nav.jsp" %>

<%Album album = (Album) request.getAttribute("album"); %>
<% List <Brano> brani = album.getBrano(); %>
		
		<!-- Inizio Logo -->
	        <div class="svg-container mt-3">
	           <img alt="" src="images/header Brano.svg"  style="opacity: 0.7; transition: opacity 0.3s ease;">
	        </div>
        <!-- Fine Logo -->
		
		<div class="container mt-5">
		    <div class="row justify-content-center text-center">
		        <div class="col-md-4">
		            <!-- Immagine dell'album -->
		            <img src="<%=album.getFoto() %>" alt="Album image" class="img-thumbnail album-img" style="max-width: 100%; width:300px; height:300px;">
		            
		            <!-- Titolo dell'album centrato sotto l'immagine -->
		            <h1 class="display-4 text-light mt-3 album-title">
		                <b><%= album.getTitolo() %></b>
		            </h1>
		        </div>
		    </div>
		</div>
		
		<div class="container mt-5">
			<div class="row">
		        <!-- Dettagli dell'album -->
		        <div class="col-md-8">
		            <div class="col-md-4">
		                <img src="<%=album.getArtista().getFoto() %>" alt="Album image" class="img-thumbnail rounded song-img rounded-circle" style="max-width: 100%;">
		            </div>
		
		            <ul style="list-style-type: none; color: white; text-align: justify; padding: 0;">
		                <li><b>Artista:</b> <%= album.getArtista().getPseudonimo() %></li>
		                <li><b>Genere:</b> <%= album.getGenere().getNome() %></li>
		                <li><b>Durata:</b> <%= album.getDurata() %></li>
		                <li><b>Data di Uscita:</b> <%= album.getDataUscita() %></li>
		                <li><b>Descrizione:</b> <%= album.getDescrizione() %></li>
		                <li><%= album.getBrano().size() %> brani</li>
		            </ul>
		        </div>
		    </div>
		</div>
		
		<div class="container min-vh-10 d-flex justify-content-center mt-5">
		    <h1 style="color:white"> Elenco brani</h1>
		</div>
		
		<!-- Griglia delle card -->
		<div class="row justify-content-center">
		    <% if (!brani.isEmpty()) { %>
		        <% for (Brano brano : brani) { %>
		            <div class="col-12 mb-3 d-flex justify-content-center">
		                <div class="card song-card">
		                    <div class="row no-gutters align-items-center">
		                        <div class="col-auto">
		                            <img src="<%= brano.getAlbum().get(0).getFoto() %>" height="110" class="rounded song-img" alt="...">
		                        </div>
		                        <div class="col">
		                            <div class="card-body p-2">
		                                <a class="card-title h5" href="brano?id=<%= brano.getId() %>">
		                                    <h5 class="card-title text-start"><%= brano.getTitolo() %></h5>
		                                </a>
		                                <h6 class="card-title text-start"><%= new java.text.SimpleDateFormat("dd-MM-yyyy").format(brano.getDataUscita()) %></h6>
		                            </div>
		                        </div>
		                        <div class="col-auto">
		                            <a class="btn btn-play" href="<%= brano.getYtLink() %>">
		                                <i class="bi bi-play-circle-fill"></i>
		                            </a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        <% } %>
		    <% } else { %>
		        <p>Nessun brano trovato.</p>
		    <% } %>
		</div>

<%@ include file="footer.jsp" %>

<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<!-- Swiper JS library -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- headroom JS library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/headroom/0.12.0/headroom.min.js" integrity="sha512-9UsrKTYzS9smDm2E58MLs0ACtOki+UC4bBq4iK5wi7lJycwqcaiHxr1bdEsIVoK0l5STEzLUdYyDdFQ5OEjczw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="assets/javascript/bs5.js"></script>
<!-- Bootstrap Js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
