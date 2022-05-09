package board;

import com.matjo.pickafood.admin.board.BoardVO;
import com.matjo.pickafood.admin.board.mapper.BoardMapper;
import com.matjo.pickafood.admin.common.ListDTO;
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
public class BoardMapperTests {

    @Autowired(required = false)
    private BoardMapper boardMapper;

    @Test
    public void testInsert() {

        BoardVO board = BoardVO.builder()
                .title("테테테")
                .content("스스스")
                .writer("트트트user123")
                .build();

        boardMapper.insert(board);
        log.info(board);
    }

    @Test
    public void testSelectList() {

        ListDTO listDTO = new ListDTO();
        listDTO.setType("t");
        listDTO.setKeyword("1");

        List<BoardVO> boardList = boardMapper.selectList(listDTO);

        boardList.forEach(board -> log.info(board));

    }

    @Test
    public void testSelectOne() {

        int bno = 32760;

        BoardVO board = boardMapper.selectOne(bno);

        log.info(board);
    }

    @Test
    public void testDelete(){  // delYn 업뎃 -> 1
        int bno = 32760;

        boardMapper.delete(bno);

    }

    @Test
    public void testGetBoardTotal() {

        ListDTO listDTO = new ListDTO();
        listDTO.setType("t");
        listDTO.setKeyword("1");
        int total = boardMapper.getBoardTotal(listDTO);
        log.info(total);

    }

    }