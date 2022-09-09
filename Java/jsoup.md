# jsoup

> java로 만들어진 HTML parser



**https://jsoup.org/**



### 문서 파싱



#### 문서 전체를 가지고 있는 문자열로부터 파싱

```java
import org.jsoup.Jsoup; import org.jsoup.nodes.Document;
... 
String html = "<title>First parse</title>"
            + "<p>Parsed HTML into a doc.</p>";
Document doc = Jsoup.parse(html);
```



#### 문서의 body 일부분을 가지고 있는 문자열로부터 파싱

```java
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
...
String html = "<div><p>Lorem ipsum.</p>";
Document doc = Jsoup.parseBodyFragment(html);
Element body = doc.body();
```



#### URL로부터 문서 파싱

```java
// get 방식
Document doc = Jsoup.connect("http://example.com/").get();
String title = doc.title();

// post 방식
Document doc = Jsoup.connect("http://example.com")
                    .data("query", "Java")
                    .userAgent("Mozilla")
                    .cookie("auth", "token")
                    .timeout(3000)
                    .post();
```



#### 파일로부터 파싱

```java
File input = new File("/tmp/input.html");
Document doc = Jsoup.parse(input, "UTF-8", "http://example.com/");
```

