---
title: java日期比较忽略时分秒
date: 2023-05-23 10:59:31
---

示例代码如下

```java
public class DateUtils {
    public static int compareDatesWithoutTime(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        resetTime(cal1);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        resetTime(cal2);

        return cal1.compareTo(cal2);
    }

    private static void resetTime(Calendar calendar) {
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
    }
}
```

