package com.matjo.pickafood.admin.board;

import com.matjo.pickafood.admin.board.mapper.BoardMapper;
import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{

    private final BoardMapper boardMapper;
    private final ModelMapper modelMapper;
    // 생성자를 만들어주기 위해서 @RequiredArgsConstructor와 final

    @Override
    public ListResponseDTO<BoardDTO> getList(ListDTO listDTO) {

        List<BoardVO> boardList = boardMapper.selectList(listDTO);

        List<BoardDTO> boardDTOList =boardList.stream()
                .map(board -> modelMapper.map(board, BoardDTO.class))
                .collect(Collectors.toList());

        return ListResponseDTO.<BoardDTO>builder()
                .dtoList(boardDTOList)
                .total(boardMapper.getBoardTotal(listDTO))
                .build();
    }
}
