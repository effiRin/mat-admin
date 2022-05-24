package mapper.board.reply;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.reply.domain.ReplyVO;
import com.matjo.pickafood.admin.reply.mapper.ReplyMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class ReplyMapperTests {

        @Autowired(required = false)
        private ReplyMapper boardReplyMapper;

        @Test
        public void testMapper(){
            log.info(boardReplyMapper);
        }

        @Test
        public void testInsert(){

        ReplyVO replyVO = ReplyVO.builder()
                .boardSeq(87)
                .content("스스스")
                .id("kim")
                .nickname("연느짱")
                .build();

            boardReplyMapper.insert(replyVO);
            log.info(replyVO);
    }


        @Test
        public void testList1(){

            Integer boardSeq = 87;

            ListDTO listDTO = new ListDTO();
            listDTO.setPage(1);
            listDTO.setSize(10);

        boardReplyMapper.selectListOfBoard(boardSeq, listDTO).forEach(reply -> log.info(reply));
        }

    }