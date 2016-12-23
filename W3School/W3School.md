# HTML/CSS

## HTML

### HTML 基础教程

#### HTML 教程

#### HTML 简介

#### HTML 编辑器

#### 基本的 HTML 标签 - 四个实例

##### HTML 标题

\<h1> - \<h6>

##### HTML 段落

\<p>

##### HTML 链接 

 \<a>

##### HTML 图像

\<img>



#### HTML 元素

##### HTML 元素

开始标签常被称为开放标签（opening tag），结束标签常称为闭合标签（closing tag）。

##### 空的 HTML 元素

\<br> 就是没有关闭标签的空元素（\<br> 标签定义换行）。

在 XHTML、XML 以及未来版本的 HTML 中，所有元素都必须被关闭。

在开始标签中添加斜杠，比如 \<br />，是关闭空元素的正确方法，HTML、XHTML 和 XML 都接受这种方式。

##### HTML 提示：使用小写标签

万维网联盟（W3C）在 HTML 4 中*推荐*使用小写，而在未来 (X)HTML 版本中*强制*使用小写。



#### HTML 属性

##### HTML 提示：使用小写属性

##### 始终为属性值加引号

在某些个别的情况下，比如属性值本身就含有双引号，那么您必须使用单引号



#### HTML 标题

##### HTML 标题

注释：浏览器会自动地在标题的前后添加空行。

注释：默认情况下，HTML 会自动地在块级元素前后添加一个额外的空行，比如段落、标题元素前后。

##### HTML 水平线

\<hr /> 标签在 HTML 页面中创建水平线。

hr 元素可用于分隔内容。



#### HTML 段落

##### HTML 段落

注释：浏览器会自动地在段落的前后添加空行。（\<p> 是块级元素）

提示：使用空的段落标记\<p>\</p> 去插入一个空行是个坏习惯。用 \<br /> 标签代替它！（但是不要用 \<br /> 标签去创建列表。

##### HTML 折行

如果您希望在不产生一个新段落的情况下进行换行（新行），请使用 \<br /> 标签



#### HTML 样式

##### 不赞成使用的标签和属性

| 标签                    | 描述          |
| --------------------- | ----------- |
| \<center>             | 定义居中的内容。    |
| \<font> 和 \<basefont> | 定义 HTML 字体。 |
| \<s> 和 \<strike>      | 定义删除线文本     |
| \<u>                  | 定义下划线文本     |
| 属性                    | 描述          |
| align                 | 定义文本的对齐方式   |
| bgcolor               | 定义背景颜色      |
| color                 | 定义文本颜色      |

##### HTML 样式实例 - 背景颜色

background-color 属性为元素定义了背景颜色,style 属性淘汰了“旧的” bgcolor 属性。

##### HTML 样式实例 - 字体、颜色和尺寸

font-family、color 以及 font-size 属性分别定义元素中文本的字体系列、颜色和字体尺寸：

style 属性淘汰了旧的\<font> 标签。

##### HTML 样式实例 - 文本对齐

text-align 属性规定了元素中文本的水平对齐方式 , style 属性淘汰了旧的 "align" 属性。



#### HTML 文本格式化

##### 文本格式化标签

| 标签        | 描述                     |
| --------- | ---------------------- |
| \<b>      | 定义粗体文本。                |
| \<big>    | 定义大号字。                 |
| \<em>     | 定义着重文字。                |
| \<i>      | 定义斜体字。                 |
| \<small>  | 定义小号字。                 |
| \<strong> | 定义加重语气。                |
| \<sub>    | 定义下标字。                 |
| \<sup>    | 定义上标字。                 |
| \<ins>    | 定义插入字。                 |
| \<del>    | 定义删除字。                 |
| \<s>      | *不赞成使用。*使用 \<del> 代替。  |
| \<strike> | *不赞成使用。*使用\<del> 代替。   |
| \<u>      | *不赞成使用。*使用样式（style）代替。 |

##### “计算机输出”标签

| 标签           | 描述                    |
| ------------ | --------------------- |
| \<code>      | 定义计算机代码。              |
| \<kbd>       | 定义键盘码。                |
| \<samp>      | 定义计算机代码样本。            |
| \<tt>        | 定义打字机代码。              |
| \<var>       | 定义变量。                 |
| \<pre>       | 定义预格式文本。              |
| \<listing>   | *不赞成使用。*使用 \<pre> 代替。 |
| \<plaintext> | *不赞成使用。*使用 \<pre> 代替。 |
| \<xmp>       | *不赞成使用。*使用 \<pre> 代替。 |

##### 引用、引用和术语定义

| 标签            | 描述        |
| ------------- | --------- |
| \<abbr>       | 定义缩写。     |
| \<acronym>    | 定义首字母缩写。  |
| \<address>    | 定义地址。     |
| \<bdo>        | 定义文字方向。   |
| \<blockquote> | 定义长的引用。   |
| \<q>          | 定义短的引用语。  |
| \<cite>       | 定义引用、引证。  |
| \<dfn>        | 定义一个定义项目。 |



#### HTML 引用

##### HTML \<q> 用于短的引用

- 浏览器通常会为 \<q> 元素包围*引号*。

##### 用于长引用的 HTML \<blockquote>

- 浏览器通常会对 \<blockquote> 元素进行*缩进*处理。

##### 用于缩略词的 HTML \<abbr>

- 对缩写进行标记能够为浏览器、翻译系统以及搜索引擎提供有用的信息。

##### 用于定义的 HTML \<dfn>

HTML  \<dfn>元素定义项目或缩写的定义。\<dfn> 的用法，按照 HTML5 标准中的描述，有点复杂：

1. 如果设置了 \<dfn> 元素的 title 属性，则定义项目

   ```
   <p><dfn title="World Health Organization">WHO</dfn> 成立于 1948 年。</p>
   ```

2. 如果 \<dfn> 元素包含具有标题的 \<abbr> 元素，则 title 定义项目

   ```
   <p><dfn><abbr title="World Health Organization">WHO</abbr></dfn> 成立于 1948 年。</p>
   ```

3. 否则，\<dfn> 文本内容即是项目，并且父元素包含定义。

   ```
   <p><dfn>WHO</dfn> World Health Organization 成立于 1948 年。</p>
   ```


注释：如果您希望简而化之，请使用第一条，或使用 \<abbr> 代替。

##### 用于联系信息的 HTML \<address>

- HTML \<address>元素定义文档或文章的联系信息（作者/拥有者）。
- 此元素通常以*斜体*显示。大多数浏览器会在此元素前后添加折行。

##### 用于著作标题的 HTML \<cite>

- 浏览器通常会以斜体显示 \<cite> 元素。

##### 用于双向重写的 HTML \<bdo>

- 如果您的浏览器支持 bdo，则文本将从左向左进行书写

  ​

#### HTML 计算机代码元素

##### HTML 计算机代码格式

- 通常，HTML 使用**可变** 的字母尺寸，以及可变的字母间距。


- 在显示**计算机代码**示例时，并不需要如此。**\<kbd>**,**\<samp>**,**\<code>** 元素全都支持固定的字母尺寸和间距。


- \<code> 元素*不保留*多余的*空格*和*折行* , 如需解决该问题，您必须在 \<pre> 元素中包围代码

| 标签      | 描述        |
| ------- | --------- |
| \<code> | 定义计算机代码文本 |
| \<kbd>  | 定义键盘文本    |
| \<samp> | 定义计算机代码示例 |
| \<var>  | 定义数学变量    |
| \<pre>  | 定义预格式化文本  |



#### HTML 注释

##### 条件注释

- 条件注释定义只有 Internet Explorer 执行的 HTML 标签。

```
<!--[if IE 8]>
    .... some HTML here ....
<![endif]-->
```

##### 软件程序标签

- 各种 HTML 软件程序也能够生成 HTML 注释。


- 例如 <!--webbot bot--> 标签会被包围在由 FrontPage 和 Expression Web 创建的 HTML 注释中。


- 作为一项规则，这些标签的存在，有助于对创建这些标签的软件的支持。



#### HTML CSS

##### 外部样式表

- 当样式需要被应用到很多页面的时候，外部样式表将是理想的选择。

##### 内部样式表

- 当单个文件需要特别样式时，就可以使用内部样式表。你可以在 head 部分通过\<style> 标签定义内部样式表。

##### 内联样式

- 当特殊的样式需要应用到个别元素时，就可以使用内联样式。使用内联样式的方法是在相关的标签中使用样式属性。样式属性可以包含任何 CSS 属性。



#### HTML 链接

##### HTML 超链接（链接）

有两种使用 \<a> 标签的方式：

1. 通过使用 href 属性 - 创建指向另一个文档的链接
2. 通过使用 name 属性 - 创建文档内的书签

##### HTML 链接语法

- 开始标签和结束标签之间的文字被作为超级链接来显示。"链接文本" 不必一定是文本。图片或其他 HTML 元素都可以成为链接。

```
<a href="url">Link text</a>
```

##### HTML 链接 - target 属性

- 使用 Target 属性，你可以定义被链接的文档在何处显示。

  下面的这行会在新窗口打开文档：

```
<a href="http://www.w3school.com.cn/" target="_blank">Visit W3School!</a>
```

##### HTML 链接 - name 属性

- name 属性规定锚（anchor）的名称。


- 可以使用 name 属性创建 HTML 页面中的书签。


- 书签不会以任何特殊方式显示，它对读者是不可见的。


- 当使用命名锚（named anchors）时，我们可以创建直接跳至该命名锚（比如页面中某个小节）的链接，这样使用者就无需不停地滚动页面来寻找他们需要的信息了。

