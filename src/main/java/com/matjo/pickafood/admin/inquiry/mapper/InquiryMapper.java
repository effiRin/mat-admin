package com.matjo.pickafood.admin.inquiry.mapper;

import com.matjo.pickafood.admin.common.mapper.GenericMapper;
import com.matjo.pickafood.admin.inquiry.domain.InquiryVO;

public interface InquiryMapper extends GenericMapper<InquiryVO, Integer> {

    void answerContent(InquiryVO inquiryVO);
}
