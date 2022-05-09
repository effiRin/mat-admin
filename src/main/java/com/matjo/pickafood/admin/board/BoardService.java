package com.matjo.pickafood.admin.board;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;

import java.util.List;

public interface BoardService {

    ListResponseDTO<BoardDTO> getList(ListDTO listDTO);

    void register(BoardDTO boardDTO);

    BoardDTO getOne(Integer board_seq);

    void update(BoardDTO boardDTO);

    void remove(Integer board_seq);

//    List<UploadResultDTO> getFiles(Integer board_seq);
}
