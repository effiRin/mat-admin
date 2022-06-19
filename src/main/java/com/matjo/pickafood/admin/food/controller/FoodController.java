package com.matjo.pickafood.admin.food.controller;

import com.matjo.pickafood.admin.common.dto.ListResponseDTO;
import com.matjo.pickafood.admin.common.dto.PageMaker;
import com.matjo.pickafood.admin.food.dto.CompanyDTO;
import com.matjo.pickafood.admin.food.dto.FoodDTO;
import com.matjo.pickafood.admin.food.dto.FoodSearchDTO;
import com.matjo.pickafood.admin.food.service.FoodService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j2
@Controller
@RequestMapping("/food/")
@RequiredArgsConstructor
public class FoodController {
    private final FoodService foodService;

    //list
    @GetMapping("/")
    public String basic() {
        return "redirect:/food/list";
    }

    //main
    @GetMapping("/main")
    public void main(FoodSearchDTO foodSearchDTO, Model model) {
        log.info(foodSearchDTO);
        ListResponseDTO<CompanyDTO> responseDTO = foodService.getMain(foodSearchDTO);
        model.addAttribute("companyList", responseDTO.getDtoList());
        model.addAttribute("total", responseDTO.getTotal());
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(foodSearchDTO.getPage(), total));

        // 알레르기 옵션 뿌려주기
        List<String> allergyOptions = foodService.getAllergyOptions();
        model.addAttribute("allergyOptions", allergyOptions);
    }

    //list 페이지
    @GetMapping("/list")
    public void list(FoodSearchDTO foodSearchDTO, Model model) {
        log.info(foodSearchDTO);
        // log.info("food list.........");
        // log.info("page : "+page);

        // 알레르기 체크 X, 재료명 입력 O -> 이거 줄여도 될듯??
        if ((foodSearchDTO.getAllergy() == null) && (foodSearchDTO.getIngredient() != null)) {
            log.info("=======");
            log.info("allergy is null & ingredient is " + foodSearchDTO.getIngredient());
            log.info("=======");
            ListResponseDTO<FoodDTO> responseDTO = foodService.getList(foodSearchDTO);
            model.addAttribute("dtoList", responseDTO.getDtoList());
//            model.addAttribute("sameFactoryList", responseDTO.get)
            model.addAttribute("total", responseDTO.getTotal());
            int total = responseDTO.getTotal();
            model.addAttribute("pageMaker", new PageMaker(foodSearchDTO.getPage(), total));

        } else { // 알레르기 체크했을 경우
            log.info("=======");
            log.info("allergy!!!!");
            log.info("=======");
            ListResponseDTO<FoodDTO> responseDTO = foodService.getAllergySearchList(foodSearchDTO);
            model.addAttribute("dtoList", responseDTO.getDtoList());
            model.addAttribute("total", responseDTO.getTotal());
            int total = responseDTO.getTotal();
            model.addAttribute("pageMaker", new PageMaker(foodSearchDTO.getPage(), total));
        }
    }
}
