<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <style>
        body{
            background-image: url(https://i.imgur.com/KSBmJOW.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
    <head>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuários</title>
    </head>
    <body>
        <div w3-include-html="menu.html"></div>
        <script>
            w3IncludeHTML();
            function mudaImagem() {

                document.getElementById("imagem_do_menu").style.cssText = "width: 200px; height: 136px; margin-left:0; margin-top: 0";
            }
            function resetaImagem() {
                document.getElementById("imagem_do_menu").style.cssText = "width: 60px; height: 50px; margin-left: 128px; margin-top: 100px;";
            }

            function checkNome() {
                var nome = document.querySelector("#nome");
                if (nome.value === "") {
                    nome.setCustomValidity("Insira um nome");
                }
            }
            function checkLogin() {
                var login = document.querySelector("#login");
                if (login.value === "") {
                    login.setCustomValidity("Insira um login");
                }
            }
            
               function checkEmail() {
                var email = document.querySelector("#email");
                if (email.value === "") {
                    email.setCustomValidity("Insira um e-mail válido");
                }
            }
            
        </script>

        <div class="main">
            <div class="container">
                <div class="row centered-form">
                    <div >
                        <br>
                        <br>
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Editar Usuário</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form" action="usuario" method="POST">
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <h3 class="panel-title">Dados do Usuário</h3>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="nome" class="control-label">Nome*</label>
                                            <input type="text" name="nome" id="nome" class="form-control input-sm" placeholder="Nome Completo" value="${usuario.nome}" oninput="this.setCustomValidity('')" oninvalid="checkNome();" required>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="grupoFilial">Grupo/Filial*</label>
                                                </div>	
                                                <select id="grupoFilial" name="grupoFilial" class="form-control">
                                                    <option>Selecione</option>
                                                    <option <c:if test="${usuario.grupoFilial=='Sao Paulo'}">selected</c:if>>Sao Paulo</option>
                                                    <option <c:if test="${usuario.grupoFilial=='Porto Alegre'}">selected</c:if>>Porto Alegre</option>
                                                    <option <c:if test="${usuario.grupoFilial=='Recife'}">selected</c:if>>Recife</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-auto col-sm-auto col-md-2">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="departamento">Departamento*</label>
                                                    </div>	
                                                    <select id="departamento" name="departamento" class="form-control">
                                                        <option>Selecione</option>
                                                    <option <c:if test="${usuario.departamento=='BackOffice'}">selected</c:if>>BackOffice</option>
                                                    <option <c:if test="${usuario.departamento=='Vendas'}">selected</c:if>>Vendas</option>
                                                    <option <c:if test="${usuario.departamento=='TI'}">selected</c:if>>TI</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-auto col-sm-auto col-md-2">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="Cargo">Cargo*</label>
                                                    </div>	
                                                    <select id="cargo" name="cargo" class="form-control">
                                                        <option>Selecione</option> 
                                                    <option  <c:if test="${usuario.cargo=='Gerente'}">selected</c:if>>Gerente</option>
                                                    <option  <c:if test="${usuario.cargo=='BackOffice'}">selected</c:if>>BackOffice</option>
                                                    <option  <c:if test="${usuario.cargo=='Vendedor(a)'}">selected</c:if>>Vendedor(a)</option>
                                                    <option  <c:if test="${usuario.cargo=='Suporte Técnico'}">selected</c:if>>Suporte Técnico</option>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-xs-auto col-sm-auto col-md-4">
                                                <br>
                                                <h3 class="panel-title">Dados de Acesso </h3>
                                                <hr>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-auto col-sm-auto col-md-4">
                                                <label for="login" class="control-label">Login*</label>
                                                <input type="text" name="login" id="login" class="form-control input-sm" placeholder="Login" value="${usuario.login}" oninput="this.setCustomValidity('')" oninvalid="checkLogin();" required>
                                        </div>                                        
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="email" class="control-label">Email</label>
                                            <input type="text" name="email" id="email" class="form-control input-sm" placeholder="fulano@astec.com" value="${usuario.email}" oninput="this.setCustomValidity('')" oninvalid="checkEmail();" required>
                                            <!-- input escondido que passa o comando para o servlet 
                                            (Deve ter um forma mais simples de fazer isso)-->
                                            <input type="hidden" name="comando" id="comando" value="editar">
                                            <input type="hidden" id="idUsuario" name="idUsuario" value="${usuario.idUsuario}">

                                        </div>
                                    </div>

                                    <div class="row">
                                        <br>
                                        <div class="col-xs-10 col-sm-10 col-md-10">
                                            <button type="button submit" class="btn btn-info btn-sm" >Salvar</button>                                    
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>	
            </div>
        </div>
    </body>
</html>
