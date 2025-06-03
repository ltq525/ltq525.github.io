# Html基础语法

## 编辑器
> 搭配VSCode插件 `Live Server`、`Auto Rename Tag`

## html文件结构
``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
```

### `<html>`标签
HTML `<html>` 元素 表示一个 HTML 文档的根（顶级元素），所以它也被称为根元素。所有其他元素必须是此元素的后代。

### `<head>`标签
HTML head 元素 规定文档相关的配置信息（元数据），包括文档的标题，引用的文档样式和脚本等。

### `<body>`标签
HTML body 元素表示文档的内容。document.body 属性提供了可以轻松访问文档的 body 元素的脚本。

### `<title>`标签
HTML `<title>` 元素 定义文档的标题，显示在浏览器的标题栏或标签页上。它只应该包含文本，若是包含有标签，则它包含的任何标签都将被忽略。

### `<meta>` 标签
HTML `<meta>` 元素表示那些不能由其它 HTML 元相关`meta-related`元素`<base>、<link>, <script>、<style>` 或 `<title>`之一表示的任何元数据信息。

常见属性：

* `charset`：这个属性声明了文档的字符编码。如果使用了这个属性，其值必须是与 ASCII 大小写无关（ASCII case-insensitive）的”utf-8”。  
* `name`：name 和 content 属性可以一起使用，以名 - 值对的方式给文档提供元数据，其中 name 作为元数据的名称，content 作为元数据的值。  

### icon
`<link rel="icon" href="images/icon.png">` 标题图标  

## 文本标签

### `<div>`标签
`<div>`元素 (或 HTML 文档分区元素) 是一个通用型的流内容容器，在不使用CSS的情况下，其对内容或布局没有任何影响。  
其他块级标签例如：`<h1>, <p>, <pre>, <ul>, <ol>, <table>`

### `<span>`标签
`<span>` 元素是短语内容的通用行内容器，并没有任何特殊语义。可以使用它来编组元素以达到某种样式意图（通过使用类或者 Id 属性），或者这些元素有着共同的属性，比如lang。应该在没有其他合适的语义元素时才使用它。`<span> `与 `<div>` 元素很相似，但 `<div>` 是一个 块元素 而 `<span>` 则是 行内元素  
其他内联标签例如：`<i>, <b>, <del>, <ins>, <td>, <a>`。

## 图片
`html`格式: `<img src="" alt="" height="" width="">`  
`src`: 图片的文件路径。  
`alt`: 图片因某些原因无法显示时，显示alt属性  
`height、width`: 定义高度与宽度  

## 音频与视频
`<audio>`标签
例：自上而下显示一个无损的音频
``` html
<audio controls>
    <source src="/audios/sound1" type="audio/mpeg"/>
    <source src="/audios/sound2" type="audio/mpeg"/>
</audio>
```
`<video>`标签
``` html
<video controls width="800">
    <source src="/videos/video1.mp4"
            type="video/mp4">
    <source src="/videos/video2.mp4"
            type="video/mp4">
    Sorry, your browser doesn't support embedded videos.
