# GB/T 7713.3-2014 专题科技报告 LaTeX 模板

这是一个面向“专题科技报告”的 XeLaTeX 项目模板。它以现行国家标准 [GB/T 7713.3-2014《科技报告编写规则》](https://openstd.samr.gov.cn/bzgk/std/newGbInfo?hcno=E2BA32B0F5E570E5844A9E7E2D42393F)为依据，默认采用标准附录 B--F 所示的结构、字号和编号思路。

模板是编写起点，不是标准符合性认证。附录 B--F 为资料性附录，主管部门、资助机构和所属专业领域可另有封面、页边距、行距或元数据要求；正式提交时应同时执行这些规定。

## 快速开始

1. 编辑 `metadata.tex`，替换报告编号、密级、题名、作者、摘要、关键词和项目元数据。
2. 第 0--2 章已按当前课题的冻结需求起草；继续替换第 3--8 章中的编写占位内容。
3. 图片放入 `figures/`，用相对路径引用。
4. 采用 XeLaTeX 编译；为生成正确目次、引用和总页数，至少完整编译两轮。

本地使用 `latexmk`：

```text
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

若本机的 `latexmk` 因缺少 Perl 不可用，可依次运行：

```text
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

清理辅助文件：

```text
latexmk -C
```

## Overleaf

项目不含本机绝对路径，可直接上传 Overleaf：

1. 将本目录打包为 ZIP，确保 `main.tex` 位于 ZIP 根目录。
2. 在 Overleaf 选择 **New Project -> Upload Project** 并上传 ZIP。
3. 在项目设置中将 **Main document** 设为 `main.tex`，**Compiler** 设为 **XeLaTeX**。
4. 点击 Recompile；首次编译后再编译一次，使目次、引用和辑要页总页数稳定。

Overleaf 官方说明确认，多文件 LaTeX 项目可整体 ZIP 上传：[Uploading a project](https://docs.overleaf.com/managing-projects-and-files/uploading-a-project)。

## GitHub 与 Overleaf 同步

本目录适合直接作为 Git 仓库根目录。Overleaf 的 GitHub Synchronization 可从一个现有 GitHub 仓库新建 Overleaf 项目，或从一个现有 Overleaf 项目新建 GitHub 仓库；它不能把“两个都已存在”的项目和仓库直接绑定，而且同步需要手动 Push/Pull。该功能目前属于 Overleaf Premium，并仅支持 github.com，详见 [GitHub synchronization](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/github-synchronization)。

推荐顺序：

1. 先在 GitHub 建立新仓库并推送本模板；
2. 在 Overleaf 选择 **New Project -> Import from GitHub**；
3. 后续在 Overleaf 的 Integrations 中手动拉取或推送。

若没有 Overleaf Premium，仍可用 ZIP 上传/下载完成交换，只是没有双向 GitHub 同步。

## 结构与标准要点

- `gbt7713topic.cls`：A4、宋体/黑体与 Times New Roman、五号正文、章内图表公式编号、罗马/阿拉伯页码。
- `metadata.tex`：封面、题名页、辑要页和摘要共用的唯一元数据源。
- `main.tex`：标准结构顺序和可选要素开关位置。
- `references.bib`：配合 `gbt7714-numerical` BibTeX 样式。
- `COMPLIANCE.md`：提交前的标准映射与人工检查清单。

模板默认包含可选的题名页、插图和附表清单、符号和缩略语说明。若报告不需要，可删除 `main.tex` 中对应命令；封面、辑要页、目次、主体和总结不应删除。

## 正文与目次框架

正文层级采用所提供《专题科技报告框架模板》的内容结构，但不复制其 Word 排版。Word 目录中个别条目使用了错误的 TOC 样式；本模板按编号语义将 `3.4.1`、`8.1.1` 等统一实现为三级标题。默认结构为：

```text
0 引言
1 绪论
  1.1 研究背景与意义
  1.2 研究需求与目标
  1.3 面临的关键问题
  1.4 本文研究内容与逻辑关系
    1.4.1 主要研究内容与关键技术
    1.4.2 研究内容的逻辑关系
  1.5 本文组织结构
2 证券担保品估值及价差风险计量技术研究进展综述
3 研究点一 多品种证券担保品估值及价差风险计量技术
4 研究点二 大模型增强的估值及价差风险计量技术
5 研究点三 实际市场结果返回检验与动态监控技术
6 证券担保品估值及价差风险测试系统验证（可选）
7 证券担保品估值及价差风险测试系统应用验证（可选）
8 总结与展望
参考文献
研究期间发表的学术论文与其他相关学术成果
```

第 3--5 章均按“引言—相关研究—方法—实验验证与结果分析—本章小结”展开；方法与实验部分继续细分到三级标题。第 6、7 章由 `main.tex` 顶部的两个布尔开关控制，默认启用。附录不属于所提供目录框架，已在 `main.tex` 中保留为注释化的可选入口。

## 字体

模板优先使用宋体、黑体和 Times New Roman。若 Overleaf/Linux 环境没有微软字体，类文件会自动改用 FandolSong、FandolHei 和 TeX Gyre Termes，以避免上传专有字体文件。Fandol/TeX Gyre 是可移植替代方案；正式提交前应确认主管部门是否接受替代字体，必要时按合法授权方式提供并配置指定字体。
