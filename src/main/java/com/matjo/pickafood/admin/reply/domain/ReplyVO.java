package com.matjo.pickafood.admin.reply.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {

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