</video>
```

## 超链接
`html`格式: `<a href="" target="_blank"></a>`
`target="_blank"`: 点击链接打开新标签页面

## 表单

### `<form>`标签
HTML `<form>` 元素表示文档中的一个区域，此区域包含交互控件，用于向 Web 服务器提交信息。

### `<input>`标签
HTML `<input>`用来填写内容，常见类型有：

* `<input type="text">`：创建基础的单行文本框。
* `<input type="number">`：用于让用户输入一个数字。其包括内置验证以拒绝非数字输入。浏览器可能会选择提供步进箭头，让用户可以使用鼠标增加和减少输入的值，或者只需用指尖敲击即可。
* `<input type="email">`：带有 “email” (电子邮箱) 类型标记的输入框元素 `<input>`能够让用户输入或编辑一个电子邮箱地址，此外，如果指定了multiple属性，用户还可以输入多个电子邮箱地址。在表单提交前，输入框会自动验证输入值是否是一个或多个合法的电子邮箱地址 (非空值且符合电子邮箱地址格式). CSS 伪标签 :valid 和 :invalid 能够在校验后自动应用。
* `<input type="password">`：`<input>` 元素 里有一种叫做 “password” 的值，给我们一个方法让用户更加安全的输入密码。这个元素是作为一行纯文本编辑器控件呈现的，其中文本被遮蔽以致于无法读取，通常通过用诸如星号（“*”）或点（“•”）等符号替换每个字符来实现。这个符号会根据用户的浏览器和操作系统来具体显示哪个。
* `<input type="radio">`：`<input>` 的 radio 类型元素默认渲染为小型圆圈图表，填充即为激活，类似于之前描述额复选框（checkbox）类型。单选按钮允许你选择单一的值来提交表单。  

常用属性有：

* `name`: 名称
* `id`: 唯一ID
* `maxlength`：最大长度
* `minlength`：最小长度
* `required`：是否必填
* `placeholder`：当表单控件为空时，控件中显示的内容

### `<textarea>`标签
HTML `<textarea>` 元素表示一个多行纯文本编辑控件，当你希望用户输入一段相当长的、不限格式的文本，例如评论或反馈表单中的一段意见时，这很有用。

### `<select>`与`<option>`标签
HTML `<select>` 元素表示一个提供选项菜单的控件。

### `<button>`标签
HTML `<button>` 元素表示一个可点击的按钮，可以用在表单或文档其它需要使用简单标准按钮的地方。 默认情况下，HTML 按钮的显示样式接近于 user agent 所在的宿主系统平台（用户操作系统）的按钮， 但你可以使用 CSS 来改变按钮的样貌。

## 列表
### `<ul>`与`<li>`标签
HTML `<ul>` 元素（或称 HTML 无序列表元素）表示一个内可含多个元素的**无序列表**或**项目符号列表**。
### `<ol>`与`<li>`标签
HTML `<ol>` 元素表示**有序列表**，通常渲染为一个带编号的列表。

## 表格
### `<table>`标签
HTML的 table 元素表示表格数据 — 即通过二维数据表表示的信息。

### `<thead>`标签
HTML的`<thead>`元素定义了一组定义表格的**列头的行**。

### `<tbody>`标签
HTML的`<tbody>`元素定义一组**数据行**。

### `<tr>`标签
HTML `<tr>` 元素定义表格中的行。 同一行可同时出现`<td>`和`<th>`元素。

### `<th>`标签
HTML `<th>`元素定义表格内的**表头单元格**。

### `<td>`标签
HTML `<td>` 元素 定义了一个包含**数据单元格**。

### `<caption>`标签
HTML `<caption>` 元素 (or HTML 表格标题元素) 展示一个表格的**标题**， 它常常作为 `<table>` 的第一个子元素出现，同时显示在表格内容的最前面，但是，它同样可以被 CSS 样式化，所以，它同样可以出现在相对于表格的任意位置。

## 语义标签
![picture](https://ltq525.github.io/site/picture/html_Semantic tags.png)

### `<header>`
HTML `<header>` 元素用于展示介绍性内容，通常包含一组介绍性的或是辅助导航的实用元素。它可能包含一些标题元素，但也可能包含其他元素，比如 Logo、搜索框、作者名称，等等。

### `<nav>`
HTML `<nav>`元素表示页面的一部分，其目的是在当前文档或其他文档中提供导航链接。导航部分的常见示例是菜单，**目录**和**索引**。

### `<section>`
HTML `<section>`元素表示一个包含在 HTML 文档中的独立部分，它没有更具体的语义元素来表示，一般来说会有包含一个标题。

### `<figure>`
HTML `<figure>` 元素代表一段独立的内容，经常与说明（caption）`<figcaption>` 配合使用，并且作为一个独立的引用单元。当它属于主内容流（main flow）时，它的位置独立于主体。这个标签经常是在主文中引用的图片，插图，表格，代码段等等，当这部分转移到附录中或者其他页面时不会影响到主体。

### `<figcaption>`
HTML `<figcaption>` 元素 是与其相关联的图片的说明/标题，用于描述其父节点 `<figure>` 元素里的其他数据。这意味着 `<figcaption>` 在`<figure>` 块里是第一个或最后一个。同时 HTML Figcaption 元素是可选的；如果没有该元素，这个父节点的图片只是会没有说明/标题。

### `<article>`
HTML `<article>`元素表示文档、页面、应用或网站中的独立结构，其意在成为可独立分配的或可复用的结构，如在发布中，它可能是论坛帖子、杂志或新闻文章、博客、用户提交的评论、交互式组件，或者其他独立的内容项目。

### `<aside>`
HTML `<aside>` 元素表示一个和其余**页面内容几乎无关的部分**，被认为是独立于该内容的一部分并且可以被单独的拆分出来而不会使整体受影响。其通常表现为侧边栏或者标注框（call-out boxes）。

### `<footer>`
HTML `<footer>` 元素表示最近一个章节内容或者根节点（sectioning root）元素的**页脚**。一个页脚通常包含该章节作者、版权数据或者与文档相关的链接等信息。

### 特殊符号

HTML源代码|显示结果|描述|
:--:|:-:|:-:|
`&lt;`|	<	|小于号或显示标记|
`&gt;`|	>	|大于号或显示标记|
`&amp;`|	&	|可用于显示其它特殊字符|
`&quot;`|	“	|引号|
`&reg;`|	®	|已注册|
`&copy;`|	©	|版权|
`&trade;`|	™   |商标|
`&nbsp;`|		|不断行的空白|
