package com.gobook.event.dao;

import java.util.List;

import com.gobook.event.dto.EventDto;

public interface IEventDao {
	
     public int eventWriteInsert(EventDto eventDto);
     
     public List<EventDto> eventListSelect();
     
     public EventDto eventRead(int event_bunho);
     
     public EventDto eventSelect(int event_bunho);
     
     public int eventUpdate(EventDto eventDto);
     
     public int eventDelete(int event_bunho);
     
     public EventDto eventDelSelect(int event_bunho);
}
