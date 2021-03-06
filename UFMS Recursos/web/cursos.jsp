<%-- 
    Document   : cursos
    Created on : 21/02/2013, 23:14:38
    Author     : Kleber
--%>

<%@page import="br.ufms.model.bean.Curso"%>
<%@page import="br.ufms.model.dao.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- título da aplicação -->
        <title>UFMS Recursos</title>
        <!-- inserindo o css -->
        <link href="resources/css/estilos.css" rel="stylesheet">
        <link href="resources/css/google-buttons.css" rel="stylesheet">
        <!-- inserindo os scripts -->
        <script src="resources/js/jquery.1.9.1.min.js"></script>
        <script src="resources/js/jquery.dropdown.menu.js"></script>
        <script src="resources/js/jquery.tiptip.js"></script>
        <script src="resources/js/jquery.slideform.js"></script>
        <!-- scripts da tabela -->
        <script src="resources/js/jquery.tablesorter.min.js"></script>
        <script src="resources/js/jquery.tablesorter.pager.js"></script>
        <script src="resources/js/jquery.tableactions.js"></script>
    </head>
    <body>
        <div class="inner">
            <jsp:include page="WEB-INF/jspf/cabecalho.jspf"/>
            <jsp:include page="WEB-INF/jspf/menu_cadastros.jspf"/>

            <section class="content">
                <article>
                    <form action="controller" method="get">
                        <div class="oculto">
                            <h3>Curso</h3>
                            <fieldset>
                                <legend>Curso</legend>
                                <input type="hidden" name="cmd" value=""/>
                                <p class="first">
                                    <label for="codigo">Código</label>
                                    <input type="text" name="codigo" id="codigo" size="30"/>
                                </p>
                                <p>
                                    <label for="nome">Nome</label>
                                    <input type="text" name="nome" id="nome" size="30"/>
                                </p>
                                <p>${mensagem}</p>
                            </fieldset>
                            <nav class="menu-superior">
                                <button type="submit" id="btn-salvar" title="Salvar">Salvar</button>
                                <button type="button" id="btn-fechar" title="Fechar">Fechar</button>
                            </nav>
                        </div>
                    </form>
                    <nav class="menu-superior">
                        <button type="button" id="btn-novo" title="Novo">Novo</button>
                        <input type="text" name="pesquisar" id="pesquisar" placeholder="Pesquisar" size="30"/>
                    </nav>
                    <div style="padding: 10px;">
                        <!-- tabela -->
                        <table cellspacing="0" summary="Tabela de administradores">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" value="1" id="marcar-todos" name="marcar-todos"></th>
                                    <th>Código</th>
                                    <th>Nome</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    CursoDAO dao = new CursoDAO();
                                    for (Curso curso : dao.listar()) {
                                %>
                                <tr>
                                    <td><input type="checkbox" value="1" name="marcar[]"/></td>
                                    <td><%=curso.getCodigo()%></td>
                                    <td><%=curso.getNome()%></td>
                                    <td>
                                        <a href="#" class="ddm btn-editar"><span class="icon icon145"></span></a>
                                        <a href="#" class="ddm btn-excluir"><span class="icon icon186"></span></a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <div id="pager" class="pager">
                            <form class="table-component">
                                <span>Exibir
                                    <select class="pagesize">
                                        <option value="10" selected="selected">10</option>
                                        <option value="20">20</option>
                                        <option value="30">30</option>
                                        <option value="40">40</option>
                                        <option value="50">50</option>
                                    </select> registros
                                </span>
                                <a href="#" class="ddm"><span class="icon icon152"></span></a>
                                <a href="#" class="ddm"><span class="icon icon161"></span></a>
                                <a href="#" class="ddm"><span class="icon icon86"></span></a>
                                <a href="#" class="ddm"><span class="icon icon136"></span></a>
                            </form>
                        </div>
                    </div>
                </article>
            </section>
            <jsp:include page="WEB-INF/jspf/rodape.jspf"/>
        </div>
    </body>
</html>
