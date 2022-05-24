package com.matjo.pickafood.admin.main.controller;

import com.matjo.pickafood.admin.inquiry.dto.InquiryDTO;
import com.matjo.pickafood.admin.main.service.MainService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/main")
public class MainController {
  
  private final MainService mainService;
  
  @GetMapping("/main")
  public void mainInquiry(Model model) {
    List<InquiryDTO> list  = mainService.getMainInquiryList();
    model.addAttribute("list", list);
    log.info("list",list);
  }
  
  
}
