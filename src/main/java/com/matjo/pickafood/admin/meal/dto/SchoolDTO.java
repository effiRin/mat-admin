package com.matjo.pickafood.admin.meal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SchoolDTO {

  private String ATPT_OFCDC_SC_CODE;   //regionCode
  private String LCTN_SC_NM;          //regionName
  private String ORG_RDNMA;         //address
  private String SCHUL_NM;        //schoolName
  private String SD_SCHUL_CODE;

}
