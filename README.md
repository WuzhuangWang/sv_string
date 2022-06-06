# sv_string

A magic systemverilog string extensions package, contains various string operation.

sv_string是针对systemverilog中string操作的扩展库，使用systemverilog编写，无需dpi接口和c文件编译，开箱即用。部分函数接口借鉴python string操作函数接口风格。

## 使用方法

1. 下载sv_string源码, 并加入到环境编译list中;
2. 需要使用时import相应pkg即可: import sv_string_pkg : : *;
3. 使用sv_string操作函数, 如swapcase("abcd").
   如果sv_string_pkg中的函数和其他的pkg中函数重名，在函数名前加pkg作用域即可:
   sv_string_pkg ::swapcase("abcd")

## sv_string操作函数

### 大小写转换

1. string upper(string src)
   将字符串全部转为大写,
   upper("abcd")="ABCD"
2. string lower(string src)
   将字符串全部转为小写,
   lower("ADFE")="adfe"
3. string swapcase(string src)
   将字符串中的大小写字母反转
   swapcase("ab_CD")="AB_cd"
4. string capitalize(string src)
   将字符串的首字母大写
   capitalize("it is done")="It is done"
5. string title(string src)
   将字符串中每个单词的首字母大写
   title("it is done")="It Is Done"
6. bit isupper(string src)
   字符串中的字母全部为大写，则返回1;反之返回0
7. bit islower(string src)
   字符串中的字母全部为小写，则返回1;反之返回0

### 数字识别与提取

1. bit isbin(string src)
   判断字符串是否为二进制数，格式：'b101xxx
2. bit ishex(string src)
   判断字符串是否为十六进制，格式：'h101xxx
3. bit isdec(string src)
   判断字符串是否为十进制数，格式：123...
4. bit isdigital(string src)
   判断字符串是否为一个数字，可能是bin、hex、dec
5. bit[31:0] atobin(string src)
   二进制字符串到数字转换
   atobin("'b1010")=10
6. bit[31:0] atohex(string src)
   十六进制字符串到数字转换
   atohex("'h1F")=31
7. bit[31:0] atodec(string src)
   十进制字符串到数字转换
   atodec("123")=123
8. bit[31:0] atoi(string src)
   数字字符串到数字转换
   atoi("'b1010")=10
   atoi("'h1F")=31
   atoi("123")=123

### 字符串判断,修剪,排序和填充

1. bit isSpace (byte unsigned ch)
   判断字符串是否为空白符
   包含: " ","\n","\t","\v","\f"
2. bit startswith (string src,string m_s)
   字符串src以m_s开头，则返回1；否则返回0
   startswith("abcd","ab")=1|
3. bit endswith (string src,string m_s)
   字符串src以m_s结尾，则返回1；否则返回0
   endswith("abcd","d")=1
4. string lstrip(string src)
   去除字符串开头处的空白符
   lstrip("\n\ta bc")="a bc"
5. string rstrip(string src)
   去除字符串结尾处的空白符
   rstrip("\ta bc\n")="\ta bc"
6. string strip(string src)
   去除字符串两端的空白符
   strip("\ta bc\n")="a bc"
7. string reverse(string src)
   将字符串逆序输出
   reverse("abc")="cba"
8. string zfill(string src,int width,string fill_s="0",align_pos = LEFT)
   使用字符串fill_s将src补齐到指定宽度，支持左补齐、右补齐和两端补齐
   zfill("abc",6)="000abc"

## 字符串定位、分隔和替换

1. int find(string src,string m_s)
   如果src包含m_s字符串，则返回m_s所在的位置，否则返回-1
   find("abcd","b")=1
2. q_int findall(string src,string m_s)
   返回所有的m_s在src中位置队列
   findall("abab","a")={0,2}
3. q_string split(string src,string m_s)
   src字符串按m_s进行分隔，返回分隔后的string队列
   split("abcd","a")='{bcd}
4. q_string splitlines(string src)
   src字符串按换行符进行拆分成多个字符串，返回分隔后的string队列
5. string replace(string src,string old_s,string new_s，int r_cnt=0)
   将src中的old_s字符串替换成new_s,默认全部替换，支持指定替换次数
   replace("it done"," ",",")="it,done"

----
如有问题和疑问，欢迎交流。

技术交流请联系：

公众号：验证芯发现

![验证芯发现](https://gitee.com/cc-hook/picture/raw/master/wechat/weixin.jpg)

---

微信号：cc_hook

![cc_hook](https://gitee.com/cc-hook/picture/raw/master/wechat/微信图片_20220316213415.jpg)