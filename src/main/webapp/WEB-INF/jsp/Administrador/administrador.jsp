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
					<h2 align="center">Pagina principal do Administrador</h2>
					<h3 align="center">Imobiliarias Cadastradas</h3></span>
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
																<th class="text-center"><span style="color: #FFFFFF">alterar</span></th>
																<th class="text-center"><span style="color: #FFFFFF">deletar</span></th>
				
															</tr>
														</thead>
													<tbody>
														<c:forEach var="imobiliaria" items="${imobiliaria}">
															<tr>
																<td><span style="color: #FFFFFF">${imobiliaria.nome}</span></td>
																<td><a
																	class="btn btn-success btn-sm glyphicon glyphicon-refresh"
																	href="RedAlteraImobiliaria?id=${imobiliaria.id}">
																</a></td>
																<td><a a
																	class="btn btn-danger  btn-sm btn btn-success btn-sm glyphicon glyphicon-remove"
																	href="RemoverImobiliaria?id=${imobiliaria.id}">
																</a></td>
															</tr>
														</c:forEach>
												</tbody>
											</table>
									</section>
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

					<form class="form-signin" action="CadastraImovelServlet" method="post">
						
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
	
	<!-- Modal  cadastra venda inicio-->
	<div class="modal fade" id="modalvenda" tabindex="-1" role="dialog"
		aria-labelledby="myModalVenda">
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

					<form class="form-signin" action="CadastraImovelServlet" method="post">
							
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
							<input type="file" name="imagem" id="imagem" accept=".jpg, .png, .jpeg">   -->

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
