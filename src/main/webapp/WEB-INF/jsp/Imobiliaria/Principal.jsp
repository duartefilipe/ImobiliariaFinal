<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
					<li><a href="RedInicioImob">Inicio</a></li>

					<li><a href="index">Sair</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>


	<div class="container-fluid text-center" style="background-color: #504E4E">
		<div class="row">
			<img src="http://csi.ufsm.br/images/banner.png" width="355" height="105">
		</div>
	</div>

	<br>

	<div class="container-fluid">
		<div class="col-md-3">
			<div class="con">
				<div class="list-group">
					<a class="list-group-item text text-center" style="background: #504E4E"> 
						<span style="color: #80BFFF">MENU </span>
					</a>
					
					<a href="#" class="list-group-item" data-toggle="modal" data-target="#modalaluga"> Adicionar imóveis para locaçao </a>
					<a href="#" class="list-group-item" data-toggle="modal" data-target="#modalvenda"> Adicionar imóveis para venda </a>
				</div>
			</div>
		</div>

		<div class="col-md-9">
			<div class="container-fluid responsive" style="background-color: #504E4E; border-radius: 10px">
				<div class="row">
					<div class="container-fluid">
						<span style="color: #80BFFF">
							<h3 align="center">Imoveis em Destaque</h3>
							<hr>

							<h3 style="color: #FFFFFF">Imoveis Aluguel</h3>
							<hr> 
							
							<c:forEach var="aluga" items="${aluga}">
								<div class="col-sm-6 col-md-3">
									<a class="thumbnail" href="RedMostraCasa?id=${aluga.id}">
									<img src="http://www.plantasdecasas.com/wp-content/uploads/2012/11/Casa-de-Campo-Minas-Gerais-Cod.-400-590x300.jpg" alt="">
										<p align="center">
											<font color="#000000">${aluga.cidade}</font>
											<a href="RemoverImovel?id=${aluga.id}">
												<i class="glyphicon glyphicon-remove" style="color: red; font-size: 25px;"></i>
											</a> 
											
											<a href="RedAlteraImovelAluga?id=${aluga.id}">
												<i style="font-size: 25px;" class="glyphicon glyphicon-refresh"></i>
											</a>
										</p>
									</a>
								</div>
							</c:forEach>
						</span>
					</div>
				</div>
				
				<div class="row">
					<div class="container-fluid">
						<span style="color: #80BFFF">
							<h3 style="color: #FFFFFF">Imoveis Venda</h3>
							<hr> 
							<c:forEach var="vende" items="${vende}">
								<div class="col-sm-6 col-md-3">
									<a class="thumbnail" href="RedMostraCasa?id=${vende.id}"">
										<img src="http://quinan.com/wp-content/uploads/2015/07/Fachadas-de-casas-modernas-o-cartao-de-visita-do-lar-13-2.jpg" alt="">
										<p align="center">
											<font color="#000000">${vende.cidade}</font>
											<a href="RemoverImovel?id=${vende.id}">
												<i class="glyphicon glyphicon-remove" style="color: red; font-size: 25px;"></i>
											</a>
											
											<a href="RedAlteraImovelVenda?id=${vende.id}"> 
												<i style="font-size: 25px;" class="glyphicon glyphicon-refresh"></i>
											</a>
										</p>
									</a>
								</div>
							</c:forEach>
						</span>
					</div>
				</div>
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
						
						<!-- 
						<label for="pro_foto">Imagem:</label>
						<input type="file" name="imagem" accept=".jpg, .png, .jpeg">
						 -->
						 
						<button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
						<br>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal  cadastra aluga fim-->

	<!-- Modal  cadastra venda inicio-->
	<div class="modal fade" id="modalvenda" tabindex="-1" role="dialog" aria-labelledby="myModalVenda">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="border-radius: 10px">
				<div class="modal-header" style="background-color: #504E4E">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<span style="color: #80BFFF">
						<h4 class="modal-title" id="myModalVenda">Login</h4>
					</span>
				</div>
				<div class="modal-body">
					<span style="color: #80BFFF">
						<h2 class="form-signin-heading">Cadastre um imóvel para vender</h2>
					</span>
					
					<form class="form-signin" action="CadastrarImovel" method="post">

						<input type="hidden" name="opcao" value="inserir" />
						
						<label for="cidade">Cidade</label><br>
						<input type="text" name="cidade" class="form-control" placeholder="Informe a cidade"><br>

						<label for="endereco">Endereço</label><br>
						<input type="text" name="endereco" class="form-control" placeholder="Informe o endereço"><br>
						
						<label for="valor">Valor</label><br>
						<input type="text" name="valor" class="form-control" placeholder="Informe o valor"><br>

						<label for="caracteristicas">Caracteristicas</label><br>
						<input type="text" name="caracteristicas" class="form-control" placeholder="Informe alguma caracteristica"><br>
						
						<input type="hidden" name="tipo" value="vender">
						
						<!-- 			
						<label for="pro_foto">Imagem:</label>
						<input type="file" name="imagem" id="imagem" accept=".jpg, .png, .jpeg">  
						-->

						<button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
						<br>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal  cadastra venda fim-->


</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>
