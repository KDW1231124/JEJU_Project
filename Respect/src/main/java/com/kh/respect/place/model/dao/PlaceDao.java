package com.kh.respect.place.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.meet.model.vo.MeetReply;
import com.kh.respect.meet.model.vo.MeetReplyAttachment;
import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceGood;
import com.kh.respect.place.model.vo.PlaceReply;
import com.kh.respect.place.model.vo.PlaceReplyAttachment;

public interface PlaceDao {
	List<String> searchKeyword(SqlSessionTemplate sqlSession,String keyword);
	List<Place> selectSpotList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Place> selectUserSpotList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage);
	List<Place> selectSearchList(SqlSessionTemplate sqlSession,int cPage, int numPerPage,String keyword);
	int selectTotalCount(SqlSessionTemplate sqlSession);
	int insertPlace(SqlSessionTemplate sqlSession, Place p);
	int updatePlace(SqlSessionTemplate sqlSession, Place p);
	Place selectPlace(SqlSessionTemplate sqlSession, int placeno);
	void updateSpotCnt(SqlSessionTemplate sqlSession, int placeno);

	List<Place> selectPlaceList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	int selectPlaceCount(SqlSessionTemplate sqlSession);
	List<Place> selectFoodList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	int selectFoodCount(SqlSessionTemplate sqlSession);
	List<Place> selectAccommList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	int selectAccommCount(SqlSessionTemplate sqlSession);
	
	int insertLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	int deleteLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	PlaceGood selectLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	int insertBring(SqlSessionTemplate sqlSession, PlaceGood pg);
	int deleteBring(SqlSessionTemplate sqlSession, PlaceGood pg);
	PlaceGood selectBring(SqlSessionTemplate sqlSession, PlaceGood pg);
	void increaseLike(SqlSessionTemplate sqlSession, int placeno);
	void decreaseLike(SqlSessionTemplate sqlSession, int placeno);
	int selectPlaceLikecnt(SqlSessionTemplate sqlSession, int placeno);
	void increaseBring(SqlSessionTemplate sqlSession, int placeno);
	void decreaseBring(SqlSessionTemplate sqlSession, int placeno);
	int selectPlaceBringcnt(SqlSessionTemplate sqlSession, int placeno);
	List<Place> searchCategoryList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String minorcategory);
	int categoryTotalCount(SqlSessionTemplate sqlSession, String minorcategory);
	List<Place> searchAreaList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String area, String major);
	int areaTotalCount(SqlSessionTemplate sqlSession, String area, String major);
	
	
	int insertMySpot(SqlSessionTemplate sqlSession, Place place);
	int selectTotalUserCount(SqlSessionTemplate sqlSession,String userId);
	int deleteSpot(SqlSessionTemplate sqlSession,int placeno);
	int selectSearchCount(SqlSessionTemplate sqlSession,String keyword);

	
	//댓글
	int placeReplyWrite(SqlSessionTemplate sqlSession, PlaceReply placeReply);
	void placeReplyCountUpdate(SqlSessionTemplate sqlSession, int placeNo);
	int insertPlaceReplyAttach(SqlSessionTemplate sqlSession, PlaceReplyAttachment a);
	int placeReplyWrite2(SqlSessionTemplate sqlSession, PlaceReply placeReply);
	void placeReplyReplyCountUpdate(SqlSessionTemplate sqlSession, int replyRefNo);
	int placeReplyDelete(SqlSessionTemplate sqlSession, int replyNo);
	int placeReplyGood(SqlSessionTemplate sqlSession, int replyNo);
	int placeReplyGoodCheck(SqlSessionTemplate sqlSession, PlaceReply placeReply);
	void insertplaceReplyGood(SqlSessionTemplate sqlSession, PlaceReply placeReply);
	List<Map<String, String>> placeReplyList(SqlSessionTemplate sqlSession, int placeNo);
	List<Map<String, String>> placeAttList(SqlSessionTemplate sqlSession);
}
