package com.matjo.pickafood.admin.board.vo;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AttachFile {

    private String uuid;
    private Integer bno;
    private String fileName;
    private String savePath;
    private boolean img;

}