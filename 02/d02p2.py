#! /usr/bin/env python3

import sys
import fileinput
import operator


def issafe(report, skipped=-1):
    if len(report) < 2:
        return True
    op = None
    v0 = None
    for i, v1 in enumerate(report):
        if i == skipped:
            continue
        if v0 is None:
            v0 = v1
            continue
        d = abs(v1 - v0)
        if not 1 <= d <= 3:
            return False
        if op is None:
            op = operator.lt if v0 < v1 else operator.gt
        elif not op(v0, v1):
            return False
        v0 = v1
    return True


def main(argv=sys.argv):
    nsafe = 0
    for line in fileinput.input(encoding="utf-8"):
        report = [int(v) for v in line.split()]
        for skipped in range(-1, len(report)):
            if issafe(report, skipped):
                nsafe += 1
                break
    print(nsafe)
    return


if __name__ == '__main__':
    main()
