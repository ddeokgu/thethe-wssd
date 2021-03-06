package com.ttcc.wssd.common.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuItem {
	private int menuSeq;
	private String menuName;
	private String setIcon;
	private String programUrl;
	private String programParameter;
	private int depth;
	private int parentMenuSeq;
	private int displayOrder;
	private boolean selected = false;

}
