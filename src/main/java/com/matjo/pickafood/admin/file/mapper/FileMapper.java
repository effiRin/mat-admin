package com.matjo.pickafood.admin.file.mapper;

import com.matjo.pickafood.admin.common.mapper.GenericMapper;
import com.matjo.pickafood.admin.file.domain.FileVO;

public interface FileMapper extends GenericMapper<FileVO, Integer> {

    void insert(FileVO fileVO); //mapping 테이블에 이미지 등록

    void insertBoard(FileVO fileVO);

    void delete(String uuid);; //이미지 삭제

}
