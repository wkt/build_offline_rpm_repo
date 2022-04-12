# 生成rpm离线安装包
## 1 安装docker
    请参考： https://www.runoob.com/docker/docker-tutorial.html

## 2 设置离线安装的目标系统
    编辑文件build_repo，填写需要离线安装软件的系统版本
    OS_NAME=centos:7.6 #理论上支持centos/yum系统，但是仅测试了centos 7.6

## 3 构建离线安装包
    在联网的机器（原则只要支持docker和bash就可以）上，运行：
    bash build_repo pack git java-1.8.0-openjdk # 创建git、java-1.8.0-openjdk的离线安装包

## 4 离线安装软件
    解压安装包
    #cd path_of_unpack
    #bash install.sh
