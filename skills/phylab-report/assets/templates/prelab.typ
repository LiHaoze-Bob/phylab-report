// 保留原模板的栏目与评分示例，实际要求以当前课程为准。
#let phylab(
  name: "实验名称",
  instructor: "指导教师",
  class: "班级",
  desk-id: "实验桌号",
  author: "姓名",
  author-id: "学号",
  date: none,
  week: "",
  am-pm: "",
  body
) = {
  let 小初 = 36pt
  let 三号 = 16pt
  let 小三 = 15pt
  let 四号 = 14pt
  let 小四 = 12pt
// 设置字体和基本文本格式
set text(font: ("Times New Roman", "Songti SC"), size: 四号)
show raw: set text(font: "Menlo", size: 10pt)

// 设置段落格式：正文两端对齐，适当增加行距与段间距。
set par(
  justify: true,
  first-line-indent: (amount: 2em, all: true),
  leading: 0.9em,
  spacing: 0.75em,
)

import "@preview/numbly:0.1.0": numbly
set heading(numbering: numbly(
  "一、",
  "{2}.",
  "{2}.{3}",
))

// 一级标题设置（章节标题）
show heading.where(level: 1): set heading(numbering: "一、")
show heading.where(level: 1): set text(
  font: "Heiti SC",
  size: 三号,
  weight: "bold",
)
show heading.where(level: 1): set block(
  spacing: 1em,
  above: 0.4em,
  below: 0.9em,
)

// 二级标题设置（小节标题）- 独立编号
show heading.where(level: 2): set text(
  font: "Heiti SC",
  size: 四号,
  weight: "bold",
)
show heading.where(level: 2): set block(
  spacing: 0.8em,
  above: 1em,
  below: 0.55em,
)

// 三级标题设置（子小节标题）- 独立编号

show heading.where(level: 3): set text(
  font: "Songti SC",
  size: 小四
)

show heading.where(level: 3): set block(
  spacing: 0.9em,
  above: 0.7em,
  below: 0.7em
)
  // 设置纸张大小与页边距
  set page(paper: "a4", margin: (top: 2.54cm, bottom: 2.54cm, left: 1.91cm, right: 1.91cm), numbering: (..args) => {
    let ind = args.pos().at(0)
    if ind > 1 {
      "第" + str(args.pos().at(0) - 1) + "页"
    }
  })

  // 封面部分开始
  set text(stroke: 0.03em, size: 三号)
  set align(center)
  set box(stroke: (bottom: 1pt), inset: (bottom: 20%, left: -10%, right: -10%))
  v(0.15fr)
  text("物理实验预习报告", size: 小初)
  v(0.8fr)
  [#box("实验名称：", stroke: none) #box(name, width: 7cm)]
  v(0.5cm)
  [#box("指导教师:", stroke: none) #box(instructor, width: 7cm)]

  set text(size: 四号)
  v(0.6fr)
  [#box("班级:", stroke: none) #box(class, width: 8.4cm)]
  v(.1cm)
  [#box("姓名:", stroke: none) #box(author, width: 8.4cm)]
  v(.1cm)
  [#box("学号:", stroke: none) #box(author-id, width: 8.4cm)]

  v(0.4fr)
  [#box("实验日期：", stroke: none) #box(if date == none { "____" } else { str(date.year()) }, width: 3em) #box("年", stroke: none) #box(if date == none { "__" } else { str(date.month()) }, width: 1.5em) #box("月", stroke: none) #box(if date == none { "__" } else { str(date.day()) }, width: 1.5em) #box("日", stroke: none) #h(1cm) #box("星期", stroke: none) #box(if date == none { "__" } else { "一二三四五六日".clusters().at(date.weekday() - 1) }, width: 1em) #box(am-pm, stroke: none, width: 2em)]


 v(2cm)
 [#box("浙江大学物理实验教学中心", stroke: none)]

  // 封面部分结束
  pagebreak()
  set text(stroke: none)
  set align(left)
  set text(size: 小四)
  body
}

// 单文件模板；将以下占位文字替换为本次实验信息。
// 日期确认后，将 none 改为 datetime(year: ..., month: ..., day: ...)；不自动填入当天日期。
#show: phylab.with(
  name: "实验名称",
  instructor: "指导教师",
  class: "班级",
  author: "姓名",
  author-id: "学号",
  date: none,
  week: "",
  am-pm: "",
)

= 预习报告（10分）
== 实验综述（5分）
（自述实验现象、实验原理和实验方法，包括必要的光路图、电路图、公式等。不超过500字。）
== 实验重点（3分）
（简述本实验的学习重点，不超过100字。）
== 实验难点（2分）
（简述本实验的实现难点，不超过100字。）
