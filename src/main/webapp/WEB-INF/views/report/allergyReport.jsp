<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">알레르기 오류 신고글</h1>
</div>

<div class="row">




</div>

<form class="actionForm" action="/inquiry/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type == null ? '':listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword == null ? '' : listDTO.keyword}">
</form>

<script>

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>