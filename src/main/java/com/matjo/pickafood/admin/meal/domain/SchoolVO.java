package com.matjo.pickafood.admin.meal.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SchoolVO {

  private String ATPT_OFCDC_SC_CODE;   //regionCode
  private String LCTN_SC_NM;          //regionName
  private String ORG_RDNMA;         //address
  private String SCHUL_NM;        //schoolName
  private String SD_SCHUL_CODE;

}
