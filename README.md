# PHYLAB-Report

用于中文物理实验预习报告和正式报告的 Agent Skill。根据课程资料和本次原始记录，完成报告计划、Typst 写作、数据处理、软件作图、误差分析、照片与图注核对，以及按需 PDF 导出。

正文采用实验者视角和自然短句，保留测量依据与物理条件，减少重复表达。没有原始数据时不编造结果；默认交付可编辑源文件，明确要求后才导出 PDF。

## 安装

电脑需要安装 Node.js 和 npm，以便使用 `npx`。在实验项目目录打开终端，运行：

```bash
npx skills add LiHaoze-Bob/phylab-report --skill phylab-report
```

按提示选择正在使用的 AI 工具和安装方式。默认安装到当前项目；希望在多个项目使用时，加上 `-g`：

```bash
npx skills add LiHaoze-Bob/phylab-report --skill phylab-report -g
```

安装和更新由 [skills CLI](https://github.com/vercel-labs/skills) 完成。只查看仓库里可用的技能：

```bash
npx skills add LiHaoze-Bob/phylab-report --list
```

检查已安装技能并更新：

```bash
npx skills list
npx skills update
```

## 使用

将本次课件、教师要求、原始记录和报告模板放到自己的实验项目，再向支持技能的 AI 工具提出请求。例如：

> 使用 $phylab-report，先计划本次实验报告，列出需要的数据和处理方法。

> 使用 $phylab-report，完成不依赖实验数据的部分，生成正式报告的 Typst 文件，数据和结果留空，不导出 PDF。

> 使用 $phylab-report，根据本次原始记录完成数据处理、软件作图和误差分析，补入报告，仍不导出 PDF。

> 使用 $phylab-report，检查照片与图注、计算和误差分析，删去冗余表达。

> 使用 $phylab-report，按当前项目命名规范导出 PDF，并逐页检查最终排版。

本仓库提供写作与核对方法，不附带课程课件、报告模板、个人实验数据或照片。使用时准备自己的资料；生成报告需要可用的 Typst 环境和中文字体，软件作图需要 Python、NumPy、Matplotlib 或相应工具。封面信息、课程规则、目录和字体按自己的项目调整。

## 文件结构

```text
skills/phylab-report/
├── SKILL.md
├── agents/openai.yaml
└── references/
    ├── project-conventions.md
    └── uncertainty.md
```

- [SKILL.md](skills/phylab-report/SKILL.md)：任务范围、数据与照片核对、自然写作及交付规则。
- [project-conventions.md](skills/phylab-report/references/project-conventions.md)：可调整的目录、Typst 排版和命名起点。
- [uncertainty.md](skills/phylab-report/references/uncertainty.md)：不确定度、单位、修约和误差解释。

## skills.sh 收录

技能源文件托管在本 GitHub 仓库，同学可以直接使用上面的 `npx skills add` 命令安装。[skills.sh 官方 FAQ](https://skills.sh/docs/faq) 说明，用户通过安装工具安装技能后，平台会依据匿名安装统计自动收录和排名；无需另行上传技能包。网站收录的显示时间以平台实际状态为准，安装不依赖榜单上是否已经出现。
