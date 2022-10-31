def check(text):
    temp = []
    result = 1
  
    for t in text:
        if t == '(' or t == '{':
            temp.append(t)
        elif t == ')' or t == '}':
            if len(temp) == 0:
                result = 0
                break
            elif t == ')' and temp.pop() == '{':
                result = 0
                break
            elif t == '}' and temp.pop() == '(':
                result = 0
                break
            else:
                result = 1
              
    if len(temp) != 0:
        result = 0
      
    return result

T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    text = input()
    result = check(text)
    print('#{} {}'.format(test_case, result))