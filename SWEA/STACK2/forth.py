T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    forth = list(input().split())
    c = ['+', '-', '*', '/']
    stack = []
    error = 0
    
    for i in range(len(forth) - 1):
        if forth[i].isdigit():
            stack.append(forth[i])
        elif forth[i] in c:
            if len(stack) < 2:
                error = 1
                break
            y = int(stack.pop())
            x = int(stack.pop())
            if forth[i] == '+':
                result = x + y
            elif forth[i] == '-':
                result = x - y
            elif forth[i] == '*':
                result = x * y
            elif forth[i] == '/':
                result = x // y
            stack.append(result)
        else:
            error = 1
            break
    if error == 1 or len(stack) != 1:
        print('#{} error'.format(test_case))
    else:
        print('#{} {}'.format(test_case, stack.pop()))