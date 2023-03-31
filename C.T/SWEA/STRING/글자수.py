T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    N = list(input())
    M = list(input())
    count = {string: 0 for string in N}
    
    for i in M:
        if i in count:
            count[i] += 1
    maxCount = max(count.values())
    print('#', test_case, ' ', maxCount, sep='')