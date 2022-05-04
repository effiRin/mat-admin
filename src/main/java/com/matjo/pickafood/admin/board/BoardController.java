package com.matjo.pickafood.admin.board;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@RequestMapping("/board/")
@RequiredArgsConstructor
@Controller
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/")
    public String basic() {return "redirect:/board/list";}

    @GetMapping("/list")
    public void list(ListDTO listDTO, Model model) {
        log.info("Board List 입니다...");
        log.info("Page : " + listDTO);

        ListResponseDTO<BoardDTO> responseDTO = boardService.getList(listDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());

    }
}
