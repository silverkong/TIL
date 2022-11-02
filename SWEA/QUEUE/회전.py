T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    N, M = map(int, input().split())
    nums = list(map(int, input().split()))

    if M // N > 0:
        temp = M % N
        print('#{} {}'.format(test_case, nums[temp]))
    else:
        print('#{} {}'.format(test_case, nums[M]))