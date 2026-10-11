# 项目约定与排版起点

以下是可采用的相对目录结构；先看当前项目，不要求已有项目改名，也不依赖某位作者的报告文件。

| 内容 | 目录起点 |
|---|---|
| 当前课件、通用要求 | `PPT/` 或项目实际资料目录 |
| 原始照片、核对读数及参数来源 | `data/` |
| 计算脚本、完整精度结果 | `analysis/` |
| 软件图 SVG、PNG | `analysis/figures/` |
| 可编辑报告 | `typ/` |
| 预习／正式模板 | `Template/PreviewTemplate/`、`Template/ReportTemplate/` |
| 按需导出的预习／正式 PDF | `preview/`、`report/` |

参考同项目报告时只参考结构、简洁风格和适用脚本；本次读数、参数、身份与元数据独立核对。

## 结构、封面与命名

章节与评分以当前教师要求为准。一种评分起点是：预习10分、原始数据20分、结果与分析60分、思考题10分；结果与分析又含数据处理30分、误差分析20分、实验探讨10分。它不是所有课程的固定结构。

正式报告原始记录单独分页通常便于核对；其他章节根据实际渲染决定分页，不为没有数据的项目插入编辑说明。

使用项目现有模板。若模板函数为 `phylab`，核对 `name`、`instructor`、`class`、`desk-id`、`author`、`author-id`、`date`、`week`、`am-pm`。字段值来自当前报告作者与本次实验；技能不预置个人信息，参考报告的封面不能直接沿用。

无另行规定时，PDF 使用 `姓名+学号+实验名称+第N周.pdf`，正式报告放 `report/`，预习报告放 `preview/`。例如 `report/姓名+学号+实验名称+第N周.pdf`，各字段替换为当前报告已确认的值；周次不照抄旧文件后缀。

## Typst 排版起点

先检查字体是否可用，再从以下局部样式调整。中文字体可选 Noto Serif CJK SC、思源宋体、宋体或 Songti SC；不要将某台电脑的字体路径当作运行条件。

```typst
#set text(size: 12pt)
#set par(justify: true,
  first-line-indent: (amount: 2em, all: true),
  leading: 0.7em, spacing: 0.7em)
#show heading: set par(first-line-indent: 0pt)
#show list: set par(first-line-indent: 0pt)
#set list(indent: 1em, body-indent: 0.55em,
  tight: false, spacing: 0.6em)
#show table: set par(first-line-indent: 0pt, leading: 0.45em)
#set table(stroke: 0.5pt,
  inset: (x: 7pt, y: 5.5pt), align: center + horizon)
#show figure: set par(first-line-indent: 0pt)
#show figure.caption: set text(size: 10pt)
```

源码相邻条目之间留空行。使用宽度 `100%` 的块承载居中公式或表题，避免按内容宽度收缩造成偏左。短表可用 `breakable: false`，长表或整个章节允许合理分页。

照片只去掉无关背景，不裁掉测量曲线和必要标识。用排版视窗时检查继承的边线、内边距及图片尺寸约束，防止模板封面样式影响照片。软件图优先 SVG，附 PNG 便于检查；Matplotlib 字体须实际可用，SVG 可设 `svg.fonttype: path` 嵌入字形。

## 验证与导出

在项目根目录运行，下列占位路径按实际文件替换。每次检查使用新目录，避免将旧页计入本次结果。

```sh
check_dir=$(mktemp -d)
typst compile --root . --format png --ppi 110 \
  'typ/实验名称-实验报告.typ' \
  "$check_dir/page-{p}.png"
```

查看整份缩略图，再检查实际页面中的原始记录、照片图注、公式与表格。只有当前任务明确要求 PDF 导出时运行：

```sh
typst compile --root . 'typ/实验名称-实验报告.typ' \
  'report/姓名+学号+实验名称+第N周.pdf'
```

重新打开成品，检查页数并渲染实际 PDF，确认字体、图片、公式、页码和分页。已有 PDF 不等于编辑任务有新的导出要求。工具使用当前环境中已确认可用的版本，不固化个人缓存路径。
