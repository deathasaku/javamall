<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- <div class="table-responsive"> -->
<c:set var="sum" value="0"></c:set>
<table class="table table-hover table-striped" id="producttable">
                  <thead>
                    <tr>
                      <th>商品編號</th>
                      <th>商品名稱</th>
                      <th>售價</th>
                      <th>購買數量</th>
                      <th>小計</th>
                    </tr>
                  </thead>
                  <tbody>
<c:forEach items="${order}" var="items" >
                    <tr>
                      <td>${items.id}</td>
                     <td>${items.productsku.product.productName}</td>
                      <td><fmt:formatNumber type="number" maxFractionDigits="0" value=" ${items.productsku.originalPrice*(items.productsku.sellingPrice/100)}" /></td>
                      <td>${items.buyNumber}</td>
                      <td><fmt:formatNumber type="number" maxFractionDigits="0" value="  ${items.buyNumber*items.productsku.originalPrice*(items.productsku.sellingPrice/100)}" />
                     </td>
                      <c:set var="sum" value="${sum+items.buyNumber*items.productsku.originalPrice*(items.productsku.sellingPrice/100)}"></c:set>
                    </tr>
    
                

</c:forEach>
              </tbody>
                </table>
                <hr>
                <div class="row justify-content-end"><div class="col-3"><p >稅:  <fmt:formatNumber type="number" maxFractionDigits="0" value="${sum*0.05}"></fmt:formatNumber></p></div></div>
                <div class="row justify-content-end"><div class=" col-3"><p>運費:  60</p></div></div>
                <div class="row justify-content-end"><div class=" col-3"><p >總價:  <fmt:formatNumber type="number" maxFractionDigits="0" value="${sum+60+sum*0.05}"></fmt:formatNumber></p></div></div>
                

         
<!-- </div> -->