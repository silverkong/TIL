# Form 유효성 확인

```javascript
// js 코드는 다음과 같음
// input 입력란에 입력하지 않은 경우 : 아이디, 성명
// 아이디는 6~10자 입력
// 비밀번호와 비밀번호 확인이 일치하지 않는 경우
// <select>에서 선택하지 않은 경우
// 라디오 버튼 체크하지 않은 경우
// 체크박스에서 하나도 체크하지 않은 경우

window.onload = function(){
  //id가 joinForm인 객체의 submit 버튼이 눌러졌을 때 수행되는 함수
  document.getElementById('joinForm').onsubmit = function(){
    // 성명을 입력하지 않은 경우 알림창 출력
    var name = document.getElementById('name');

    if(name.value == ""){
      alert("성명을 입력하세요");
      name.focus();
      // 다음 페이지로 이동하지 않게
      return false;
    }

    // 아이디를 입력하지 않은 경우 알림창 출력
    var id = document.getElementById('id');

    if(id.value == ""){
      alert("아이디를 입력하세요");
      id.focus();
      // 다음 페이지로 이동하지 않게
      return false;
    }

    // 아이디 6~10자 아니라면
    if(id.value.length < 6 || id.value.length > 10){
      alert("아이디는 6~10자로 입력하세요");
      id.value = '';
      id.focus();
      return false;
    }

    // 비밀번호와 비밀번호 확인이 일치하지 않는 경우
    var pw = document.getElementById('password');
    var pwCheck = document.getElementById('passwordCheck');

    if(pw.value != pwCheck.value){
      alert("비밀번호가 일치하지 않습니다");
      pwCheck.value = '';
      pwCheck.focus();
      return false;
    }

    // 직업을 선택하지 않은 경우
    var job = document.getElementById('job');

    if(job.selectedIndex == 0){
      alert("직업을 선택해주세요");
      return false;
    }

    // 이메일 수신 여부를 선택하지 않은 경우(라디오 버튼)
    var chk = false;

    for(var i = 0; i<joinForm.emailRcv.length; i++){
      if(joinForm.emailRcv[i].checked){
        chk = true; //하나라도 체크가 된다면 true
      }
    }

    // 하나도 check되지 않으면 false 유지
    if(chk == false){
      alert("이메일 수신 여부를 선택하세요");
      return false;
    }

    // checkbox 유효성 검사, 둘 다 동의해야 합니다.
    var agreement1 = document.getElementById('agreement1');
    var agreement2 = document.getElementById('agreement2');

    if(agreement1.checked == false || agreement2.checked == false){
      alert("모두 동의해야 합니다.");
      return false;
    }


  };//onsubmit 끝

};//window.onload 끝

```

