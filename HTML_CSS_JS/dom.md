# DOM

HTML 요소를 다루기 위해서는 우선 해당 요소를 선택해야만 합니다.

자바스크립트에서 특정 HTML 요소를 선택하는 방법은 다음과 같습니다.

 

1. HTML 태그 이름(tag name)을 이용한 선택
2. 아이디(id)를 이용한 선택
3. 클래스(class)를 이용한 선택
4. name 속성(attribute)을 이용한 선택
5. CSS 선택자(selector)를 이용한 선택
6. HTML 객체 집합(object collection)을 이용한 선택



### 아이디(id)를 이용한 선택

``` javascript
var selectedItem = document.getElementById("even"); // 아이디가 "even"인 요소를 선택함.
selectedItem.style.color = "red"; // 선택된 요소의 텍스트 색상을 변경함.
```



### 클래스(class)를 이용한 선택

```javascript
var selectedItem = document.getElementsByClassName("odd"); // 클래스가 "odd"인 모든 요소를 선택함.

for (var i = 0; i < selectedItem.length; i++) {
    selectedItem.item(i).style.color = "red"; // 선택된 모든 요소의 텍스트 색상을 변경함.
}
```



### name 속성을 이용한 선택

```javascript
var selectedItem = document.getElementsByClassName("odd"); // 클래스가 "odd"인 모든 요소를 선택함.

for (var i = 0; i < selectedItem.length; i++) {
    selectedItem.item(i).style.color = "red"; // 선택된 모든 요소의 텍스트 색상을 변경함.
}
```



### CSS 선택자를 이용한 선택

```javascript
var selectedItem = document.querySelectorAll("li.odd"); // 클래스가 "odd"인 요소 중에서 <li> 요소만을 선택함.

for (var i = 0; i < selectedItem.length; i++) {
    selectedItem.item(i).style.color = "red"; // 선택된 모든 요소의 텍스트 색상을 변경함.
}
```

