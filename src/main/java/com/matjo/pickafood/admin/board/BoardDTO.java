package com.matjo.pickafood.admin.board;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class BoardDTO {

    private Integer bno;
    private String title;
    private String content;
    private String writer;

    private LocalDateTime regDate;
    private LocalDateTime updateDate;
    private int delYn;
    private int replyCount;

}
