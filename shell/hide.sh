	echo -e "\033[?25l"

	echo -e "\033[?25h"


　echo ^[[[?25l

　　请注意这个转义系列的敲法是，<ctrl-v><escape>[?25l（是字母l不是1）

　　要使光标恢复则

　　echo ^[[[?25h


echo -ne <ctrl+v><ESC>[?25l&<60;&<60;&<60; 隐藏光标
echo -ne <ctrl+v><ESC>[?25h&<60; 显示光标
l,h为字母, <ctrl+v>是按下ctrl键不放,然后按下V, <ESC>就是按一下键盘上的ESC键
在终端回显的情况如下:
echo -ne&<60; ^[[?25l
echo -ne&<60; ^[[?25h
其中^[是用<ctrl+v><ESC>得到的,直接输入^[无效

超级终端里的光标经常意外消失,这是个好办法让它恢复.

更简单一点的方法
echo -e "\033[?25l"  隐藏光标
echo -e "\033[?25h" 显示光标
其实\033(八进制,相当于10进制的27)就是<ctrl+v><ESC>所输入字符的值.

echo -ne "\33[32m" 可以将字符的显示颜色改为绿色 
echo -ne "\33[3;1H" 可以将光标移到第3行第1列处 
具体的摘抄一些如下： 
\33[0m 关闭所有属性 
\33[1m 设置高亮度 
\33[4m 下划线 
\33[5m 闪烁 
\33[7m 反显 
\33[8m 消隐 
\33[30m -- \33[37m 设置前景色 
\33[40m -- \33[47m 设置背景色 
\33[nA 光标上移n行 
\33[nB 光标下移n行 
\33[nC 光标右移n行 
\33[nD 光标左移n行 
\33[y;xH设置光标位置 
\33[2J 清屏 
\33[K 清除从光标到行尾的内容 
\33[s 保存光标位置 
\33[u 恢复光标位置 
\33[?25l 隐藏光标 
\33[?25h 显示光标