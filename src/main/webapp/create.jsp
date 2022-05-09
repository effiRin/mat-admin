<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
  
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
  <script nonce="d4372773-a8f8-499e-8797-519e2d01421d">(function(w,d){!function(a,e,t,r){a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zaraz={deferred:[]},a.zaraz.q=[],a.zaraz._f=function(e){return function(){var t=Array.prototype.slice.call(arguments);a.zaraz.q.push({m:e,a:t})}};for(const e of["track","set","ecommerce","debug"])a.zaraz[e]=a.zaraz._f(e);a.addEventListener("DOMContentLoaded",(()=>{var t=e.getElementsByTagName(r)[0],z=e.createElement(r),n=e.getElementsByTagName("title")[0];for(n&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),a.zarazData.w=a.screen.width,a.zarazData.h=a.screen.height,a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.zarazData.q=[];a.zaraz.q.length;){const e=a.zaraz.q.shift();a.zarazData.q.push(e)}z.defer=!0,z.referrerPolicy="origin",z.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script></head>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>
  
  <nav class="main-header navbar navbar-expand navbar-purple navbar-light">
    
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
    
    <ul class="navbar-nav ml-auto">
      <%--      <li class="nav-item">--%>
      <%--        <a class="nav-link" data-widget="fullscreen" href="#" role="button">--%>
      <%--          <i class="fas fa-expand-arrows-alt"></i>--%>
      <%--        </a>--%>
      <%--      </li>--%>
      <li class="nav-item dropdown user user-menu">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
          <img class="user-image img-circle elevation-2" src="http://106.241.252.54:8085/img/undraw_profile.svg">
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Logout</a>
        </div>
      </li>
    </ul>
  </nav>
  
  
  <aside class="main-sidebar sidebar-light-primary elevation-4">
    
    <a href="index3.html" class="brand-link logo-switch">
      <img src="http://106.241.252.54:8085/img/icon/icon_thumbnail.png" alt="AdminLTE Logo" class="brand-image-xl" style="left:12px">
      <span class="brand-text font-weight-light">Pick <sup>A</sup> Food</span>
    </a>
    
    <div class="sidebar">
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p> 회원 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원 정보</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="/board/list" class="nav-link">
              <i class="nav-icon fas fa-clipboard-list"></i>
              <p> 게시글 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/board/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>자유 게시판</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="/inquiry/list" class="nav-link">
              <i class="nav-icon fas fa-comments"></i>
              <p> 문의/신고
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/inquiry/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전체 문의글</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>미답변 문의</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원 신고 사항</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>급식 오류 수정</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품 알레르기 오류 수정</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
    
    </div>
  
  </aside>
  
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
              <div class="form-group">
                <label for="inputName">제목</label>
                <input type="text" id="inputName" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputDescription">내용</label>
                <textarea id="inputDescription" class="form-control" rows="4"></textarea>
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
</div>
<style>
  .file-list {
    list-style: none;
  }
</style>
<script type="text/javascript">
  document.querySelector(".file-add").addEventListener("click",(e) =>{
    console.log("123")
     const fileInput = document.querySelector(".file-list");
    //
    fileInput.innerHTML += "<li><input type='file'></li>";
  },false);
</script>

<script src="https://adminlte.io/themes/v3/plugins/jquery/jquery.min.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/jquery-ui/jquery-ui.min.js"></script>

<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<script src="http://106.241.252.54:8085/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="http://106.241.252.54:8085/vendor/chart.js/Chart.min.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/sparklines/sparkline.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="https://adminlte.io/themes/v3/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/jquery-knob/jquery.knob.min.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/moment/moment.min.js"></script>
<script src="https://adminlte.io/themes/v3/plugins/daterangepicker/daterangepicker.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/summernote/summernote-bs4.min.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>

<script src="https://adminlte.io/themes/v3/dist/js/adminlte.js?v=3.2.0"></script>
</body>
</html>