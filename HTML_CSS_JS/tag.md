# Tag



## 기본태그

1. [HTML 문서 구조 태그](#1.-HTML-문서-구조-태그)
2. [텍스트 관련 태그](#2.-텍스트-관련-태그)
3. [하이퍼링크 태그](#3.-하이퍼링크-태그)
4. [목록 태그](#4.-목록-태그)
5. [테이블 태그](#5.-테이블-태그)
6. [이미지/이미지맵 태그](#6.-이미지/이미지맵-태그)





### 1. HTML 문서 구조 태그

```html
<html> <!--문서의 시작과 끝 표시 크게 head, body 두 부분으로 이루어져 있음 -->
  <head>
    <!-- 웹 브라우저 화면에는 보이지 않지만 웹 브라우저가 알아두어야 할 문서 정보 포함 -->
    <!-- 문자 인코딩 및 문서 키워드, 문서 정보 -->
    <meta charset="utf-8">
    <!-- 외부 리소스 연결 -->
    <link rel="stylesheet" href="StyleSheet.css">
    <!-- 문서 제목 -->
    <title>문서 제목</title>
  </head>
  <body>
    <!-- 문서의 몸통 부분, 실제 화면에 보이는 문서 내용 포함-->
    <!-- 대부분의 태그가 body 사이에 위치-->
  </body>
</html>
```



### 2. 텍스트 관련 태그

```html
<h1>제목 태그</h1>
<p>본문 태그</p>
<br><!-- 엔터 -->
<hr><!-- 구분선 -->
<b>텍스트 강조</b>
<strong>텍스트 강조2</strong>
<i>이탤릭체</i>
<em>이탤릭체2</em>
<sub>아래 첨자</sub>
<sup>위 첨자</sup>
<ins>밑줄 표시</ins>
<del>취소 선</del>
<strike>취소 선2</strike>
&nbsp;<!-- 공백 특수 문자-->
&lt;<!-- "<" -->
&gt;<!-- ">" -->
```



### 3. 하이퍼링크 태그

 ```html
 <a href="#" target="iFrame">iframe에서 출력</a>
 <a href="#" target="_blank">새 창에서 출력</a>
 ```



### 4. 목록 태그

```html
<!--순서 없는 목록-->
<ul>
  <li>순서없는1</li>
  <li>순서없는2</li>
</ul>
<!--순서 없는 목록-->
<ol>
  <li>순서있는1</li>
  <li>순서있는2</li>
</ol>
```

```html
<!--정의 목록-->
<dl>
  <dt>정의 용어</dt>
  <dd>정의 설명</dd>
</dl>
```



### 5. 테이블 태그

```html
<table>
  <caption>테이블 설명</caption>
  <tr>
    <th>테이블 제목</th>
  	<td>테이블 내용</td>
  </tr>
</table>
```

```html
<table>
  <!-- 셀을 구분지어 놓으면 시각 장애인들도 화면 판독기를 통해 테이블 구조 쉽게 이해, CSS 사용하여 테이블의 각 부분에 		다른 스타일을 적용할 수 있어 편리 -->
  <thead><!-- 표의 제목 구분 -->
  	<tr>
    	<th></th>
      <th></th>
    </tr>
  </thead>
  <tbody><!-- 표의 내용 구분 -->
  	<tr>
    	<td></td>
      <td></td>
    </tr>
  </tbody>
  <tfoot><!-- 표의 푸터 구분 -->
  	<tr>
    	<td></td>
      <td></td>
    </tr>
  </tfoot>
</table>
```





### 6. 이미지/이미지맵 태그

```html
<img src="경로/파일명.파일확장자">
```

```html
<img src="images/메인.png" border="1" usemap="#cityMap">
<map name="cityMap">
  <area shape="rect" coords="60, 90, 250, 150" href="뉴욕.html">
  <area shape="rect" coords="310, 90, 500 150" href="파리.html">
  <area shape="rect" coords="560, 90, 750, 150" href="로마.html">
  <area shape="rect" coords="810, 90, 1000, 150" href="베이징.html">
</map>
```

