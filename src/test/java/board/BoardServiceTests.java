package board;

import com.matjo.pickafood.admin.board.BoardDTO;
import com.matjo.pickafood.admin.board.BoardService;
import com.matjo.pickafood.admin.board.BoardVO;
import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.common.ListResponseDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class BoardServiceTests {

    @Autowired(required = false)
    private BoardService boardService;

    @Test
    public void testExist() {   //  BoardService 객체가 제대로 주입이 가능한지 확인

        log.info(boardService);
        assertNotNull(boardService);
        //정상적으로 BoardService 객체가 생성되고 BoardMapper 가 주입되었다면 아래와 같이
        //BoardService 객체와 데이터베이스 관련 로그가 같이 출력

    }

    @Test
    public void testSelectList() {

        ListDTO listDTO = new ListDTO();
        listDTO.setType("t");
        listDTO.setKeyword("1");

        ListResponseDTO<BoardDTO> listResponseDTO = boardService.getList(listDTO);
        listResponseDTO.getDtoList().forEach(boardDTO -> log.info(boardDTO));
        // listResponseDTO에 @Data가 있기 때문에 따로 만들지 않아도 get 메소드 getDtoList를 쓸 수 있음
        // forEach - boardDTO 변수

        }



    }
