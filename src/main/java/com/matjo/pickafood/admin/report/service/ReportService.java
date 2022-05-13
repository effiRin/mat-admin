package com.matjo.pickafood.admin.report.service;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.common.dto.ListResponseDTO;
import com.matjo.pickafood.admin.report.dto.ReportDTO;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface ReportService {
    ListResponseDTO<ReportDTO> getList(ListDTO listDTO); //회원 신고글 목록
    ReportDTO getOne(Integer bno); //회원 신고 상세 페이지
}
