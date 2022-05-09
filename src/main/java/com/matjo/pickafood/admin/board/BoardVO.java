package com.matjo.pickafood.admin.board;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {

    private Integer board_seq;
    private String title;
    private String content;
    private String id;
    private String nickName;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
    private int delFlag;
    private int replyCount;
    private int loveFor;
    private int viewsCount;
}
