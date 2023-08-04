def solution(H, X, Y):
    H.sort(reverse=True)

    tot = 0
    timex = 0
    timey = 0

    for i in range(len(H)):
        if timex + H[i] <= X and timey + H[i] <= Y:
            if timex <= timey:
                timex += H[i]
            else:
                timey += H[i]
            tot += 1
        elif timex + H[i] <= X:
            timex += H[i]
            tot += 1
        elif timey + H[i]<= Y:
            timey += H[i]
            tot += 1

    return tot

# Example usage:
H = [1, 1, 3]
X = 1
Y = 1
print(solution(H, X, Y))  # Output: 4
