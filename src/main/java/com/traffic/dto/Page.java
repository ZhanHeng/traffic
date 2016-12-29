package com.traffic.dto;

/**
 * 分页用的实体Bean
 * Created by ZhanHeng on 2016/11/16.
 */
public class Page
{
    /**
     * 每页大小
     */
    private int pageSize;

    /**
     * 总页数
     */
    private int pageCount;

    /**
     * 总记录数
     */
    private int recordCount;

    /**
     * 当前页
     */
    private int curPage;

    /**
     * 第一页
     */
    private int firstPage;

    /**
     * 前一页
     */
    private int beforePage;

    /**
     * 下一页
     */
    private int nextPage;

    /**
     * 最后一页
     */
    private int lastPage;

    private final int PAGE_SIZE = 15;

    private final int DEFAULT_PAGE = 1 ;

    public int getPageSize(){
        return pageSize;
    }

    public void setPageSize(int pageSize){
        this.pageSize = pageSize;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount){
        this.pageCount = pageCount;
    }

    public int getRecordCount(){
        return recordCount;
    }

    public void setRecordCount(int recordCount){
        this.recordCount = recordCount;
    }

    public int getFirstPage(){
        return firstPage;
    }

    public void setFirstPage(int firstPage){
        this.firstPage = firstPage;
    }

    public int getBeforePage(){
        return beforePage;
    }

    public void setBeforePage(int beforePage){
        this.beforePage = beforePage;
    }

    public int getNextPage()   {
        return nextPage;
    }

    public void setNextPage(int nextPage)    {
        this.nextPage = nextPage;
    }

    public int getLastPage()    {
        return lastPage;
    }

    public void setLastPage(int lastPage)    {
        this.lastPage = lastPage;
    }

    public int getCurPage()    {
        return curPage;
    }

    public void setCurPage(int curPage)    {
        this.curPage = curPage;
        System.out.println("setCurpage is invoke curpape is <"+this.curPage+">");
    }


    public Page(){
        this.pageSize = PAGE_SIZE;
        this.curPage = DEFAULT_PAGE;
        System.out.println("new Page() is invoke");
    }

    /**
     * 重新设置page信息
     */
    public void freshPage()    {
        setTotalPageNum();
        initNavbar();
    }

    /**
     * 初始化分页导航
     */
    public void initNavbar() {
        this.beforePage = curPage-1;
        this.nextPage = curPage+1;
        this.lastPage = pageCount;
        this.pageSize = PAGE_SIZE;
        if(beforePage<=0){
            this.beforePage = 1;
        }
        if(nextPage>pageCount) {
            this.nextPage = pageCount;
        }
    }

    /**
     * 设置总页数
     */
    private void setTotalPageNum()    {
        // 得到总的页数
        if (this.recordCount % this.pageSize == 0){
            this.pageCount = this.recordCount / this.pageSize;
        }
        else {
            this.pageCount = this.recordCount / this.pageSize + 1;
        }
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageSize=" + pageSize +
                ", pageCount=" + pageCount +
                ", recordCount=" + recordCount +
                ", curPage=" + curPage +
                ", firstPage=" + firstPage +
                ", beforePage=" + beforePage +
                ", nextPage=" + nextPage +
                ", lastPage=" + lastPage +
                ", PAGE_SIZE=" + PAGE_SIZE +
                ", DEFAULT_PAGE=" + DEFAULT_PAGE +
                '}';
    }
}
