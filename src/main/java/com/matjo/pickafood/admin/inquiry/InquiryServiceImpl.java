package com.matjo.pickafood.admin.inquiry;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import com.matjo.pickafood.admin.inquiry.mapper.InquiryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class InquiryServiceImpl implements InquiryService {

    private final InquiryMapper inquiryMapper;
    private final ModelMapper modelMapper;

    //목록
    @Override
    public ListResponseDTO<InquiryDTO> getList(ListDTO listDTO) {
        List<InquiryVO> inquiryVOList = inquiryMapper.selectList(listDTO);

        List<InquiryDTO> dtoList =
                inquiryVOList.stream()
                        .map(inquiryVO -> modelMapper.map(inquiryVO, InquiryDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<InquiryDTO>builder()
                .dtoList(dtoList)
                .total(inquiryMapper.getTotal(listDTO))
                .build();
    }
}
