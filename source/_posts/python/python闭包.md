---
title: python闭包
date: 2023-05-30 17:37:57
---

# Python闭包

闭包（Closure）是指在一个函数内部定义的函数，并且该内部函数可以访问外部函数的变量。闭包可以捕获并保持外部函数的状态，即使外部函数已经执行结束，内部函数仍然可以访问和操作外部函数的变量。

在Python中，定义闭包的一般形式是在一个函数内部定义另一个函数，并将内部函数作为返回值返回。内部函数可以访问外部函数的局部变量，并且可以在外部函数执行完毕后继续访问和修改这些变量。

以下是一个简单的示例，展示了闭包的用法：

```
def outer_function(x):
    def inner_function(y):
        return x + y
    return inner_function

closure = outer_function(10)  # 调用外部函数，返回内部函数作为闭包
result = closure(5)  # 调用闭包函数
print(result)  # 输出：15
```

在上面的示例中，`outer_function`是外部函数，它接受一个参数`x`。在`outer_function`内部，定义了内部函数`inner_function`，它接受另一个参数`y`，并返回`x + y`的结果。`outer_function`最后将`inner_function`作为返回值返回。

通过调用`outer_function(10)`，我们得到一个闭包`closure`，它实际上是一个函数，可以在后续的代码中使用。当我们调用`closure(5)`时，实际上是调用了内部函数`inner_function`，并将`x`的值设置为10，`y`的值设置为5，返回结果15。

