def get_pairs(id_in_subsessions):
    """
    Function to get the pairs for the round robin tournament.
    """
    if len(id_in_subsessions) % 2 != 0:
        raise ValueError("The number of participants must be even.")
    left = id_in_subsessions[: len(id_in_subsessions)//2]
    right = id_in_subsessions[len(id_in_subsessions)//2:]

    while True:
        yield list(map(list, zip(left, right)))
        right.append(left.pop())
        left.insert(1, right.pop(0))


pairs = get_pairs(list(range(20)))
