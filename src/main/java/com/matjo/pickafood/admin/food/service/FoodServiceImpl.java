package com.matjo.pickafood.admin.food.service;

import com.matjo.pickafood.admin.food.domain.FoodVO;
import com.matjo.pickafood.admin.food.dto.FoodDTO;
import com.matjo.pickafood.admin.food.mapper.FoodMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FoodServiceImpl implements FoodService {

  private final FoodMapper foodMapper;
  private final ModelMapper modelMapper;

  @Override
  public void insert(FoodDTO foodDTO) {
    FoodVO foodVO = modelMapper.map(foodDTO, FoodVO.class);
    foodMapper.insert(foodVO);
  }
}
