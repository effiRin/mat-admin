<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Pick A Food</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="http://106.241.252.54:8085/img/icon/pickafood.ico" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  
    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/fontawesome-free/css/all.min.css">
    
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    
<%--    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">--%>
<%--    --%>
<%--    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/icheck-bootstrap/icheck-bootstrap.min.css">--%>
    
<%--    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/jqvmap/jqvmap.min.css">--%>
    
    <link rel="stylesheet" href="https://adminlte.io/themes/v3/dist/css/adminlte.min.css?v=3.2.0">
    
<%--    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">--%>
<%--    --%>
<%--    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/daterangepicker/daterangepicker.css">--%>
<%--    --%>
<%--    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/summernote/summernote-bs4.min.css">--%>
<%--    <script nonce="d4372773-a8f8-499e-8797-519e2d01421d">(function(w,d){!function(a,e,t,r){
a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zaraz={deferred:[]},a.zaraz.q=[],
a.zaraz._f=function(e){return function(){var t=Array.prototype.slice.call(arguments);
a.zaraz.q.push({m:e,a:t})}};
for(const e of["track","set","ecommerce","debug"])a.zaraz[e]=a.zaraz._f(e);a.addEventListener("DOMContentLoaded",
(()=>{var t=e.getElementsByTagName(r)[0],z=e.createElement(r),n=e.getElementsByTagName("title")[0];
for(n&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),a.zarazData.w=a.screen.width,
a.zarazData.h=a.screen.height,a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,
a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,
a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.zarazData.q=[];
a.zaraz.q.length;){const e=a.zaraz.q.shift();a.zarazData.q.push(e)}z.defer=!0,z.referrerPolicy="origin",
z.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),
t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script></head>--%>



  <script src="http://106.241.252.54:8085/vendor/jquery/jquery.min.js"></script>
  
  <script src="http://106.241.252.54:8085/vendor/jquery/jquery-ui.min.js"></script>
  <script src="https://adminlte.io/themes/v3/dist/js/adminlte.js?v=3.2.0"></script>
  <script src="http://106.241.252.54:8085/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="http://106.241.252.54:8085/img/icon/icon_thumbnail.png" alt="AdminLTELogo" height="60" width="60">
  </div>
  
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">

    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
  <sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.nickname" var="nickname"/>
    <sec:authentication property="principal.profile" var="profile" />
    <sec:authentication property="principal.name" var="name" />

    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown user user-menu">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><p>${name}</p> <p>관리자님</p>
          <img class="user-image img-circle elevation-2" src="${profile}">
          <%-- http://106.241.252.54:8085/img/undraw_profile.svg --%>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a>${nickname}</a>
          <a class="dropdown-item" href="/logout">Logout</a>
        </div>
      </li>
    </ul>
  </sec:authorize>
  </nav>
  <%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>
  <div class="content-wrapper">

