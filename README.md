# playdata_project_movie

접속 시 http://localhost:8088/reprotype/log 로 접속 

connectDB를 써있는 예시를 보고 자신의 데이터 베이스에 맞게 연결하세요 
connect() 메서드로서 Connection conn을 반환하도록 해주세요

테이블은 생성해 주셔야 합니다.

테이블 정보(mysql기준):

    comment 
    {
    nick: varchar(20),
    preHour: datetime,
    cont: varchar(2000),
    movieName: varchar(100),
    like_no: int,
    cnt: int primary key
    }

    member
    {
    id: varchar(20) primary key,
    pwd: varchar(20),
    nickname: varchar(20),
    name: varchar(50),
    curdate: varchar(50),
    gender: varchar(20),
    email: varchar(300),
    grade:int default 1
    }
