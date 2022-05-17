package com.matjo.pickafood.admin.security;

import com.matjo.pickafood.admin.admin.domain.AdminVO;
import com.matjo.pickafood.admin.admin.dto.AdminDTO;
import com.matjo.pickafood.admin.admin.mapper.AdminMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@RequiredArgsConstructor
@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final AdminMapper adminMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        log.info("===========================");
        log.info("===========================");
        log.info(username);

        AdminVO adminVO = adminMapper.selectOne(username);

        log.info(adminVO);

        log.info("===========================");
        log.info("===========================");

        List<SimpleGrantedAuthority> authList = adminVO.getAuthList().stream()
                .map(auth ->new SimpleGrantedAuthority("ROLE_"+"ADMIN"))
                .collect(Collectors.toList());

        //username, password, Authority List
        AdminDTO adminDTO = new AdminDTO(adminVO.getId(), adminVO.getPw(), authList);
        adminDTO.setNickname(adminVO.getNickname());

        return adminDTO;
    }
}
