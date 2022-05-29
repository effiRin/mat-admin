package com.matjo.pickafood.admin.food.controller;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.common.dto.ListResponseDTO;
import com.matjo.pickafood.admin.common.dto.PageMaker;
import com.matjo.pickafood.admin.food.dto.CompanyDTO;
import com.matjo.pickafood.admin.food.dto.FoodDTO;
import com.matjo.pickafood.admin.food.service.FoodService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/food/")
@RequiredArgsConstructor
public class FoodController {
    private final FoodService foodService;

    //list
    @GetMapping("/")
    public String basic(){
        return "redirect:/food/list";
    }

    //main
    @GetMapping("/main")
    public void  main(ListDTO listDTO, Model model){
        ListResponseDTO<CompanyDTO> responseDTO = foodService.getMain(listDTO);
        model.addAttribute("companyList", responseDTO.getDtoList());
        model.addAttribute("total", responseDTO.getTotal());
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(), total));

        List<String> allergyOptions = foodService.getAllergyOptions();
        model.addAttribute("allergyOptions", allergyOptions);
    }

    //list 페이지
    @GetMapping("/list")
    public void list(ListDTO listDTO, Model model){

        // log.info("food list.........");
        // log.info("page : "+page);

        ListResponseDTO<FoodDTO> responseDTO = foodService.getList(listDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());
        model.addAttribute("total", responseDTO.getTotal());
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(), total));

    }

    // 알레르기 체크박스 검색 - 수정필요!!!
    public String Test(ModelMap model, HttpServletRequest request ) throws Exception{
        try{
            int cnt = Integer.parseInt(request.getParameter("cnt"));
            for(int j = 1; j <= cnt ; j++ ){
                for(int i = 0; i < request.getParameterValues("ch" + String.valueOf(j)).length ; i++){
                    System.out.println(request.getParameterValues("ch" + String.valueOf(j))[i]);
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
