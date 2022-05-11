package com.matjo.pickafood.admin.file.service;

import com.matjo.pickafood.admin.file.dto.FileDTO;

public interface FileService {
    void remove(String uuid);
    void register(FileDTO fileDTO);
}
