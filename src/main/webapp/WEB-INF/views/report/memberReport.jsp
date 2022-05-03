<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link href="/resources/css/table.css" rel="stylesheet" type="text/css">

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">회원 신고 사항</h1>
</div>

<div class="row">
    <table class="table table-hover">
        <thead>
        <tr style="background-color: #e9f2ec">
            <th scope="col" style="width: 3vw">#</th>
            <th scope="col" style="width: 14vw">카테고리</th>
            <th scope="col" style="width: 30vw; text-align: left;">내용</th>
            <th scope="col" style="width: 14vw">접수일</th>
            <th scope="col" style="width: 10vw">담당자</th>
        </tr>
        </thead>
        <tbody class="reportList">
        <c:forEach items="${dtoList}" var="report">
            <tr>
                <th scope="row">${report.report_seq}</th>
                <td class="dateType"><c:out value="${report.category}"/></td>
                <td style="text-align: left;"><span><a href='/report/memberReport/read/${report.report_seq}' class="dtoLink"><c:out value="${report.content}"/></a></span></td>
                <td class="dateType">
                    <c:choose>
                        <c:when test="${report.report_yn eq 0}">
                            <span style="color:blue">미접수</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color:cadetblue">${report.reportDate}</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><c:out value="${inquiry.answerId}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagingArea">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:if test="${pageMaker.start > 1}">
                    <li class="page-item"><a class="page-link" href="${pageMaker.start-1}">이전</a></li>
                </c:if>
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

                <c:if test="${pageMaker.end < total/listDTO.size}">
                    <li class="page-item"><a class="page-link" href="${pageMaker.end+1}">다음</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>

<form class="actionForm" action="/report/memberReport" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type == null ? '':listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword == null ? '' : listDTO.keyword}">
</form>

<script>
    const reportList = document.querySelector(".reportList");

    const dateStyle = reportList.querySelectorAll(".dateType");
    dateStyle.forEach(dateType => {
        const dateText = dateType.innerHTML;
        dateType.innerHTML = dateText.split('T')[0];
    });

    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")

    document.querySelector(".reportList").addEventListener("click", (e) => {
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
        actionForm.setAttribute("action","/report/memberReport")
        actionForm.submit();

    }, false)
    // ↑ 버블링 ok 캡쳐링은 false

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>