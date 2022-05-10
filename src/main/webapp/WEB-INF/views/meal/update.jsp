<%--
  Created by IntelliJ IDEA.
  User: suhong
  Date: 2022/05/10
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<h1>급식 데이터 최신화</h1>

<table>
  <thead>
    <tr>
      <th>업데이트 일자</th>
      <th>From</th>
      <th>To</th>
    </tr>
  </thead>
  <tbody class="dataTableBody">

  </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/meal/updateSchool.js"></script>
<script>
  const result = getAllSchools();
  console.log(result.length);
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>