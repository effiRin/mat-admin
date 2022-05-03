package com.matjo.pickafood.admin.inquiry;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface InquiryService {
    ListResponseDTO<InquiryDTO> getList(ListDTO listDTO); //문의글 목록
    InquiryDTO getOne(Integer bno); //문의 상세 페이지
    void answerContent(InquiryDTO inquiryDTO); //답변 달기
}
