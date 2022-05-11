package com.ttcc.wssd.common.util.paging;

public class PlatformPaging2 extends DefaultPaging {

    public PlatformPaging2(int totalCount, int currentPage, int rowsPerPage, int viewPageNum) {
        super(totalCount, currentPage, rowsPerPage, viewPageNum);
        this.firstTag = "<a href='?currentPage=1' onclick='linkPage2(1);return false;' class='first'><img src=\"/images/egovframework/com/cmm/icon/first_arrow.png\" alt=\"처음\"></a>";
        this.preTag = "<a href='?currentPage=#{pre}' onclick='linkPage2(#{pre});return false;' class='prev'><img src=\"/images/egovframework/com/cmm/icon/prev_arrow.png\" alt=\"이전\"></a>";
        this.curTag = "<strong class='current'><span>#{cur}</span></strong>";
        this.idxTag = "<a href='?currentPage=#{idx}' onclick='linkPage2(#{idx});return false;'>#{idx}</a>";
        this.nextTag = "<a href='?currentPage=#{next}' onclick='linkPage2(#{next});return false;' class='next'><img src=\"/images/egovframework/com/cmm/icon/next_arrow.png\" alt=\"다음\"></a>";
        this.endTag = "<a href='?currentPage=#{end}' onclick='linkPage2(#{end});return false;' class='last'><img src=\"/images/egovframework/com/cmm/icon/last_arrow.png\" alt=\"마지막\"></a>";
    }
    
}
