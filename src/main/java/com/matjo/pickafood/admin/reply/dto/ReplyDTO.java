package com.matjo.pickafood.admin.reply.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ReplyDTO {

    private Integer reply_seq;
    private Integer board_seq;
    private Integer rootReply_seq;

    private String content;
    private String id;
    private String nickName;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime regDate;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateDate;

    private int delFlag;
    private int likeCount;
    private String mainImage;

}
