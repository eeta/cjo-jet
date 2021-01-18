package com.cjo.jet.member.mapper;

import com.cjo.jet.vo.InterestVo;
import com.cjo.jet.vo.MemberVo;

public interface MemberSQLMapper {
	//기본키
	public int createKey();
	//회원 가입 시 사용자 정보 추가
	public void insertMember(MemberVo vo);
	//회원 가입 시 관심사 정보 추가
	public void insertInterest(InterestVo vo);
	//로그인
	public MemberVo selectByIdAndPW(MemberVo vo);
	//멤버 no 뽑아오기
	public MemberVo selectByNo(int no);
	//아이디 중복 확인
	public MemberVo selectById(String id);
}
