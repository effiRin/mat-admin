package food;

import com.matjo.pickafood.admin.board.dto.BoardDTO;
import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.common.dto.ListResponseDTO;
import com.matjo.pickafood.admin.food.domain.FoodVO;
import com.matjo.pickafood.admin.food.dto.FoodDTO;
import com.matjo.pickafood.admin.food.service.FoodService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class FoodServiceTests {

    @Autowired(required = false)
    private FoodService foodService;

//    @Test
//    public void testGetAllergyCheckList() {
//
//        List<String> allergy = new ArrayList<>();
//        allergy.add("밀");
//        allergy.add("난류");
//
//        ListDTO listDTO = new ListDTO();
//        listDTO.setType("a");
//        listDTO.setSize(1000);
//        listDTO.setAllergyChecks(allergy);
//        foodService.getAllergyCheckList(listDTO);
//
//        ListResponseDTO<FoodDTO> foodDTOListResponseDTO = foodService.getAllergyCheckList(listDTO);
//        foodDTOListResponseDTO.getDtoList().forEach(foodDTO -> log.info(foodDTO));
//    }

}
