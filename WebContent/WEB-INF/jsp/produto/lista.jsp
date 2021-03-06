<%@page import="br.com.caelum.produtos.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function removeProduto(id){
			$("#mensagem").load('<c:url value="/produto/remove"/>' + '?produto.id=' + id);
			$("#produto" + id).remove();
		}
	</script>
	<h3><fmt:message key="mensagem.bemvindo" /></h3>

	<h1>Produtos</h1>
	<div id="mensagem"></div>
	<table width="100%">
		<tr>
			<td>Status</td>
			<td width="20%">Nome</td>
			<td>Preco</td>
			<td>Descricao</td>
			<td>Data de Inicio da Venda</td>
			<td>Usado?</td>
			<td width="20%">Remover?</td>
		</tr>

		<c:forEach var="p" items="${produtoLista}" varStatus="st">

			<tr id="produto${p.id}">
				<td>${st.count}</td>
				<td>${p.nome.toUpperCase()}</td>
				<td><fmt:formatNumber value="${p.preco}" type="currency" /></td>
				<td>${p.descricao}</td>
				<td><fmt:formatDate value="${p.dataInicioVenda.time}"
						pattern="EEEE, dd 'de' MMMM 'de' yyyy" /></td>

				<%-- 				<c:if test="${p.usado}"> --%>
				<!--                 <td>Sim</td> -->
				<%--                 </c:if> --%>
				<%--                 <c:if test="${not p.usado}"> --%>
				<!--                 <td>Não</td> -->
				<%--                 </c:if> --%>

				<c:choose>
					<c:when test="${p.usado}">
						sim
					</c:when>
					<c:otherwise>
						nao
					</c:otherwise>
				</c:choose>
				<td><a href="#" onclick="return removeProduto(${p.id})">Remover</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="<c:url value="/produto/formulario" />"><fmt:message key="mensagem.adicionarcurso"/></a>
	<br />
	
	<c:import url="../_comum/rodape.jsp" />
	
<%-- 	<c:set var="nome" value="João da Silva" /> --%>
<%-- 	<c:out value="${nome}" /> --%>
<!-- 	<br /> -->
<%-- 	<c:set var="now" value="<%=new java.util.Date()%>" /> --%>
<%-- 	<fmt:formatDate value="${now}" pattern="EEEE, dd 'de' MMMM 'de' yyyy" --%>
<%-- 		var="strDate" /> --%>
<%-- 	<c:out value="${strDate}" /> --%>
</body>
</html>