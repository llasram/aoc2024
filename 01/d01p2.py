#! /usr/bin/env python3

import sys
import fileinput
import collections


def main(argv=sys.argv):
    xs, ys = [], collections.defaultdict(int)
    for line in fileinput.input(encoding="utf-8"):
        x, y = [int(s) for s in line.split()]
        xs.append(x)
        ys[y] += 1
    result = 0
    for x in xs:
        result += x * ys[x]
    print(result)
    return


if __name__ == '__main__':
    main()
