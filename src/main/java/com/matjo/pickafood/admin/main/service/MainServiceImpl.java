package com.matjo.pickafood.admin.main.service;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.inquiry.domain.InquiryVO;
import com.matjo.pickafood.admin.inquiry.dto.InquiryDTO;
import com.matjo.pickafood.admin.main.mapper.MainMapper;
import com.matjo.pickafood.admin.member.domain.MemberVO;
import com.matjo.pickafood.admin.member.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
  
  private final ModelMapper modelMapper;
  private final MainMapper mainMapper;
  
  
  @Override
  public List<InquiryDTO> getMainInquiryList(){
    List<InquiryVO> inquiryVOList = mainMapper.selectAnanswerInquiry();
    return inquiryVOList.stream()
            .map(inquiryVO -> modelMapper.map(inquiryVO, InquiryDTO.class))
            .collect(Collectors.toList());
  }
}
