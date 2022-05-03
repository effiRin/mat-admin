package com.matjo.pickafood.admin.inquiry;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import com.matjo.pickafood.admin.common.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequestMapping("/inquiry/")
@RequiredArgsConstructor
public class InquiryController {

    private final InquiryService inquiryService;

    //list
    @GetMapping("/")
    public String basic(){
        return "redirect:/inquiry/list";
    }

    //list 페이지
    @GetMapping("/list")
    public void list(ListDTO listDTO, Model model){

        log.info("inquiry list.........");
        // log.info("page : "+page);

        ListResponseDTO<InquiryDTO> responseDTO = inquiryService.getList(listDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());
        model.addAttribute("total", responseDTO.getTotal());
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(), total));

    }

    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model){
        log.info("==========bno: "+bno);
        log.info("======listDTO: "+listDTO);

        model.addAttribute("dto", inquiryService.getOne(bno));

        return "/inquiry/read";
    }

    @PostMapping("/read/{bno}")
    public String answerContentPost(InquiryDTO inquiryDTO){

        inquiryService.answerContent(inquiryDTO);

        return "redirect:/inquiry/read/{bno}";
    }


}
