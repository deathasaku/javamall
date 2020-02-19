<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />


<c:forEach items="${propertyList}" var="item" varStatus="status">
<%--  <c:if test=""> --%>
<!-- <div class="row"> -->
<%-- </c:if> --%>
                    <div class="col-sm-2">
                      <!-- select -->
                      <div class="form-group">
                        <label>${item.propertyName}</label>
                        <select class="form-control">
                        
					<c:forEach var="propertyValue" items="${item.propertyValue}" varStatus="status2">
					<option value="${propertyValue.propertyValue}" <c:if test="${status2.first}">selected</c:if>  >${propertyValue.propertyValue}</option>
					</c:forEach>
                        </select>
                      </div>
                      
                    </div>
<%--    <c:if test="${status.last||status.count%6==0}"> --%>
<!-- 	</div>    -->
<%--    </c:if>         --%>

                  
</c:forEach>