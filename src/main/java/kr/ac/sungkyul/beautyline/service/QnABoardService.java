package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.QnABoardDao;
import kr.ac.sungkyul.beautyline.vo.QnABoardVo;

@Service
public class QnABoardService {
	
	@Autowired
	private QnABoardDao qBoardDao;

	
	/* 전체글 가져오기*/
	public List<QnABoardVo> getAll(String keyfield, String keyword, String keyWord2){
		//찾기가 있다면 if (){ 찾기  sql 문으로 ㄱㄱ 나중에 string 들어와야함
		List<QnABoardVo> list = qBoardDao.getAll(keyfield, keyword, keyWord2);		
		return list;	
	}
	
	/* 글쓰기	*/
	public void write(QnABoardVo qbdvo){
		qBoardDao.insertBoard(qbdvo);
		
	}
	
	/* 답글쓰기 */
	public void replywrite(QnABoardVo qbdvo){
		qBoardDao.updatereply(qbdvo);
		qBoardDao.insertreply(qbdvo);
		
	}
	
	
	/* 문의 글 보기 */
	public QnABoardVo view( Long no ){
		return qBoardDao.viewBoard(no);
		
	}
	

	/* 문의 글 조회수 업뎃 */
	public void updateViewCount( Long no ){
		qBoardDao.updateViewCount(no);
	}
	
	/* 문의 글 삭제 */
	public int delete(QnABoardVo qbdv){
		 return qBoardDao.delete(qbdv);
	}
	


	/* 답글을 위해 원글 작성자 알아오기 */
	public Long getOrgNo( Long no ){
		return qBoardDao.getOrgNo(no);
	}
	
/*------------------- 수정--------------------  */
	/* 글 수정 */
	public void modify(QnABoardVo qbdvo){
		qBoardDao.modify(qbdvo);
		
	}
	
	

	
	
}





	