<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/justified-nav.css" rel="stylesheet">
<link href="bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Imobiliaria</title>
</head>
<body>
	<jsp:useBean id="log2" class="br.csi.modelo.dao.ImovelDao" />
	<c:set var="aluga" value="${log2.getImoveisAl()}" />
	
	<jsp:useBean id="log3" class="br.csi.modelo.dao.ImovelDao" />
	<c:set var="vende" value="${log3.getImoveisV()}" />
	
	<jsp:useBean id="log4" class="br.csi.modelo.dao.ImobiliariaDao" />
	<c:set var="imobiliaria" value="${log4.getImobiliarias()}" />
	
	
	
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="RedInicioAdm">Inicio</a></li>
					
					

					<li><a href="index">Sair</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	
	
	<div class="container-fluid text-center"
		style="background-color: #504E4E">
		<div class="row">
			<img src="http://csi.ufsm.br/images/banner.png" width="355"
				height="105">
		</div>
	</div>

	<br>

	<div class="container-fluid">
		<div class="col-md-3">
			<div class="con">
				<div class="list-group">
					<a class="list-group-item text text-center" style="background: #504E4E"> <span style="color: #80BFFF">MENU </span></a>
					<a href="#" class="list-group-item" data-toggle="modal" data-target="#modalimobiliaria"> Cadastrar Nova Imobiliaria </a>
					<a href="RedImoveis" class="list-group-item"> Imoveis </a>
					<a href="Red360" class="list-group-item"> Seção 360º </a>
					
				</div>
			</div>
		</div>

		<div class="col-md-9">
			<div class="container-fluid responsive" style="background-color: #504E4E; border-radius: 10px">
				<span style="color: #FFFFFF">
					<h2 align="center">Pagina principal da imobiliaria</h2></span>
					<hr>
						
						<form class="form-signin" action="AlteraImovelAdmin" method="post">
						
							<input type="hidden" name="id" class="form-control" value="${imo.id }"><br>
									
							<label for="cidade">Cidade</label><br>
							<input type="text" name="cidade" class="form-control" value="${imo.cidade }"><br>
							
							<label for="endereco">Endereço</label><br>
							<input type="text" name="endereco" class="form-control" value="${imo.endereco }"><br>
							
							<label for="valor">Valor</label><br>
							<input type="text" name="valor" class="form-control" value="${imo.valor }"><br>
							
							<label for="caracteristicas">Caracteristicas</label><br>
							<input type="text" name="caracteristicas" class="form-control" value="${imo.caracteristicas }"><br>
							
							<input type="hidden" name="tipo" value="alugar">

							<button class="btn btn-lg btn-primary btn-block" type="submit">Alterar</button>
							<br>
						</form>
					</div>
			</div>
		</div>
	<!-- 
	<footer class="footer" style="background-color: #504E4E">
		<div class="container text-center">
			<p class="text-muted">Desenvolvido por Filipe Duarte | @2016.</p>
		</div>
	</footer>
	 -->
	

	<!-- Modal  cadastra aluga inicio-->
	<div class="modal fade" id="modalaluga" tabindex="-1" role="dialog" aria-labelledby="myModalAluga">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="border-radius: 10px">
				<div class="modal-header" style="background-color: #504E4E">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
					<span style="color: #80BFFF">
						<h2 class="form-signin-heading">Cadastre um imóvel para alugar</h2>
					</span>

					<form class="form-signin" action="CadastrarImovel" method="post">
						
						<input type="hidden" name="opcao" value="inserir" />

						<label for="cidade">Cidade</label><br>
						<input type="text" id="cidade" name="cidade" class="form-control" placeholder="Informe a cidade"><br>
							
						<label for="endereco">Endereço</label><br>
						<input type="text" id="endereco" name="endereco" class="form-control" placeholder="Informe o endereço"><br>
							
						<label for="valor">Valor</label><br>
						<input type="text" id="valor" name="valor" class="form-control" placeholder="Informe o valor"><br>
							
						<label for="caracteristicas">Caracteristicas</label><br>
						<input type="text" id="caracteristicas" name="caracteristicas" class="form-control" placeholder="Informe alguma caracteristica"><br>
													
						<input type="hidden" id="tipo" name="tipo" value="alugar">
							
				 			<label for="pro_foto">Imagem:</label>
							<input type="file" name="imagem" accept=".jpg, .png, .jpeg">   

							<button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
							<br>
						</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal  cadastra aluga fim-->
	
	
	
	



</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>
