/**
 * 
 */
package com.irace.service;

import java.sql.Date;
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
	
}
