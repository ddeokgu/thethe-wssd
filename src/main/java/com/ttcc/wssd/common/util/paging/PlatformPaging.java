package com.ttcc.wssd.common.util.paging;

public class PlatformPaging extends DefaultPaging {

    public PlatformPaging(int totalCount, int currentPage, int rowsPerPage, int viewPageNum) {
        super(totalCount, currentPage, rowsPerPage, viewPageNum);
        System.err.println("여기에 찍힘 = " + totalCount +","+ currentPage +","+ rowsPerPage +","+ viewPageNum);
        this.firstTag = "<a href='?currentPage=1' onclick='linkPage(1);return false;' class='first'><img src=\"/resources/main/images/egovframework/com/cmm/icon/first_arrow.png\" alt=\"처음\"></a>";
        this.preTag = "<a href='?currentPage=#{pre}' onclick='linkPage(#{pre});return false;' class='prev'><img src=\"/resources/main/images/egovframework/com/cmm/icon/prev_arrow.png\" alt=\"이전\"></a>";
        this.curTag = "<strong class='current'><span class='now'>#{cur}</span></strong>";
        this.idxTag = "<a href='?currentPage=#{idx}' onclick='linkPage(#{idx});return false;'>#{idx}</a>";
        this.nextTag = "<a href='?currentPage=#{next}' onclick='linkPage(#{next});return false;' class='next'><img src=\"/resources/main/images/egovframework/com/cmm/icon/next_arrow.png\" alt=\"다음\"></a>";
        this.endTag = "<a href='?currentPage=#{end}' onclick='linkPage(#{end});return false;' class='last'><img src=\"/resources/main/images/egovframework/com/cmm/icon/last_arrow.png\" alt=\"마지막\"></a>";
    }
}
