package com.matjo.pickafood.admin.file.service;

import com.matjo.pickafood.admin.file.domain.FileVO;
import com.matjo.pickafood.admin.file.dto.FileDTO;
import com.matjo.pickafood.admin.file.mapper.FileMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class FileServiceImpl implements FileService{

    private final FileMapper fileMapper;
    private final ModelMapper modelMapper;

    @Override
    public void remove(String uuid) {
        fileMapper.delete(uuid);
    }

    @Override
    public void register(FileDTO fileDTO) {
        FileVO fileVO = modelMapper.map(fileDTO, FileVO.class);
        fileMapper.insert(fileVO);
    }
}
