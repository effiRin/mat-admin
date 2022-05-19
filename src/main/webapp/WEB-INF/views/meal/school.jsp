<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link href="/resources/css/table.css" rel="stylesheet" type="text/css">

<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6" style="margin-top: 1vw">
        <h1 class="m-0">급식 관리</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/">Home</a></li>
          <li class="breadcrumb-item active">급식 관리</li>
        </ol>
      </div>
    </div>
  </div>
</div>

<div class="container-fluid">
  <div class="row">
    <div class="col-12">
      <div class="card card-primary card-outline">
        <div class="card-header">
          <div class="row float-left">
            <div class="col-sm-5">
              <div class="form-group">
                <select class="form-control">
                  <option value="">학교 소재지를 선택해주세요</option>
                  <option value="B10">서울특별시</option>
                  <option value="C10">부산굉역시</option>
                  <option value="D10">대구광역시</option>
                  <option value="E10">인천광역시</option>
                  <option value="F10">광주광역시</option>
                  <option value="G10">대전광역시</option>
                  <option value="H10">울산광역시</option>
                  <option value="I10">세종특별자치시</option>
                  <option value="J10">경기도</option>
                  <option value="K10">강원도</option>
                  <option value="M10">충청북도</option>
                  <option value="N10">충청남도</option>
                  <option value="P10">전라북도</option>
                  <option value="Q10">전라남도</option>
                  <option value="R10">경상북도</option>
                  <option value="S10">경상남도</option>
                  <option value="T10">제주특별자치도</option>
                </select>
              </div>
            </div>
            <div class="col-sm-7">
              <div class="input-group" style="width: 150px;">
                <input type="text" name="schoolCode" class="form-control float-right" placeholder="Search">
                <div class="input-group-append">
                  <button class="btn btn-default searchSchoolBtn">
                    <i class="fas fa-search"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="card-body table-responsive p-0">
          <table class="schoolTable">
            <thead>
            <tr>
              <th>학교명</th>
              <th>소재지</th>
            </tr>
            </thead>
            <tbody class="schoolTableBody">
    
            </tbody>
          </table>
        </div>
        
        <div class="card-body table-responsive p-0">
          <table class="table table-hover text-nowrap">
            <thead>
            <tr>
              <th>Num</th>
              <th>Title</th>
              <th>NickName</th>
              <th>regDate</th>
              <th>Views</th>
              <th>Like</th>
            </tr>
            </thead>
            <tbody> <%-- 내용 forEach로 감싸기 --%>
            
            <c:forEach items="${boardList}" var="board">
              <tr>
                <td><c:out value="${board.boardSeq}"/></td>
                <td><a href="/board/read/${board.boardSeq}"><c:out value="${board.title}"/></a></td>
                <td><c:out value="${board.nickname}"/></td>
                <td><c:out value="${board.regDate}"/></td>
                <td><c:out value="${board.viewsCount}"/></td>
                <td><c:out value="${board.likeCount}"/></td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="card-footer clearfix">
          <ul class="pagination pagination-sm m-0 float-right">
            <li class="page-item"><a class="page-link" href="#">«</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">»</a></li>
          </ul>
        </div>
      
      </div>
    </div>
  </div>
</div>
<script>

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>