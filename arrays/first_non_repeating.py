from typing import List, Dict, Optional

def find_first_non_repeating(arr: List[int]) -> Optional[int]:
    # Dictionaries in python since 3.6 are ordered by insertion
    # That means we can insert into this dictionary, then at the end we just iterate over
    # it until we find on that has a 'size' of 1
    # This results in 2n iterations, which makes this O(n)
    
    number_occurrences: Dict[int, int] = {}
    for number in arr:
        if number in number_occurrences:
            number_occurrences[number] += 1
        else:
            number_occurrences[number] = 1
    
    for number, count in number_occurrences.items():
        if count == 1:
            return number
    
    return None

arr = [1,5,3,2,9,6,24,6,45,1,5,23,24,3,8,9,2]
print(find_first_non_repeating(arr))