package org.pro.pulmuone.domain.event;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventListVO {

	private int event_no;
	private String event_name;
	private Date event_start;
	private Date event_end;
	private String event_notice;
	private int event_cmt;
	
	private EventThumbnailVO thumbnail;
	
}
