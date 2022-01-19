from typing import List

def integer_merge_sort(arr: List[int]) -> None:
    if len(arr) == 1:
        return
    mid = len(arr) // 2
    left = arr[:mid]
    right = arr[mid:]
    integer_merge_sort(left)
    integer_merge_sort(right)

    merge(arr, left, right)

def merge(arr: List[int], left: List[int], right: List[int]) -> None:
    i = j = k = 0

    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            arr[k] = left[i]
            i += 1
        else:
            arr[k] = right[j]
            j += 1
        k += 1

    # Fill the remaining numbers
    while i < len(left):
        arr[k] = left[i]
        i += 1
        k += 1
    while j < len(right):
        arr[k] = right[j]
        j += 1
        k += 1


arr = [7,1,4,12,3,8,65,24,4,86,34,25,23,64,7,99,87,46]
print(arr)
integer_merge_sort(arr)
print(arr)