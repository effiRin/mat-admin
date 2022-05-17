package com.matjo.pickafood.admin.admin.mapper;

import com.matjo.pickafood.admin.admin.domain.AdminVO;
import com.matjo.pickafood.admin.admin.domain.Auth;
import com.matjo.pickafood.admin.common.mapper.GenericMapper;
import org.apache.ibatis.annotations.Insert;

public interface AdminMapper extends GenericMapper<AdminVO, Integer> {

    @Insert("insert into admin (name, position, nickname, profile, id, pw) values (#{name), #{position}, #{nickname}, #{profile}, #{id}, #{pw}")
    void register(AdminVO adminVO);

    @Insert("insert into auth (id, roleName) values (#{id}, #{roleName})")
    void addAuth(Auth authVO);

    AdminVO selectOne(String id);


}
