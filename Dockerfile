# Sử dụng OpenJDK 17 (ổn định và phổ biến cho Tomcat 10)
FROM openjdk:17-jdk-slim

# Cài wget + tar
RUN apt-get update && apt-get install -y wget tar && rm -rf /var/lib/apt/lists/*

# Cài Apache Tomcat 10.1.44
RUN wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.44/bin/apache-tomcat-10.1.44.tar.gz \
    && tar xzf apache-tomcat-10.1.44.tar.gz \
    && mv apache-tomcat-10.1.44 /usr/local/tomcat \
    && rm apache-tomcat-10.1.44.tar.gz

# Thiết lập biến môi trường
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH="$CATALINA_HOME/bin:$PATH"

# Xoá các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR của bạn vào Tomcat và đặt tên ROOT.war để chạy tại "/"
COPY EmailList.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
