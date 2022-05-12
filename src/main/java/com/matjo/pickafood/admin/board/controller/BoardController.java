package com.matjo.pickafood.admin.board.controller;

import com.matjo.pickafood.admin.board.service.BoardService;
import com.matjo.pickafood.admin.board.dto.BoardDTO;
import com.matjo.pickafood.admin.board.dto.UploadResultDTO;
import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.board.vo.BoardVO;
import com.matjo.pickafood.admin.common.dto.ListResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

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

    @GetMapping("/register")
    public void registerGET(){

    }

    @PostMapping("/register")
    public String registerPOST (BoardDTO boardDTO, RedirectAttributes rttr){

        log.info("register..." + boardDTO);

        boardService.register(boardDTO);

        rttr.addFlashAttribute("result", boardDTO.getBoard_seq());

        return "redirect:/board/list";

    }

    @PostMapping("/modify")
    public String modify(@RequestParam("bno") Integer bno, BoardDTO boardDTO, ListDTO listDTO, RedirectAttributes rttr) {

        boardDTO.setBoard_seq(bno);
        log.info("modify:" + boardDTO);
        boardService.update(boardDTO);
        rttr.addFlashAttribute("result", "modified");
        return "redirect:/board/read/" + bno + listDTO.getLink();
    }

    @GetMapping({"/remove/{bno}"})
    public String getNotSupported(){
        return "redirect:/board/list";
    }

    @PostMapping("/remove")
    public String removePost(@RequestParam("bno") Integer bno, RedirectAttributes rttr) {

        boardService.remove(bno);
        rttr.addFlashAttribute("result", "removed");
        return "redirect:/board/list";
    }

    @GetMapping("/files/{bno}")
    @ResponseBody
    public List<UploadResultDTO> getFiles(@RequestParam("bno") Integer bno){

        return boardService.getFiles(bno);
    }

    }
