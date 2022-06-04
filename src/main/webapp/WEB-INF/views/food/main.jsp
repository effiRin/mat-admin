<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link href="/resources/css/table.css" rel="stylesheet" type="text/css">
<style>
    .box {
        width: 850px;
        white-space: nowrap;
        overflow: hidden;
        display: block;
        text-overflow: ellipsis;
    }
</style>
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6" style="margin-top: 1vw">
        <h1></h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/">Home</a></li>
          <li class="breadcrumb-item active" onclick="location.href='/food/main'" style="cursor: pointer">알레르기 지식창고</li>
        </ol>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid">
  카테고리 들어갈 곳
  <hr>
  <h4 style="padding-left: 20px; padding-bottom: 10px;"><strong>'검색'으로 찾기</strong></h4>
  <div class="row">
    <div class="col-sm-offset-1">
      <div class="form-group searchDiv" style="padding-top: 5px; padding-left: 20px;">
      </div>
    </div>
    <div class="col-sm-11">
      <div class="input-group" style="padding-left: 10px;">
        <input type="text" name="keyword" class="form-control float-right" placeholder="'식품명'을 입력하세요!">
        <div class="input-group-append">
          <button type="submit" class="btn btn-default searchBtn">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
  <hr>
  <div class="row">
    <div class="col-12" style="padding-top: 40px">
      <h4 style="padding-left: 20px; padding-bottom: 10px;"><strong>'알레르기'로 찾기</strong></h4>
      <div class="allergy_option_title" style="padding-bottom: 10px;">
        <span style="padding-left: 20px;"><strong>(식품의약품안전처 고시 알레르기 유발식품 19종)</strong></span>
      </div>
      <div class="card card-primary card-outline">
        <div class="card-header">
        </div>
        <div class="row row-cols-1 row-cols-md-4 g-4">
          <c:forEach items="${allergyOptions}" var="allergy">
            <div class="col" style="text-align: center; margin-bottom: 10px;">
              <label style="padding-right: 100px;">
                <input type="checkbox" name="allergyCode" value="${allergy}">
                <span>${allergy}</span>
              </label>
            </div>
          </c:forEach>
          <div class="col" style="text-align: center; margin-bottom: 10px;">
            <label style="padding-right: 100px;">
              <input type="checkbox" id="others">
              <span>기타</span>
            </label>
          </div>
        </div>
        <div class="col-sm-5" name="ingredientSearchDiv" style="margin: auto; display: none;">
          <div class="input-group" style="padding-bottom: 20px">
            <input type="text" name="keyword" class="form-control float-right" placeholder="'재료명'을 입력하세요!" style="text-align: center;">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default searchBtn">
                <i class="fas fa-search"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="text-center">
    <button type="submit" class="btn btn-default center AllergySearchBtn" style="zoom: 1.2;">
      <strong> 찾기 </strong>
    </button>
  </div>
  <hr>
  <div class="row">
    <div class="col-12" style="padding-top: 40px">
      <h4 style="padding-left: 30px; padding-bottom: 10px;"><strong>'브랜드'로 찾기</strong></h4>
      <div class="card card-primary card-outline">
        <div class="card-header">
        </div>
        <div class="row row-cols-1 row-cols-md-4 g-4">
          <c:forEach items="${companyList}" var="company">
            <div class="col" style="text-align: center; margin-bottom: 10px;">
              <a href="/food/list?type=${company.cateNum}">
                <div class="card h-100"
                     style="margin-bottom: 10px; max-height: 100vw; width: auto; display: flex; justify-content:center; align-items: center;">
                  <img src="${company.image}" class="card-img-top" alt="${company.name}"
                       style="max-height: 10vw; width: 15vw">
                </div>
              </a>
            </div>
          </c:forEach>
        </div>
        <div class="pagingArea">
          <nav aria-label="Page navigation example">
            <ul class="pagination" style="margin-top: 10px">
              <c:if test="${pageMaker.start > 1}">
                <li class="page-item"><a class="page-link" href="${pageMaker.start-1}">이전</a></li>
              </c:if>
              <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">

                <c:choose>
                  <c:when test="${num eq listDTO.page}">
                    <li class="page-item active" aria-current="page"><a class="page-link" href="${num}">${num}</a>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
                  </c:otherwise>
                </c:choose>

              </c:forEach>

              <c:if test="${pageMaker.end < total/listDTO.size}">
                <li class="page-item"><a class="page-link" href="${pageMaker.end+1}">다음</a></li>
              </c:if>
            </ul>
          </nav>
        </div>
      </div>

    </div>
  </div>
</div>
</div>
<form class="allergyForm" action="/food/list" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type == null ? '':'a'}">
  <input type="hidden" name="allergy">
</form>
<script>

    function show_ingredientSearchDiv(){

        const othersInput = document.getElementById(others);

        if(othersInput.checked == true){
        document.querySelector("ingredientSearchDiv").style.display = "";
        }else{
        document.querySelector("ingredientSearchDiv").style.display = "none";
        }
    }

    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")
    const allergyForm = document.querySelector(".allergyForm")
    // '검색' 버튼
    document.querySelector(".AllergySearchBtn").addEventListener("click", (e) => {
        //const type = document.querySelector('.searchDiv .type').value
        //const keyword = document.querySelector("input[name='keyword']").value

        allergyForm.setAttribute("action", "/food/list")
        allergyForm.querySelector("input[name='page']").value = 1
      //  allergyForm.querySelector("input[name='type']").value = type
       // allergyForm.querySelector("input[name='keyword']").value = keyword

        const allergies = []
        const allergyChecks = document.querySelectorAll("input[name='allergyCode']")

        for (let i = 0; i < allergyChecks.length; i++) {
            if (allergyChecks[i].checked) {
                allergies.push(allergyChecks[i].value)
            }
        }

        //allergyForm.querySelector("input[name='allergy']").value = allergy;
        allergyForm.querySelector("input[name='allergy']").value = allergies.toString();

         allergyForm.submit()

    }, false)

    //페이지 이동
    linkDiv.addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if (target.getAttribute("class") !== 'page-link') { //page 링크가 아니면 끝내기
            return
        }

        const pageNum = target.getAttribute("href")
        actionForm.querySelector("input[name='page']").value = pageNum
        actionForm.setAttribute("action", "/food/list")
        actionForm.submit();

    }, false)
    // ↑ 버블링 ok 캡쳐링은 false

    // foodList.addEventListener("click", (e) => {
    //     const target = e.target.closest("div");
    //
    //     if (target.className !== "ingredients") {
    //         return;
    //     }
    //
    //     const boxShort = target.querySelector(".box");
    //     const boxLong = target.querySelector(".show-box");
    //
    //     boxShort.classList.toggle("hidden")
    //     boxLong.classList.toggle("hidden")
    //
    // }, false)


</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>