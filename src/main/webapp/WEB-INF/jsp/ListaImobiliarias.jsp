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
					<li><a href="index">Inicio</a></li>
					<li><a href="RedSobreIndex">Sobre</a></li>
					<li><a href="RedContato">Contato</a></li>

					<li><a href="#" data-toggle="modal" data-target="#myModal">login</a></li>
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
					<a class="list-group-item text text-center"
						style="background: #504E4E"> <span style="color: #80BFFF">MENU
					</span></a> <a href="RedLocacao" class="list-group-item"> locaçao </a> <a
						href="RedVenda" class="list-group-item"> Venda </a>
						<a href="RedListaImobiliarias" class="list-group-item"> Imobiliarias </a>
				</div>
			</div>
		</div>


		<div class="col-md-9">
			<div class="container-fluid responsive"
				style="background-color: #504E4E; border-radius: 10px">
				<div class="row">
					<div class="container-fluid">
						<span style="color: #80BFFF">
							<h3 align="center">Lista de Imobiliarias Cadastradas</h3>
							<hr> 
							<section>
												<style>
													table {
													table-layout: fixed;
													word-wrap: break-word;
													}
													</style>
								<table class="text-center table table-bordered" >
														<thead>
															<tr>
																<th class="text-center"><span style="color: #FFFFFF">Nome</span></th>
																<th class="text-center"><span style="color: #FFFFFF">Telefone</span></th>
																<th class="text-center"><span style="color: #FFFFFF">Endereço</span></th>
				
															</tr>
														</thead>
													<tbody>
														<c:forEach var="imobiliaria" items="${imobiliaria}">
															<tr>
																<td><span style="color: #FFFFFF">${imobiliaria.nome}</span></td>
																<td><span style="color: #FFFFFF">${imobiliaria.telefone}</span></td>
																<td><span style="color: #FFFFFF">${imobiliaria.endereco}</span></td>
															</tr>
														</c:forEach>
												</tbody>
											</table>
									</section>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal  login-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="border-radius: 10px">
				<div class="modal-header" style="background-color: #504E4E">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<span style="color: #80BFFF">
						<h4 class="modal-title" id="myModalLabel">Login</h4>
					</span>
				</div>
				<div class="modal-body">
				
					<span style="color: #80BFFF">
						<h2 class="form-signin-heading">Insira Seu Login</h2>
					</span>

					<form class="form-signin" action="login" method="post">

						<input type="text" id="nome" name="nome" class="form-control" placeholder="Insira o login" required autofocus><br>
						<input type="text" id="senha" name="senha" class="form-control" placeholder="Informe a sua Senha" autofocus required><br>
						<button type="submit" class="btn btn-primary">Logar</button>
					</form>
						<c:if test="${not empty msgDoServidor}">
							<h2>Usuário ou Senha não cadastrado</h2>
						</c:if>
						
	<!-- 				<a href="#" data-toggle="modal" data-target="#modalcadastraimobiliaria">Cadastrar nova imobiliaria</a>   -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal  mostra casa-->
	<div class="modal fade" id="modalmostra" tabindex="-1"
		role="dialog" aria-labelledby="modalmostraLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="border-radius: 10px">
				<div class="modal-header" style="background-color: #504E4E">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<span style="color: #80BFFF">
						<h4 class="modal-title" id="modalmostraLabel">Cadastrar</h4>
					</span>
				</div>
				<div class="modal-body">

					<form class="form-signin" action="ImobiliariaServlet" method="post">
						<h2 class="form-signin-heading">Informe os dados necessarios</h2>
						<label for="nome">Nome</label><br>
						<input type="text" id="nome" name="nome" class="form-control" placeholder="Informe o nome da empresa"><br>
						<label for="cidade">Cidade</label><br>
						<input type="text" id="cidade" name="cidade" class="form-control" placeholder="Informe a cidade"><br>
						<label for="endereco">Endereço</label><br>
						<input type="text" id="endereco" name="endereco" class="form-control" placeholder="Informe o endereço"><br>
						<label for="telefone">Telefone</label><br>
						<input type="text" id="telefone" name="telefone" class="form-control" placeholder="Telefone"><br>
						<label for="cnpj">CNPJ</label><br>
						<input type="text" id="cnpj" name="cnpj" class="form-control" placeholder="Informe o CNPJ"><br>
						<label for="email">EMAIL</label><br>
						<input type="text" id="email" name="email" class="form-control" placeholder="Informe um Email"><br>
						<label for="senha">Senha</label><br>
						<input type="text" id="senha" name="senha" class="form-control" placeholder="Informe uma senha"><br>
						<label for="tipo">Tipo</label><br>
						<input type="text" id="tipo" name="tipo" class="form-control" placeholder="Informe o tipo"><br>
						
						<button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>
