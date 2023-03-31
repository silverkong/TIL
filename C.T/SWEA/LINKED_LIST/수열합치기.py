T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    N, M = map(int, input().split())
    arr = [float('inf')]
    cnt = 0
    
    for _ in range(M):
        a = list(map(int, input().split()))
        for i in range(N*cnt+1):
            if a[0] < arr[i]:
                arr[i:i] = a
                break
        cnt +=  1
    
    print('#', test_case, ' ', sep='', end='')
    print(*arr[-11:-1][::-1])