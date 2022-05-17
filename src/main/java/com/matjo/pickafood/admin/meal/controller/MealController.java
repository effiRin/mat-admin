package com.matjo.pickafood.admin.meal.controller;

import com.matjo.pickafood.admin.meal.service.SchoolService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/meal")
@Log4j2
public class MealController {

  private final SchoolService schoolService;
  @GetMapping("/school")
  public void school() {

  }

  @GetMapping("/update")
  public void updateGET() {

  }

////  @RequestMapping(value = "/update", method = RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE)
//  @PostMapping("/update")
//  public void updatePOST(@RequestBody SchoolDTO schoolDTO) {
//    log.info(schoolDTO);
////    schoolService.insertAll(schoolUpdateDTO.getResult());
//
//  }

}

