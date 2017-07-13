<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="trab.produto.Produto"%>

<html>
<head>
  <%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="utf-8">

    <title>CadastrarView</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
<div class="w3-container">
  <h2>Mercado</h2>
  <div class="w3-bar w3-light-grey">
    <a href="#" class="w3-bar-item w3-button">Home</a>
    <a href="/Poupe-Dinheiro/manter" class="w3-bar-item w3-button">Gestão de Produtos</a>
    <div class="w3-dropdown-hover">
      <button class="w3-button">Listar favoritos</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">Link 1</a>
        <a href="#" class="w3-bar-item w3-button">Link 2</a>
        <a href="#" class="w3-bar-item w3-button">Link 3</a>
      </div>
    </div>
  </div>
</div>

<div class="container">
<h3>Cadastrar</h3>
  <form class="form-inline" action="manter">
    <div class="form-group">
      <label for="codMercadoria">Código do Produto:</label>
      <input type="text" class="form-control" id="codMercadoria" placeholder="Ex:AH123" name="codMercadoria">
    </div>
    <div class="form-group">
      <label for="nome">Nome:</label>
      <input type="text" class="form-control" id="nome" placeholder="Ex:Arroz Cristal" name="nome">
    </div>
    <div class="form-group">
      <label for="preco">Preço:</label>
      <input type="text" class="form-control" id="preco" placeholder="Ex:8.96" name="preco">
    </div>
    <button name="operacao" value="incluir">Incluir</button>
  </form>
  <h3>Editar</h3>
  <form class="form-inline" action="manter">
    <div class="form-group">
      <label for="codMercadoria">Código do Produto:</label>
      <input type="text" class="form-control" id="codMercadoria" placeholder="Ex:AH123" name="codMercadoria">
    </div>
    <div class="form-group">
      <label for="preco">Preço:</label>
      <input type="text" class="form-control" id="preco" placeholder="Ex:8.96" name="preco">
    </div>
      <button name="operacao" value="alterar">Alterar</button>
      </form>
      
      <h3>Excluir</h3>
 <form class="form-inline" action="manter">
    <div class="form-group">
      <label for="codMercadoria">Código do Produto:</label>
      <input type="text" class="form-control" id="codMercadoria" placeholder="Ex:AH123" name="codMercadoria">
    </div>
<button name="operacao" value="excluir">Excluir</button>
    </form>
    
      
  </form>
  <b>${msg}</b>
   <hr>
   <%  ArrayList<Produto> produtos = (ArrayList<Produto>) request.getAttribute("produtos"); %>
     <table class="table" border="1">
      <tr>
        <th>Cod-Produtor</th>
        <th>Nome</th>
        <th>Preço</th>
        <th>Ações</th>
      </tr>
      <%
      for (Produto produto : produtos) {
      %>
      <tr>
        <td><%=produto.getCodMercadoria()%></td>
        <td><%=produto.getNome()%></td>
        <td><%=String.valueOf(produto.getPreco()) %></td>
        <td><a href="?operacao=excluir&codMercadoria=<%=produto.getCodMercadoria()%>">Excluir</a></td>
      </tr>
      <%}%>
    </table>
</div>
</body>

</html>