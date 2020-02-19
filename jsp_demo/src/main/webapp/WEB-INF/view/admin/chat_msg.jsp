<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

            <c:forEach items="${msglist}" var="msg">
            <c:if test="${msg.fromUser==admin.id}">
            
            <div class="d-flex justify-content-end mb-4">
								<div class="msg_cotainer_send">
							${msg.text}
									
									<span class="msg_time_send">${msg.createDate}</span>
								</div>
							
								<div class="img_cont_msg">
							<img src="${ctx}${admin.image}" class="rounded-circle user_img_msg">
								</div>
							</div>
          
            </c:if>
            <c:if test="${msg.fromUser!=admin.id}">
            
            <div class="d-flex justify-content-start mb-4">
								<div class="img_cont_msg">
<!-- 								放聊天對象的圖片 -->
									<img src="${ctx}${toUserserBean.image}" class="rounded-circle user_img_msg">
								</div>
								<div class="msg_cotainer">
							${msg.text}
									<span class="msg_time">${msg.createDate}</span>
								</div>
							</div>
							
            
            </c:if>
            </c:forEach>
  
            