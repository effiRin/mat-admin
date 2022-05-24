package com.matjo.pickafood.admin.main.mapper;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.inquiry.domain.InquiryVO;

import java.util.List;


public interface MainMapper {
  
  List<InquiryVO> selectAnanswerInquiry();
}
