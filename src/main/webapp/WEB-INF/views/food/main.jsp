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
  <div class="row">
    <div class="col-12" style="padding-top: 20px">
      <h4 style="padding-left: 20px; padding-bottom: 10px;"><strong>'알레르기' 선택하기</strong></h4>
      <div class="allergy_option_title" style="padding-bottom: 10px;">
        <span style="padding-left: 20px;"><strong>(식품의약품안전처 고시 알레르기 유발식품 19종)</strong></span>
      </div>
      <div class="card card-primary card-outline">
        <div class="card-header">
        </div>
        <form>
          <div class="row row-cols-1 row-cols-md-4 g-4">
            <c:forEach items="${allergyOptions}" var="allergy">
              <div class="col" style="text-align: center; margin-bottom: 10px;">
                <label style="padding-right: 100px;">
                  <input type="checkbox" name="allergyCode" value="${allergy}">
                  <span>${allergy}</span>
                </label>
              </div>
            </c:forEach>
          </div>
          <div class="col-sm-5" style="margin: auto; text-align: center;">
            <input type="checkbox" name="others" onclick="show_ingredientDiv(this)" style="margin-bottom: 1vw;">
            <strong>찾으시는 알레르기가 없나요?</strong>
            <div class="input-group ingredientDiv" style="margin-bottom: 1vw; display: none;">
              <input type="text" name="foodIngredient" class="form-control float-right" placeholder="'재료명'을 입력해 보세요!"
                     style="text-align: center;">
            </div>
          </div>
      </div>
    </div>
    <div style="margin: auto">
      <span style="padding-right: 10vw;">
        <input type="radio" name="choice" value="contained" checked> 포함한 식품 보기
        </span>
      <span style="padding-right: 10vw;">
    <input type="radio" name="choice" value="excepted"> 제외한 식품 보기
        </span>
      <span style="padding-right: 10vw;">
    <button type="reset"> 초기화 </button>
        </span>
    </div>
    </form>
  </div>
<hr>
  <h4 style="padding-left: 20px; margin-top: 40px; padding-bottom: 10px;"><strong>'식품명' 입력하기</strong></h4>
  <div class="row justify-content-center">
    <div class="col-sm-offset-1">
      <div class="form-group searchDiv" style="padding-top: 5px; padding-left: 20px;">
      </div>
    </div>
    <div class="col-sm-5">
      <div class="input-group">
        <input type="text" name="foodName" class="form-control float-right" placeholder="'식품명'을 입력하세요!"
               style="text-align: center;">
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12" style="margin-top: 40px">
      <h4 style="padding-left: 30px; padding-bottom: 10px;"><strong>'브랜드' 선택하기</strong></h4>
      <div class="card card-primary card-outline">
        <div class="card-header">
        </div>
        <div class="row row-cols-1 row-cols-md-4 g-4">
          <c:forEach items="${companyList}" var="company">
            <div class="col" style="text-align: center; margin-bottom: 10px;">
                <div class="card h-100"
                     style="margin-bottom: 10px; max-height: 100vw; width: auto; display: flex; justify-content:center; align-items: center;">
                  <img src="${company.image}" class="card-img-top" alt="${company.name}"
                       style="max-height: 10vw; width: 15vw">
                  <input type="checkbox" name="brandCode" value="${company.name}", style="position: absolute; bottom: 0px; right: 0px;">
                </div>
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
  <hr>
  <div class="text-center">
    <button type="submit" class="btn btn-default center SearchBtn" style="zoom: 1.2;">
      <strong> 찾기 </strong>
    </button>
  </div>
</div>
<form class="allergyForm" action="/food/list" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type == null?'':listDTO.type}">
  <input type="hidden" name="allergy">
  <input type="hidden" name="ingredient">
  <input type="hidden" name="name">
  <input type="hidden" name="brand">
</form>

<script>

    // 체크하면 ingredient 창 보여주기
    function show_ingredientDiv(others){

        if(others.checked==true){
        document.querySelector(".ingredientDiv").style.display = ""
        }else{
        document.querySelector(".ingredientDiv").style.display = "none"
        document.querySelector("input[name='foodIngredient']").value = null
        }
    }

    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")
    const allergyForm = document.querySelector(".allergyForm")

    // '검색' 버튼
    document.querySelector(".SearchBtn").addEventListener("click", (e) => {

        allergyForm.setAttribute("action", "/food/list")
        allergyForm.querySelector("input[name='page']").value = 1


        // 알레르기 19종 체크 했을 때
        const allergies = []
        const allergyChecks = document.querySelectorAll("input[name='allergyCode']")

        for (let i = 0; i < allergyChecks.length; i++) {
            if (allergyChecks[i].checked) {
                allergies.push(allergyChecks[i].value)
            }
        }

        let allergy = allergies.toString();
        allergyForm.querySelector("input[name='allergy']").value = allergy;


        // ingredient(재료명) 입력했을 때
        let ingredient = document.querySelector("input[name='foodIngredient']").value
        allergyForm.querySelector("input[name='ingredient']").value = ingredient;


        // foodName(식품명) 입력했을 때
        let foodName = document.querySelector("input[name='foodName']").value
        allergyForm.querySelector("input[name='name']").value = foodName;

        // brand (company 회사) 선택했을 때
        const brands = []
        const brandChecks = document.querySelectorAll("input[name='brandCode']")

        for (let i = 0; i < brandChecks.length; i++) {
            if (brandChecks[i].checked) {
                brands.push(brandChecks[i].value)
            }
        }

        let brand = brands.toString();
        allergyForm.querySelector("input[name='brand']").value = brand;

        // 포함과 제외 + 타입
        const choiceNodeList = document.getElementsByName('choice');
        let type = "";

        choiceNodeList.forEach((node) => {
            // 포함,여부 조건문
            const cond1 = {
                "c": node.value == 'contained',
                "e": node.value == 'excepted',
            };

            if(node.checked)  {
                if(cond1.c){return type = 'c'}
                if(cond1.e){return type = 'e'}
            }
        }) // forEach 끝

        const cond2 = {
            "a": allergy.toString().length != 0,
            "i": ingredient.toString().length != 0,
            "n": foodName.toString().length != 0,
            "b": brand.toString().length != 0
        };

        if(cond2.a){type = "a" + type}
        if(cond2.i){type = "i" + type}
        if(cond2.n){type = "n" + type}
        if(cond2.b){type = "b" + type}

        allergyForm.querySelector("input[name='type']").value = type;

        // console.log(allergyForm)

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

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>