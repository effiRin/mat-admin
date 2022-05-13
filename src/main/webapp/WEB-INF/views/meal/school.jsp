<%--
  Created by IntelliJ IDEA.
  User: suhong
  Date: 2022/05/09
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<h1>Search School Test</h1>

<form class="searchSchoolForm">
  <select>
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
  <div>
    학교명 검색:
    <input type="text" name="schoolCode">
  </div>
  <button class="searchSchoolBtn">검색</button>
</form>

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

<div class="searchMealsFormContainer">

</div>

<div class="mealsDataContainer row">
  <table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">급식일</th>
        <th scope="col">메뉴</th>
        <th scope="col">사용 재료</th>
      </tr>
    </thead>
    <tbody class="mealsTableBody">

    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/school.js"></script>
<script>
  const searchSchoolForm = document.querySelector(".searchSchoolForm");
  searchSchoolForm.addEventListener("submit", (e) => {
    e.preventDefault();
    e.stopPropagation();
    const region = searchSchoolForm.querySelector("select").value;
    const schoolName = searchSchoolForm.querySelector("input[name='schoolCode']").value;

    const requestURL = getSchoolCode(region, schoolName);
    axios.get(requestURL).then(res => {
      const result = res.data;
      console.log(result);
      if (result["RESULT"] != null) {
        console.log("해당하는 데이터가 없습니다.");
        return;
      }

      const count = result["schoolInfo"][0]["head"][0]["list_total_count"];
      const resultArr = result.schoolInfo[1]["row"];
      let str = "";
      for (school of resultArr) {
        str +=
            `<tr data-school-code="\${school.SD_SCHUL_CODE}"
                data-region-code="\${school.ATPT_OFCDC_SC_CODE}"
                data-school-name="\${school.SCHUL_NM}"
                data-school-address="\${school.ORG_RDNMA}">
                <td>\${school.SCHUL_NM}</td>
                <td>\${school.ORG_RDNMA}</td>
            </tr>`
        console.log(school);
      }
      document.querySelector(".schoolTableBody").innerHTML = str;
    });
  }, false);

  document.querySelector(".schoolTableBody").addEventListener("click", (e) => {
    if (e.target.tagName != 'TD') {
      return;
    }
    const target = e.target.closest("tr");
    const school = {
      schoolName : target.dataset.schoolName,
      schoolCode : target.dataset.schoolCode,
      schoolAddress : target.dataset.schoolAddress,
      regionCode : target.dataset.regionCode
    }
    document.querySelector(".searchMealsFormContainer").innerHTML =
        `<form class="searchMealsForm">
            <input type="hidden" name="regionCode" value="\${school.regionCode}">
            <input type="hidden" name="schoolCode" value="\${school.schoolCode}">
            <input readonly value="\${school.schoolName}">
            <input type="date" name="startDate">
            <input type="date" name="endDate">
            <button class="searchMealsBtn">식단 검색하기</button>
        </form>`
  });

  const searchMealsFormContainer = document.querySelector(".searchMealsFormContainer");
  searchMealsFormContainer.addEventListener("submit", async (e) => {
    e.stopPropagation();
    e.preventDefault();
    if (e.target.getAttribute("class") != "searchMealsForm") {
      return;
    }

    const target = e.target;
    const mealSearchParams = {
      regionCode: target.querySelector("input[name='regionCode']").value,
      schoolCode: target.querySelector("input[name='schoolCode']").value,
      startDate: target.querySelector("input[name='startDate']").value.replaceAll("-",""),
      endDate: target.querySelector("input[name='endDate']").value.replaceAll("-","")
    };

    const mealsInfo = await getMealsData(mealSearchParams).then(result => result.data.mealServiceDietInfo);
    const mealsArr = mealsInfo[1]["row"];
    console.log(mealsArr)
    let str = "";
    mealsArr.forEach(meal => {
      str +=
          `<tr scope="row">
                <td>\${meal.MLSV_YMD}</td>
                <td>\${meal.DDISH_NM}</td>
                <td>\${meal.ORPLC_INFO}</td>
            </tr>`;
    })
    document.querySelector(".mealsTableBody").innerHTML = str;
  }, false);

</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
