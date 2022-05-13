package com.matjo.pickafood.admin.reply.controller;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.reply.dto.ReplyDTO;
import com.matjo.pickafood.admin.reply.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Log4j2
@RequestMapping("/replies/")
@RestController
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;

    //댓글 목록
    @GetMapping(value = "/list/{board_seq}" , produces = MediaType.APPLICATION_JSON_VALUE )
    public List<ReplyDTO> getListOfBoard(@PathVariable("board_seq") Integer board_seq, ListDTO listDTO){
        log.info("reply list....... :"+listDTO);

        return replyService.getListOfBoard(board_seq, listDTO);
    }

    //댓글 등록
    @PostMapping("/")
    public Map<String,Integer> registerReply(@RequestBody ReplyDTO replyDTO){
        log.info(replyDTO);
        log.info("-------댓글 등록 확인 -------");

        int totalCount = replyService.register(replyDTO);
        return Map.of("result", totalCount);
    }

    @DeleteMapping("/{rno}")
    public Map<String, String> remove(@PathVariable("rno") Integer rno){
        //log.info("=================================");
        //log.info("remove..." + rno);
        //replyService.remove(rno);

        return Map.of("result", "success");
    }
    
}
