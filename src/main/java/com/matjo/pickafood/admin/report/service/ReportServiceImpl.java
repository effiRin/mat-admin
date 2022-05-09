package com.matjo.pickafood.admin.report.service;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import com.matjo.pickafood.admin.report.domain.ReportVO;
import com.matjo.pickafood.admin.report.dto.ReportDTO;
import com.matjo.pickafood.admin.report.mapper.ReportMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class ReportServiceImpl implements ReportService {

    private final ReportMapper reportMapper;
    private final ModelMapper modelMapper;

    //회원 신고 목록
    @Override
    public ListResponseDTO<ReportDTO> getList(ListDTO listDTO) {
        List<ReportVO> reportVOList = reportMapper.selectList(listDTO);

        List<ReportDTO> dtoList =
                reportVOList.stream()
                        .map(reportVO -> modelMapper.map(reportVO, ReportDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<ReportDTO>builder()
                .dtoList(dtoList)
                .total(reportMapper.getTotal(listDTO))
                .build();
    }

    //회원 신고 상세 페이지
    @Override
    public ReportDTO getOne(Integer bno) {
        ReportVO reportVO = reportMapper.selectOne(bno);
        ReportDTO reportDTO = modelMapper.map(reportVO, ReportDTO.class);


        return reportDTO;
    }
}
