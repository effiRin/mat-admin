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

import java.util.ArrayList;
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
        listDTO.setType("ris");
        listDTO.setKeyword("대파");
        listDTO.setSize(100);

        List<FoodVO> foodList = foodMapper.selectList(listDTO);
        foodList.forEach(food -> log.info(food));

    }

    @Test
    public void testAllergyOptions(){
        List<String> allergyOptions = foodMapper.allergyOptions();
        allergyOptions.forEach(allergy -> log.info(allergy));
    }
}
