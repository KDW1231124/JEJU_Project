package com.kh.respect.common;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImgExtract {


   public String imgExtract(String img) {
      
	// 이미지 태그를 추출하기 위한 정규식.
        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

     // 내용 중에서 이미지 태그를 찾아라!
        Matcher matcher = pattern.matcher(img);
        String src="";
        
     // 이미지 태그를 찾았다면,,
        while(matcher.find()){

           src=matcher.group(1); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
        }
        
        return src;

	}
   
   
   public String hpExtract(String p) {
	      
		// 이미지 태그를 추출하기 위한 정규식.
	        Pattern pattern = Pattern.compile("");

	     // 내용 중에서 이미지 태그를 찾아라!
	        Matcher matcher = pattern.matcher(p);
	        String hp="";
	        
	     // 이미지 태그를 찾았다면,,
	        while(matcher.find()){

	           hp=matcher.group(1); // 글 내용 중에 첫번째 태그를 뽑아옴.
	        }
	        
	        return hp;

		}
}



