package com.matjo.pickafood.admin.food.service;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.common.dto.ListResponseDTO;
import com.matjo.pickafood.admin.food.dto.CompanyDTO;
import com.matjo.pickafood.admin.food.dto.FoodDTO;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Transactional
public interface FoodService {
    ListResponseDTO<FoodDTO> getList(ListDTO listDTO); //목록
    void insert(FoodDTO foodDTO);
    ListResponseDTO<CompanyDTO> getMain(ListDTO listDTO); //메인화면
    List<String> getAllergyOptions(); // 알레르기 19종 가져오기

    ListResponseDTO<FoodDTO> getAllergySearchList(ListDTO listDTO); // 알레르기 리스트 불러오기
}
