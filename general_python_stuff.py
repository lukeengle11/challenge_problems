import sys
from typing import List

def write_to_file(filename: str, file_contents: str) -> None:
    with open(filename, "w") as f:
        f.write(file_contents)

def read_from_console() -> str:
    try:
        return input()
    except KeyboardInterrupt:
        sys.exit(0)

def get_two_d_int_array(columns: int, rows: int) -> List[List[int]]:
    return [[0 for i in range(columns)] for j in range(rows)]

def remove_even_integers(some_list: List[int]) -> None:
    list_length = len(some_list)
    for index, value in enumerate(reversed(some_list)):
        if value % 2 == 0:
            del(some_list[list_length - index - 1])
    

# write_to_file("some_file.txt", "This is some content\nsome more content\n")
# print(read_from_console())

# two_d_array = get_two_d_int_array(5, 5)
# two_d_array[2][2] = 1
# for l in two_d_array:
#     print(l)

arr = [1,2,3,4,5,6,7,8,9,10]
remove_even_integers(arr)
print(arr)
