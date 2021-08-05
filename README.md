# YellowBridge

## 개요 : 유기동물 입양 및 기부 사이트

+ 유기동물이 늘어나고 있는 실정에 제작한 사이트를 통해 경각심 및 쉬운 입양 접근 
+ 기부금 내역을 투명하게 공개함으로 인해 기부를 적극적으로 유도 
+ 입양 이후의 입양 일지를 통해 파양율을 낮추고 입양한 동물들의 상태 확인 가능
+ 금전적인 기부 뿐만 아니라 봉사를 통해 다양한 후원 방식 제공

## 사용기술 및 개발 환경
<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"><img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"><img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

## 구현 기능 

+ 사용자 회원가입 / 로그인/ 회원탈퇴 / 회원정보 수정 / 마이페이지
+ 봉사프로그램을 구매할 수 있는 형태로 제작 및 자신이 원하는 조건에 맞는 봉사 검색 기능
+ 결제기능을 통해 후원 기능 구현 및 후원사용내역 확인 가능
+ 게시판 관련 기능(글 쓰기, 덧글, 목록 보기, 글 읽기)
+ 관리자를 통한 웹사이트 정보의 관리


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
+ 각 카테고리별 정보가 사용자에게  쉽게 파악할수 있도록 설계 
+ 봉사프로그램 구매와 입양 후 입양일지 작성을 통하여 책임감을 높임. 
+ 회원 정보 연동을  통한 편리한 후원 신청 가능
+ 각각의 신청 및 구매내역을 쉽게 파악하도록 구성 및 설계 
 


## 팀원별 단위 업무

전 상 수 (팀장)     : 프로젝트 일정 및 전체 관리 , 회원 정보 관련 카테고리 담당 
김 도 영           : 커뮤니티 카테고리 및 관리자 관련 카테고리 담당
김 지 연           : 후원 관련카테고리 담당 
김 채 원           : 봉사 관련 카테고리 담당
이 새 린           : 입양 관련 카테고리 담당




