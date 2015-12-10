package com.gobook.event.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.event.dto.EventDto;

@Component
public class EventDao implements IEventDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

}
