package com.matjo.pickafood.admin.inquiry;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/inquiry/")
@RequiredArgsConstructor
public class InquiryController {
    @GetMapping("/list")
    public void list(Model model){

        log.info("inquiry list.........");
        // log.info("page : "+page);

        //ListResponseDTO<BoardDTO> responseDTO = boardService.getList(listDTO);
        //model.addAttribute("dtoList", responseDTO.getDtoList());
        //model.addAttribute("total", responseDTO.getTotal());
        //int total = responseDTO.getTotal();
        //model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(), total));

    }


}
