# CDATA

- 파싱되지 않는 문자 데이터
- 쿼리를 작성할 때 `<, >, >=, &, ||` 등을 사용해야 하는 xml 태그로 인식해서 오류가 발생할 수 있음
- XML 파싱 대상이 아닌 단순 문자열로 처리하라는 의미



### 사용 방법

```xml
<select id="listAllProduct" resultMap="prdResult">
  <![CDATA[
   SELECT * FROM product WHERE prdPrice > 100000 ORDER BY prdNo
  ]]>		
</select>
```

