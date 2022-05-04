package com.matjo.pickafood.admin.board;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;

public interface BoardService {

    ListResponseDTO<BoardDTO> getList(ListDTO listDTO);

}
