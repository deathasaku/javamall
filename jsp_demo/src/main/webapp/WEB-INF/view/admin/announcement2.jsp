<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />


											<c:forEach items="${msglist}" var="msg">

									

													<div class="d-flex justify-content-start mb-4">
														<div class="img_cont_msg">
															<!-- 								放聊天對象的圖片 -->
<%-- 															<img src="${ctx}${toUserserBean.image}" --%>
<!-- 																class="rounded-circle user_img_msg"> -->
<span>公告:</span>
														</div>
														<div class="msg_cotainer">
															${msg.text} <span class="msg_time">${msg.createDate}</span>
														</div>
													</div>


												
											</c:forEach>


