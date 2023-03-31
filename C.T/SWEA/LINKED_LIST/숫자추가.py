T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    N, M, L = map(int, input().split())
    nums = list(map(int, input().split()))

    for _ in range(M):
        I, num = map(int, input().split())
        temp = nums[I:]
        del nums[I:]
        nums.append(num)
        for i in temp:
            nums.append(i)

    print('#{} {}'.format(test_case, nums[L]))