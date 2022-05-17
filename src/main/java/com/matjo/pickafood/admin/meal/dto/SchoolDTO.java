package com.matjo.pickafood.admin.meal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SchoolDTO {

  private String regionCode;
  private String regionName;
  private String address;
  private String schoolName;
  private String schoolCode;

}
