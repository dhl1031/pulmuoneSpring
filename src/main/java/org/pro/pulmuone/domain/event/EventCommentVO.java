package org.pro.pulmuone.domain.event;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventCommentVO {

	private int comment_no;
	private int event_no;
	private int member_no;
	private Date write_date;
	private String content;
	
	private String name;
	
}
