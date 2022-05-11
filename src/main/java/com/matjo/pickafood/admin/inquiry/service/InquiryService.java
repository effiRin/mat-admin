package com.matjo.pickafood.admin.inquiry.service;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.common.dto.ListResponseDTO;
import com.matjo.pickafood.admin.inquiry.dto.InquiryDTO;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface InquiryService {
    ListResponseDTO<InquiryDTO> getList(ListDTO listDTO); //문의글 목록
    InquiryDTO getOne(Integer bno); //문의 상세 페이지
    void answerContent(InquiryDTO inquiryDTO); //답변 달기
}
