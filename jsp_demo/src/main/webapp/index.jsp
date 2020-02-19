<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
<!-- 這是決定首頁跳轉的JSP -->
  <meta http-equiv="Refresh" content="0; URL=${ctx}/store/index">
</head>