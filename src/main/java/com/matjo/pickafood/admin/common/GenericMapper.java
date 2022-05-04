package com.matjo.pickafood.admin.common;

import com.matjo.pickafood.admin.inquiry.InquiryVO;

import java.util.List;

public interface GenericMapper <E, K>{

    List<E> selectList(ListDTO listDTO);
    int getTotal(ListDTO listDTO);
    void delete(K bno);
    E selectOne(K bno);
    void update(E board);
    void insert(E board);

    int getBoardTotal();

}
