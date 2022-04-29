<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link href="/resources/css/inquiry.css" rel="stylesheet" type="text/css">

  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">전체 문의글</h1>
    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
  </div>
  <div class="row">
    <table class="table table-hover">
      <thead>
      <tr style="background-color: #e9f2ec">
        <th scope="col" style="width: 3vw">#</th>
        <th scope="col" style="width: 14vw">문의일</th>
        <th scope="col" style="width: 30vw; text-align: left;">제목</th>
        <th scope="col" style="width: 10vw">사용자</th>
        <th scope="col" style="width: 14vw">답변일</th>
        <th scope="col" style="width: 10vw">담당자</th>
      </tr>
      </thead>
      <tbody class="inquiryList">
        <c:forEach items="${dtoList}" var="inquiry">
        <tr>
          <th scope="row">${inquiry.inquiry_seq}</th>
          <td class="dateType"><c:out value="${inquiry.inquiryDate}"/></td>
          <td style="text-align: left; background-color:#f2f7f4;"><c:out value="${inquiry.title}"/></td>
          <td><c:out value="${inquiry.id}"/></td>
          <td class="dateType"><c:out value="${inquiry.answerDate}"/></td>
          <td><c:out value="${inquiry.answerId}"/></td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="pagingArea">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="${pageMaker.start-1}">이전</a></li>
            <c:forEach begin="${pageMaker.start}" end ="${pageMaker.end}" var="num">

              <c:choose>
                <c:when test="${num eq listDTO.page}">
                  <li class="page-item active" aria-current="page"><a class="page-link" href="${num}">${num}</a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
                </c:otherwise>
              </c:choose>

            </c:forEach>
            <li class="page-item"><a class="page-link" href="${pageMaker.end+1}">다음</a></li>
          </ul>
        </nav>
    </div>
  </div>

<form class="actionForm" action="/board/list" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type == null ? '':listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword == null ? '' : listDTO.keyword}">
</form>

<script>
  const inquiryList = document.querySelector(".inquiryList");

  const dateStyle = inquiryList.querySelectorAll(".dateType");
  dateStyle.forEach(dateType => {
    const dateText = dateType.innerHTML;
    dateType.innerHTML = dateText.split('T')[0];
  });

  const linkDiv = document.querySelector(".pagination")
  const actionForm = document.querySelector(".actionForm")

  document.querySelector(".inquiryList").addEventListener("click", (e) => {
    e.preventDefault()
    e.stopPropagation()

    const target = e.target
    if(target.getAttribute("class").indexOf('dtoLink') < 0 ){
      return                  // class 는 이름이 길어질 수 있으므로 indexOf 그 안에 dtoLink가 있는 지 확인 하는 방식으로 가야함.
    }
    const url = target.getAttribute("href")

    actionForm.setAttribute("action", url)
    actionForm.submit()
  }, false)


  linkDiv.addEventListener("click", (e) => {
    e.stopPropagation()
    e.preventDefault()

    const target = e.target

    if(target.getAttribute("class") !== 'page-link'){ //page 링크가 아니면 끝내기
      return
    }
    const pageNum = target.getAttribute("href")
    actionForm.querySelector("input[name='page']").value = pageNum
    actionForm.setAttribute("action","/inquiry/list")
    actionForm.submit();

  }, false)
  // ↑ 버블링 ok 캡쳐링은 false

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>