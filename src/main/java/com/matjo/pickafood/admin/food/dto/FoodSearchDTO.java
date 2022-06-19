package com.matjo.pickafood.admin.food.dto;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import lombok.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@Data
public class FoodSearchDTO extends ListDTO {

    private List<String> allergyChecks;
    private String allergy;  // a
    private String ingredient;  // i
    private String name; // n
    private String brand; // DB의 company를 의미, type은 b (brand)
    private String sort;

    public String[] getAllergies() {
        return this.allergy.split(",");
    }

    public String getIngredient(){
        return ingredient == null || ingredient.trim().length() == 0 ? null : ingredient.trim();
    }

    public String[] getBrands() {
        return this.brand.split(",");
    }

    public String getLink(){
        //UriComponentBuilder
        UriComponentsBuilder builder = UriComponentsBuilder.newInstance();
        builder.queryParam("page",getPage())
                .queryParam("size", getSize());

        if(type != null){
            builder.queryParam("type", type);
        }

        if(keyword != null){
            try {
                String enStr = URLEncoder.encode(keyword, "UTF-8");
                builder.queryParam("keyword",enStr);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        if(allergy != null) {
            try {
                String enStr = URLEncoder.encode(allergy, "UTF-8");
                builder.queryParam("allergy",enStr);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        if(ingredient != null) {
            try {
                String enStr = URLEncoder.encode(ingredient, "UTF-8");
                builder.queryParam("ingredient", enStr);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        if(brand != null) {
            try {
                String enStr = URLEncoder.encode(brand, "UTF-8");
                builder.queryParam("brand",enStr);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        return builder.build().toString();
    }

}
