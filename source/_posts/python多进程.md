---
title: python多进程
date: 2023-08-24 12:48:31
---

# Python多进程

多进程

```plain
import multiprocessing
import time


def f1():
    print("f1")
    time.sleep(2)


def f2():
    print("f2")
    time.sleep(3)


def main():
    # f1()
    # f2()

    p1 = multiprocessing.Process(target=f1)
    p2 = multiprocessing.Process(target=f2)
    p1.start()
    p2.start()


if __name__ == '__main__':
    main()
```

参数传递

```plain
import multiprocessing


def f1(val):
    print(val)


def main():
    p1 = multiprocessing.Process(target=f1, args=(3,))
    p1.start()


if __name__ == '__main__':
    main()
```

守护进程

主进程执行结束，子进程也结束运行

```plain
import multiprocessing
import time


def f1(val):
    time.sleep(2)
    print(val)


def main():
    p1 = multiprocessing.Process(target=f1, args=(3,))
    # p1.daemon = True

    p1.start()
    print("主进程结束...")


if __name__ == '__main__':
    main()
```

进程通信

Windows

```plain
import multiprocessing
import time


def f1(val, queue):
    queue.put(val)


def f2(val, queue):
    queue.put(val)


def main():
    queue = multiprocessing.Queue()
    p1 = multiprocessing.Process(target=f1, args=(1, queue))
    p2 = multiprocessing.Process(target=f1, args=(3, queue))

    p1.start()
    p2.start()

    time.sleep(2)

    while not queue.empty():
        print(queue.get())

    print("主进程结束...")


if __name__ == '__main__':
    main()
```

