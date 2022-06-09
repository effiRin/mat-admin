<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

  <%--  <h5 style="text-align: center;"><strong> [검색 조건] </strong></h5>--%>
  <%--  <div class="card-body table-responsive p-0">--%>
  <%--    <table class="table table-hover text-nowrap">--%>
  <%--      <thead>--%>
  <%--      </thead>--%>
  <%--      <tbody>--%>
  <%--      <tr>--%>
  <%--        <c:if test="${listDTO.allergy ne ''}">--%>
  <%--          <td style="width: 25%">--%>
  <%--            <strong> 알레르기 19종 </strong> : '${listDTO.allergy}'--%>
  <%--            <c:if test="${fn:contains(listDTO.type, 'c')}"> (포함) </c:if>--%>
  <%--            <c:if test="${fn:contains(listDTO.type, 'e')}"> (제외) </c:if>--%>
  <%--          </td>--%>
  <%--        </c:if>--%>

  <%--        <c:if test="${listDTO.ingredient ne null}">--%>
  <%--          <td style="width: 25%">--%>
  <%--            <strong> 재료 </strong> : '${listDTO.ingredient}'--%>
  <%--            <c:if test="${fn:contains(listDTO.type, 'c')}"> (포함) </c:if>--%>
  <%--            <c:if test="${fn:contains(listDTO.type, 'e')}"> (제외) </c:if>--%>
  <%--          </td>--%>
  <%--        </c:if>--%>

  <%--        <c:if test="${listDTO.name ne ''}">--%>
  <%--          <td style="width: 25%">--%>
  <%--            <strong> 제품명 </strong> : '${listDTO.name}'--%>
  <%--          </td>--%>
  <%--        </c:if>--%>

  <%--        <c:if test="${listDTO.brand ne ''}">--%>
  <%--          <td style="width: 25%">--%>
  <%--            <strong> 브랜드 </strong> : '${listDTO.brand}'--%>
  <%--          </td>--%>
  <%--        </c:if>--%>
  <%--      </tr>--%>
  <%--      </tbody>--%>
  <%--    </table>--%>
  <%--  </div>--%>

  <div style="text-align: center; margin-bottom: 1vw;">
    <h5><strong>[정렬]</strong></h5>
    검색 조건별 <strong>'우선순'</strong> 보기
    <div class="row" style="margin-top: 1vw;">
      <c:if test="${listDTO.allergy ne ''}">
        <div class="col-md-3">
          <input type="radio" name="sort" value="allergySort" checked> <strong>알레르기 19종</strong><br>'${listDTO.allergy}'
          <c:if test="${fn:contains(listDTO.type, 'c')}"><br> (포함) </c:if>
          <c:if test="${fn:contains(listDTO.type, 'e')}"><br> (제외) </c:if>
        </div>
      </c:if>

      <c:if test="${listDTO.ingredient ne null}">
        <div class="col-md-3">
          <input type="radio" name="sort" value="ingredientSort"> <strong>재료명</strong><br>'${listDTO.ingredient}'
          <c:if test="${fn:contains(listDTO.type, 'c')}"><br> (포함) </c:if>
          <c:if test="${fn:contains(listDTO.type, 'e')}"><br> (제외) </c:if>
        </div>
      </c:if>


      <c:if test="${listDTO.name ne ''}">
        <div class="col-md-3">
          <input type="radio" name="sort" value="foodNameSort"> <strong>제품명</strong><br>'${listDTO.name}'
        </div>
      </c:if>

      <c:if test="${listDTO.brand ne ''}">
        <div class="col-md-3">
          <input type="radio" name="sort" value="brandSort"> <strong>브랜드</strong><br>'${listDTO.brand}'
        </div>
      </c:if>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-12">
    <div class="card card-primary card-outline">
      <div class="card-body table-responsive p-0">
        <table class="table table-hover text-nowrap">
          <thead>
          <tr>
            <th>#</th>
            <th></th>
            <th style="text-align: left;">식품 이름 / 알레르기 성분/ <span style="color: darkslateblue">식품 재료</span> / <span
                    style="color: brown">(같은 공장에서 제조하는 식품 성분)</span></th>
          </tr>
          </thead>
          <tbody class="foodList">
          <style>
              .hidden {
                  display: none;
              }
          </style>
          <c:forEach items="${dtoList}" var="food">
          <c:if test="${food.foodSeq % 2 == 0}">
          <tr style=" background-color: #f7faf8">
            </c:if>
            <c:if test="${food.foodSeq % 2 == 1}">
          <tr style=" background-color: #fffde6">
            </c:if>
            <td></td>
            <td><img src="${food.mainImage}" style="max-width:100px"/></td>
            <td style="text-align: left;">

              <span style="font-size: 15px">${food.name}</span>
              <hr>
              <div class="ingredients">
                <span class="box" style="font-size: 17px">${food.refinedAllergyIngredient}</span>
                <span class="box" style="font-size: 17px">${food.ingredient}</span>
              </div>
              <c:if test="${food.sameFactory != null}">
              <hr>
              <span style="font-size: 15px; color: brown">${food.sameFactory}</span>
              </c:if>
      </div>
      </td>
      </tr>
      </c:forEach>
      </tbody>
      </table>
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
                <li class="page-item active" aria-current="page"><a class="page-link" href="${num}">${num}</a></li>
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


<form class="actionForm" action="/food/list" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type == null ? '':listDTO.type}">
  <input type="hidden" name="allergy" value="${listDTO.allergy == null ? '' : listDTO.allergy}">
  <input type="hidden" name="ingredient" value="${listDTO.ingredient == null ? '' : listDTO.ingredient}">
  <input type="hidden" name="name" value="${listDTO.name == null ? '':listDTO.name}">
  <input type="hidden" name="brand" value="${listDTO.brand == null ? '':listDTO.brand}">
  <input type="hidden" name="sort" value="${listDTO.sort == null ? '':listDTO.sort}">
</form>

<script>

    const foodList = document.querySelector(".foodList");
    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")

    // sort click 했을 때

    if (document.querySelector('input[name="sort"]')) {
        document.querySelectorAll('input[name="sort"]').forEach((elem) => {
            elem.addEventListener("change", (e) => {
                const item = e.target.value;
                let sort;

                // console.log(item);

                switch (item) {
                    case 'allergySort':
                        sort = "allergy";
                        break;
                    case 'ingredientSort':
                        sort = "ingredient";
                        break;
                    case 'foodNameSort':
                        sort = "foodName";
                        break;
                    case 'brandSort':
                        sort = "brand";
                        break;
                }

                actionForm.querySelector("input[name='sort']").value = sort;

                // console.log(sort)
                // console.log(actionForm)

                actionForm.submit()

            }, false)
        })
    }


    // 페이지 링크
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

    // 재료 토글
    foodList.addEventListener("click", (e) => {
        const target = e.target.closest("div");
        if (target.className !== "ingredients") {
            return;
        } else if (target.className !== "allergy_ingredients") {

        }

        const boxShort = target.querySelector(".box");
        const boxLong = target.querySelector(".show-box");

        boxShort.classList.toggle("hidden")
        boxLong.classList.toggle("hidden")

    }, false)

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>