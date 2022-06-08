package food;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.food.domain.FoodVO;
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
        ListDTO listDTO = new ListDTO();
        listDTO.setType("dn");
        listDTO.setKeyword("비비고");
        listDTO.setSize(100);

        List<FoodVO> foodList = foodMapper.selectList(listDTO);
        foodList.forEach(food -> log.info(food));
    }

    @Test
    public void testAllergyCheck(){

        ListDTO listDTO = new ListDTO();

        listDTO.setAllergy("우유,밀");
        log.info("getAllergy() : " + listDTO.getAllergy());
        log.info("getAllergies() : " + listDTO.getAllergies().toString());

        String ingredient = "두유";
        listDTO.setIngredient(ingredient);

        listDTO.setName("만두");
        listDTO.setBrand("CJ");

        listDTO.setType("ainbc");
        listDTO.setSize(1000);

        List<FoodVO> allergyCheckResult = foodMapper.allergyCheck(listDTO);
        allergyCheckResult.forEach(food -> log.info(food));
        log.info("======================"+allergyCheckResult.size()+"====================");
    }

    @Test
    public void testAllergyOptions(){
        List<String> allergyOptions = foodMapper.allergyOptions();
        allergyOptions.forEach(allergy -> log.info(allergy));
    }
}
