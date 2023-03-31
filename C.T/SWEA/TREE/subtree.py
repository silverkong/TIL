# 구현3
def inorder(node): 
    global cnt
    if node == 0:
        return
    # 전위
    cnt += 1
    inorder(left[node])
    # 중위
    inorder(right[node])
    # 후위
 
for test_case in range(1, int(input()) + 1):
    E,N = map(int, input().split())
    arr = list(map(int, input().split()))
    # 구현1
    left = [0]*(E+2) # 첫번째 자식
    right = [0]*(E+2) # 두번째 자식
    # 구현2
    for i in range(0,len(arr),2): 
        papa, baby = arr[i], arr[i+1] # 부모 - 자식
        if left[papa]: # 0이 아니고 첫번째에 값이 있으면
            right[papa]=baby # 두번째에 보관
        else: # 0이면
            left[papa]=baby # 첫번째에 보관
 
    cnt = 0
    inorder(N)
    print('#{} {}'.format(test_case,cnt))

'''
런타임에러

def check(count, N):      
    if N in child1:
        count += 1
        point = child1.index(N) - 1
    while True:
        if child1[point] != 0:
            count += 1
            point = child1[point] - 1
        else:
            break
    point = child1.index(N) - 1
    while True:
        if child2[point] != 0:
            count += 1
            point = child2[point] - 1
        else:
            break
    return count

T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    E, N = map(int, input().split())
    child1 = [0 for _ in range(1, E+2)]
    child2= [0 for _ in range(1, E+2)]
    count = 0

    l = list(map(int, input().split()))
    for i in range(0, len(l), 2):
        if child1[l[i]-1] == 0:
            child1[l[i]-1] = l[i+1]
        else:
            child2[l[i]-1] = l[i+1]

    count = check(count, N)
    print('#{} {}'.format(test_case, count))def check(count, N):      
    if N in child1:
        count += 1
        point = child1.index(N) - 1
    while True:
        if child1[point] != 0:
            count += 1
            point = child1[point] - 1
        else:
            break
    point = child1.index(N) - 1
    while True:
        if child2[point] != 0:
            count += 1
            point = child2[point] - 1
        else:
            break
    return count

T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    E, N = map(int, input().split())
    child1 = [0 for _ in range(1, E+2)]
    child2= [0 for _ in range(1, E+2)]
    count = 0

    l = list(map(int, input().split()))
    for i in range(0, len(l), 2):
        if child1[l[i]-1] == 0:
            child1[l[i]-1] = l[i+1]
        else:
            child2[l[i]-1] = l[i+1]

    count = check(count, N)
    print('#{} {}'.format(test_case, count))'''