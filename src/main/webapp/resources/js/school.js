const OPEN_API_URL = "https://open.neis.go.kr/hub/";
const SCHOOL_API = "schoolInfo";
const MEAL_API = "mealServiceDietInfo";
const fixedParams = {
  KEY : "2e191712000e470dac71cace19e334d9",
  TYPE : "json",
  pIndex : 1,
  pSize : 10,
  makeQuery : function() {
    return `KEY=${this.KEY}&TYPE=${this.TYPE}&pIndex=${this.pIndex}&pSize=${this.pSize}`;
  }
};


function getSchoolCode(ATPT_OFCDC_SC_CODE, SCHUL_NM) {
  const mutableParams = {
    ATPT_OFCDC_SC_CODE : ATPT_OFCDC_SC_CODE,
    SCHUL_NM : SCHUL_NM,
    makeQuery : function() {
      return `ATPT_OFCDC_SC_CODE=${this.ATPT_OFCDC_SC_CODE}&SCHUL_NM=${this.SCHUL_NM}`;
    }
  };
  return `${OPEN_API_URL}${SCHOOL_API}?${fixedParams.makeQuery()}&${mutableParams.makeQuery()}`;
}

async function getMealsData({regionCode, schoolCode, startDate, endDate}) {
  const mutableParams = `ATPT_OFCDC_SC_CODE=${regionCode}&SD_SCHUL_CODE=${schoolCode}&MLSV_FROM_YMD=${startDate}&MLSV_TO_YMD=${endDate}`;
  const request_url = `${OPEN_API_URL}${MEAL_API}?${fixedParams.makeQuery()}&${mutableParams}`;
  return await axios.get(request_url);
}