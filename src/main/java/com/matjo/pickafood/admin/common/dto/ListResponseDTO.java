package com.matjo.pickafood.admin.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ListResponseDTO<E>{ //<E> 나중에 정하는 타입
    private List<E> dtoList;
    private int total;

}