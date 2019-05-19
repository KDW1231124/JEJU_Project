package com.kh.respect.common;

public class PageS {
	
	public static String getPage(int cPage, int numPerPage, int totalContents, String url, String userId)
	{
		String pageBar="";
		int pageBarSize=5;
		System.out.println("받아온아읻디 : " + userId);
		int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1)
		{
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+","+"\""+userId+"\""+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<li class='page-item active disabled'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+","+"\""+userId+"\""+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage)
		{
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+","+"\""+userId+"\""+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage,userId){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&userId='+userId;";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}

}
