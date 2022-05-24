package mapper.board.reply;

import com.matjo.pickafood.admin.reply.dto.ReplyDTO;
import com.matjo.pickafood.admin.reply.service.ReplyService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class ReplyServiceTests {

    @Autowired
    private ReplyService replyService;

    @Test
    public void testBoardRegister() {
        ReplyDTO replyDTO = new ReplyDTO();
        replyDTO.setBoardSeq(138);
        replyDTO.setContent("댓글 서비스를 통한 댓글 추가");
        replyDTO.setId("kim");
        replyDTO.setNickname("연느");

        replyService.boardRegister(replyDTO);
    }
}
