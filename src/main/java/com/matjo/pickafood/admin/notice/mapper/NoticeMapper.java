package com.matjo.pickafood.admin.notice.mapper;

import com.matjo.pickafood.admin.common.mapper.GenericMapper;
import com.matjo.pickafood.admin.notice.domain.NoticeVO;

public interface NoticeMapper extends GenericMapper<NoticeVO, Integer> {
    void updateReplyCount(Integer board_seq, int i);
}
