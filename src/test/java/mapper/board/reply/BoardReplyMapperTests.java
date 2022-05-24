package mapper.board.reply;

import com.matjo.pickafood.admin.board.reply.domain.ReplyVO;
import com.matjo.pickafood.admin.board.reply.mapper.BoardReplyMapper;
import com.matjo.pickafood.admin.board.vo.BoardVO;
import com.matjo.pickafood.admin.common.dto.ListDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class BoardReplyMapperTests {

        @Autowired(required = false)
        private BoardReplyMapper mapper;

        @Test
        public void testList1(){

            Integer boardSeq = 87;

            ListDTO listDTO = new ListDTO();
            listDTO.setPage(1);
            listDTO.setSize(10);

            mapper.selectListOfBoard(boardSeq, listDTO).forEach(reply -> log.info(reply));
        }

        @Test
        public void testInsert(){

            ReplyVO replyVO = ReplyVO.builder()
                    .boardSeq(40)
                    .content("스스스")
                    .id("kim")
                    .nickname("연느짱")
                    .build();

            mapper.insert(replyVO);
            log.info(replyVO);
        }
    }