package food;

import com.matjo.pickafood.admin.food.domain.FoodVO;
import com.matjo.pickafood.admin.food.dto.FoodSearchDTO;
import com.matjo.pickafood.admin.food.mapper.FoodMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class FoodMapperTests {

    @Autowired(required = false)
    private FoodMapper foodMapper;



    @Test
    public void testSelectList() {
        FoodSearchDTO foodSearchDTO = new FoodSearchDTO();
        foodSearchDTO.setType("dn");
        foodSearchDTO.setKeyword("비비고");
        foodSearchDTO.setSize(100);

        List<FoodVO> foodList = foodMapper.selectList(foodSearchDTO);
        foodList.forEach(food -> log.info(food));
    }

    @Test
    public void testAllergySelectList(){
        FoodSearchDTO foodSearchDTO = new FoodSearchDTO();
        foodSearchDTO.setAllergy("조개류,난류");
        log.info("getAllergy() : " + foodSearchDTO.getAllergy());
        log.info("getAllergies() : " + foodSearchDTO.getAllergies().toString());

        String ingredient = "조개";
        foodSearchDTO.setIngredient(ingredient);

        foodSearchDTO.setName("만두");
        foodSearchDTO.setBrand("CJ");

        foodSearchDTO.setType("ainbc");
        foodSearchDTO.setSize(1000);
        foodSearchDTO.setSort("allergySort");

        List<FoodVO> allergyCheckResult = foodMapper.allergySearchList(foodSearchDTO);
        log.info(foodSearchDTO);
        allergyCheckResult.forEach(food -> log.info(food));
        log.info("======================"+allergyCheckResult.size()+"====================");
    }

    @Test
    public void testAllergyOptions(){
        List<String> allergyOptions = foodMapper.allergyOptions();
        allergyOptions.forEach(allergy -> log.info(allergy));
    }
}
