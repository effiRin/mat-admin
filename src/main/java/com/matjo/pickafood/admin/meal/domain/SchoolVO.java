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

  private String regionCode;
  private String regionName;
  private String address;
  private String schoolName;
  private String schoolCode;

}
