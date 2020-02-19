<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<c:forEach items="${dropmsg}" var="msg" >
          <a href="${ctx}/admin/chat/${msg.key.id}" class="dropdown-item">
             <!-- Message Start -->
            <div class="media">
              <img src="${ctx}${msg.key.image}" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  ${msg.key.username}
<!--                   <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span> -->
                </h3>
                <p class="text-sm">${msg.value[0].text}</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> ${msg.value[0].createDate}</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          </c:forEach>
          
<!--           到這結束 -->
          <div class="dropdown-divider"></div>
<!--           跳轉到CHAT -->
          <a href="${ctx}/admin/chat" class="dropdown-item dropdown-footer">See All Messages</a>


