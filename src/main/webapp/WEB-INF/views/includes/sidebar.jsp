<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Sidebar -->
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
              <a href="/inquiry/list?type=n" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>미답변 문의</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/report/memberReport" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>회원 신고 사항</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/inquiry/list" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>급식 오류 수정</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/inquiry/list" class="nav-link">
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
<!-- End of Sidebar -->
<style>
  .logo_images {
    width : 100%
  }
</style>