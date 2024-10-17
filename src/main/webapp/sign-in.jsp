<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="UTF-8">
		<title>Registrazione</title>
		<link rel="stylesheet" type="text/css"
			href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="style2.css">
	 
		<style>
		.container-sign-in {
	            
	            margin-top:-60px;
	            margin-bottom: 50px;
	            max-width: 500px;           
	            padding: 20px;              
	            background-color: white;   
	            border-radius: 10px;    
	            
	    }
		</style>
		
	</head>

	<body >
	
		
		<div class="container-sign-in mx-auto ">
			<form action="registrati" method="post">
			
				
					<h1 style= "text-align:center "class="mb-3">Registrazione</h1>
					<div  class="form-row">
						
						<div class="form-row col-md-20">
							<form id="uploadForm">
								<img width="150px"  src="giradischi.png" class="rounded mx-auto d-block " alt= "...">
								<br><br>
								<!-- commento l'inserimento foto perchè non ho idea di come farlo dal lato servlet -->
								<!-- <label for="profileImage">Scegli un'immagine:</label>
								<input type="file" id="profileImage" accept="image/*">  -->
							</form>
						</div>
						
						<div class="form-row col-md-20">
						    <label class="mt-3" for="input-nome">Nome</label>
						    <input type="text" class="form-control" id="input-nome" name="nome" required>
						</div>
						
						<div class="form-group col-md-20">
							<label class="mt-3" for="input-cognome">Cognome</label>
							<input type="text" class="form-control" id="input-cognome" name="cognome" required>
						</div>
						
						<div class="form-group col-md-20">
							<label class="mt-3" for="inputEmail4">Email</label>
							<input type="email" class="form-control" id="inputEmail4" name="email" required>
						</div>
						
						<div class="form-group col-md-20">
							<label class="mt-3" for="input-username">Username</label>
							<input type="text" class="form-control" id="input-username" name="username" required>
						</div>
						
						<div class="form-group col-md-20 ">
							<label class="mt-3" for="inputPassword4">Password</label>
							<input type="password" class="form-control" id="inputPassword4" name="password" required>
						</div>
						<br>
						<button class="custom-register-btn" type="submit" >Registrati</button>
					
				
			</form>
			</div>
			<!-- <div class="form-group">
			    <label for="inputAddress">Address</label>
			    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
			  </div>
			  <div class="form-group">
			    <label for="inputAddress2">Address 2</label>
			    <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
			  </div>
			   <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputCity">City</label>
			      <input type="text" class="form-control" id="inputCity">
			    </div>
			    <div class="form-group col-md-4">
			      <label for="inputState">State</label>
			      <select id="inputState" class="form-control">
			        <option selected>Choose...</option>
			        <option>...</option>
			      </select>
			    </div>
			    <div class="form-group col-md-2">
			      <label for="inputZip">Zip</label>
			      <input type="text" class="form-control" id="inputZip">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="form-check">
			      <input class="form-check-input" type="checkbox" id="gridCheck">
			      <label class="form-check-label" for="gridCheck">
			        Check me out
			      </label>
			    </div>
			  </div>-->
		   
		</div>
		
		<%@ include file="footer.jsp" %>

	<script type="text/javascript" src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>