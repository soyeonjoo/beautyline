package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.VisitVo;


@Repository
public class MypageDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	public List<VisitVo> listHistory(Long userNo) {
<<<<<<< HEAD
		List<VisitVo> list = sqlSession.selectList("mypage.listHistory",userNo);
=======
		List<VisitVo> list = sqlSession.selectList("mypage.listHistory" ,userNo);
>>>>>>> 9736b05cc1fed2de8363c2e5ff8d8e59da73a5d9
		return list;
	}
	
	
	
}
