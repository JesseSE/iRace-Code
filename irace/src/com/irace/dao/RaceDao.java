package com.irace.dao;

import java.util.Date;
import java.util.List;

import com.irace.entity.AdvertismentEntity;
import com.irace.entity.RaceEntity;

public interface RaceDao {
	
	public Integer addRace(RaceEntity race);	
	
	public boolean delRace(Integer id);
	
	public boolean delRaceByType(int type);
	
	public boolean updateRace(RaceEntity race);
	
	public RaceEntity getRace(Integer id);
	
	public List getRaceListByUser(Integer pageNo, Integer pageItemNum, int userID);
	
	public List getRaceListByUser(Integer pageNo, Integer pageItemNum, int userID, int status);
	
	public List getRaceList(Integer pageNo, Integer pageItemNum);
	
	public List getRaceList(Integer pageNo, Integer pageItemNum, int type);
	
	public List getRaceList(Integer pageNo, Integer pageItemNum, String keyword); //通过比赛名称关键字查询得到一个List
	
	public List getRaceListByGrade(Integer pageNo, Integer pageItemNum,String grade);  //通过级别进行查询
	
	public List getRaceListByTime(Integer pageNo, Integer pageItemNum,Date startTime, Date endTime);
		
    public RaceEntity getRaceDetail(int id);   //获取包括外键实体	
	
	public List getRaceListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	/**
	 * 通过关键字获取包括外键实体list的json串
	 * @param pageNo
	 * @param keyword
	 * @return
	 */
	public List getRaceListDetail(int pageNo,Integer pageItemNum, String keyword);
	
	/**
	 * 通过开始时间的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public List getRaceListBySortedStartTime(int pageNo,Integer pageItemNum, boolean isAsc);
	
	/**
	 * 通过结束时间的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param pageItemNum 每页显示的条目数
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public List getRaceListBySortedEndTime(int pageNo,Integer pageItemNum, boolean isAsc);
	
	/**
	 * 通过热度的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param pageItemNum 每页显示的条目数
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public List getRaceListBySortedHotPoint(int pageNo,Integer pageItemNum, boolean isAsc);
	
	/**
	 * 通过开始时间的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param pageItemNum 每页显示的条目数
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public List getRaceListBySortedStartTime(int pageNo,Integer pageItemNum, String keyword, boolean isAsc);
	
	/**
	 * 通过结束时间的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param pageItemNum 每页显示的条目数
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public List getRaceListBySortedEndTime(int pageNo,Integer pageItemNum, String keyword, boolean isAsc);
	
	/**
	 * 通过热度的排序方式和页码得到实体类list的json串
	 * @param pageNo
	 * @param pageItemNum 每页显示的条目数
	 * @param isAsc 是否按照升序
	 * @return
	 */
	public List getRaceListBySortedHotPoint(int pageNo,Integer pageItemNum, String keyword, boolean isAsc);
	
}