###### 命名锚的语法：

```
<a name="label">锚（显示在页面上的文本）</a>
```

- 提示：您可以使用 id 属性来替代 name 属性，命名锚同样有效。


- 可以将 # 符号和锚名称添加到 URL 的末端，就可以直接链接到 tips 这个命名锚了。

##### 基本的注意事项-有用的提示

- 请始终将正斜杠添加到子文件夹。否则可能会向服务器产生两次 HTTP 请求。这是因为服务器会添加正斜杠到这个地址，然后创建一个新的请求
- 提示：命名锚经常用于在大型文档开始位置上创建目录。可以为每个章节赋予一个命名锚，然后把链接到这些锚的链接放到文档的上部。
- 提示：假如浏览器找不到已定义的命名锚，那么就会定位到文档的顶端。不会有错误发生。

##### 更多实例

##### [在新的浏览器窗口打开链接](http://www.w3school.com.cn/tiy/t.asp?f=html_link_target)

```
本例演示如何在新窗口打开一个页面，这样的话访问者就无需离开你的站点了。
```

##### [链接到同一个页面的不同位置](http://www.w3school.com.cn/tiy/t.asp?f=html_link_locations)

    本例演示如何使用链接跳转至文档的另一个部分
##### [跳出框架](http://www.w3school.com.cn/tiy/t.asp?f=html_frame_getfree)

    本例演示如何跳出框架，假如你的页面被固定在框架之内。
##### [创建电子邮件链接](http://www.w3school.com.cn/tiy/t.asp?f=html_mailto)

    本例演示如何链接到一个邮件。（本例在安装邮件客户端程序后才能工作。）
##### [创建电子邮件链接 2](http://www.w3school.com.cn/tiy/t.asp?f=html_mailto2)

    本例演示更加复杂的邮件链接。


#### HTML 图像

##### 图像标签（\<img>）和源属性（Src）

- \<img> 是空标签，意思是说，它只包含属性，并且没有闭合标签。

##### 替换文本属性（Alt）

- alt 属性用来为图像定义一串预备的可替换的文本。替换文本属性的值是用户定义的。
- 在浏览器无法载入图像时，替换文本属性告诉读者她们失去的信息。此时，浏览器将显示这个替代性的文本而不是图像。为页面上的图像都加上替换文本属性是个好习惯，这样有助于更好的显示信息，并且对于那些使用纯文本浏览器的人来说是非常有用的。

##### 更多实例

