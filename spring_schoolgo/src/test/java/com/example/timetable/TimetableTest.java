package com.example.timetable;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.config.ApplicationConfig;

import com.example.dto.TimetableTotal;
import com.example.repo.TimetableRepo;
import com.example.service.TimetableService;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class TimetableTest {
	
	private static Logger logger = LoggerFactory.getLogger(TimetableTest.class);
	
	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	TimetableRepo tRepo;
	
	@Autowired
	TimetableService tService;
	
/*	@Test
	public void insertTimetableTest(){
		Timetable tableobj = new Timetable("3","3","3","3","3","3","3");
		logger.trace("table insert test : {}", tService.insert(tableobj));
	}
	
	@Test
	public void selectTimetableTest(){
		Timetable tableobj = new Timetable("3","3","3","3","3dfg","3","3");
		Timetable tableobj2= new Timetable("3","3","5","3","3","3","3sdf");
		Timetable tableobj3 = new Timetable("3","3777","3dfgdfgdf","3","3","3","3");
		tService.insert(tableobj);
		tService.insert(tableobj2);
		tService.insert(tableobj3);
		logger.trace("table insert List test : {} " , tService.selectTimetableUserId("3"));
		
	}
	
	@Test
	public void deleteTimetableTest(){
		Timetable tableobj = new Timetable("3","3","3","3","3","3","3");
		logger.trace("table insert test : {}", tService.delete("3"));
	}*/
	
	@Test
	public void insertTimetableTest(){
		TimetableTotal tableobj = new TimetableTotal("asdf","0","0","0","0","0","0", "0", "0", "0", "0");
		logger.trace("table insert test : {}", tService.insert(tableobj));
	}
	
	
}
