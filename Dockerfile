# tomcat에서 제공하는 tomcat 10.1ver + java jre21인 이미지 가져옴
FROM tomcat:10.1-jre21

# 톰캣 타임존 설정
RUN ["rm", "/etc/localtime"]
RUN ["ln", "-sf", "/usr/share/zoneinfo/Asia/Seoul", "/etc/localtime"]

COPY setenv.sh /usr/local/tomcat/bin

#컨테이너 내부에 필요한 파일을 복사한다. 예를들어 war, 위 타임존 세팅할 때 사용할 setenv.sh 파일
COPY ./ROOT.war /usr/local/tomcat/webapps

# 컨테이너 외부에서 사용하는 포트 지정
EXPOSE 8080

#start tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]