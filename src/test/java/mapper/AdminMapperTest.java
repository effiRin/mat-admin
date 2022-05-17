package mapper;

import com.matjo.pickafood.admin.admin.domain.AdminVO;
import com.matjo.pickafood.admin.admin.domain.Auth;
import com.matjo.pickafood.admin.admin.mapper.AdminMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class AdminMapperTest {

    @Autowired(required = false)
    private AdminMapper adminMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    public void testInsert(){

            AdminVO adminVO = AdminVO.builder()
                    .id("kim")
                    .pw(passwordEncoder.encode("aaa"))
                    .name("김이슬")
                    .nickname("앵")
                    .position("관리자")
                    .build();

            adminMapper.register(adminVO);


            Auth authAdmin = Auth.builder()
                    .id("kim")
                    .rolename("ADMIN") /* ROLE_ 는 자동으로 붙는 접두사임 */
                    .build();
            adminMapper.addAuth(authAdmin);

    }


    @Test
    public void testSelectOne(){
        String id ="user90";
        /* 권한이 두개 이상인 사람은 문제 .. */

        AdminVO adminVO = adminMapper.selectOne(id);

        log.info("------------------------");
        log.info("adminVO: "+ adminVO);
        log.info ("-------------------------");


    }




}
