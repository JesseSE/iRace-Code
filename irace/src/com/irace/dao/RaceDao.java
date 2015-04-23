package com.irace.dao;

import java.sql.Date;
import java.util.List;

import com.irace.entity.AdvertismentEntity;
import com.irace.entity.RaceEntity;

public interface RaceDao {
	
	public Integer addRace(RaceEntity race);	
	
	public boolean delRace(Integer id);
	
	public boolean delRaceByType(int type);
	
	public boolean updateRace(RaceEntity race);
	
	public RaceEntity getRace(Integer id);
	
	public List getRaceList(Integer pageNo, Integer pageItemNum);
	
	public List getRaceList(Integer pageNo, Integer pageItemNum, int type);
	
	public List getRaceList(Integer pageNo, Integer pageItemNum, String keyword); //通过比赛名称关键字查询得到一个List
	
	public List getRaceListByGrade(Integer pageNo, Integer pageItemNum,String grade);  //通过级别进行查询
	
	public List getRaceListByTime(Integer pageNo, Integer pageItemNum,Date startTime, Date endTime);
		
    public RaceEntity getRaceDetail(int id);   //获取包括外键实体	
	
	public List getRaceListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
}
