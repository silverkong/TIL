T = int(input())

def binary_search(array, target, start, end, count):
    if start > end:
        return None
    mid = int((start + end) // 2)
    count += 1
    if (array[mid] - 1) == target:
        return count
    elif (array[mid] - 1) > target:
        return binary_search(array, target, start, mid, count)
    else:
        return binary_search(array, target, mid, end, count)
      
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(1, T + 1):
    P, PA, PB = map(int, input().split())
    array = list(range(1, P+1))
    count = 0
  
    A = binary_search(array, PA, 1, P, count)
    B = binary_search(array, PB, 1, P, count)
    
    if A < B:
      result = 'A'
    elif A > B:
      result = 'B'
    else:
      result = 0
    
    print('#', test_case, ' ', result, sep='')