<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- <div class="table-responsive"> -->
<table class="table table-hover table-striped" id="producttable">
                  <thead>
                    <tr>
                      <th>商品編號</th>
                      <th>商品名稱</th>
                      <th>原價</th>
                      <th>折扣價</th>
                      <th>購買數量</th>
                      <th>總價</th>
                    </tr>
                  </thead>
                  <tbody>
<c:forEach items="${order}" var="items" >
                    <tr>
                      <td>${items.id}</td>
                     <td>${items.productsku.product.productName}</td>
                      <td>${items.productsku.originalPrice}</td>
                      <td><fmt:formatNumber type="number" maxFractionDigits="0" value=" ${items.productsku.originalPrice*(items.productsku.sellingPrice/100)}" /></td>
                      <td>${items.buyNumber}</td>
                      <td><fmt:formatNumber type="number" maxFractionDigits="0" value="  ${items.buyNumber*items.productsku.originalPrice*(items.productsku.sellingPrice/100)}" />
                     </td>
                      
                    </tr>
    
                

</c:forEach>
              </tbody>
                </table>
<!-- </div> -->