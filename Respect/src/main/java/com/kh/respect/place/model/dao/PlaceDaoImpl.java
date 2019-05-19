package com.kh.respect.place.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.meet.model.vo.MeetReply;
import com.kh.respect.meet.model.vo.MeetReplyAttachment;
import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceGood;
import com.kh.respect.place.model.vo.PlaceReply;
import com.kh.respect.place.model.vo.PlaceReplyAttachment;
import com.kh.respect.place.model.vo.PlaceSpring;

@Repository
public class PlaceDaoImpl implements PlaceDao {

	SqlSessionTemplate sqlSession;

	@Override
	public int insertPlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.insert("spot.insertPlace", p);
	}
	
	@Override
	public int updatePlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.update("spot.updatePlace", p);
	}

	@Override
	public List<Place> selectSpotList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("spot.selectSpotList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("spot.selectTotalCount");
	}
	
	@Override
	public List<Place> selectPlaceList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("spot.selectPlaceList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectPlaceCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("spot.selectPlaceCount");
	}
	
	@Override
	public List<Place> selectFoodList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("spot.selectFoodList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectFoodCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("spot.selectFoodCount");
	}
	
	@Override
	public List<Place> selectAccommList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("spot.selectAccommList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectAccommCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("spot.selectAccommCount");
	}

	@Override
	public Place selectPlace(SqlSessionTemplate sqlSession, int placeno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectSpot", placeno);
	}
	
	@Override
	public void updateSpotCnt(SqlSessionTemplate sqlSession, int spotno) {
		sqlSession.update("spot.updateSpotCnt", spotno);
	}

	@Override
	public List<Place> selectUserSpotList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage) {
		return sqlSession.selectList("spot.selectUserSpotList", userId, new RowBounds((cPage-1)*numPerPage, numPerPage));
		
	}

	@Override
	public int insertLike(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.insert("spot.insertLike", pg);
	}
	
	@Override
	public int deleteLike(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.delete("spot.deleteLike", pg);
	}
	
	@Override
	public PlaceGood selectLike(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectLike", pg);
	}
	
	@Override
	public int insertBring(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.insert("spot.insertBring", pg);
	}
	
	@Override
	public int deleteBring(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.delete("spot.deleteBring", pg);
	}
	
	@Override
	public PlaceGood selectBring(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectBring", pg);
	}
	
	

//	@Override
//	public List<PlaceSpring> spotSearchList(PlaceSpring p) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("spot.spotSearchList", p.getMinorcategory());
//	}
//
//	@Override
//	public Integer spotSearchListTotal(PlaceSpring p) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("spot.spotSearchListTotal", p.getMinorcategory());
//	}
	
	@Override
	public int selectPlaceLikecnt(SqlSessionTemplate sqlSession, int placeno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectPlaceLikecnt", placeno);
	}

	@Override
	public int selectPlaceBringcnt(SqlSessionTemplate sqlSession, int placeno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectPlaceBringcnt", placeno);
	}
	
	public void increaseLike(SqlSessionTemplate sqlSession, int placeno) {
		sqlSession.update("spot.increaseLike", placeno);
	}
	
	public void decreaseLike(SqlSessionTemplate sqlSession, int placeno) {
		sqlSession.update("spot.decreaseLike", placeno);
	}
	
	public void increaseBring(SqlSessionTemplate sqlSession, int placeno) {
		sqlSession.update("spot.increaseBring", placeno);
	}
	
	public void decreaseBring(SqlSessionTemplate sqlSession, int placeno) {
		sqlSession.update("spot.decreaseBring", placeno);
	}

	public int insertMySpot(SqlSessionTemplate sqlSession, Place place) {
		return sqlSession.insert("spot.insertMyPlace", place);
	}
	
	@Override
	public List<Place> searchCategoryList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String minorcategory) {
		return sqlSession.selectList("spot.searchCategoryList", minorcategory, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int categoryTotalCount(SqlSessionTemplate sqlSession, String minorcategory) {
		return sqlSession.selectOne("spot.categoryTotalCount", minorcategory);
	}
	
	@Override
	public List<Place> searchAreaList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String area, String major) {
		Map<String,String> m = new HashMap();
		m.put("area", area);
		m.put("major", major);
		return sqlSession.selectList("spot.searchAreaList", m, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int areaTotalCount(SqlSessionTemplate sqlSession, String area, String major) {
		Map<String,String> m = new HashMap();
		m.put("area", area);
		m.put("major", major);
		return sqlSession.selectOne("spot.areaTotalCount", m);
	}
	
	
	
	public int selectTotalUserCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("spot.selectTotalUserCount",userId);
	}

	@Override
	public List<Place> selectSearchList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String keyword) {
		return sqlSession.selectList("spot.selectSearchList", keyword, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int deleteSpot(SqlSessionTemplate sqlSession, int placeno) {
		return sqlSession.delete("spot.deleteSpot",placeno);
	}

	@Override
	public int selectSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("spot.selectSearchCount",keyword);
	}

	@Override
	public List<String> searchKeyword(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectList("spot.searchKeyword",keyword);
	}

	/////////////   댓글     ////////////////
	@Override
	public List<Map<String, String>> placeReplyList(SqlSessionTemplate sqlSession, int placeNo) {
	return sqlSession.selectList("spot.placeReplyList", placeNo);
	}
	
	@Override
	public List<Map<String, String>> placeAttList(SqlSessionTemplate sqlSession) {
	return sqlSession.selectList("spot.placeAttList");
	}
	
	@Override
	public int placeReplyWrite(SqlSessionTemplate sqlSession, PlaceReply placeReply) {
	return sqlSession.insert("spot.placeReplyWrite", placeReply);
	}
	
	@Override
	public void placeReplyCountUpdate(SqlSessionTemplate sqlSession, int placeNo) {
	sqlSession.update("spot.placeReplyCountUpdate", placeNo);
	}
	
	@Override
	public int insertPlaceReplyAttach(SqlSessionTemplate sqlSession, PlaceReplyAttachment a) {
	// TODO Auto-generated method stub
	return sqlSession.insert("spot.insertPlaceReplyAttach", a);
	}
	
	@Override
	public int placeReplyWrite2(SqlSessionTemplate sqlSession, PlaceReply placeReply) {
	// TODO Auto-generated method stub
	return sqlSession.insert("spot.placeReplyWrite2",placeReply);
	}
	
	@Override
	public void placeReplyReplyCountUpdate(SqlSessionTemplate sqlSession, int replyRefNo) {
	sqlSession.update("spot.placeReplyReplyCountUpdate", replyRefNo);
	}
	
	@Override
	public int placeReplyDelete(SqlSessionTemplate sqlSession, int replyNo) {
	return sqlSession.delete("spot.placeReplyDelete",replyNo);
	}
	
	@Override
	public int placeReplyGood(SqlSessionTemplate sqlSession, int replyNo) {
	return sqlSession.update("spot.placeReplyGood",replyNo);
	}
	
	@Override
	public int placeReplyGoodCheck(SqlSessionTemplate sqlSession, PlaceReply placeReply) {
	return sqlSession.selectOne("spot.placeReplyGoodCheck", placeReply);
	}
	
	@Override
	public void insertplaceReplyGood(SqlSessionTemplate sqlSession, PlaceReply placeReply) {
	sqlSession.insert("spot.insertplaceReplyGood", placeReply);
	}

}
