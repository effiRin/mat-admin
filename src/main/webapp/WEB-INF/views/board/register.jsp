<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

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
        <div class="col-12">
          <div class="form-group">
            <a href="#" class="btn btn-secondary">취소</a>
            <button class="btn btn-success float-right boardSend"><i class="fa fa-plus"></i>저장</button>
          </div>
        </div>
      </div>
       
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
                <button class="btn bg-gradient-info float-right file-add">
                  <i class="fa-file-image-o"></i>파일 추가</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </section>
    
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">댓글</h3>
            </div>
            <div class="card-body">
               <div class="card card-info card-outline">
                 <div class="card-body">
                  <p>댓글 냄겼어요 짱짱아아앙아아뽕</p>
                 </div>
  
                 <div class="form-group" >
                   <button class="btn bg-gradient-info float-right" style="margin-right: 1em">
                     <i class="fas fa-pen"></i>수정</button>
                 </div>
               </div>
              
            </div>
            <form class="form-horizontal">
              <div class="card-body">
                <div class="form-group row">
                  <label for="recommand" class="col-sm-2 col-form-label">댓글</label>
                  <div class="col-sm-10">
                    <textarea id="recommand" class="form-control inputContent" rows="5"></textarea>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <button type="submit" class="btn btn-default float-right">댓글 달기</button>
              </div>
            </form>
          </div>
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

  document.querySelector(".boardSend").addEventListener("click", (e) => {
      e.preventDefault()
      e.stopPropagation()

      const actionForm = document.querySelector(".board")
//      actionForm.innerHTML += str
      actionForm.submit()

  },false)

  
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>