# JDK / Eclipse 다운로드 및 환경설정 (Mac OS)

> Mac OS 버전으로 내가 한 눈에 알아보기 위해서 작성



## JDK

1. JDK 11 다운로드

   - macOS x64 DMG Installer > idk-11.0.15_osx-x64_bin.dmg
   - 오라클 계정 로그인 필수

2. JDK 설치 및 환경설정

   1. idk-11.0.15_osx-x64_bin.dmg 파일 실행시켜서 설치

   2. 터미널 켜서 아래와 같이 입력하여 환경변수 설정 진행

      ```bash
      cd /Library/Java/JavaVirtualMachines
      ls -al # 이때 파일명 알 수 있음
      cd jdk-11.0.15.jdk/Contents/Home
      pwd # pwd 입력 시 하단에 경로가 뜸
      (경로) # 복사하기
      
      # 터미널 닫고 다시 시작
      vi ~/.bash_profile # 이때 새 창이 뜸
      i # 편집 환경 들어가기
      # 하단 내용 작성
      export JAVA_HOME=(복사한 경로)
      export PATH=$(PATH):$JAVA_HOME/bin
      # 작성 후 esc
      :wq # 저장하고 닫기
      ```



## 이클립스

1. 작업 폴더 생성 (workspace)
   - 다음 위치에 생성하지 말 것 : 바탕화면, 사용자, 한글 폴더명
2. 이클립스 다운로드
   - IDE 2022-03
3. 이클립스 설치
   1. 파일 실행 후 설치
   2. Eclipse IDE Enterprise Java and Web Developers 선택
   3. 설치 위치 변경
   4. INSATALL (Accept)
   5. LAUNCH > 작업 폴더 선택
4. 이클립스 설정
   - Perspective 변경 : Window > Perspective > Java 선택
   - Package Explorer 안 보일 때 : Window > Show View > Package Explorer