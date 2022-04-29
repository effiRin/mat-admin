package inquiry;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.inquiry.mapper.InquiryMapper;
import com.matjo.pickafood.admin.inquiry.InquiryVO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class InquiryMapperTests {

    @Autowired(required = false)
    private InquiryMapper inquiryMapper;


    @Test
    public void testSelectList(){
        ListDTO listDTO = new ListDTO();

        List<InquiryVO> boardList = inquiryMapper.selectList(listDTO);

        boardList.forEach(InquiryVO -> log.info(InquiryVO));
    }
}
