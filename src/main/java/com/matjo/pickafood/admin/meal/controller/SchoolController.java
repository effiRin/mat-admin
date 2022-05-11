package com.matjo.pickafood.admin.meal.controller;

import com.matjo.pickafood.admin.meal.dto.SchoolDTO;
import com.matjo.pickafood.admin.meal.dto.SchoolUpdateDTO;
import com.matjo.pickafood.admin.meal.service.SchoolService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/school")
@Log4j2
@RestController
public class SchoolController {

  private final SchoolService schoolService;

  //  @RequestMapping(value = "/update", method = RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE)
  @PostMapping(value = "/update", consumes = MediaType.APPLICATION_JSON_VALUE)
  public void updatePOST(@RequestBody String schoolDTO) {
//    log.info(string);
    log.info(schoolDTO);
//    schoolService.insertAll(schoolUpdateDTO.getResult());

  }

}


