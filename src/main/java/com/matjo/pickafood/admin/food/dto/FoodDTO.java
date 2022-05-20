package com.matjo.pickafood.admin.food.dto;

import lombok.Data;

@Data
public class FoodDTO {
    private Integer food_seq; //pk
    private String name; //이름
    private String company; //회사
    private String company_category;
    private String main_image; //이미지
    private String ingredient; //재료 성분
    private String same_factory; //같은 공장
    private String allergy_ingredient; // 알레르기 성분

    private String image2;
    private String image3;

    private int num;
}
