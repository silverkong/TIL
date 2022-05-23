# Git 기초



### Git 초기 설정 방법

> 최초 한 번만 설정, 매번 설정할 필요 없음



1. 이름 및 이메일 설정

   - 누가 커밋했는지 알아보기 위함
   - github에 사용하는 username과 email 사용할 것

   ```bash
   % git config --global user.name "username"
   % git config --global user.email "email"
   ```

   - 이때, 작성하고 아무 반응이 없다면 정상적으로 작동한 것

2. 설정 확인

   ```bash
   % git config --global --list
   user.name=username
   user.email=email
   ```

   - 하단에 정상적으로 뜬다면 설정 완료!



### Git 기본 명령어

#### 0. 로컬 저장소

- `Working Directory (= Working Tree)` : 사용자의 작업이 일어나는 곳
- `Staging Area (= Index)` : 커밋을 위한 파일 및 폴더가 추가되는 곳
- `Repository` : Staging Area에 있던 파일 및 폴더의 변경사항(커밋)을 저장하는 곳
- Git은 **Working Directory > Staging Area > Repository**의 과정으로 버전 관리 수행



#### 1. git init

> 로컬 저장소로 지정한다는 명령어 / 한 번만 수행해도 됨



```bash
% git init	# 초기화 한 후 저장소로 지정
```

- `.git` 이라는 숨김 폴더를 생성하고, 터미널에는 `(master)`라고 표기됨
  - Mac OS의 경우 `(master)`가 표기되지 않는데, Terminal 업그레이드를 통해 표기 가능

- **주의 사항**

	1. 이미 git 저장소인 폴더 내에 또 다른 git 저장소 만들지 말 것 (중첩 하지 말 것)
      - 터미널에 이미 (master)가 뜬다면 git init 절대 입력하지 말 것
	2. 절대로 최상위폴더에서 git init 하지 말 것
      - 터미널의 경로가 `~` 인지 확인



#### 2. git status

> 파일의 현재 상태를 알려주는 명령어 / 뭘 해야할지 모르겠다면 수시로 git status를 쳐서 확인



```bas
% git status
```

- 상태
  1. `Untracked` : git이 관리하지 않는 파일 (한 번도 Staging Area에 올라간 적 없는 파일)
  2. `Tracked` : git이 관리하는 파일
     - `Unmodfied` : 최신 상태
     - `Modified` : 수정되었지만 아직 Staging Area에 반영하지 않은 상태
     - `Staged` : Staging Area에 올라간 상태



#### 3. git add

> Working Directory에 있는 파일을 Staging Area로 올리는 명령어



```bash
# 특정 파일
% git add 파일명.파일확장자

# 특정 폴더
% git add 폴더명/

# 현재 디렉토리 파일/폴더 전부
% git add .
```

- `Untracked`, `Modified` 상태를 `Staged` 상태로 변경



#### 4. git commit

> Staging Area에 올라온 파일의 변경사항을 하나의 버전(커밋)으로 저장하는 명령어



``` bash
% git commit -m "커밋 메세지"
```

- `커밋 메세지` 는 현재 변경 사항을 잘 나타낼 수 있도록 의미있게 작성
- 각각 커밋은 SHA-1 알고리즘에 의해 반환된 고유의 해시 값을 ID로 가짐
- `root-commit` 은 해당 커밋이 최초의 커밋일 때만 표시



#### 5. git log

> 커밋의 내역을 조회할 수 있는 명령어



```bash
% git log

#옵션
% git log --oneline	# 한 줄로 축약해서 보여줌
% git log --graph		# 브랜치와 머지 내역을 그래프로 보여줌
% git log --all			# 현재 브랜치를 포함한 모든 브랜치 내역 보여줌
% git log --reverse # 커밋 내역의 순서를 반대로 보여줌(최신이 가장 아래)
% git log --p				# 파일의 변경 내용도 같이 보여줌
% git log --2				# 원하는 갯수만큼 내역 보여줌(2말고 임의 숫자 가능)
```





