T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    N, K = map(int, input().split())
    result = []
    count = 0
    def nCr(n, ans, r):
          A = list(range(1, 13))
          if n == len(A):
              if len(ans) == r:
                  temp = [i for i in ans]
                  result.append(temp)
              return
          ans.append(A[n])
          nCr(n + 1, ans, r)
          ans.pop()
          nCr(n + 1, ans, r)
      
    nCr(0, [], N)
    for i in range(len(result)):
        if sum(result[i]) == K:
            count += 1
        
    print('#', test_case, ' ', count, sep='')