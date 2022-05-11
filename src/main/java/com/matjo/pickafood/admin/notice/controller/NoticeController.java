package com.matjo.pickafood.admin.notice.controller;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.common.dto.ListResponseDTO;
import com.matjo.pickafood.admin.common.dto.PageMaker;
import com.matjo.pickafood.admin.notice.dto.NoticeDTO;
import com.matjo.pickafood.admin.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/notice/")
public class NoticeController {

    private final NoticeService noticeService ;

    //list
    @GetMapping("/")
    public String basic(){
        return "redirect:/notice/list";
    }

    @GetMapping("/list")
    public void list(ListDTO listDTO, Model model) {
        //log.info("notice list.........");

        ListResponseDTO<NoticeDTO> responseDTO = noticeService.getList(listDTO);

        model.addAttribute("dtoList", responseDTO.getDtoList());
        model.addAttribute("total", responseDTO.getTotal());

        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(), total));
    }

    //등록
    @GetMapping("/register")
    public String register(){

        return "/notice/register";
    }

    @PostMapping("/register")
    public String registerPOST(NoticeDTO noticeDTO, RedirectAttributes rttr){
        log.info("등록 시....post................");
        log.info(noticeDTO);

        noticeService.register(noticeDTO);
        rttr.addFlashAttribute("result", 123);

        return "redirect:/notice/list";
    }



}