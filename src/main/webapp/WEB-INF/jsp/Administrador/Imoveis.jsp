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
					
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Imobiliarias <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:forEach var="imobiliaria" items="${imobiliaria}">
								<li><a href="#">${imobiliaria.nome}</a></li>
							</c:forEach>
						</ul></li>

					<li><a href="index">Sair</a></li>
				</ul>
			</div>
		</div>
	</nav>

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
						
						<h3 style="color: #FFFFFF">Imoveis Aluguel</h3><hr>
						<c:forEach var="aluga" items="${aluga}">
							<div class="col-sm-6 col-md-3">
								<a class="thumbnail" href="#">
								<img src="http://www.plantasdecasas.com/wp-content/uploads/2012/11/Casa-de-Campo-Minas-Gerais-Cod.-400-590x300.jpg"
									alt="">
									<p align="center">
										<font color="#000000">${aluga.cidade}</font>
										<a href="RemoverImovel?id=${aluga.id}" >
											<i class="glyphicon glyphicon-remove" style="color: red; font-size: 25px;"></i>
										</a>
                                        <a href="RedAlteraImovelAluga?id=${aluga.id}">
                                        	<i style="font-size: 25px;" class="glyphicon glyphicon-refresh"></i>
                                        </a>
									</p>
								</a>
							</div>
						</c:forEach>
					</div>	
						
					<div class="container-fluid responsive" style="background-color: #504E4E; border-radius: 10px">
						<h3 style="color: #FFFFFF">Imoveis Venda</h3><hr>
						<c:forEach var="vende" items="${vende}">
							<div class="col-sm-6 col-md-3" id="${vende.id }">
								<a class="thumbnail" href="#">
									<img src="http://www.plantasdecasas.com/wp-content/uploads/2012/11/Casa-de-Campo-Minas-Gerais-Cod.-400-590x300.jpg" alt="">
									<p align="center">
										<font color="#000000">${vende.cidade}</font>
										
										<a href="RemoverImovel?id=${vende.id}" ><i class="glyphicon glyphicon-remove" style="color: red; font-size: 25px;"></i></a>
                                        <a href="RedAlteraImovelVenda?id=${vende.id}">
                                        	<i style="font-size: 25px;" class="glyphicon glyphicon-refresh"></i>
                                        </a>
										
									</p>
								</a>
							</div>
						</c:forEach>
					</div>
			</div>
			
	<!-- 
	<footer class="footer" style="background-color: #504E4E">
		<div class="container text-center">
			<p class="text-muted">Desenvolvido por Filipe Duarte | @2016.</p>
		</div>
	</footer>
	 -->
	

<!-- Modal  cadastra imobiliaria inicio-->
	<div class="modal fade" id="modalimobiliaria" tabindex="-1" role="dialog"
		aria-labelledby="myModalImobiliaria">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="border-radius: 10px">
				<div class="modal-header" style="background-color: #504E4E">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<span style="color: #80BFFF">
						<h4 class="modal-title" id="myModalImobiliaria">Login</h4>
					</span>
				</div>
				<div class="modal-body">
				
					<span style="color: #80BFFF">
						<h2 class="form-signin-heading">Cadastre uma nova imobiliaria</h2>
					</span>

					<form class="form-signin" action="CadastrarImobiliaria" method="post">
							
							<label for="nome">Nome</label><br>
							<input type="text" name="nome" class="form-control" placeholder="Informe o nome"><br>
							
							<label for="cidade">Cidade</label><br>
							<input type="text" name="cidade" class="form-control" placeholder="Informe a cidade"><br>
							
							<label for="endereco">Endereço</label><br>
							<input type="text" name="endereco" class="form-control" placeholder="Informe o endereço"><br>
							
							<label for="telefone">Telefone</label><br>
							<input type="text" name="telefone" class="form-control" placeholder="Informe o telefone"><br>
							
							<label for="cnpj">CNPJ</label><br>
							<input type="text" name="cnpj" class="form-control" placeholder="Informe o CNPJ"><br>
							
							<label for="email">EMAIL</label><br>
							<input type="text" name="email" class="form-control" placeholder="Informe o email"><br>
							
							<label for="senha">Senha</label><br>
							<input type="text" name="senha" class="form-control" placeholder="escolha uma senha"><br>
							
							<input type="hidden" name="tipo" value="2">

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
	
	<!-- Modal  cadastra imobiliaria fim-->



</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>
