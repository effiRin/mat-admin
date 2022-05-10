async function getAllSchools() {
  const OPEN_API_URL = "https://open.neis.go.kr/hub";
  const SCHOOL_API = "/schoolInfo";
  const MEAL_API = "/mealServiceDietInfo";
  const KEY = "2e191712000e470dac71cace19e334d9";
  const TYPE = "json";

  async function getSchools(pIndex) {
    const fixedParams = `KEY=${KEY}&TYPE=${TYPE}&pIndex=${pIndex}&pSize=1000`;
    return await axios.get(`${OPEN_API_URL}${SCHOOL_API}?${fixedParams}`);
  }

  let i = 1;
  const resultArr = [];
  let data;
  await getSchools(i).then(result => {
    data = result.data;
    const pureDataArr = data.schoolInfo[1];
    pureDataArr.forEach(data => {
      resultArr.push(data);
    })
  })
  while (data.RESULT != null) {
    getSchools(i).then(result => {
      const data = result.data;
      const pureDataArr = data.schoolInfo[1];
      pureDataArr.forEach(data => {
        resultArr.push(data);
      })
    })
  }
  return resultArr;
}




function getSchoolList() {

}