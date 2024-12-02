#! /usr/bin/env python3

import sys
import fileinput
import operator


def main(argv=sys.argv):
    nsafe = 0
    for line in fileinput.input(encoding="utf-8"):
        report = [int(v) for v in line.split()]
        if len(report) < 2:
            nsafe += 1
            continue
        v0, v1, *_ = report
        op = operator.lt if v0 < v1 else operator.gt
        for v0, v1 in zip(report[:-1], report[1:]):
            d = abs(v1 - v0)
            if not (op(v0, v1) and 1 <= d <= 3):
                break
        else:
            nsafe += 1
    print(nsafe)
    return


if __name__ == '__main__':
    main()
