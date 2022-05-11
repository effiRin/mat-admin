package com.matjo.pickafood.admin.member.service;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.member.dto.MemberDTO;

import java.util.List;

public interface MemberService {

  List<MemberDTO> getList(ListDTO listDTO);
}
