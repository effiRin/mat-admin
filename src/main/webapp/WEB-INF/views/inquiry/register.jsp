<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link href="/resources/css/table.css" rel="stylesheet" type="text/css">

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"></h1>
    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
</div>

<div class="content-wrapper">

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>등록</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">등록</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body" style="display: block;">
                        <div class="form-group" style="display: flex">
                            <label for="inputName" style="width: 7vw; ">제 목</label>
                            <input type="text" id="inputName" class="form-control inputName" style="margin-right: 5vw">
                            <label for="inputName" style="width: 10vw;">아이디</label>
                            <input type="text" class="form-control inputId">
                        </div>
                        <div class="form-group">
                            <label for="inputDescription">내용</label>
                            <textarea id="inputDescription" class="form-control inputContent" rows="5"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">첨부파일</h3>
                    </div>
                    <div class="card-body" style="display: block;">
                        <div>
                            <ul class="file-list">
                                <li >
                                    <input type="file"/>
                                </li>
                            </ul>
                        </div>
                        <div class="form-group">

                            <button class="btn bg-gradient-info float-right file-add"><i class="fa-file-image-o"></i>파일 추가</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <a href="#" class="btn btn-secondary">취소</a>
                <button class="btn btn-success float-right"><i class="fa fa-plus"></i>저장</button>
            </div>
        </div>
    </section>

</div>


<%-- Axios --%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>


</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>