def fibo(x):
    if x == 10:
        return 1
    elif x == 20:
        return 3
    else:
        return fibo(x - 10) + 2*fibo(x - 20)

T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    N = int(input())
    result = fibo(N)
    print('#', test_case, ' ', result, sep='')