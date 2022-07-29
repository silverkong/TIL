# Chatbot #1

> 웰컴 메세지 요청 방법



### Ajax를 사용하여 메세지를 요청

- 원래는 submit 함수 안에 Ajax를 사용하여 메세지를 요청
- Ajax 요청 코드를 함수로 선언하고 submit에서 해당 함수를 호출함
- 웰컴 메세지를 요청하기 위해서는 그 함수를 ready 뒤에 호출하여 시작과 동시에 요청하여 진입과 동시에 웰컴 메세지가 출력되도록 한다

```javascript
$(document).ready(function() {
	
	// 시작하자마자 웰컴 메시지 요청
	callAjax();

  // ajax() 부분을 별도의 함수로 분리
  function callAjax(){
    $.ajax({
      type:"post",
      url:"chatbot",
      data:{"message":$('#message').val()},
      dataType:"text",
      success:function(result){
        // chatBox에 받은 메시지 추가				
        $('#chatBox').append(result);

        // 스크롤해서 올리기 : 맨 아래 답변이 밑으로 내려가지 않도록 맨 아래 위치에 고정								
        $('#chatBox').scrollTop($('#chatBox').prop("scrollHeight"));			

        // 챗봇으로부터 텍스트 답변 받음 -> 음성 변환 (TTS)
        callAjaxTTS(result); // result를 callAjaxTTS() 함수에게 전달
        // callAjaxTTS() 함수는 TTS 요청해서 음성 파일 받고, audio play, audio 안 보이게


        $('#message').val("");
        $('#message').focus();					
      },
      error:function(){
        // 오류있을 경우 수행 되는 함수
        alert("전송 실패");
      },
    }); // ajax 끝
  } // function 끝
});
```

