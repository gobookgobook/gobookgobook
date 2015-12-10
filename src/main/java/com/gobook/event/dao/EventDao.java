package com.gobook.event.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.gobook.event.dto.EventDto;

@Component
public class EventDao implements IEventDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int eventWriteInsert(EventDto eventDto) {
		
		if(eventDto.getEvent_file_name() != null){
			return sqlSessionTemplate.insert("dao.EventMapper.eventWriteFileInsert",eventDto);
		}else{
			return sqlSessionTemplate.insert("dao.EventMapper.eventWriteInsert",eventDto);
		}
		
		//System.out.println("hi");
		
	}

	@Override
	public List<EventDto> eventListSelect() {
		
		return sqlSessionTemplate.selectList("dao.EventMapper.eventListSelect");
	}

	@Override
	public EventDto eventRead(int event_bunho) {
		EventDto eventDto=null;
		

		return sqlSessionTemplate.selectOne("dao.eventMapper.eventRead",event_bunho);
	}
	

}
