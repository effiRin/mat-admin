package com.matjo.pickafood.admin.food.mapper;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.common.mapper.GenericMapper;
import com.matjo.pickafood.admin.food.domain.CompanyVO;
import com.matjo.pickafood.admin.food.domain.FoodVO;
import com.matjo.pickafood.admin.food.dto.FoodSearchDTO;

import java.util.List;

public interface FoodMapper extends GenericMapper<FoodVO, Integer> {
    List<CompanyVO> companyList(FoodSearchDTO foodSearchDTO);
    int getCompanyTotal(FoodSearchDTO foodSearchDTO);
    List<String> allergyOptions();

    List<FoodVO> allergySearchList(FoodSearchDTO foodSearchDTO);
    int getAllergyCheckTotal(FoodSearchDTO foodSearchDTO);

}
