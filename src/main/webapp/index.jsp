<html>

<head>
  <%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Calculo IMC-JSP</title>

    <!-- Bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <!-- Optional theme -->
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">-->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   <!-- <script src="javaScript-imc.js"></script> -->
</head>

<body>
 
  <h1>Cálculo de IMC</h1>
    <div class="col-md-12">
		<div class="modal-dialog" style="margin-bottom:0">
			<div class="modal-content">
				<div class="panel-heading text-center">
					<h3 class="panel-title">Cálculo IMC - JSP</h3>
				</div>
				<div class="panel-body">
					<form name="formulario">
						<fieldset>
							<div class="form-group">
							  <label for="altura">Altura:</label>
							  <input class="form-control" placeholder="Altura" id="altura" name="altura" type="text" autofocus="">
							</div>
							<div class="form-group">
							  <label for="peso">Peso:</label>
							  <input class="form-control" placeholder="Peso" id="peso" name="peso" type="text">
							</div>
							<div class="form-group">
							  <label for="sexo">Sexo:</label>
							  <input class="form-control" placeholder="Homem ou Mulher" id="sexo" name="sexo" type="text">
							</div>
							<button class="btn btn-sm btn-success">Calcular</button>
						</fieldset>
					</form>
				</div>
			</div>

<%!
public String estado(float altura, float peso, String sexo)
{
	String situacao = "";
	float imc = peso / (altura * altura);
	if(imc < 19.1 && sexo == "mulher")
   {
     situacao = "Abaixo do peso";
   }
   else if(imc < 20.7 && sexo == "homem")
   {
     situacao = "Abaixo do peso";
   }
   else if(imc >=19.1 && imc <= 25.8 && sexo == "mulher")
   {
     situacao = "No peso normal";
   }
   else if(imc >=20.7 && imc <= 26.4 && sexo == "homem")
   {
     situacao = "No peso normal";
   }
   else if(imc >=25.8 && imc <= 27.3 && sexo == "mulher")
   {
     situacao = "Marginalmente acima do peso";
   }
   else if(imc >=26.4 && imc <= 27.8 && sexo == "homem")
   {
     situacao = "Marginalmente acima do peso";
   }
   else if(imc >=27.3 && imc <= 32.3 && sexo == "mulher")
   {
     situacao = "Acima do peso ideal";
   }
   else if(imc >=27.8 && imc <= 31.1 && sexo == "homem")
   {
     situacao = "Acima do peso ideal";
   }
   else if(imc > 32.3 && sexo == "mulher")
   {
     situacao = "Obeso";
   }
   else if(imc > 31.1 && sexo == "homem")
   {
     situacao = "Obeso";
   }
   return situacao;
}
%>

<%
String pesoString = request.getParameter("peso");
pesoString = pesoString == null ? "0" : pesoString;
float peso = Float.parseFloat(pesoString); 

String alturaString = request.getParameter("altura");
alturaString = alturaString == null ? "0" : alturaString;
float altura = Float.parseFloat(alturaString);

String sexo = request.getParameter("sexo");
sexo = sexo == null ? "0" : sexo;

String message = estado(altura, peso, "homem");
%>

<div class="alert alert-info" role="alert" style="margin-top:45px"><%=message%></div>

		</div>
	</div>
</body>

</html>