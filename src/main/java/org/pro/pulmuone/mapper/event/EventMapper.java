package org.pro.pulmuone.mapper.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pro.pulmuone.domain.event.EventCommentVO;
import org.pro.pulmuone.domain.event.EventListVO;
import org.pro.pulmuone.domain.event.EventViewVO;

public interface EventMapper {
	
	List<EventListVO> eventList(@Param("start") int start, @Param("numberPerPage") int numberPerPage);
	List<EventListVO> endedEventList(@Param("start") int start, @Param("numberPerPage") int numberPerPage);

    int getTotalRecords();
    int getTotalPages(int numberPerPage);
    
    EventViewVO viewEvent(int event_no);
    
    List<EventCommentVO> getComments(@Param("event_no") int event_no, @Param("start") int currentPage, @Param("end") int numberPerPage);
    
    int getCommentCount(int event_no);
    
    void insertComment(EventCommentVO dto);
    
}

