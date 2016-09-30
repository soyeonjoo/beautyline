package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.ReserveDao;
import kr.ac.sungkyul.beautyline.vo.ReserveVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Service
public class ReserveService {

	@Autowired
	private ReserveDao reserveDao;
	
	//reserveList
	public List<ReserveVo> resList(){
		return reserveDao.resList();
	}
	
	//예약번호로 검색
	public ReserveVo selectReserve( int no ){
		return reserveDao.selectReserve( no );
	}
	
	//예약실행
	public int reserve( ReserveVo reserveVo ){
		int count = reserveDao.reserve( reserveVo );
		return count;
		
	}
	
	//삭제
	public String reserveDelete( int no ){
		int delCount;
		delCount = reserveDao.reserveDelete( no );
		
		
		return "";
	}
	
	//달력에서 선택한 날짜로 vo받아오기
	public List<ReserveVo> resDaySel( String resDateText ){
		return reserveDao.resDaySel( resDateText );
	}
	
	//회원 이름으로 검색
	public List<UserVo> UserSearch( String name ){
		return reserveDao.UserSearch( name );
	}
}
