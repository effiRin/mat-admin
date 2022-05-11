<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>문의 사항 - ${dto.content}</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/jqvmap/jqvmap.min.css">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/dist/css/adminlte.min.css?v=3.2.0">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/daterangepicker/daterangepicker.css">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/summernote/summernote-bs4.min.css">
    <script nonce="d4372773-a8f8-499e-8797-519e2d01421d">(function(w,d){
        !function(a,e,t,r){a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zaraz={deferred:[]}
            ,a.zaraz.q=[],a.zaraz._f=function(e){return function(){
                var t=Array.prototype.slice.call(arguments);a.zaraz.q.push({m:e,a:t})}};
            for(const e of["track","set","ecommerce","debug"])a.zaraz[e]=a.zaraz._f(e);
            a.addEventListener("DOMContentLoaded",(()=>{var t=e.getElementsByTagName(r)[0]
                ,z=e.createElement(r),n=e.getElementsByTagName("title")[0];
                for(n&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),
                        a.zarazData.w=a.screen.width,a.zarazData.h=a.screen.height,
                        a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.zarazData.q=[];a.zaraz.q.length;){const e=a.zaraz.q.shift();a.zarazData.q.push(e)}z.defer=!0,z.referrerPolicy="origin",z.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script></head>


<link href="/resources/css/inquiry.css" rel="stylesheet" type="text/css">

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"></h1>
    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
</div>


<div class="row">

    <section class="content-header" style="margin-left: 10px; width: 300px;">
        <div class="container-fluid">
            <div class="row mb-2" >
                <div class="col-sm-6" style="">
                    <ol class="breadcrumb float-sm-right" >
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active"><a href="/inquiry/list?page=${listDTO.page}&size=${listDTO.size}" style="color:#3c3b3b;">문의 목록</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>


    <div class="col-md-12">
        <div class="card card-primary card-outline">
            <div class="card-body" style="display: block;">
                <div class="form-group" style="display: flex">
                    <label style="width: 7vw;">제 목</label>
                    <c:out value="${dto.title}"></c:out>
                    <label style="width: 10vw;  margin-left: 5vw;">아이디</label>
                    <c:out value="${dto.id}"></c:out>
                    <label style="width: 10vw; margin-left: 5vw;">문의날짜</label>
                    <c:out value="${dto.inquiryDate}"></c:out>
                </div>
                <div class="form-group">
                    <label for="inputDescription">내용</label>
                    <textarea id="inputDescription" class="form-control inputContent" rows="5" readonly><c:out value="${dto.content}"></c:out></textarea>
                </div>
            </div>
        </div>
    </div>

            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title">관리자 답변</h3>
                    </div>

                    <%-- 답변 단 경우 --%>
                    <c:if test="${dto.answerFlag == 1}">
                    <div class="card-body">
                        <div class="card card-info card-outline">
                            <div class="card-body">
                                <div class="flex-shrink-0">${dto.answerId}</div>
                                <div class="fw-bold">${dto.answerDate}</div>
                            </div>

                            <div class="form-group" >
                                <div class="answerContent" style="margin-left: 20px;">${dto.answerContent}</div>
                                <button class="btn bg-gradient-info float-right" style="margin-right: 1em">
                                    <i class="fas fa-pen"></i>수정</button>
                            </div>
                        </div>

                    </div>
                    </c:if>

                    <%-- 답변 안 단 경우 --%>
                    <c:if test="${dto.answerFlag == 0}">
                    <form class="form-horizontal"  action="/inquiry/read/${dto.inquiry_seq}" method="post">
                        <input type="hidden" name="inquiry_seq" value="${dto.inquiry_seq}">
                        <div class="card-body">
                            <div class="form-group row">
                                <label for="recommand" class="col-sm-2 col-form-label">답 변</label>
                                <div class="col-sm-10">
                                    <textarea id="recommand" name="answerContent" class="form-control" rows="5"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-default float-right">댓글 달기</button>
                        </div>
                    </form>
                    </c:if>
                </div>
            </div>


</div>











<%-- Axios --%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>


</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>