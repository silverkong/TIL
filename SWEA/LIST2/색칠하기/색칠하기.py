T = int(input())

# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    N = int(input())
    graph = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0] for i in range(10)]
    count = 0
    for _ in range(N):
        nList = list(map(int, input().split()))
        for i in range(nList[0], nList[2]+1):
            for j in range(nList[1], nList[3]+1):
                if graph[i][j] == 0:
                    graph[i][j] = nList[4]
                else:
                    count += 1
    print('#', test_case, ' ', count, sep='')