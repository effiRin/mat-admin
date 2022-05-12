function getSchools(pIndex, pSize) {
  const OPEN_API_URL = "https://open.neis.go.kr/hub";
  const SCHOOL_API = "/schoolInfo";
  const KEY = "2e191712000e470dac71cace19e334d9";
  const TYPE = "json";
  const fixedParams = `KEY=${KEY}&TYPE=${TYPE}&pIndex=${pIndex}&pSize=${pSize}`;
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

function getMeals(pIndex, pSize, schoolCode, regionCode) {
  const OPEN_API_URL = "https://open.neis.go.kr/hub";
  const MEAL_API = "/mealServiceDietInfo";
  const KEY = "2e191712000e470dac71cace19e334d9";
  const TYPE = "json";
  const fixedParams = `KEY=${KEY}&TYPE=${TYPE}&pIndex=${pIndex}&pSize=${pSize}`;
  const unfixedParams = `SD_SCHUL_CODE=${schoolCode}&ATPT_OFCDC_SC_CODE=${regionCode}`
  console.log(`${OPEN_API_URL}${MEAL_API}?${fixedParams}&${unfixedParams}`);
  return axios.get(`${OPEN_API_URL}${MEAL_API}?${fixedParams}`)
      .then(response => response.data);
}

async function getAllMeals() {
  const promises = [];
  for (let i = 1; i <= 13; i++) {
    const promise = await getMeals(i, 1000);
    promises.push(promise);
  }
  const results = await Promise.all(promises);
  const meals = [];
  results.forEach(result => {
    if (result["mealServiceDietInfo"] != null) {
      const arr = result["mealServiceDietInfo"][1]["row"];
      arr.forEach(meal => {
        console.log(meal);
        // const newSchool = {
        //   "regionCode": school.ATPT_OFCDC_SC_CODE,
        //   "schoolCode": school.SD_SCHUL_CODE,
        //   "address": school.ORG_RDNMA,
        //   "schoolName": school.SCHUL_NM,
        //   "regionName": school.LCTN_SC_NM
        // }
        // schools.push(newSchool);
      })
    };
  });
  const result = meals;

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