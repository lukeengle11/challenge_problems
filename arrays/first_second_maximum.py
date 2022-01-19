from typing import List

def first_second_max(arr: List[int]) -> int:
    max = arr[0]
    second_max = None
    if arr[1] >= max:
        second_max = max
        max = arr[1]
    else:
        second_max = arr[1]

    for number in arr[1:]:
        if number > max or number == max:
            second_max = max
            max = number
        elif number > second_max:
            second_max = number

    return second_max
        





arr = [47,1,5,3,2,9,6,24,6,45,1,5,23,24,3,8,9,2]
print(first_second_max(arr))