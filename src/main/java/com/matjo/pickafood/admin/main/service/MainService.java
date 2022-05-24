package com.matjo.pickafood.admin.main.service;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.inquiry.dto.InquiryDTO;


import java.util.List;

public interface MainService {
  List<InquiryDTO> getMainInquiryList();
}
