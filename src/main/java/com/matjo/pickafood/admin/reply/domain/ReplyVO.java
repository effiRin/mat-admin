package com.matjo.pickafood.admin.reply.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {

    private Integer reply_seq;
    private Integer board_seq;
    private Integer originReply_seq;
    private Integer rootReply_seq;

    private String content;
    private String id;
    private String nickName;
    private String profile;

    @DateTimeFormat(pattern = "yyyy-MM-dd kk:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime regDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd kk:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateDate;

    private String dateStr;
    private double date;

    private int delFlag;
    private int likeCount;
    private String mainImage;

}