- [背景图片](http://www.w3school.com.cn/tiy/t.asp?f=html_backgroundimage)

  本例演示如何向 HTML 页面添加背景图片。

- [排列图片](http://www.w3school.com.cn/tiy/t.asp?f=html_image_align)

  本例演示如何在文字中排列图像。

- [浮动图像](http://www.w3school.com.cn/tiy/t.asp?f=html_image_float)

  本例演示如何使图片浮动至段落的左边或右边。

- [调整图像尺寸](http://www.w3school.com.cn/tiy/t.asp?f=html_image_size)

  本例演示如何将图片调整到不同的尺寸。

- [为图片显示替换文本](http://www.w3school.com.cn/tiy/t.asp?f=html_image_alt)

  本例演示如何为图片显示替换文本。在浏览器无法载入图像时，替换文本属性告诉读者们失去的信息。为页面上的图像都加上替换文本属性是个好习惯。

- [制作图像链接](http://www.w3school.com.cn/tiy/t.asp?f=html_image_link)

  本例演示如何将图像作为一个链接使用。

- [创建图像映射](http://www.w3school.com.cn/tiy/t.asp?f=html_areamap)

  本例显示如何创建带有可供点击区域的图像地图。其中的每个区域都是一个超级链接。

- [把图像转换为图像映射](http://www.w3school.com.cn/tiy/t.asp?f=html_ismap)

  本例显示如何把一幅普通的图像设置为图像映射。

##### 图像标签

| 标签      | 描述             |
| ------- | -------------- |
| \<img>  | 定义图像。          |
| \<map>  | 定义图像地图。        |
| \<area> | 定义图像地图中的可点击区域。 |



#### HTML 表格

##### 表格和边框属性

- 如果不定义边框属性，表格将不显示边框。

```
<table border="1">
```

##### 表格的表头

- 表格的表头使用 \<th> 标签进行定义。


- 大多数浏览器会把表头显示为粗体居中的文本

##### 表格中的空单元格

- 在一些浏览器中，没有内容的表格单元显示得不太好。如果某个单元格是空的（没有内容），浏览器可能无法显示出这个单元格的边框。


- 注意：为了避免这种情况，在空单元格中添加一个空格占位符，就可以将边框显示出来。

```
<td>&nbsp;</td>
```

##### 更多实例

- [没有边框的表格](http://www.w3school.com.cn/tiy/t.asp?f=html_tables2)

  本例演示一个没有边框的表格。

- [表格中的表头(Heading)](http://www.w3school.com.cn/tiy/t.asp?f=html_table_headers)

  本例演示如何显示表格表头。

- [空单元格](http://www.w3school.com.cn/tiy/t.asp?f=html_table_nbsp)

  本例展示如何使用 "&nbsp;" 处理没有内容的单元格。

- [带有标题的表格](http://www.w3school.com.cn/tiy/t.asp?f=html_tables3)

  本例演示一个带标题 (caption) 的表格

- [跨行或跨列的表格单元格](http://www.w3school.com.cn/tiy/t.asp?f=html_table_span)

  本例演示如何定义跨行或跨列的表格单元格。

- [表格内的标签](http://www.w3school.com.cn/tiy/t.asp?f=html_table_elements)

  本例演示如何显示在不同的元素内显示元素。

- [单元格边距(Cell padding)](http://www.w3school.com.cn/tiy/t.asp?f=html_table_cellpadding)

  本例演示如何使用 Cell padding 来创建单元格内容与其边框之间的空白。

- [单元格间距(Cell spacing)](http://www.w3school.com.cn/tiy/t.asp?f=html_table_cellspacing)

  本例演示如何使用 Cell spacing 增加单元格之间的距离。

- [向表格添加背景颜色或背景图像](http://www.w3school.com.cn/tiy/t.asp?f=html_table_background)

  本例演示如何向表格添加背景。

- [向表格单元添加背景颜色或者背景图像](http://www.w3school.com.cn/tiy/t.asp?f=html_table_cellbackground)

  本例演示如何向一个或者更多表格单元添加背景。

- [在表格单元中排列内容](http://www.w3school.com.cn/tiy/t.asp?f=html_table_align)

  本例演示如何使用 "align" 属性排列单元格内容,以便创建一个美观的表格。

- [框架(frame)属性](http://www.w3school.com.cn/tiy/t.asp?f=html_table_frame)

  本例演示如何使用 "frame" 属性来控制围绕表格的边框。

##### 表格标签

| 表格          | 描述          |
| ----------- | ----------- |
| \<table>    | 定义表格        |
| \<caption>  | 定义表格标题。     |
| \<th>       | 定义表格的表头。    |
| \<tr>       | 定义表格的行。     |
| \<td>       | 定义表格单元。     |
| \<thead>    | 定义表格的页眉。    |
| \<tbody>    | 定义表格的主体。    |
| \<tfoot>    | 定义表格的页脚。    |
| \<col>      | 定义用于表格列的属性。 |
| \<colgroup> | 定义表格列的组。    |



#### HTML 列表

##### 定义列表

- 自定义列表不仅仅是一列项目，而是项目及其注释的组合。


- 自定义列表以 \<dl> 标签开始。每个自定义列表项以 \<dt> 开始。每个自定义列表项的定义以 \<dd> 开始。
- 定义列表的列表项内部可以使用段落、换行符、图片、链接以及其他列表等等。

##### 列表标签

| 标签      | 描述                |
| ------- | ----------------- |
| \<ol>   | 定义有序列表。           |
| \<ul>   | 定义无序列表。           |
| \<li>   | 定义列表项。            |
| \<dl>   | 定义定义列表。           |
| \<dt>   | 定义定义项目。           |
| \<dd>   | 定义定义的描述。          |
| \<dir>  | 已废弃。使用 \<ul> 代替它。 |
| \<menu> | 已废弃。使用 \<ul> 代替它。 |



#### HTML \<div> 和 \<span>

##### HTML 块元素

- 大多数 HTML 元素被定义为块级元素或内联元素。
- 块级元素在浏览器显示时，通常会以新行来开始（和结束）。

##### HTML 内联元素

- 内联元素在显示时通常不会以新行开始。

##### HTML \<span> 元素

- HTML \<span> 元素是内联元素，可用作文本的容器。
- \<span> 元素也没有特定的含义。



#### HTML 类

#### HTML 布局

##### 使用 HTML5 的网站布局

| header  | 定义文档或节的页眉        |
| ------- | ---------------- |
| nav     | 定义导航链接的容器        |
| section | 定义文档中的节          |
| article | 定义独立的自包含文章       |
| aside   | 定义内容之外的内容（比如侧栏）  |
| footer  | 定义文档或节的页脚        |
| details | 定义额外的细节          |
| summary | 定义 details 元素的标题 |



#### HTML 响应式 Web 设计

##### 什么是响应式 Web 设计？

- RWD 指的是响应式 Web 设计（Responsive Web Design）
- RWD 能够以可变尺寸传递网页
- RWD 对于平板和移动设备是必需的

##### 使用 Bootstrap

- Bootstrap 是最流行的开发响应式 web 的 HTML, CSS, 和 JS 框架。



#### HTML 框架

##### 框架

通过使用框架，你可以在同一个浏览器窗口中显示不止一个页面。每份HTML文档称为一个框架，并且每个框架都独立于其他的框架。

使用框架的坏处：

- 开发人员必须同时跟踪更多的HTML文档
- 很难打印整张页面

##### 框架结构标签（\<frameset>）

- 框架结构标签（）定义如何将窗口分割为框架 
- 每个 frameset 定义了一系列行*或* 列 
- rows/columns 的值规定了每行或每列占据屏幕的面积 

注：frameset 标签也被某些文章和书籍译为框架集。

##### 框架标签（Frame）

Frame 标签定义了放置在每个框架中的 HTML 文档。

##### 基本的注意事项 - 有用的提示：

- 假如一个框架有可见边框，用户可以拖动边框来改变它的大小。为了避免这种情况发生，可以在 \<frame> 标签中加入：noresize="noresize"。


- 为不支持框架的浏览器添加 \<noframes> 标签。


- 重要提示：不能将 \<body>\</body> 标签与 \<frameset>\</frameset> 标签同时使用！不过，假如你添加包含一段文本的 \<noframes> 标签，就必须将这段文字嵌套于 \<body>\</body> 标签内。

##### 更多实例

- [如何使用 \<noframes>标签](http://www.w3school.com.cn/tiy/t.asp?f=html_noframes)

- [混合框架结构](http://www.w3school.com.cn/tiy/t.asp?f=html_frame_mix)

- [含有 noresize="noresize" 属性的框架结构](http://www.w3school.com.cn/tiy/t.asp?f=html_frame_noresize)

- [导航框架](http://www.w3school.com.cn/tiy/t.asp?f=html_frame_navigation)

- [内联框架](http://www.w3school.com.cn/tiy/t.asp?f=html_iframe)

- [跳转至框架内的一个指定的节](http://www.w3school.com.cn/tiy/t.asp?f=html_frame_jump)

- [使用框架导航跳转至指定的节](http://www.w3school.com.cn/tiy/t.asp?f=html_frame_navigation2)

  ​

#### HTML Iframe

##### 添加 iframe 的语法

```
<iframe src="URL"></iframe>
```

##### Iframe - 设置高度和宽度

- height 和 width 属性用于规定 iframe 的高度和宽度。
- 属性值的默认单位是像素，但也可以用百分比来设定（比如 "80%"）。

##### Iframe - 删除边框

- frameborder 属性规定是否显示 iframe 周围的边框。
- 设置属性值为 "0" 就可以移除边框：

##### 使用 iframe 作为链接的目标

- iframe 可用作链接的目标（target）。
- 链接的 target 属性必须引用 iframe 的 name 属性



#### HTML 背景

##### 背景（Backgrounds）

###### 背景颜色（Bgcolor）

- 背景颜色属性将背景设置为某种颜色。属性值可以是十六进制数、RGB 值或颜色名。

###### 背景（Background）

- 背景属性将背景设置为图像。属性值为图像的URL。如果图像尺寸小于浏览器窗口，那么图像将在整个浏览器窗口进行复制。

提示：如果你打算使用背景图片，你需要紧记一下几点：

- 背景图像是否增加了页面的加载时间。小贴士：图像文件不应超过 10k。
- 背景图像是否与页面中的其他图象搭配良好。
- 背景图像是否与页面中的文字颜色搭配良好。
- 图像在页面中平铺后，看上去还可以吗？
- 对文字的注意力被背景图像喧宾夺主了吗？

##### 基本的注意事项 - 有用的提示：

- \<body> 标签中的背景颜色（bgcolor）、背景（background）和文本（text）属性在最新的 HTML 标准（HTML4 和 XHTML）中已被废弃。W3C 在他们的推荐标准中已删除这些属性。
- 应该使用层叠样式表（CSS）来定义 HTML 元素的布局和显示属性。



#### HTML 脚本

##### HTML script 元素

- \<script> 标签用于定义客户端脚本，比如 JavaScript。
- script 元素既可包含脚本语句，也可通过 src 属性指向外部脚本文件。
- 必需的 type 属性规定脚本的 MIME 类型。
- JavaScript 最常用于图片操作、表单验证以及内容动态更新。

##### \<noscript> 标签

- \<noscript> 标签提供无法使用脚本时的替代内容，比方在浏览器禁用脚本时，或浏览器不支持客户端脚本时。
- noscript 元素可包含普通 HTML 页面的 body 元素中能够找到的所有元素。
- 只有在浏览器不支持脚本或者禁用脚本时，才会显示 noscript 元素中的内容：

##### 如何应付老式的浏览器

- 如果浏览器压根没法识别 \<script> 标签，那么 \<script> 标签所包含的内容将以文本方式显示在页面上。为了避免这种情况发生，你应该将脚本隐藏在注释标签当中。那些老的浏览器（无法识别 \<script> 标签的浏览器）将忽略这些注释，所以不会将标签的内容显示到页面上。而那些新的浏览器将读懂这些脚本并执行它们，即使代码被嵌套在注释标签内。



#### HTML 头部元素

##### 实例

- [文档的标题](http://www.w3school.com.cn/tiy/t.asp?f=html_title)
- [所有链接一个目标](http://www.w3school.com.cn/tiy/t.asp?f=html_base)
- [文档描述](http://www.w3school.com.cn/tiy/t.asp?f=html_meta)
- [文档关键词](http://www.w3school.com.cn/tiy/t.asp?f=html_keywords)
- [重定向用户](http://www.w3school.com.cn/tiy/t.asp?f=html_redirect)

##### HTML \<head> 元素

- \<head> 元素是所有头部元素的容器。\<head> 内的元素可包含脚本，指示浏览器在何处可以找到样式表，提供元信息，等等。
- 以下标签都可以添加到 head 部分：\<title>、\<base>、\<link>、\<meta>、\<script> 以及 \<style>。

##### HTML \<title> 元素

title 元素能够：

- 定义浏览器工具栏中的标题
- 提供页面被添加到收藏夹时显示的标题
- 显示在搜索引擎结果中的页面标题

##### HTML \<base> 元素

- \<base> 标签为页面上的所有链接规定默认地址或默认目标（target）

##### HTML \<link> 元素

- \<link> 标签定义文档与外部资源之间的关系。
- \<link> 标签最常用于连接样式表

##### HTML \<style> 元素

\<style> 标签用于为 HTML 文档定义样式信息。

##### HTML \<meta> 元素

- 元数据（metadata）是关于数据的信息。
- \<meta> 标签提供关于 HTML 文档的元数据。元数据不会显示在页面上，但是对于机器是可读的。
- 典型的情况是，meta 元素被用于规定页面的描述、关键词、文档的作者、最后修改时间以及其他元数据。
- \<meta> 标签始终位于 head 元素中。
- 元数据可用于浏览器（如何显示内容或重新加载页面），搜索引擎（关键词），或其他 web 服务。

###### 针对搜索引擎的关键词

- 一些搜索引擎会利用 meta 元素的 name 和 content 属性来索引您的页面。

##### HTML \<script> 元素

- \<script> 标签用于定义客户端脚本，比如 JavaScript。



#### HTML 字符实体

##### **HTML 中的预留字符必须被替换为字符实体。**

##### HTML 实体

- 如果希望正确地显示预留字符，我们必须在 HTML 源代码中使用字符实体

- 字符实体类似这样：

  ```
  &entity_name;

  或者

  &#entity_number;
  ```

  如需显示小于号，我们必须这样写：

  `&lt;`  或  `&#60;`

  提示：使用实体名而不是数字的好处是，名称易于记忆。不过坏处是，浏览器也许并不支持所有实体名称（对实体数字的支持却很好）。

##### 不间断空格（non-breaking space）

- HTML 中的常用字符实体是不间断空格(`&nbsp;`)。


- 浏览器总是会截短 HTML 页面中的空格。如果您在文本中写 10 个空格，在显示该页面之前，浏览器会删除它们中的 9 个。如需在页面中增加空格的数量，您需要使用   字符实体。

##### HTML 中有用的字符实体

注释：实体名称对大小写敏感！

| 显示结果 | 描述   | 实体名称             | 实体编号      |
| ---- | ---- | ---------------- | --------- |
|      | 空格   | `&nbsp;`         | `&#160;`  |
| <    | 小于号  | `&lt;`           | `&#60;`   |
| >    | 大于号  | `&gt;`           | `&#62;`>  |
| &    | 和号   | `&amp;`          | `&#38;`   |
| "    | 引号   | `&quot;`         | `&#34;`   |
| '    | 撇号   | `&apos;` (IE不支持) | `&#39;`   |
| ￠    | 分    | `&cent;`         | `&#162;`  |
| £    | 镑    | `&pound;`        | `&#163;`  |
| ¥    | 日圆   | `&yen;`          | `&#165;`  |
| €    | 欧元   | `&euro;`         | `&#8364;` |
| §    | 小节   | `&sect;`         | `&#167;`  |
| ©    | 版权   | `&copy;`         | `&#169;`  |
| ®    | 注册商标 | `&reg;`          | `&#174;`  |
| ™    | 商标   | `&trade;`        | `&#8482;` |
| ×    | 乘号   | `&times;`        | `&#215;`  |
| ÷    | 除号   | `&divide;`       | `&#247;`  |



#### HTML 统一资源定位器

##### URL - Uniform Resource Locator

```
scheme://host.domain:port/path/filename
```

解释：

- scheme - 定义因特网服务的类型。最常见的类型是 http
- host - 定义域主机（http 的默认主机是 www）
- domain - 定义因特网域名，比如 w3school.com.cn
- :port - 定义主机上的端口号（http 的默认端口号是 80）
- path - 定义服务器上的路径（如果省略，则文档必须位于网站的根目录中）。
- filename - 定义文档/资源的名称

##### URL Schemes

| Scheme | 访问        | 用于...                  |
| ------ | --------- | ---------------------- |
| http   | 超文本传输协议   | 以 http:// 开头的普通网页。不加密。 |
| https  | 安全超文本传输协议 | 安全网页。加密所有信息交换。         |
| ftp    | 文件传输协议    | 用于将文件下载或上传至网站。         |
| file   |           | 您计算机上的文件。              |



#### HTML URL 字符编码

##### URL 编码

- URL 只能使用ASCII字符集来通过因特网进行发送。
- URL 编码使用 "%" 其后跟随两位的十六进制数来替换非 ASCII 字符。
- URL 不能包含空格。URL 编码通常使用 + 来替换空格。



#### HTML Web Server

##### 托管自己的网站

- ###### 硬件支出

  如果要运行“真正”的网站，您不得不购买强大的服务器硬件。不要指望低价的 PC 能够应付这些工作。您还需要稳定的（一天 24 小时）高速连接。

- ###### 软件支出

  请记住，服务器授权通常比客户端授权更昂贵。同时请注意，服务器授权也许有用户数量限制。

- ###### 人工费

  不要指望低廉的人工费用。您必须安装自己的硬件和软件。您同时要处理漏洞和病毒，以确保您的服务器时刻正常地运行于一个“任何事都可能发生”的环境中。

##### 使用因特网服务提供商（ISP）

把网站存放到由 ISP 提供的服务器上优势:

- ###### 连接速度

  大多数 ISP 都拥有连接因特网的高速连接。

- ###### 强大的硬件

  ISP 的 web 服务器通常强大到能够由若干网站分享资源。您还要看一下 ISP 是否提供高效的负载平衡，以及必要的备份服务器。

- ###### 安全性和可靠性

  ISP 是网站托管方面的专家。他们应该提供 99% 以上的在线时间，最新的软件补丁，以及最好的病毒防护。

##### 选择 ISP 时的注意事项

- ###### 24 小时支持

  确保 ISP 提供 24 小时支持。不要使自己置于无法解决严重问题的尴尬境地，同时还必须等待第二个工作日。如果您不希望支付长途电话费，那么免费电话服务也是必要的。

- ###### 每日备份

  确保 ISP 会执行每日备份的例行工作，否则您有可能损失有价值的数据。

- ###### 流量

  研究一下 ISP 的流量限制。如果出现由于网站受欢迎而激增的不可预期的访问量，那么您要确保不会因此支付额外费用。

- ###### 带宽或内容限制

  研究一下 ISP 的带宽和内容限制。如果您计划发布图片或播出视频或音频，请确保您有此权限。

- ###### E-mail 功能

  请确保 ISP 支持您需要的 e-mail 功能。

- ###### 数据库访问

  如果您计划使用网站数据库中的数据，那么请确保您的 ISP 支持您需要的数据库访问。



#### HTML 颜色

##### 颜色值

- 颜色由一个十六进制符号来定义，这个符号由红色、绿色和蓝色的值组成（RGB）。
- 每种颜色的最小值是0（十六进制：#00）。最大值是255（十六进制：#FF）。

##### 颜色名

- 大多数的浏览器都支持颜色名集合。
- 提示：仅仅有 16 种颜色名被 W3C 的 HTML4.0 标准所支持。它们是：aqua, black, blue, fuchsia, gray, green, lime, maroon, navy, olive, purple, red, silver, teal, white, yellow。
- 如果需要使用其它的颜色，需要使用十六进制的颜色值。

##### Web安全色

- 数年以前，当大多数计算机仅支持 256 种颜色的时候，一系列 216 种 Web 安全色作为 Web 标准被建议使用。其中的原因是，微软和 Mac 操作系统使用了 40 种不同的保留的固定系统颜色（双方大约各使用 20 种）。



#### HTML 颜色名

##### 颜色名列表



#### HTML <!DOCTYPE>

##### <!DOCTYPE> 声明

- HTML 也有多个不同的版本，只有完全明白页面中使用的确切 HTML 版本，浏览器才能完全正确地显示出 HTML 页面。这就是 <!DOCTYPE> 的用处。
- <!DOCTYPE> 不是 HTML 标签。它为浏览器提供一项信息（声明），即 HTML 是用什么版本编写的。

##### 常用的声明

###### HTML5

```
<!DOCTYPE html>
```

###### HTML 4.01

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

```

###### XHTML 1.0

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
```



#### HTML 4.01 快速参考



### HTML XHTML

#### XHTML 简介

##### **XHTML 是以 XML 格式编写的 HTML。**

##### 什么是 XHTML？

- XHTML 指的是可扩展超文本标记语言
- XHTML 与 HTML 4.01 几乎是相同的
- XHTML 是更严格更纯净的 HTML 版本
- XHTML 是以 XML 应用的方式定义的 HTML
- XHTML 是2001年1月发布的 W3C 推荐标准
- XHTML 得到所有主流浏览器的支持

##### 为什么使用 XHTML？

与 HTML 相比最重要的区别：

###### 文档结构

- XHTML DOCTYPE 是*强制性的*
- \<html> 中的 XML namespace 属性是*强制性的*
- \<html>、\<head>、\<title> 以及 \<body> 也是*强制性的*

###### 元素语法

- XHTML 元素必须*正确嵌套*
- XHTML 元素必须始终*关闭*
- XHTML 元素必须*小写*
- XHTML 文档必须有*一个根元素*

###### 属性语法

- XHTML 属性必须使用*小写*
- XHTML 属性值必须用*引号包围*
- XHTML 属性最小化也是*禁止的*

###### 如何从 HTML 转换到 XHTML

1. 向每张页面的第一行添加 XHTML <!DOCTYPE>
2. 向每张页面的 html 元素添加 xmlns 属性
3. 把所有元素名改为小写
4. 关闭所有空元素
5. 把所有属性名改为小写
6. 为所有属性值加引号



#### XHTML - 元素

**XHTML 元素是以 XML 格式编写的 HTML 元素。**

##### XHTML 元素 - 语法规则

- XHTML 元素必须*正确嵌套*
- XHTML 元素必须始终*关闭*
- XHTML 元素必须*小写*
- XHTML 文档必须有*一个根元素*



#### XHTML - 属性

##### **XHTML 属性是以 XML 格式编写的 HTML 属性。**

##### XHTML 属性 - 语法规则

- XHTML 属性必须使用*小写*
- XHTML 属性值必须用*引号包围*
- XHTML 属性最小化(简写)也是*禁止的*



### HTML 表单

#### HTML 表单

##### **HTML 表单用于搜集不同类型的用户输入。**

##### \<form> 元素

- HTML 表单用于收集用户输入。

##### HTML 表单包含*表单元素*。

- 表单元素指的是不同类型的 input 元素、复选框、单选按钮、提交按钮等等。

###### \<input> 元素

\<input> 元素有很多形态，根据不同的 *type* 属性。

| 类型     | 描述                 |
| ------ | ------------------ |
| text   | 定义常规文本输入。          |
| radio  | 定义单选按钮输入（选择多个选择之一） |
| submit | 定义提交按钮（提交表单）       |

##### 提交按钮

- 表单处理程序通常是包含用来处理输入数据的脚本的服务器页面。
- 表单处理程序在表单的 *action* 属性中指定

##### Action 属性

- *action 属性*定义在提交表单时执行的动作。
- 通常，表单会被提交到 web 服务器上的网页。
- 如果省略 action 属性，则 action 会被设置为当前页面。

##### Method 属性

- *method 属性*规定在提交表单时所用的 HTTP 方法（*GET* 或 *POST*）

##### 何时使用 GET？

- 如果表单正在更新数据，或者包含敏感信息（例如密码）。
- POST 的安全性更加，因为在页面地址栏中被提交的数据是不可见的。

##### Name 属性

- 如果要正确地被提交，每个输入字段必须设置一个 name 属性。

##### 用 \<fieldset> 组合表单数据

-  \<fieldset> 元素组合表单中的相关数据
-  \<legend>元素为 \<fieldset> 元素定义标题。

##### HTML Form 属性

| 属性             | 描述                                       |
| -------------- | ---------------------------------------- |
| accept-charset | 规定在被提交表单中使用的字符集（默认：页面字符集）。               |
| action         | 规定向何处提交表单的地址（URL）（提交页面）。                 |
| autocomplete   | 规定浏览器应该自动完成表单（默认：开启）。                    |
| enctype        | 规定被提交数据的编码（默认：url-encoded）。              |
| method         | 规定在提交表单时所用的 HTTP 方法（默认：GET）。             |
| name           | 规定识别表单的名称（对于 DOM 使用：document.forms.name）。 |
| novalidate     | 规定浏览器不验证表单。                              |
| target         | 规定 action 属性中地址的目标（默认：_self）。            |



#### HTML 表单元素

##### \<input> 元素

##### \<select> 元素（下拉列表）

- \<option>元素定义待选择的选项。
- 列表通常会把首个选项显示为被选选项。
- 您能够通过添加 selected 属性来定义预定义选项。

##### \<textarea> 元素

- \<textarea> 元素元素定义多行输入字段（*文本域*）

##### HTML5 表单元素

HTML5 增加了如下表单元素：

- \<datalist>
- \<keygen>
- \<output>

注释：默认地，浏览器不会显示未知元素。新元素不会破坏您的页面。

##### HTML5 \<datalist> 元素

 \<datalist>元素为 \<input> 元素规定预定义选项列表。

用户会在他们输入数据时看到预定义选项的下拉列表。

\<input> 元素的 *list* 属性必须引用 \<datalist> 元素的 *id* 属性。



#### HTML 输入类型

##### 输入类型：text

- \<input type="text">定义供*文本输入*的单行输入字段

##### 输入类型：password

- *\<input type="password">定义*密码字段*


- 注释：password 字段中的字符会被做掩码处理（显示为星号或实心圆）。

##### 输入类型：submit

- \<input type="submit">定义*提交 *表单数据至*表单处理程序*的按钮。
- 表单处理程序（form-handler）通常是包含处理输入数据的脚本的服务器页面。
- 在表单的 action 属性中规定表单处理程序（form-handler）
- 如果省略了提交按钮的 value 属性，那么该按钮将获得默认文本

##### Input Type: radio

- \<input type="radio"> 定义单选按钮

##### Input Type: checkbox

- \<input type="checkbox"> 定义复选框。

##### Input Type: button

- \<input type="button">定义*按钮*。

##### HTML5 输入类型

HTML5 增加了多个新的输入类型：

- color
- date
- datetime
- datetime-local
- email
- month
- number
- range
- search
- tel
- time
- url
- week

注释：老式 web 浏览器不支持的输入类型，会被视为输入类型 text。

##### 输入类型：number

- \<input type="number">用于应该包含数字值的输入字段。
- 您能够对数字做出限制。
- 根据浏览器支持，限制可应用到输入字段。

###### 输入限制

这里列出了一些常用的输入限制（其中一些是 HTML5 中新增的）：

| 属性        | 描述                |
| --------- | ----------------- |
| disabled  | 规定输入字段应该被禁用。      |
| max       | 规定输入字段的最大值。       |
| maxlength | 规定输入字段的最大字符数。     |
| min       | 规定输入字段的最小值。       |
| pattern   | 规定通过其检查输入值的正则表达式。 |
| readonly  | 规定输入字段为只读（无法修改）。  |
| required  | 规定输入字段是必需的（必需填写）。 |
| size      | 规定输入字段的宽度（以字符计）。  |
| step      | 规定输入字段的合法数字间隔。    |
| value     | 规定输入字段的默认值。       |

##### 输入类型：date

- \<input type="date">用于应该包含日期的输入字段。
- 根据浏览器支持，日期选择器会出现输入字段中。
- 可以向输入添加限制

##### 输入类型：color

- \<input type="color">用于应该包含颜色的输入字段。
- 根据浏览器支持，颜色选择器会出现输入字段中。

##### 输入类型：range

- \<input type="range">用于应该包含一定范围内的值的输入字段。
- 根据浏览器支持，输入字段能够显示为滑块控件。
- 您能够使用如下属性来规定限制：min、max、step、value。

##### 输入类型：month

- \<input type="month">允许用户选择月份和年份。
- 根据浏览器支持，日期选择器会出现输入字段中。

##### 输入类型：week

- \<input type="week">允许用户选择周和年。
- 根据浏览器支持，日期选择器会出现输入字段中。

##### 输入类型：time

- \<input type="time">允许用户选择时间（无时区）。

- 根据浏览器支持，时间选择器会出现输入字段中。


##### 输入类型：datetime

- \<input type="datetime"> 允许用户选择日期和时间（有时区）。

- 根据浏览器支持，日期选择器会出现输入字段中。


##### 输入类型：datetime-local

- \<input type="datetime-local"> 允许用户选择日期和时间（无时区）。

- 根据浏览器支持，日期选择器会出现输入字段中。


##### 输入类型：email

- \<input type="email"> 用于应该包含电子邮件地址的输入字段。

- 根据浏览器支持，能够在被提交时自动对电子邮件地址进行验证。



- 某些智能手机会识别 email 类型，并在键盘增加 ".com" 以匹配电子邮件输入。


##### 输入类型：search

- \<input type="search"> 用于搜索字段（搜索字段的表现类似常规文本字段）。


##### 输入类型：tel

- \<input type="tel"> 用于应该包含电话号码的输入字段。

- 目前只有 Safari 8 支持 tel 类型。


##### 输入类型：url

- \<input type="week">用于应该包含 URL 地址的输入字段。

- 根据浏览器支持，在提交时能够自动验证 url 字段。

- 某些智能手机识别 url 类型，并向键盘添加 ".com" 以匹配 url 输入。

  ​

#### HTML Input 属性

##### value 属性

- *value* 属性规定输入字段的初始值

##### readonly 属性

- *readonly* 属性规定输入字段为只读（不能修改）
- readonly 属性不需要值。它等同于 readonly="readonly"。

##### disabled 属性

- *disabled* 属性规定输入字段是禁用的。
- 被禁用的元素是不可用和不可点击的。
- 被禁用的元素不会被提交。
- disabled 属性不需要值。它等同于 disabled="disabled"。

##### size 属性

- *size* 属性规定输入字段的尺寸（以字符计）

##### maxlength 属性

- *maxlength* 属性规定输入字段允许的最大长度
- 如设置 maxlength 属性，则输入控件不会接受超过所允许数的字符。
- 该属性不会提供任何反馈。如果需要提醒用户，则必须编写 JavaScript 代码。
- 注释：输入限制并非万无一失。JavaScript 提供了很多方法来增加非法输入。如需安全地限制输入，则接受者（服务器）必须同时对限制进行检查。

##### HTML5 属性

HTML5 为 \<input> 增加了如下属性：

- autocomplete
- autofocus
- form
- formaction
- formenctype
- formmethod
- formnovalidate
- formtarget
- height 和 width
- list
- min 和 max
- multiple
- pattern (regexp)
- placeholder
- required
- step

并为 \<form> 增加如需属性：

- autocomplete
- novalidate

##### autocomplete 属性

- autocomplete 属性规定表单或输入字段是否应该自动完成。
- 当自动完成开启，浏览器会基于用户之前的输入值自动填写值。
- 提示：autocomplete 属性适用于\<form> 以及如下 \<input> 类型：text、search、url、tel、email、password、datepickers、range 以及 color。

提示：在某些浏览器中，您也许需要手动启用自动完成功能。

##### novalidate 属性

- novalidate 属性属于 \<form> 属性。
- 如果设置，则 novalidate 规定在提交表单时不对表单数据进行验证。

##### autofocus 属性

- autofocus 属性是布尔属性。
- 如果设置，则规定当页面加载时 \<input> 元素应该自动获得焦点。

##### form 属性

- form 属性规定 \<input> 元素所属的一个或多个表单。
- 提示：如需引用一个以上的表单，请使用空格分隔的表单 id 列表。

##### formaction 属性

- formaction 属性规定当提交表单时处理该输入控件的文件的 URL。
- formaction 属性覆盖 \<form> 元素的 action 属性。
- formaction 属性适用于 type="submit" 以及 type="image"。

##### formenctype 属性

- formenctype 属性规定当把表单数据（form-data）提交至服务器时如何对其进行编码（仅针对 method="post" 的表单）。
- formenctype 属性覆盖 \<form> 元素的 enctype 属性。
- formenctype 属性适用于 type="submit" 以及 type="image"。

##### formmethod 属性

- formmethod 属性定义用以向 action URL 发送表单数据（form-data）的 HTTP 方法。
- formmethod 属性覆盖 \<form> 元素的 method 属性。
- formmethod 属性适用于 type="submit" 以及 type="image"。

##### formnovalidate 属性

- novalidate 属性是布尔属性。
- 如果设置，则规定在提交表单时不对 \<input> 元素进行验证。
- formnovalidate 属性覆盖 \<form> 元素的 novalidate 属性。
- formnovalidate 属性可用于 type="submit"。

##### formtarget 属性

- formtarget 属性规定的名称或关键词指示提交表单后在何处显示接收到的响应。
- formtarget 属性会覆盖 \<form> 元素的 target 属性。
- formtarget 属性可与 type="submit" 和 type="image" 使用。

##### height 和 width 属性

- height 和 width 属性规定 \<input> 元素的高度和宽度。
- height 和 width 属性仅用于 \<input type="image">。
- 注释：请始终规定图像的尺寸。如果浏览器不清楚图像尺寸，则页面会在图像加载时闪烁。

##### list 属性

- list 属性引用的 \<datalist> 元素中包含了 \<input> 元素的预定义选项。

##### min 和 max 属性

- min 和 max 属性规定 \<input> 元素的最小值和最大值。
- min 和 max 属性适用于如需输入类型：number、range、date、datetime、datetime-local、month、time 以及 week。

##### multiple 属性

- multiple 属性是布尔属性。
- 如果设置，则规定允许用户在 \<input> 元素中输入一个以上的值。
- multiple 属性适用于以下输入类型：email 和 file。

##### pattern 属性

- pattern 属性规定用于检查 \<input> 元素值的正则表达式。
- pattern 属性适用于以下输入类型：text、search、url、tel、email、and password。
- 提示：请使用全局的 title 属性对模式进行描述以帮助用户。

##### placeholder 属性

- placeholder 属性规定用以描述输入字段预期值的提示（样本值或有关格式的简短描述）。
- 该提示会在用户输入值之前显示在输入字段中。
- placeholder 属性适用于以下输入类型：text、search、url、tel、email 以及 password。

##### required 属性

- required 属性是布尔属性。
- 如果设置，则规定在提交表单之前必须填写输入字段。
- required 属性适用于以下输入类型：text、search、url、tel、email、password、date pickers、number、checkbox、radio、and file.

##### step 属性

- step 属性规定 \<input> 元素的合法数字间隔。
- 示例：如果 step="3"，则合法数字应该是 -3、0、3、6、等等。
- 提示：step 属性可与 max 以及 min 属性一同使用，来创建合法值的范围。
- step 属性适用于以下输入类型：number、range、date、datetime、datetime-local、month、time 以及 week。



### HTML5

#### HTML5 简介

##### HTML5 中的新内容？

```
<!DOCTYPE html>
<meta charset="UTF-8">
```

注释：HTML5 中默认的字符编码是 UTF-8。

#### HTML5 - 新的属性语法

HTML5 标准允许 4 中不同的属性语法。

| 类型            | 示例                                       |
| ------------- | ---------------------------------------- |
| Empty         | \<input type="text" value="John Doe" disabled> |
| Unquoted      | \<input type="text" value=John Doe>      |
| Double-quoted | \<input type="text" value="John Doe">    |
| Single-quoted | \<input type="text" value='John Doe'>    |

##### HTML5 - 新特性

HTML5 的一些最有趣的新特性：

- 新的语义元素，比如 \<header>, \<footer>, \<article>, and \<section>。
- 新的表单控件，比如数字、日期、时间、日历和滑块。
- 强大的图像支持（借由 \<canvas> 和 \<svg>）
- 强大的多媒体支持（借由 \<video> 和 \<audio>）
- 强大的新 API，比如用本地存储取代 cookie。

##### HTML5 - 被删元素

以下 HTML 4.01 元素已从 HTML5 中删除：

- \<acronym>
- \<applet>
- \<basefont>
- \<big>
- \<center>
- \<dir>
- \<font>
- \<frame>
- \<frameset>
- \<noframes>
- \<strike>
- \<tt>



#### HTML5 浏览器支持

##### HTML5 浏览器支持

所有浏览器，不论新旧，都会自动把未识别元素当做行内元素来处理。

##### 把 HTML5 元素定义为块级元素

- HTML5 定义了八个新的*语义* HTML 元素。所有都是*块级*元素。
- 您可以把 CSS *display* 属性设置为 *block*，以确保老式浏览器中正确的行为

##### 向 HTML 添加新元素

- 您可以通过浏览器 trick 向 HTML 添加任何新元素

##### Internet Explorer 的问题

- 注意：Internet Explorer 8 以及更早的版本，不允许对未知元素添加样式。
- 幸运的是，Sjoerd Visscher 创造了 "HTML5 Enabling JavaScript", *"the shiv"*：

```
<!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
```

##### 完整的 Shiv 解决方案



#### HTML5 新元素

##### 新的语义/结构元素

| 标签            | 描述                         |
| ------------- | -------------------------- |
| \<article>    | 定义文档内的文章。                  |
| \<aside>      | 定义页面内容之外的内容。               |
| \<bdi>        | 定义与其他文本不同的文本方向。            |
| \<details>    | 定义用户可查看或隐藏的额外细节。           |
| \<dialog>     | 定义对话框或窗口。                  |
| \<figcaption> | 定义 \<figure> 元素的标题。        |
| \<figure>     | 定义自包含内容，比如图示、图表、照片、代码清单等等。 |
| \<footer>     | 定义文档或节的页脚。                 |
| \<header>     | 定义文档或节的页眉。                 |
| \<main>       | 定义文档的主内容。                  |
| \<mark>       | 定义重要或强调的内容。                |
| \<menuitem>   | 定义用户能够从弹出菜单调用的命令/菜单项目。     |
| \<meter>      | 定义已知范围（尺度）内的标量测量。          |
| \<nav>        | 定义文档内的导航链接。                |
| \<progress>   | 定义任务进度。                    |
| \<rp>         | 定义在不支持 ruby 注释的浏览器中显示什么。   |
| \<rt>         | 定义关于字符的解释/发音（用于东亚字体）。      |
| \<ruby>       | 定义 ruby 注释（用于东亚字体）。        |
| \<section>    | 定义文档中的节。                   |
| \<summary>    | 定义 \<details> 元素的可见标题。     |
| \<time>       | 定义日期/时间。                   |
| \<wbr>        | 定义可能的折行（line-break）。       |

##### 新的表单元素

| 标签          | 描述               |
| ----------- | ---------------- |
| \<datalist> | 定义输入控件的预定义选项。    |
| \<keygen>   | 定义键对生成器字段（用于表单）。 |
| \<output>   | 定义计算结果。          |

##### 新的媒介元素

| 标签        | 描述                          |
| --------- | --------------------------- |
| \<audio>  | 定义声音或音乐内容。                  |
| \<embed>  | 定义外部应用程序的容器（比如插件）。          |
| \<source> | 定义 \<video> 和 \<audio> 的来源。 |
| \<track>  | 定义 \<video> 和 \<audio> 的轨道。 |
| \<video>  | 定义视频或影片内容。                  |



#### HTML5 语义元素

##### 什么是语义元素？

- 语义元素清楚地向浏览器和开发者描述其意义。
- *非语义*元素的例子：<\div> 和 \<span> - 无法提供关于其内容的信息。
- *语义*元素的例子：\<form>、\<table> 以及 \<img> - 清晰地定义其内容。

##### HTML5 中新的语义元素

HTML5 提供了定义页面不同部分的新语义元素：

- \<article>
- \<aside>
- \<details>
- \<figcaption>
- \<figure>
- \<footer>
- \<header>
- \<main>
- \<mark>
- \<nav>
- \<section>
- \<summary>
- \<time>

##### HTML5 \<section> 元素

- \<section> 元素定义文档中的节。
- 根据 W3C 的 HTML 文献：“节（section）是有主题的内容组，通常具有标题”。
- 可以将网站首页划分为简介、内容、联系信息等节。

##### HTML5 \<article> 元素

- \<article> 元素规定独立的自包含内容。
- 文档有其自身的意义，并且可以独立于网站其他内容进行阅读。
- \<article> 元素的应用场景：
  - 论坛
  - 博客
  - 新闻

##### HTML5 \<header> 元素

- \<header> 元素为文档或节规定页眉。
- \<header> 元素应该被用作介绍性内容的容器。
- 一个文档中可以有多个 \<header> 元素。

##### HTML5 \<footer> 元素

- \<footer> 元素为文档或节规定页脚。
- \<footer> 元素应该提供有关其包含元素的信息。
- 页脚通常包含文档的作者、版权信息、使用条款链接、联系信息等等。
- 您可以在一个文档中使用多个 \<footer> 元素。

##### HTML5 \<nav> 元素

- \<nav> 元素定义导航链接集合。
- \<nav> 元素旨在定义大型的导航链接块。不过，并非文档中所有链接都应该位于 \<nav> 元素中！

##### HTML5 \<aside> 元素

- \<aside> 元素页面主内容之外的某些内容（比如侧栏）。
- aside 内容应该与周围内容相关。

##### HTML5 \<figure> 和 \<figcaption> 元素

- 在书籍和报纸中，与图片搭配的标题很常见。
- 标题（caption）的作用是为图片添加可见的解释。
- 通过 HTML5，图片和标题能够被组合在 \<figure>元素中：
- \<img> 元素定义图像，\<figcaption> 元素定义标题。

## HTML5 中的语义元素

| 标签            | 描述                        |
| ------------- | ------------------------- |
| \<article>    | 定义文章。                     |
| \<aside>      | 定义页面内容以外的内容。              |
| \<details>    | 定义用户能够查看或隐藏的额外细节。         |
| \<figcaption> | 定义 \<figure> 元素的标题。       |
| \<figure>     | 规定自包含内容，比如图示、图表、照片、代码清单等。 |
| \<footer>     | 定义文档或节的页脚。                |
| \<header>     | 规定文档或节的页眉。                |
| \<main>       | 规定文档的主内容。                 |
| \<mark>       | 定义重要的或强调的文本。              |
| \<nav>        | 定义导航链接。                   |
| \<section>    | 定义文档中的节。                  |
| \<summary>    | 定义 \<details> 元素的可见标题。    |
| \<time>       | 定义日期/时间。                  |



#### HTML5 迁移

##### 从 HTML4 迁移至 HTML5

| 典型的 HTML4           | 典型的 HTML5  |
| ------------------- | ---------- |
| \<div id="header">  | \<header>  |
| \<div id="menu">    | \<nav>     |
| \<div id="content"> | \<section> |
| \<div id="post">    | \<article> |
| \<div id="footer">  | \<footer>  |

##### 更改为 HTML5 Doctype

- 修改文档类型，从 HTML4 doctype：

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
```

修改为 HTML5 doctype：

```
<!DOCTYPE html>
```

##### 更改为 HTML5 编码

- 修改编码信息，从 HTML4：

```
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
```

改为 HTML5：

```
<meta charset="utf-8">
```

##### 添加 shiv

- 为 Internet Explorer 支持而添加的 shiv：

```
<!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
```

##### 为 HTML5 语义元素添加 CSS

##### 更改为 HTML5 \<header> 和 \<footer>

- 把 id="header" 和 id="footer" 的 \<div> 元素修改为 HTML5 语义元素 \<header> 和 \<footer>

##### 更改为 HTML5 \<nav>

- 把 id="menu" 的 \<div> 元素修改为 HTML5 语义元素 \<nav>

##### 更改为 HTML5 \<section>

- 把 id="content" 的 the \<div> 元素修改为 HTML5 语义元素 \<section>

##### 更改为 HTML5 \<article>

- 把 class="post" 的所有 \<div> 元素修改为 HTML5 语义元素 \<article>

##### 典型的 HTML5 页面

- 最后您可以删除 \<head> 标签。HTML5 中不再需要它们

##### \<article> \<section> 与 \<div> 之间的差异

- 在 HTML5 标准中，\<article> \<section> 与 \<div> 之间的差异很小，令人困惑。
- 在 HTML5 标准中，\<section> 元素被定位为相关元素的块。
- \<article> 元素被定义为相关元素的完整的自包含块。
- \<div> 元素被定义为子元素的块。



#### HTML(5) 样式指南和代码约定

##### 请使用正确的文档类型

##### 请使用小写元素名

##### 关闭所有 HTML 元素

##### 关闭空的 HTML 元素

##### 使用小写属性名

##### 必需的属性

- 请始终对图像使用 *alt* 属性。当图像无法显示时该属性很重要。
- 请始终定义图像尺寸。这样做会减少闪烁，因为浏览器会在图像加载之前为图像预留空间。

##### 避免长代码行

##### 空行和缩进

##### 省略 \<html> 和 \<body>？

**我们不推荐省略  和  标签。**

- 对于可访问应用程序（屏幕阅读器）和搜索引擎，声明语言很重要。
- 省略 \<html> 或 \<body> c可令 DOM 和 XML 软件崩溃。
- 省略 \<body> 会在老式浏览器（IE9）中产生错误。

##### 省略 \<head>？

- 在 HTML5 标准中，\<head> 标签也能够被省略。
- 默认地，浏览器会把 \<body> 之前的所有元素添加到默认的 \<head> 元素。
- 通过省略 \<head> 标签，您能够降低 HTML 的复杂性
- 注释：对于 web 开发者，省略标签的做法是陌生的。建立规则需要时间。

##### 元数据

- \<title> 元素在 HTML5 中是必需的。请尽可能制作有意义的标题。
- 为了确保恰当的解释，以及正确的搜索引擎索引，在文档中对语言和字符编码的定义越早越好

##### HTML 注释

##### 样式表

- 请使用简单的语法来链接样式表（type 属性不是必需的）
- 短规则可以压缩为一行
- 长规则应该分为多行
- - 开括号与选择器位于同一行
  - 在开括号之前用一个空格
  - 使用两个字符的缩进
  - 在每个属性与其值之间使用冒号加一个空格
  - 在每个逗号或分号之后使用空格
  - 在每个属性值对（包括最后一个）之后使用分号
  - 只在值包含空格时使用引号来包围值
  - 把闭括号放在新的一行，之前不用空格
  - 避免每行超过 80 个字符
- 注释：在逗号或分号之后添加空格，是所有书写类型的通用规则。

##### 在 HTML 中加载 JavaScript

- 请使用简单的语法来加载外部脚本（type 属性不是必需的）

##### 通过 JavaScript 访问 HTML 元素

- 如果可能，请在 HTML 中使用（与 JavaScript）相同的命名约定。

##### 使用小写文件名

- 大多数 web 服务器（Apache、Unix）对文件名的大小写敏感
- 为了避免这些问题，请始终使用小写文件名（如果可以的话）。

##### 文件扩展名

- HTML 文件名应该使用扩展名 *.html*（而不是 .htm）。



### HTML 图形

#### HTML5 Canvas

##### 创建 Canvas 元素

```
<canvas id="myCanvas" width="200" height="100"></canvas>
```

##### 通过 JavaScript 来绘制

- canvas 元素本身是没有绘图能力的。所有的绘制工作必须在 JavaScript 内部完成

```
<script type="text/javascript">
var c=document.getElementById("myCanvas");
var cxt=c.getContext("2d");
cxt.fillStyle="#FF0000";
cxt.fillRect(0,0,150,75);
</script>
```

##### 理解坐标

##### 更多 Canvas 实例

###### 实例 - 线条

###### 实例 - 圆形

###### 实例 - 渐变

###### 实例 - 图像

###### 实例 - 渐变

###### 实例 - 图像



#### HTML5 内联 SVG

##### 什么是SVG？

- SVG 指可伸缩矢量图形 (Scalable Vector Graphics)
- SVG 用于定义用于网络的基于矢量的图形
- SVG 使用 XML 格式定义图形
- SVG 图像在放大或改变尺寸的情况下其图形质量不会有损失
- SVG 是万维网联盟的标准

##### SVG 的优势

与其他图像格式相比（比如 JPEG 和 GIF），使用 SVG 的优势在于：

- SVG 图像可通过文本编辑器来创建和修改
- SVG 图像可被搜索、索引、脚本化或压缩
- SVG 是可伸缩的
- SVG 图像可在任何的分辨率下被高质量地打印
- SVG 可在图像质量不下降的情况下被放大


##### 浏览器支持

- Internet Explorer 9、Firefox、Opera、Chrome 以及 Safari 支持内联 SVG。



#### HTML 5 Canvas vs. SVG

##### SVG

- SVG 是一种使用 XML 描述 2D 图形的语言。
- SVG 基于 XML，这意味着 SVG DOM 中的每个元素都是可用的。您可以为某个元素附加 JavaScript 事件处理器。
- 在 SVG 中，每个被绘制的图形均被视为对象。如果 SVG 对象的属性发生变化，那么浏览器能够自动重现图形。

##### Canvas

- Canvas 通过 JavaScript 来绘制 2D 图形。
- Canvas 是逐像素进行渲染的。
- 在 canvas 中，一旦图形被绘制完成，它就不会继续得到浏览器的关注。如果其位置发生变化，那么整个场景也需要重新绘制，包括任何或许已被图形覆盖的对象。

##### Canvas 与 SVG 的比较

###### Canvas

- 依赖分辨率
- 不支持事件处理器
- 弱的文本渲染能力
- 能够以 .png 或 .jpg 格式保存结果图像
- 最适合图像密集型的游戏，其中的许多对象会被频繁重绘

###### SVG

- 不依赖分辨率
- 支持事件处理器
- 最适合带有大型渲染区域的应用程序（比如谷歌地图）
- 复杂度高会减慢渲染速度（任何过度使用 DOM 的应用都不快）
- 不适合游戏应用



### HMTL媒体

#### HTML 多媒体

##### 视频格式

- MP4 格式是一种新的即将普及的因特网视频格式。HTML5 、Flash 播放器以及优酷等视频网站均支持它。

| 格式        | 文件         | 描述                                       |
| --------- | ---------- | ---------------------------------------- |
| AVI       | .avi       | AVI (Audio Video Interleave) 格式是由微软开发的。所有运行 Windows 的计算机都支持 AVI 格式。它是因特网上很常见的格式，但非 Windows 计算机并不总是能够播放。 |
| WMV       | .wmv       | Windows Media 格式是由微软开发的。Windows Media 在因特网上很常见，但是如果未安装额外的（免费）组件，就无法播放 Windows Media 电影。一些后期的 Windows Media 电影在所有非 Windows 计算机上都无法播放，因为没有合适的播放器。 |
| MPEG      | .mpg	.mpeg | MPEG (Moving Pictures Expert Group) 格式是因特网上最流行的格式。它是跨平台的，得到了所有最流行的浏览器的支持。 |
| QuickTime | .mov       | QuickTime 格式是由苹果公司开发的。QuickTime 是因特网上常见的格式，但是 QuickTime 电影不能在没有安装额外的（免费）组件的 Windows 计算机上播放。 |
| RealVideo | .rm	.ram   | RealVideo 格式是由 Real Media 针对因特网开发的。该格式允许低带宽条件下（在线视频、网络电视）的视频流。由于是低带宽优先的，质量常会降低。 |
| Flash     | .swf	.flv  | Flash (Shockwave) 格式是由 Macromedia 开发的。Shockwave 格式需要额外的组件来播放。但是该组件会预装到 Firefox 或 IE 之类的浏览器上。 |
| Mpeg-4    | .mp4       | Mpeg-4 (with H.264 video compression) 是一种针对因特网的新格式。事实上，YouTube 推荐使用 MP4。YouTube 接收多种格式，然后全部转换为 .flv 或 .mp4 以供分发。越来越多的视频发布者转到 MP4，将其作为 Flash 播放器和 HTML5 的因特网共享格式。 |

##### 声音格式

| 格式        | 文件         | 描述                                       |
| --------- | ---------- | ---------------------------------------- |
| MIDI      | .mid	.midi | MIDI (Musical Instrument Digital Interface) 是一种针对电子音乐设备（比如合成器和声卡）的格式。MIDI 文件不含有声音，但包含可被电子产品（比如声卡）播放的数字音乐指令。因为 MIDI 格式仅包含指令，所以 MIDI 文件极其小巧。上面的例子只有 23k 的大小，但却能播放将近 5 分钟。MIDI 得到了广泛的平台上的大量软件的支持。大多数流行的网络浏览器都支持 MIDI。 |
| RealAudio | .rm	.ram   | RealAudio 格式是由 Real Media 针对因特网开发的。该格式也支持视频。该格式允许低带宽条件下的音频流（在线音乐、网络音乐）。由于是低带宽优先的，质量常会降低。 |
| Wave      | .wav       | Wave (waveform) 格式是由 IBM 和微软开发的。所有运行 Windows 的计算机和所有网络浏览器（除了 Google Chrome）都支持它。 |
| WMA       | .wma       | WMA 格式 (Windows Media Audio)，质量优于 MP3，兼容大多数播放器，除了 iPod。WMA 文件可作为连续的数据流来传输，这使它对于网络电台或在线音乐很实用。 |
| MP3       | .mp3	.mpga | MP3 文件实际上是 MPEG 文件的声音部分。MPEG 格式最初是由运动图像专家组开发的。MP3 是其中最受欢迎的针对音乐的声音格式。期待未来的软件系统都支持它。 |

##### 使用哪种格式？

- WAVE 是因特网上最受欢迎的*无压缩*声音格式，所有流行的浏览器都支持它。如果您需要未经压缩的声音（音乐或演讲），那么您应该使用 WAVE 格式。
- MP3 是最新的*压缩*录制音乐格式。MP3 这个术语已经成为数字音乐的代名词。如果您的网址从事录制音乐，那么 MP3 是一个选项。



#### HTML Object 元素

- \<object>的作用是支持 HTML 助手（插件）。

##### HTML 助手（插件）

- 辅助应用程序（helper application）是可由浏览器启动的程序。辅助应用程序也称为插件。
- 辅助程序可用于播放音频和视频（以及其他）。辅助程序是使用 <object> 标签来加载的。
- 使用辅助程序播放视频和音频的一个优势是，您能够允许用户来控制部分或全部播放设置。
- 大多数辅助应用程序允许对音量设置和播放功能（比如后退、暂停、停止和播放）的手工（或程序的）控制。

##### 使用 QuickTime 来播放 Wave 音频

##### 使用 QuickTime 来播放 MP4 视频

##### 使用 Flash 来播放 SWF 视频

##### 使用 Windows Media Player 来播放 WMV 影片



#### HTML 音频

##### 使用插件

- 浏览器插件是一种扩展浏览器标准功能的小型计算机程序。
- 插件有很多用途：播放音乐、显示地图、验证银行账号，控制输入等等。
- 可使用 \<object> 或 \<embed> 标签来将插件添加到 HTML 页面。
- 这些标签定义资源（通常非 HTML 资源）的容器，根据类型，它们即会由浏览器显示，也会由外部插件显示。

##### 使用 \<embed> 元素

- \<embed> 标签定义外部（非 HTML）内容的容器。（这是一个 HTML5 标签，在 HTML4 中是非法的，但是所有浏览器中都有效）。

###### 问题：

- \<embed> 标签在 HTML 4 中是无效的。页面无法通过 HTML 4 验证。
- 不同的浏览器对音频格式的支持也不同。
- 如果浏览器不支持该文件格式，没有插件的话就无法播放该音频。
- 如果用户的计算机未安装插件，无法播放音频。
- 如果把该文件转换为其他格式，仍然无法在所有浏览器中播放。

###### 注释：

- 使用 <!DOCTYPE html> (HTML5) 解决验证问题。

##### 使用 \<object> 元素

- \<object tag> 标签也可以定义外部（非 HTML）内容的容器。

###### 问题：

- 不同的浏览器对音频格式的支持也不同。
- 如果浏览器不支持该文件格式，没有插件的话就无法播放该音频。
- 如果用户的计算机未安装插件，无法播放音频。
- 如果把该文件转换为其他格式，仍然无法在所有浏览器中播放。

##### 使用 HTML5 \<audio> 元素

- \<audio> 元素是一个 HTML5 元素，在 HTML 4 中是非法的，但在所有浏览器中都有效。

###### 问题：

- \<audio> 标签在 HTML 4 中是无效的。您的页面无法通过 HTML 4 验证。
- 您必须把音频文件转换为不同的格式。
- \<audio> 元素在老式浏览器中不起作用。

注释：使用 <!DOCTYPE html> (HTML5) 解决验证问题。

##### 最好的 HTML 解决方法

###### 实例

```
<audio controls="controls" height="100" width="100">
  <source src="song.mp3" type="audio/mp3" />
  <source src="song.ogg" type="audio/ogg" />
<embed height="100" width="100" src="song.mp3" />
</audio>
```

上面的例子使用了两个不同的音频格式。HTML5 \<audio> 元素会尝试以 mp3 或 ogg 来播放音频。如果失败，代码将回退尝试 \<embed> 元素。

###### 问题：

- 您必须把音频转换为不同的格式。
- \<audio> 元素无法通过 HTML 4 和 XHTML 验证。
- \<embed> 元素无法通过 HTML 4 和 XHTML 验证。
- \<embed> 元素无法回退来显示错误消息。

注释：使用 <!DOCTYPE html> (HTML5) 解决验证问题。

##### 向网站添加音频的最简单方法

##### 雅虎媒体播放器

```
<script type="text/javascript" src="http://mediaplayer.yahoo.com/js"></script>
```

##### 使用超链接

- 如果网页包含指向媒体文件的超链接，大多数浏览器会使用“辅助应用程序”来播放文件。

##### 内联的声音

- 当您在网页中包含声音，或者作为网页的组成部分时，它被称为内联声音。
- 如果您打算在 web 应用程序中使用内联声音，您需要意识到很多人都觉得内联声音令人恼火。同时请注意，用户可能已经关闭了浏览器中的内联声音选项。
- 我们最好的建议是只在用户希望听到内联声音的地方包含它们。一个正面的例子是，在用户需要听到录音并点击某个链接时，会打开页面然后播放录音。

##### HTML 4.01 多媒体标签

| 标签        | 描述                           |
| --------- | ---------------------------- |
| \<applet> | 不赞成。定义内嵌 applet。             |
| \<embed>  | HTML4 中不赞成，HTML5 中允许。定义内嵌对象。 |
| \<object> | 定义内嵌对象。                      |
| \<param>  | 定义对象的参数。                     |

##### HTML 5 多媒体标签

| 标签       | 描述                 |
| -------- | ------------------ |
| \<audio> | 标签定义声音，比如音乐或其他音频流。 |
| \<embed> | 标签定义嵌入的内容，比如插件。    |



#### HTML 视频

##### 使用 \<embed> 标签

\<embed> 标签的作用是在 HTML 页面中嵌入多媒体元素。

###### 问题

- HTML4 无法识别 \<embed> 标签。您的页面无法通过验证。
- 如果浏览器不支持 Flash，那么视频将无法播放
- iPad 和 iPhone 不能显示 Flash 视频。
- 如果您将视频转换为其他格式，那么它仍然不能在所有浏览器中播放。

##### 使用 \<object> 标签

\<object> 标签的作用是在 HTML 页面中嵌入多媒体元素。

###### 问题

- 如果浏览器不支持 Flash，将无法播放视频。
- iPad 和 iPhone 不能显示 Flash 视频。
- 如果您将视频转换为其他格式，那么它仍然不能在所有浏览器中播放。

##### 使用 \<video> 标签

- \<video> 是 HTML 5 中的新标签。
- \<video> 标签的作用是在 HTML 页面中嵌入视频元素。

###### 问题

- 您必须把视频转换为很多不同的格式。
- \<video> 元素在老式浏览器中无效。
- \<video> 元素无法通过 HTML 4 和 XHTML 验证。

##### 最好的 HTML 解决方法

HTML 5 + \<object> + \<embed>

###### 问题

- 您必须把视频转换为很多不同的格式
- \<video> 元素无法通过 HTML 4 和 XHTML 验证。
- \<embed> 元素无法通过 HTML 4 和 XHTML 验证。

##### 优酷解决方案

- 如果您希望在网页中播放视频，那么您可以把视频上传到优酷等视频网站，然后在您的网页中插入 HTML 代码即可播放视频

##### 使用超链接

- 如果网页包含指向媒体文件的超链接，大多数浏览器会使用“辅助应用程序”来播放文件。



### HTML API

#### HTML5 地理定位

**HTML5 Geolocation（地理定位）用于定位用户的位置。**

##### 浏览器支持

- Internet Explorer 9、Firefox、Chrome、Safari 以及 Opera 支持地理定位。


- 注释：对于拥有 GPS 的设备，比如 iPhone，地理定位更加精确。

##### HTML5 - 使用地理定位

- 请使用 getCurrentPosition() 方法来获得用户的位置。

##### 处理错误和拒绝

- getCurrentPosition() 方法的第二个参数用于处理错误。它规定当获取用户位置失败时运行的函数

###### 错误代码：

- Permission denied - 用户不允许地理定位
- Position unavailable - 无法获取当前位置
- Timeout - 操作超时

##### 在地图中显示结果

- 如需在地图中显示结果，您需要访问可使用经纬度的地图服务，比如谷歌地图或百度地图

##### getCurrentPosition() 方法 - 返回数据

- 若成功，则 getCurrentPosition() 方法返回对象。始终会返回 latitude、longitude 以及 accuracy 属性。如果可用，则会返回其他下面的属性。

| 属性                      | 描述          |
| ----------------------- | ----------- |
| coords.latitude         | 十进制数的纬度     |
| coords.longitude        | 十进制数的经度     |
| coords.accuracy         | 位置精度        |
| coords.altitude         | 海拔，海平面以上以米计 |
| coords.altitudeAccuracy | 位置的海拔精度     |
| coords.heading          | 方向，从正北开始以度计 |
| coords.speed            | 速度，以米/每秒计   |
| timestamp               | 响应的日期/时间    |

##### Geolocation 对象 - 其他有趣的方法

- watchPosition() - 返回用户的当前位置，并继续返回用户移动时的更新位置（就像汽车上的 GPS）。
- clearWatch() - 停止 watchPosition() 方法



HTML5 拖放















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































