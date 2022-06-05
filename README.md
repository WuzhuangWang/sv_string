# sv_string

A magic systemverilog string extensions package, contains various string operation.

## 大小写转换

python:
upper(),lower()
title()-字符串中所有单词首字母大写
capitalize()-字符串首字母大写
swapcase()-大小写反转

## is判断

python:
isdecimal()-全为10进制数字
isdigit()-全为数字
isalpha()-判断给定的字符串是否全为字母
isalnum()：判断给定的字符串是否只含有数字与字母
isupper():判断给定的字符串是否全为大写
islower():判断给定的字符串是否全为小写
isspace():判断给定的字符串是否为空白符（空格、换行、制表符）

## 字符串填充

center,ljust,rjust

zfill

## 子字符串搜索

count:
主要对指定字符串搜索是否具有给定的子字符串sub,若具有则返回出现次数。
strat与end代表搜索边界，若无写则代表全字符串搜索

startswith/endswith:
两个函数作用相同，判断函数的开始，或者末尾的字符串是否为指定字符串
与之前的搜索相同，可以给字符串加边界，若无则为全字符串搜索
两个函数都属于判断函数，返回结果为True与False

find:
返回第一个子字符串的位置信息，若无则为-1
rfind(sub[, start[, end]])返回最右边的第一个子字符串的位置信息，若无则为-1
index(sub[, start[, end]]) 返回第一个子字符串的位置信息，若无则为报错
rindex(sub[, start[, end]])返回最右边的第一个子字符串的位置信息，若无则报错

## 字符串替换

replace(old, new[, count])：将搜索到的字符串改为新字符串
作为替代函数，旧的字符串与新的字符串是必须输入的
count是可选择输入的参数，代表更改个数。

split(sep=None, maxsplit=-1)和rsplit(sep=None, maxsplit=-1)
split()函数传参两种
sep为切割，默认为空格
maxsplit为切割次数，给值-1或者none，将会从左到右每一个sep切割一次

splitlines:按照行('\r', '\r\n', '\n')分隔，返回一个包含各行作为元素的列表，如果参数 keepends 为 False，不包含换行符，如果为 True，则保留换行符。

## 字符串添加

join: X.join("")

## 字符串修剪

strip([chars])  lstrip([chars])  rstrip([chars])
strip()是为移除指定字符串char，如果没传入参数则为移除空格、制表符、换行符
lstrip()中 l为left缩写，函数表示从左到右遍历
rstrip()中 r为right缩写，函数表示从右边开始遍历