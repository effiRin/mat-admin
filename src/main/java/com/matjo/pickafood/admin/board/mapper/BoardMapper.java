package com.matjo.pickafood.admin.board.mapper;

import com.matjo.pickafood.admin.board.BoardVO;
import com.matjo.pickafood.admin.common.GenericMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BoardMapper extends GenericMapper<BoardVO, Integer> {

    void updateReplyCount(@Param("board_seq") Integer bno, @Param("amount")  int amount);

    // List<AttachFile> selectFiles(Integer bno);

}
