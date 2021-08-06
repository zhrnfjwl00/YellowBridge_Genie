[목차](#sections)
  - [프로젝트명](# 프로젝트명_:_YellowBridge)
  - [개요](#개요)
  - [사용기술 및 개발환경](#사용기술_및_개발_환경)
  - [구현기능](#구현기능)
  - [핵심 기능](#핵심 기능)
  - [설계 주안점](#설계 주안점)
  - [팀원별 단위업무](#팀원별 단위업무)
 



# 프로젝트명 : YellowBridge
## 팀 명 : Genie(전상수, 김도영, 이새린, 김지영, 김채원)



## 개요 : 유기동물 입양 및 기부 사이트

+ 유기동물이 늘어나고 있는 실정에 제작한 사이트를 통해 경각심 및 쉬운 입양 접근 
+ 기부금 내역을 투명하게 공개함으로 인해 기부를 적극적으로 유도 
+ 입양 이후의 입양 일지를 통해 파양율을 낮추고 입양한 동물들의 상태 확인 가능
+ 금전적인 기부 뿐만 아니라 봉사를 통해 다양한 후원 방식 제공

## 사용기술 및 개발 환경
+ Front-end : <img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
+ Back-end : <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">   
+ Data-base : <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
+ Server : <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">  
+ Version-control: <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

## 구현 기능 

+ 사용자 회원가입 / 로그인/ 회원탈퇴 / 회원정보 수정 / 마이페이지
+ 봉사프로그램을 구매할 수 있는 형태로 제작 및 자신이 원하는 조건에 맞는 봉사 검색 기능
+ 결제기능을 통해 후원 기능 구현 및 후원사용내역 확인 가능
+ 게시판 관련 기능(글 쓰기, 덧글, 목록 보기, 글 읽기)
+ 관리자를 통한 웹사이트 정보의 관리

 #
 #

## 핵심 특징
<img src ="https://user-images.githubusercontent.com/75979713/128276072-077e970d-7486-444f-9ec0-31f3de7b27a1.png" width="50%" height="50%">

* 사이트의 메인페이지 
  * 입양동물, 봉사, 입양일지, 공지사항을 사용자 조회순으로 보여줌으로써 사용자에게 정보 제공 


 #
 #


<img src ="https://user-images.githubusercontent.com/75979713/128276171-b3f34e28-0004-4487-9e10-c5c827e1b0ae.png" width="40%" height="50%"><img src ="https://user-images.githubusercontent.com/75979713/128276231-c2b1e2de-f615-4b49-8e3d-ad7fb1824c91.png" width="40%" height="40%">

* 입양 카테고리 
  * 입양동물들의 대한 정보를 사용자에게 제공 
  * 입양을 위한 양식을 제공함으로써 사용자의 손쉬운 접근 유도

 #
 #



<img src ="https://user-images.githubusercontent.com/75979713/128277309-6e2b7ee1-4379-4916-b578-59871367cd2d.png" width="40%" height="465"><img src ="https://user-images.githubusercontent.com/75979713/128277345-554da238-b6ae-45c6-bedd-aa0174b5b2a4.png" width="40%" height="50%">

* 봉사 카테고리 
  * 봉사시설에 대한 정보를 사용자에게 제공 
  * API들을 사용하여 사용자에게 봉사시설에 대한 설명과 봉사신청을 진행 가능
  
 #
 #
  
  
<img src ="https://user-images.githubusercontent.com/75979713/128277377-0da26aa3-296d-401b-8396-95c29a39a90b.png" width="40%" height="50%"><img src ="https://user-images.githubusercontent.com/75979713/128277425-18e96a88-05dd-4d85-92d3-50fd1c16f877.png" width="40%" height="50%">

* 후원 카테고리 
  * 사용자의 정보를 입력하고 결제API를 사용하여 결제 가능 
  * 사용자 본인이 후원한 정보를 기간별로 정보 제공 
  
 #
 #
  


## 설계 주안점
+ 각 카테고리별 정보가 사용자에게  쉽게 파악할수 있도록 설계 
+ 봉사프로그램 구매와 입양 후 입양일지 작성을 통하여 책임감을 높임. 
+ 회원 정보 연동을  통한 편리한 후원 신청 가능
+ 각각의 신청 및 구매내역을 쉽게 파악하도록 구성 및 설계


 #
 #
 


## 팀원별 단위 업무

전 상 수 (팀장)     : 프로젝트 일정 및 전체 관리 , 회원 정보 관련 카테고리 담당 

김 도 영           : 커뮤니티 카테고리 및 관리자 관련 카테고리 담당

김 지 연           : 후원 관련카테고리 담당 

김 채 원           : 봉사 관련 카테고리 담당

이 새 린           : 입양 관련 카테고리 담당




