def dfs(graph, visited, start):
    visited[start] = True
    for i in graph[start]:
        if not visited[i]:            
            dfs(graph, visited, i)

T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):          
    V, E = map(int, input().split())

    graph = [[] for _ in range(V + 1)]
    visited = [False] * (V + 1)

    for _ in range(E):
        a, b = map(int, input().split())
        graph[a].append(b)
        graph[a].sort()

    S, G = map(int, input().split())

    dfs(graph, visited, S)
    if visited[S] == True and visited[G] == True:
        result = 1
    else:
        result = 0

    print('#{} {}'.format(test_case, result))