package com.matjo.pickafood.admin.food.domain;

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FoodVO {

    private Integer food_seq; //pk
    private String name; //이름
    private String company_category;
    private String company; //회사
    private String main_image; //이미지
    private String ingredient; //재료 성분
    private String same_factory; //같은 공장
    private String allergy_ingredient;

    private String image2;
    private String image3;

}
