package org.pro.pulmuone.domain.event;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventThumbnailVO {

	private int img_no;
	private int event_no;
	private String system_name;
	private String origin_name;
	private String img_size;
	private String img_type;
	private String img_path;
	
}
