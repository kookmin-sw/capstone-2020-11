# ELSA (Elaborate Localization System Architectects)


## 1. 프로젝트 소개 (OLAF)
## OLAF
>   <img align="right" src="./images/olaf.jpg" width="300px"></img>
&nbsp; 본 프로젝트는 학교 내 건물에서 사용자가 원하는 목적지까지 <b>길을 안내하는 로봇</b>을 제작하는 것을 목표로 한다.<br/><br/>
&nbsp;매년 들어오는 신입생 및 외부인들은 캠퍼스 안내지도, 핸드폰 GPS 등을 통해 건물을 찾아오는 것은 쉽게 할 수 있다. 하지만 학과 건물과 같은 대규모 실내 공간에서는 종종 길을 헤매기도 한다. 우리는 이러한 사람들을 위해 실내에서 사용자들이 원하는 목적지까지 안내해 주는 로봇을 제작해 정확하고 빠르게 목적지까지 안내하여 편의성을 높이려 한다. 사용자는 앱을 통해 안내로봇(OLAF)과 통신을 하고 OLAF에게 목적지를 알려주면 OLAF는 목적지까지 최단경로로 안내해 준다. 안내하는 중에는 사용자는 앱을 통해 현재 자신위치, 목적지까지 남은 정도, 경로 등을 확인 할 수 있다. 이러한 과정을 통해 사용자는 처음 방문하는 건물이지만 길을 헤매지 않고 목적지까지 도달 할 수 있다.<br/><br/><br/>

## 2. Abstract

>   Our project goal is to build a robot that guides the way indoors to user. Robots are based on trutlebot3.</br> Robots have LiDAR sensor, camera, Encoder and IMU sensors. The core technologies of robots are localization, SLAM and navigation. </br>SLAM stands for 'Simultaneous Localization and Mapping'. The SLAM receives values direction from IMU, acceleration and angular velocity from Encoder, surrounding environment data from LiDAR. Then robots localizate themselves and create maps. To do localiztion, first obtain the local map through SLAM. </br>Then, for localization, compare the value measured in real time through LiDAR with the local map. It is not safe to localize only one LiDAR sensor. So robots calculates direction with the IMU and calculates accelation and angular velocity with the Encoder to modify robots position whenever robots move. </br>To do navigation, robots use local map created by SLAM and position calculated by localization. First, robots receive the destination from the user through the app. Second, The robot creates waypoints between its position and destination. Finally, Robots move to the destination use shortest path algorithm. If robots meet obstacle, robots avoid obstacles.If the camera detects the obstacles during the navigation, robots will move to the destination after avoiding obstacles.</br>

## 3. 소개 영상

- [Youtube](https://youtu.be/V9RMH4tUaUQ/) 계획서발표
- [Youtube](https://youtu.be/tdBFq6ZRJdE/) 중간보고서
- [Youtube](https://youtu.be/EMOXelOuhhg/) 2차 중간 시연 영상
- [Youtube](https://youtu.be/pPz9lZsde4Q/) 2차 중간평가 발표 + 시연 영상

## 4. 팀 소개

### Professor : 주용수


<img align="left" src="./images/dahun.jpeg" height="200px"></img>

```markdown
* Name: 김다훈
* Student ID: 20153155
* Email: as1084089@kookmin.ac.kr
* Role:
  - Project Leader
  - IMU 캘리브레이션 및 데이터 처리
  - 사용자에게 제공할 최단경로 알고리즘 개발
  - LiDAR 센서 데이터 처리 및 SLAM 알고리즘 수정
```

<img align="left" src="./images/seonpil.jpeg" height="200px"></img>

```markdown
* Name: 김선필
* Student ID: 20143038
* Email: ksp2246@kookmin.ac.kr
* Role:
  - Hardware 설계 및 관리
  - 3D 모델링 및 프린팅
  - Object Detection 개발 및 Dataset 라벨링 툴 개발
  - 시스템 구조 설계
```


<img align="left" src="./images/myungsoo.jpeg" height="200px"></img>

```markdown
* Name: 김명수
* Student ID: 20133199
* Email: msbmkim@gmail.com
* Role:
  - 사용자에게 길안내 서비스(UI) 개발 및 관리
  - AWS EC2 를 이용한 웹 서버 작업
  - ionic 빌드를 통한 application 빌드 (android, ios)

```


<img align="left" src="./images/hanul.jpeg" height="200px"></img>

```markdown
* Name: 배한울
* Student ID: 20153184
* Email: gksdnf0407@gmail.com
* Role:
  - 모터 컨트롤러 개발 및 관리
  - 각 센서와의 Nvidia Jetson Tx2 연동 시스템 구축
  - Hardware 설계 및 관리

```


<img align="left" src="./images/chanwoo.jpeg" height="200px"></img>

```markdown
* Name: 윤찬우
* Student ID: 20153202
* Email: ycw1879@kookmin.ac.kr
* Role:
  - IMU 캘리브레이션 및 데이터 처리
  - 번호 추출 알고리즘 개발 및 관리
  - Navigation 시스템 개발 및 관리

```


`GIF TEST`
![test_gif](./images/test.gif)

## 5. 사용법

- Opencr Driver Install
```markdown
    export OPENCR_PORT=/dev/ttyACM0
    export OPENCR_MODEL=olaf
    rm -rf ./opencr_update.tar.bz2
    wget https://github.com/kookmin-sw/capstone-2020-11.git/opencr_update.tar.bz2
    tar -xvf opencr_update.tar.bz2
    cd ./opencr_update
```

- Opencr Setup
```markdown
    cd /dev
    sudo chmod 777 ttyACM0
    ls -al | grep ttyACM0

    cd opencr_update
    export OPENCR_PORT=/dev/ttyACM0
    export OPENCR_MODEL=olaf
    sudo ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
```
