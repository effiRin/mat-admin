package com.matjo.pickafood.admin.inquiry;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface InquiryService {
    ListResponseDTO<InquiryDTO> getList(ListDTO listDTO);

}
