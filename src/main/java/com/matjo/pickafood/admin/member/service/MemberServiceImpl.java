package com.matjo.pickafood.admin.member.service;

import com.matjo.pickafood.admin.common.dto.ListDTO;
import com.matjo.pickafood.admin.member.domain.MemberVO;
import com.matjo.pickafood.admin.member.dto.MemberDTO;
import com.matjo.pickafood.admin.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

  private final ModelMapper modelMapper;
  private final MemberMapper memberMapper;

  @Override
  public List<MemberDTO> getList(ListDTO listDTO) {
    List<MemberVO> memberVOList = memberMapper.selectMembers(listDTO);
    return memberVOList.stream()
            .map(memberVO -> modelMapper.map(memberVO, MemberDTO.class))
            .collect(Collectors.toList());
  }


}
