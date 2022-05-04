package com.matjo.pickafood.admin.board.mapper;

import com.matjo.pickafood.admin.board.BoardVO;
import com.matjo.pickafood.admin.common.GenericMapper;
import org.apache.ibatis.annotations.Param;

public interface BoardMapper extends GenericMapper<BoardVO, Integer> {

    void updateReplyCount(@Param("bno") Integer bno, @Param("amount")  int amount);

}
