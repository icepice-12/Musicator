<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.musicator.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Musicator - Utente</title>
<!-- Bootstrap css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<!-- Bs Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- css locali -->
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

	<header>
		<%@ include file="nav.jsp"%>
	</header>

	<% utente = (Utente) session.getAttribute("utente"); %>
	<% List<Playlist> playlists = utente.getPlaylist(); %>

	<main class="overflow-hidden">

		<!-- Inizio Logo -->
		<div class="svg-container mt-3">
			<img alt="" src="images/header Brano.svg">
		</div>
		<!-- Fine Logo -->

		<div class="container mt-3">
			<!-- intestazione -->
			<div class="row d-flex align-items-center">

				<!-- inizio foto -->
				<div class="col-md-4">
					<picture> <img src="<%=utente.getFoto()%>"
						class="img-fluid img-thumbnail rounded-circle" alt="..."
						style="width: 300px; height: 300px; object-fit: cover; position: relative; right: -500px; top: -280px; z-index: 10;">
					</picture>
				</div>
				<!-- fine foto -->

				<!-- dati -->
				<div class="col-md-4 text-md-start  text-center">

					<!-- nome -->
					<h1 class="display-3 text-light text-center"
						style="position: relative; top: -50px;">
						<b> <%=utente.getUsername()%></b>
					</h1>
					<!-- fine nome -->

					<!-- data creazione account -->
					<h6 class="text-center"
						style="position: relative; top: -50px; color: #BACBE2;">
						Creato il
						<%= new java.text.SimpleDateFormat("dd-MM-yyyy").format(utente.getDataCreazione()) %></h6>
					<!-- fine data creazione account -->

					<!-- inizio bottone impostazioni -->
					<a href="./user.jsp" type="button" class="btn btn-light"
						style="position: relative; top: -50px; left: 150px;">Impostazioni</a>
					<!-- fine bottone impostazioni -->


				</div>
				<!-- fine dati -->
			</div>
			<!-- fine intestazione -->
		</div>

		<h1 style="color: white; text-align: center; margin-top: 0px; margin-bottom: 80px">PLAYLIST</h1>
		<hr style="color: white; margin-top: -50px; margin-bottom: 70px">

		<!-- inizio playlist -->
		<div class="container" style="margin-bottom: 70px">
			<div class="container">
				
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<%if (playlists != null && !playlists.isEmpty()) { %>
					<!-- inizio caso: ci sono playlist -->
					<%for (Playlist playlist : playlists) {%>
					<!-- inizio card playlist -->
					<div class="col-md-4 d-flex justify-content-center mb-2">

						<div class="card">
							<a href="playlist?id=<%=playlist.getId()%>">
								<img src="<%=playlist.getFoto()%>" class="card-img-top" alt="...">
							</a>
							<div class="card-body">
								<a class="card-title h5 text-right"
									href="playlist?id=<%=playlist.getId()%>"><%=playlist.getTitolo()%>
								</a>
								
								<!-- inizio bottone dropdown opzioni -->
								<div style="margin-top:-10px"class="dropdown ">
								  <button class="btn btn-light" type="button" data-bs-toggle="dropdown" aria-expanded="false">
								    <i class="bi bi-three-dots-vertical"></i>
								  </button>
								  <ul class="dropdown-menu">
								    <li><a class="dropdown-item" href="update-playlist?id=<%=playlist.getId()%>">Modifica</a></li>
								    <li><hr class="dropdown-divider"></li>
								    <li><a class="dropdown-item" href="delete-playlist?playlistId=<%=playlist.getId()%>">Elimina</a></li>
								  </ul>
								</div>
								<!-- fine bottone dropdown opzioni -->
							</div>
						</div>
					</div>
					<!-- fine card playlist -->
					<%
					}
					%>
					<!-- inzio card nuova playlist -->
					<div class="col d-flex justify-content-center ">

						<div class="card ml-2">
							<a href="creazioneplaylist.jsp"> 
								<img src="./+.png" class="card-img-top" alt="..."> 
							</a>
							<div class="card-body">
								<a class="card-title h5 text-right" href="creazioneplaylist.jsp" style="color:#686868"> Crea la tua playlist </a> 	
							</div>
						</div>
					</div>
					<!-- fine card nuova playlist -->
					<!-- fine caso: ci sono playlist -->
					<% } else { %>
					<!-- inizio caso: non ci sono playlist -->
					<div class="container ">
						<div class="container">
							<h4 style="color:#BACBE2; text-align:center"><i>Non ci sono ancora playlist</i></h4>	
							<!--  <div class="row row-cols-1 row-cols-md-3 g-4">-->
							<div class="col d-flex justify-content-center mt-5">
			
								<div class="card " >
									<a href="creazioneplaylist.jsp"> 
										<img src="./+.png" class="card-img-top" alt="..."> 
									</a>
									<div class="card-body">
										<a class="card-title h5 text-right" href="creazioneplaylist.jsp" style="color:#686868"><h4> Crea la tua playlist! </h4></a> 	
									</div>
								</div>
							</div>
						</div>
					</div>
					<% } %>
					<!-- fine caso: non ci sono playlist -->
				</div>
			</div>
		</div>
		<!-- fine playlist -->

	</main>
	
	<!-- inizio footer -->
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>
	<!-- fine footer -->


	<!-- Script locali -->
	<script src="assets/javascript/bs5.js"></script>
	<script type="text/javascript"
		src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>