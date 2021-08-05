# 콕콕! 쿡쿡!

## 개요 : 레시피 커뮤니티 사이트 

+ 전국의 특산물과 관련하여 사용자들끼리 레시피를 공유하고 이를 통해 지역 특산물 소비 촉진을 장려
+ 사용자들이 실제로 가지고 있는 재료들에 맞게 레시피들을 제공해주는 큐레이션 기능을 통해 재료 구비에 대한 부담을 덜어줌
+ 사용자들에 대한 설문조사를 진행하여 사용자들의 식생활에 대한 정보를 얻고 사용자들에게 서비스를 제공할 때 이를 활용

## 사용기술 및 개발 환경
<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"><img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"><img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

## 구현 기능 

+ 사용자 회원가입 / 로그인/ 회원탈퇴 / 내정보 수정 / 아이디 찾기 / 비밀번호 찾기 
+ 네이버 API 를 이용하여 별도의 회원가입없이 간편하게 로그인 할 수 있는 기능 제공  
+ Mail API 를 이용하여 회원가입 및 비밀번호 찾기 , 이벤트 정보 제공 등에서 사용자에게 메일 발송 기능  
+ 사용자 레시피 등록/ 상세보기 / 수정 
+ 이벤트 게시판을 만들어 사용자에게 이벤트에 대한 정보 제공 
+ 설문조사 페이지를 만들어 사용자가 설문조사를 하고 이에 대한 통계를 추출 
+ 관리자 페이지를 구현하여  사용자 관리, Q&A관리, 이벤트 관리 , 공지사항 관리 

## 핵심 특징
<img src ="https://user-images.githubusercontent.com/73329610/127971641-2dd3fb6b-cca2-45a2-a027-9458d160770b.png" width="50%" height="50%">

* 사이트의 메인페이지 
  * 레시피 조회 순 별로 인기 TOP4를 보여줌 
  * 지역 특산물을 사용한 횟수 순으로 인기 TOP4를 보여줌 
  * 사용자들이 집에 있는 레시피 컨텐츠를 통해 ' 이 재료로 추천받기' 를 클릭하면 해당 재료에 맞게 레시피 목록을 보여줌  

<img src ="https://user-images.githubusercontent.com/73329610/127974742-1663bc4d-71cd-425e-8763-941a8cf35dda.png" width="50%" height="50%">

* 사용자가 해당 페이지에서 레시피를 추가할 수 있는 기능
  * 레시피를 추가하면 메인페이지에 레시피가 노출
  * 자신이 작성한 레시피는 마이 페이지에서 확인 가능 


<img src ="https://user-images.githubusercontent.com/73329610/127976877-28bc7642-c581-4fc9-8821-58858b6d2363.png" width="50%" height="50%"><img src ="https://user-images.githubusercontent.com/73329610/127976609-e0288243-c94a-455a-9c74-b7dc77d02d83.png" width="50%" height="50%">

* 사용자가 설문조사를 작성하면 DB에 저장되고 , 설문조사를 구글 통계 API를 이용하여 집계처리
* 설문조사를 통해  사용자들의 연령이나 성별과 연관시켜서 연령이나 성별에 따른 식습관이나 트렌드 파악
  

## 설계 주안점
+ 전국의 특산물 및 사용자들이 실제로 가지고 있는 재료들에 맞게 레시피를 작성/수정/ 찜 하게 하기 위하여 다음과 같은 기능을 구현 
+ 메인 페이지서에 인기 레시피 및 지역 특산물을 이용한 레시피 제공 
+ 메인 페이지에서 집에 있는 재료를 선택하여 사용자가 선택한 재료로 레시피 추천 
+ 메인페이지에서 주제별 레시피 , 재료 별 레시피 , 특산물 별 레시피 게시판 구현 
+ 마이페이지에서 자신이 찜한 레시피 목록을 보여주는 기능 구현 


## 팀원별 단위 업무

임 종 부 (팀장) : 프로젝트 일정 및 전체 관리 , GiHub 관리 , 프로젝트 api 담당, 사용자 Member 기능 구현   
서 민 기        : DB스키마 생성, DB관리, 레시피 (등록, 상세보기, 수정)    
윤 종 훈        : 스토리보드 작성 , ERD 설계 , 페이지 디자인, 공지사항 게시판 , Q&A 게시판 , 아이디 찾기 , 설문조사 구현    
이 정 호        : 웹 사이트 디자인 , 스토리보드 제작, 사이트 배너 및 이벤트 이미지 제작 , 이벤트 게시판 , 관리자(재료 관리, 특산물 관리, 통계관리)    
류 승 재        : Q&A 답변 기능 , 비밀번호 찾기 , 공지 사항 게시판 , 설문조사 기능 구현    
오 진 영        : 관리자(사용자 관리, Q&A관리, 이벤트 관리 , 공지사항 관리)   
         



