<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%!
	//제시어 목록 - 임의로 배열로 값을 넣었다. 실제 실무에서는 DB에서 데이터를 가져오겠죠? ㅎㅎ
	String[] keywords = {
	"AJAX",
	"기초 경영경제수학",
	"맨큐의 경제학",
	"개인기업의 법인전환실무",
	"제대로 배우는 MATLAB",
	"Effective C++",
	"이것이 자바다",
	"삼고 재배학원론",
	"민법강의: 이론, 사례, 판례",
	"민법학원론",
	"생활지도",
	"영유아교수방법론",
	"청소년문화론",
	"LCSI의 이해와 활용 : 한국형 성격검사",
	"경호학 개론",
	"토양학",
	"동물질병학",
	"조세형사법",
	"아주 특별한 생물학 수업",
	"빅 히스토리 BIG HISTORY",
	"한 권의 물리학",
	"수학력",
	"계산이 빨라지는 인도 베다수학",
	"이상한 나라의 앨리스 추리파일",
	"삼각함수의 세계",
	"뉴턴 하이라이트 지수 로그 벡터",
	"이공대생을 위한 수학 특강 ",
	"수학의 파노라마",
	"뉴턴 하이라이트 미분과 적분",
	"수학, 생각의 기술",
	"수학선생님도 몰래 보는 수학책",
	"해부하다 생긴 일",
	"인체 구조 학습 도감",
	"인체의 구조와 질병",
	"날씨 과학",
	"손안의 지구과학",
	"지방의회론",
	"시학",
	"자연과학과 글쓰기",
	"임상실무영어",
	"목재 마감 101",
	"교정운동학",
	"대중문화의 이해",
	"한국사통론",
	"다시 찾는 우리 역사",
	"최신 문헌정보학의 이해",
	"초대칭성 물리학 입문",
	"줌달의 일반화학",
	"암호의 기초",
	"위험한 과학책",
	"세상의 모든 공식",
	"정재승의 과학콘서트",
	"마음의 미래",
	"과학, 인문으로 탐구하다",
	"이종필의 아주 특별한 상대성이론 강의",
	"뇌를 바꾼 공학, 공학을 바꾼 뇌",
	"너는 나에게 상처를 줄 수 없다",
	"인문학 습관",
	"미움받을 용기",
	"내 마음인데 왜 내 마음대로 안 되는 걸까",
	"행복해질 용기"
};
//suggestclient.html에서 넘어온 검색어를 사용하여 제시어목록을 추출해주는 메서드

//List result에 해당 키워드로 시작되는 제시어를 추가한다.
public List search(String keyword) {
	if (keyword == null || keyword.equals("")) return java.util.Collections.EMPTY_LIST;
	keyword = keyword.toUpperCase();
	List result = new java.util.ArrayList(8);
	for ( int i = 0 ; i < keywords.length ; i++ ) {
		if (((String)keywords[i]).startsWith(keyword)) {
			result.add(keywords[i]);
		}
	}
	return result;
}
%>
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword"); //키워드를 받는다.
List keywordList = search(keyword); //키워드를 추출한다.
out.print(keywordList.size()); //키워드 갯수를 출력한다.
out.print("|");

//제시어를 CVS양식으로 출력한다.
for (int i = 0 ; i < keywordList.size() ; i++) {
	String key = (String)keywordList.get(i);
	out.print(key);
	if (i < keywordList.size() - 1) {
		out.print(",");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>