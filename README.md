# 生成离线安装rpm的安装包

## 1 安装docker
    请参考： https://www.runoob.com/docker/docker-tutorial.html

## 2 设置离线安装rpm的目标系统
    编辑文件build_repo，填写需要离线安装rpm的系统版本
    OS_NAME=centos:7.6 #理论上支持centos/yum系统，但是仅测试了centos 7.6

## 3 构建离线安装包
    在联网的机器（理论上只要支持docker和bash就可以，测试用系统ubuntu）上，运行：
    bash build_repo pack git java-1.8.0-openjdk # 创建离线安装git、java-1.8.0-openjdk等软件rpm的安装包

## 4 离线安装软件
    解压安装包
    #cd path_of_unpack
    #bash install.sh

## 原理
     docker 运行centos
    设置保存yum下载的rpm缓存
    yum 安装软件，yum会自动下载安装依赖
    打包yum缓存的所有rpm，并生产离线安装安装包
