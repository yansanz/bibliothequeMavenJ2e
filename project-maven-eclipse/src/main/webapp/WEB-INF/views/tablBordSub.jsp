<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<table border="1" id="tableSub">
</table>
<table border="1" id="iTable">
	<c:forEach var="mySub" items="${emprunteur}">
		<tr>
			<td><c:out value="${mySub.lastName}" /></td>
			<td><c:out value="${mySub.fisrtName}" /></td>
			<td><c:set var="emprunt" /> <c:if test="${mySub.nbrEmprunt > 0}">
					<c:out value="emprunt en cours" />
				</c:if> <c:if test="${mySub.nbrEmprunt == 0}">
					<c:out value="pas d 'emprunt" />
				</c:if></td>
			<td><input onchange="getId(${mySub.id})" type="radio"
				id="iChoixSub" name="choixSub" value="${mySub.id}">
		</tr>
	</c:forEach>
</table>