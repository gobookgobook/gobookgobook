package com.gobook.event.dao;


import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.gobook.event.dto.EventDto;

@Component
public class EventDao implements IEventDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	/**
	 * @함수이름 : eventWriteInsert
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 등록
	 */
	@Override
	public int eventWriteInsert(EventDto eventDto) {
		
		if(eventDto.getEvent_file_name() != null){
			return sqlSessionTemplate.insert("dao.EventMapper.eventWriteFileInsert",eventDto);
		}else{
			return sqlSessionTemplate.insert("dao.EventMapper.eventWriteInsert",eventDto);
		}
		
		//System.out.println("hi");
		
	}

	/**
	 * @함수이름 : eventListSelect
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 목록
	 */
	@Override
	public List<EventDto> eventListSelect() {
		
		return sqlSessionTemplate.selectList("dao.EventMapper.eventListSelect");
	}

	/**
	 * @함수이름 : eventRead
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 읽기
	 */
	@Override
	public EventDto eventRead(int event_bunho) {
		
		return sqlSessionTemplate.selectOne("dao.EventMapper.eventRead",event_bunho);
	}

	/**
	 * @함수이름 : eventSelect
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 수정
	 */
	@Override
	public EventDto eventSelect(int event_bunho) {
		
		EventDto eventDto=null;
		
		eventDto=sqlSessionTemplate.selectOne("dao.EventMapper.eventSelect",event_bunho);
		return eventDto;
	}

	/**
	 * @함수이름 : eventUpdate
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 수정 완료
	 */
	@Override
	public int eventUpdate(EventDto eventDto) {
		
		return sqlSessionTemplate.update("dao.EventMapper.eventUpdate",eventDto);
	}

	/**
	 * @함수이름 : eventDelete
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 삭제
	 */
	@Override
	public int eventDelete(int event_bunho) {
		
		
		return sqlSessionTemplate.delete("dao.EventMapper.eventDelete",event_bunho);
	}

	

}
