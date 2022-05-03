package com.matjo.pickafood.admin.report;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface ReportService {
    ListResponseDTO<ReportDTO> getList(ListDTO listDTO); //회원 신고글 목록
    ReportDTO getOne(Integer bno); //회원 신고 상세 페이지
}
