package com.matjo.pickafood.admin.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class UploadResultDTO {

    private String uuid;
    private String fileName;
    private String savePath;
    private boolean img;

    public UploadResultDTO(){

    }

    public String getLink(){
        return savePath+"/"+uuid+"_"+fileName;
    }
    public String getThumbnail(){
        return savePath+"/s_"+uuid+"_"+fileName;
    }

}

