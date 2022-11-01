/* As root user */                                                                                                                                                                                                 
CREATE USER 'beego_blog'@'localhost' IDENTIFIED BY 'tmp_pwd';
CREATE DATABASE beego_blog;
GRANT ALL PRIVILEGES ON beego_blog . * TO 'beego_blog'@'localhost';