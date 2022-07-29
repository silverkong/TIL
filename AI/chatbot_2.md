# Chatbot #2

> JSON을 Service에서 Parsing하지 않고 그대로 전달 받아서 Javascript에서 Parsing하는 방법



### JSON 형태를 Javascript에서 Parsing

- 원래는 Service 클래스에서 파싱된 형태로 전달 받아서 result 출력
- Ajax에 JSON 형태 그대로 전달 받아서 AJax에서 파싱하여 결과 출력

```javascript
//JSON 형식 그대로 반환 받음
var bubbles = result.bubbles;
for(var b in bubbles){
  if(bubbles[b].type == 'text'){ // 기본 텍스트 답변인 경우
    /* chatBox에 받은 메시지 추가 */
    $('#chatBox').append(bubbles[b].data.description); 

    // 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출	
    callAjaxTTS(bubbles[b].data.description);										   
  }	else if(bubbles[b].type == 'template'){//이미지 답변 또는 멀티링크 답변 시작
    if(bubbles[b].data.cover.type=="image"){//이미지 이면
      $("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
                           "' alt='이미지 없음' width='200' height='100'>");
      if(bubbles[b].data.contentTable == null){
        $("#chatBox").append
        ("<a href='"+bubbles[b].data.cover.data.action.data.url+"' target='_blank'>" +   
         bubbles[b].data.cover.data.action.data.url+ "</a>");		
      } else {
        $("#chatBox").append(bubbles[b].data.cover.data.description);	
        // 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출									   
        callAjaxTTS(bubbles[b].data.cover.data.description);		
      }
    } 	else if(bubbles[b].data.cover.type=="text"){//멀티링크 답변이면
      $("#chatBox").append(bubbles[b].data.cover.data.description);
      // 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출									   
      callAjaxTTS(bubbles[b].data.cover.data.description);	
    }

    // 이미지 / 멀티링크 답변 공통 (contentTable 포함)
    for(var ct in bubbles[b].data.contentTable){
      var ct_data = bubbles[ct].data.contentTable[ct];
      for(var ct_d in ct_data){
        $("#chatBox").append
        ("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank'>" + 
         ct_data[ct_d].data.data.action.data.url+ "</a>");
      }
    }// contentTable for문 끝
  }//template 끝			
}//bubbles for문 종료
```

