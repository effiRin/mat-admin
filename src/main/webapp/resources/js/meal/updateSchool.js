function getSchools(pIndex, pSize) {
  const OPEN_API_URL = "https://open.neis.go.kr/hub";
  const SCHOOL_API = "/schoolInfo";
  const KEY = "2e191712000e470dac71cace19e334d9";
  const fixedParams = `KEY=${KEY}&TYPE=json&pIndex=${pIndex}&pSize=${pSize}`;
  console.log(`${OPEN_API_URL}${SCHOOL_API}?${fixedParams}`);
  return axios.get(`${OPEN_API_URL}${SCHOOL_API}?${fixedParams}`)
      .then(response => response.data);
}

async function getAllSchools() {
  const promises = [];
  for (let i = 1; i <= 13; i++) {
    const promise = await getSchools(i, 1000);
    promises.push(promise);
  }
  const results = await Promise.all(promises);
  const schools = [];
  results.forEach(result => {
    const arr = result["schoolInfo"][1]["row"];
    arr.forEach(school => {
      const newSchool = {
        "regionCode": school.ATPT_OFCDC_SC_CODE,
        "schoolCode": school.SD_SCHUL_CODE,
        "address": school.ORG_RDNMA,
        "schoolName": school.SCHUL_NM,
        "regionName": school.LCTN_SC_NM
      }
      schools.push(newSchool);
    });
  });
  const result = schools;

  console.log(result);

  await axios({
    method: "POST",
    url: "/school/update",
    mode: "cors",
    headers: {"Content-Type": "application/json"},
    data: JSON.stringify(result)})
      .then(response => console.log(response))
      .catch(error =>
      {
        console.log(error.message);
      });

  console.log("??????")
}

async function getMealsOfSchool(pIndex, pSize, schoolCode, regionCode, start, end) {
  const OPEN_API_URL = "https://open.neis.go.kr/hub";
  const MEAL_API = "/mealServiceDietInfo";
  const KEY = "2e191712000e470dac71cace19e334d9";
  const fixedParams = `KEY=${KEY}&TYPE=json&pIndex=${pIndex}&pSize=${pSize}`;
  const unfixedParams = `SD_SCHUL_CODE=${schoolCode}&ATPT_OFCDC_SC_CODE=${regionCode}&MLSV_FROM_YMD=${start}&MLSV_TO_YMD=${end}`
  return axios.get(`${OPEN_API_URL}${MEAL_API}?${fixedParams}&${unfixedParams}`)
      .then(response => response.data);
}

async function getAllMeals() {
  const schools = [];
  await axios.get(`/school/list/J10`)
      .then( (res) => {
        schools.push(...res.data)
          }
      );

  console.log(schools);
  const promises = []
  schools.forEach( school => {
    const meals = getMealsOfSchool(
        1,
        1000,
        school.schoolCode,
        school.regionCode,
        20220501,
        20220531
        );
    promises.push(meals);
  });

  const data = [];

  console.log(results);
  results.forEach(mealsArr => {
    mealsArr.forEach(meal => {
      data.push(meal);
    })
  });


  console.log(data);


  // await axios({
  //   method: "POST",
  //   url: "/school/update",
  //   mode: "cors",
  //   headers: {"Content-Type": "application/json"},
  //   data: JSON.stringify(data)})
  //     .then(response => console.log(response))
  //     .catch(error =>
  //     {
  //       console.log(error.message);
  //     });

  console.log("??????")
}