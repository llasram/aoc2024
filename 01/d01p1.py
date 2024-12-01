#! /usr/bin/env python3

import sys
import fileinput


def main(argv=sys.argv):
    xs, ys = [], []
    for line in fileinput.input(encoding="utf-8"):
        x, y = [int(s) for s in line.split()]
        xs.append(x)
        ys.append(y)
    xs.sort()
    ys.sort()
    result = 0
    for x, y in zip(xs, ys):
        result += abs(x - y)
    print(result)
    return


if __name__ == '__main__':
    main()
