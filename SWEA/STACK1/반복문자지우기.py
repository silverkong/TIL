def pop(str):
    if len(str) == 1:
        return str
    for i in range(1, len(str)):
        if str[i-1] == str[i]:
            del str[i]
            del str[i-1]
            return pop(str)
    return str

T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    str = list(input())
    pop(str)
    print('#{} {}'.format(test_case, len(str)))