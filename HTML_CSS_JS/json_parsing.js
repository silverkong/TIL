$.ajax({
    type:"post",
    url:"chatbot",
    data: {"chatInput": $('#chatInput').val()},
    dataType: "json",
    success:function(result){
        // JSON 그대로 반환 받아서 자바스크립트에서 JSON 파싱
        var bubbles = result.bubbles;
        $('#resultBox').append("<span class='a_title'>🧚🏻‍♂️ 피티</span>");
        for(var b in bubbles){
            // 기본 답변인 경우
            if(bubbles[b].type == 'text'){
                // 받은 메세지 출력
                 $('#resultBox').append("<pre class='a'>" + bubbles[b].data.description + "</pre>");
            }
            // 멀티링크 답변인 경우
            else if(bubbles[b].type == 'template'){
                // 웰컴메세지에서 하단으로 된 디스크립션은 출력하지 않도록
                if(bubbles[b].data.cover.type=="text" && bubbles[b].data.cover.data.description!='하단' && bubbles[b].data.cover.data.description!=' 하단'){
                    $('#resultBox').append("<pre class='a'>" + bubbles[b].data.cover.data.description + "</pre>");	
                }
                // 멀티링크 contentTable
                for(var ct in bubbles[b].data.contentTable){
                    var ct_data = bubbles[b].data.contentTable[ct];
                    if(bubbles[b].data.contentTable[0][0].data.data.action.type == "link"){
                        for(var ct_d in ct_data){
                            $("#resultBox").append("<div class='div_btn'><a class='a_btn' href='"+ct_data[ct_d].data.data.action.data.url+"'>" + 
                                ct_data[ct_d].data.title+ "</a></div>");
                        }
                    }else if(bubbles[b].data.contentTable[0][0].data.data.action.type == "postback"){
                        for(var ct_d in ct_data){
                            $("#resultBox").append("<div class='div_btn'><a class='a_btn' id='a_post" + ct + "'>" + ct_data[ct_d].data.title +"</a></div>");
                        }
                    }
                }// contentTable for문 끝
            }// 멀티링크 답변 끝
            // 이미지 답변인 경우
            else if(bubbles[b].type == 'carousel'){
                // 피티 말 한 번에 이미지 여러개 출력
                for(var c in bubbles[b].data.cards){
                    $("#resultBox").append("<div class='div_a'><img class='a_img' src='" + bubbles[b].data.cards[c].data.cover.data.imageUrl + "'>"
                                            + "<span class='a_img_title'>" + bubbles[b].data.cards[c].data.cover.title + "</span>"
                                            + "<pre class='a_img_descript'>" + bubbles[b].data.cards[c].data.cover.data.description + "</pre>"
                                            + "<a class='a_link_prd' href='" + bubbles[b].data.cards[c].data.contentTable[0][0].data.data.action.data.url  +"'>"
                                            + bubbles[b].data.cards[c].data.contentTable[0][0].data.title + "</a></div>");
                }
            }//carousel 끝
        }//bubbles for문 종료
         
         $('#a_post0').click(function(){
             $('#chatInput').val(bubbles[2].data.contentTable[0][0].data.title);
             callAjax();
             $('#chatInput').val("");
         });
         
         $('#a_post1').click(function(){
             $('#chatInput').val(bubbles[2].data.contentTable[1][0].data.title);
             callAjax();
             $('#chatInput').val("");
         });
         // 마지막 대화 내용이 보이도록
         $('#resultBox').scrollTop($('#resultBox')[0].scrollHeight);
    },
    error:function(){
        // 오류있을 경우 수행되는 함수
        alert("전송 실패");
    }
}); // ajax 끝