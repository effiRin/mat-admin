package com.matjo.pickafood.admin.food.domain;

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FoodVO {

  private Integer food_seq;
  private String name;
  private String company;
  private String mainImage;
  private String ingredient;
  private String url;

}
