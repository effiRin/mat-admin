package com.matjo.pickafood.admin.board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {

    private Integer board_seq;
    private Integer boardCategory;
    private String mainImage;
    private String title;
    private String content;
    private String id;
    private String nickName;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
    private int delFlag;
    private int replyCount;
    private int likeCount;
    private int viewsCount;

}
