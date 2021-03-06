/**
 * 
 */
package com.irace.service;

import java.util.Date;
import java.util.List;

import com.irace.entity.RaceEntity;

/**
 * @author Tracy
 *
 */
public interface RaceService {

	public Integer addRace(RaceEntity race);	
	
	public boolean delRace(Integer id);
	
	public boolean delRaceByType(int type);
	
	public boolean updateRace(RaceEntity race);
	
	public RaceEntity getRace(Integer id);
	
	public String getRaceList(Integer pageNo);
	
	/**
	 * 查询用户参加的所有比赛
	 * @param pageNo
	 * @param userID
	 * @return
	 */
	public String getRaceListByUser(Integer pageNo, int userID);
	
	/**
	 * 查询用户参加的比赛 status=1,2,3分别表示正在进行的比赛，结束的比赛，未发布的比赛。
	 * @param userID
	 * @param pageNo
	 * @param status
	 * @return
	 */
	public String getRaceListByUser(int userID, int pageNo, int status);
	
	public String getRaceList(Integer pageNo, int type);
	
	/**
	 * 通过比赛名称关键字查询得到一个List
	 * @param pageNo
	 * @param keyword
	 * @return
	 */
	public String getRaceList(Integer pageNo, String keyword);
	
	/**
	 * 根据比赛级别进行查询 分页返回
	 * @param pageNo
	 * @param grade
	 * @return
	 */
	public String getRaceListByGrade(Integer pageNo, String grade);
	
	/**
	 * 根据时间区间进行查询 分页返回
	 * @param pageNo
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public String getRaceListByTime(Integer pageNo, Date startTime, Date endTime);
	
	/**
	 * 获取包括外键实体	
	 * @param id 主键ID
	 * @return 
	 */
    public RaceEntity getRaceDetail(int id);
	
    /**
     * 获取包括外键实体
     * @param pageNo 页号
     * @return
     */
	public String getRaceListDetail(int pageNo);
	
	/**
	 * 通过关键字获取包括外键实体list的json串
	 * @param pageNo
	 * @param keyword
	 * @return
	 */
	public String getRaceListDetail(int pageNo, String keyword);
	
	/**
	 * 通过开始时间的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public String getRaceListBySortedStartTime(int pageNo, boolean isAsc);
	
	/**
	 * 通过结束时间的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public String getRaceListBySortedEndTime(int pageNo, boolean isAsc);
	
	/**
	 * 通过热度的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public String getRaceListBySortedHotPoint(int pageNo, boolean isAsc);
	
	/**
	 * 通过开始时间的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public String getRaceListBySortedStartTime(int pageNo, String keyword, boolean isAsc);
	
	/**
	 * 通过结束时间的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public String getRaceListBySortedEndTime(int pageNo, String keyword, boolean isAsc);
	
	/**
	 * 通过热度的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public String getRaceListBySortedHotPoint(int pageNo, String keyword, boolean isAsc);
	
	
	public List getRaceListByOrganizer(int oid, int currentPageNum, int status);
	
}
