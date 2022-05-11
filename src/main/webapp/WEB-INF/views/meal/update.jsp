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
  async function getAllSchools() {
    const promises = [];
    for (let i = 1; i <= 1; i++) {
      const promise = await getSchools(i, 10);
      promises.push(promise);
    }
    const results = await Promise.all(promises);
    const schools = [];
    results.forEach(result => {
      const arr = result["schoolInfo"][1]["row"];
      arr.forEach(school => {
        const newSchool = {
          "ATPT_OFCDC_SC_CODE": school.ATPT_OFCDC_SC_CODE,
          "SD_SCHUL_CODE": school.SD_SCHUL_CODE,
          "ORG_RDNMA": school.ORG_RDNMA,
          "SCHUL_NM": school.SCHUL_NM,
          "LCTN_SC_NM": school.LCTN_SC_NM
        }
        schools.push(newSchool);
      });
    });
    const result = {result :schools[0]};
    // const result = {...schools};
    // const result = {
    //   "ATPT_OFCDC_SC_CODE": "aasdf",
    //   "SD_SCHUL_CODE": "1235",
    //   "ORG_RDNMA": "서울",
    //   "SCHUL_NM": "교동 토등학교",
    //   "LCTN_SC_NM": "주우소"
    // }
    console.log(result);
    // axios.post('/meal/update', result,
    //     {headers: {'Content-Type': 'application/json'}}
    // ).then((res) => {
    //   console.log(res);
    //   console.log("Over");
    // });
    console.log("?????")
    await axios({
      method: "POST",
      url: "/school/update",
      mode: "cors",
       headers: {"Content-Type": "application/json"},
      data: JSON.stringify(result)
    }).then(response => console.log(response))
        .catch(error => {
    console.log(error.message);
  });

    console.log("??????")
  }

  getAllSchools();
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>