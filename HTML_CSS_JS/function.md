# 함수(function)

- 특정 기능을 수행하고 결과를 돌려주는 독립적인 코드 집합
- 독립적인 모듈{ }
- 메소드, 모듈, 기능, 프로시저 등으로 불림
- 함수를 사용하기 위해서는 반드시 호출해야 함
  - 함수는 호출하지 않으면 일 안함



```javascript
(function(){
  alert("함수 호출 없이도 자동 실행!")
})();
    
// 함수 선언
function show(){
  alert("show() 함수 입니다");
}

// show() 함수 호출
show();
```

```javascript
function start(){
  var answer = confirm("배경색을 변경하시겠습니까?");
  if(answer){
    changeColor();
  }else{
    alert("취소하였습니다.");
  }
}

function changeColor(){
  var color = prompt("색상 입력 : red/blue/green");
  document.write(color);
  document.bgColor = color;
}

start();
```

