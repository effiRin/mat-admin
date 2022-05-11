function getSchools(pIndex, pSize) {
  const OPEN_API_URL = "https://open.neis.go.kr/hub";
  const SCHOOL_API = "/schoolInfo";
  // const MEAL_API = "/mealServiceDietInfo";
  const KEY = "2e191712000e470dac71cace19e334d9";
  const TYPE = "json";
  const fixedParams = `KEY=${KEY}&TYPE=${TYPE}&pIndex=${pIndex}&pSize=${pSize}`;
  return axios.get(`${OPEN_API_URL}${SCHOOL_API}?${fixedParams}`)
      .then(response => response.data);
}
