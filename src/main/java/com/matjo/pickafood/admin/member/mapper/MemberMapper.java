package com.matjo.pickafood.admin.member.mapper;

import com.matjo.pickafood.admin.common.ListDTO;
import com.matjo.pickafood.admin.member.domain.MemberVO;

import java.util.List;

public interface MemberMapper {

  List<MemberVO> selectMembers(ListDTO listDTO);

  Integer selectMembersCount(ListDTO listDTO);

}
