package com.matjo.pickafood.admin.food.dto;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import lombok.Data;

import java.util.List;

@Data
public class FoodSearchDTO {

    private List<String> allergyChecks;

    private ListDTO listDTO = new ListDTO();



}
