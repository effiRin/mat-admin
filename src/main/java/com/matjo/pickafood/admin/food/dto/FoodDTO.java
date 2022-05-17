package com.matjo.pickafood.admin.food.dto;

import lombok.Data;

@Data
public class FoodDTO {
  private Integer food_seq;
  private String name;
  private String companyCategory;
  private String company;
  private String mainImage;
  private String ingredient;
  private String sameFactory;

  private String url;
}
