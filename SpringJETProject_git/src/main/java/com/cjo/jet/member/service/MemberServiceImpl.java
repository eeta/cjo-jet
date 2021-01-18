package com.cjo.jet.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.InterestVo;
import com.cjo.jet.vo.MemberVo;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void joinMember(MemberVo vo, String [] interest_name) {
		//멤버 기본키 생성
		int memberPK = memberSQLMapper.createKey();
		//멤버 키본키 세팅
		vo.setJet_member_no(memberPK);
		
		memberSQLMapper.insertMember(vo);
		//여행 관심사 부분
		System.out.println("[join member log]" + interest_name);
		if(interest_name != null) {
			System.out.println("[join member log]"+ interest_name);
			for(String interest : interest_name) {
				InterestVo interestVo = new InterestVo();
				interestVo.setjet_interest_name(interest);
				interestVo.setjet_member_no(memberPK);
				
				memberSQLMapper.insertInterest(interestVo);
			}
			
		}
		
	}
	
	public MemberVo login(MemberVo param) {
		
		MemberVo login =  memberSQLMapper.selectByIdAndPW(param);
		
		return login;
	}
	
	//아이디 중복 확인
	public boolean existId(String id) {
		MemberVo vo = memberSQLMapper.selectById(id);
		
		if(vo != null) {
			return true;
		}else {
			return false;
		}
	}
}
