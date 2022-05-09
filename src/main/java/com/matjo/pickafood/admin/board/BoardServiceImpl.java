package com.matjo.pickafood.admin.board;

import com.matjo.pickafood.admin.board.mapper.BoardMapper;
import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Log4j2
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

    @Override
    public void register(BoardDTO boardDTO) {

        BoardVO boardVO = modelMapper.map(boardDTO, BoardVO.class);
        log.info("register....." +boardDTO);
        boardMapper.insert(boardVO);
    }

    @Override
    public BoardDTO getOne(Integer board_seq) {
        log.info("get....."+ board_seq);
        BoardVO boardVO = boardMapper.selectOne(board_seq);
        BoardDTO boardDTO = modelMapper.map(boardVO, BoardDTO.class);
        return boardDTO;
    }

    @Override
    public void update(BoardDTO boardDTO) {

        boardMapper.update(BoardVO.builder()
                .board_seq(boardDTO.getBoard_seq())
                .title(boardDTO.getTitle())
                .content(boardDTO.getContent())
                .build());
    }

    @Override
    public void remove(Integer board_seq) {

        boardMapper.delete(board_seq);

    }
}
