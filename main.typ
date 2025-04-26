#import "chicv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )
  let current = translate(
    zh: [至今],
    en: [Present]
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let ncu_date = [#translate-date(9, 2023) -- #current]
    let gpa = 3.34
    translate(
      en: cventry(
        tl: [B.S. in Artificial Intelligence at *Nanchang University*, Nanchang, China (Expected Graduation: TBD)], // 结束时间待定
        tr: ncu_date,
      )[
        GPA: #gpa/4.00, Advisor: Zichen Xu\
        *Honors & Activities:*
        - Current Captain of the Nanchang University Supercomputing Team.
        - Participated in ASC24 & ASC25 Supercomputing Challenges, won Second Prize.
        - Led the design of the lab website GOODPAge.
        - First Prize in the 14th MATHORCUP Mathematical Application Challenge (2024).
      ],
      zh: cventry(
        tl: [南昌大学，人工智能专业，本科学士学位在读，中国南昌],
        tr: ncu_date,
      )[
        GPA: #gpa/4.00, 导师: 徐子晨\
        *荣誉与活动:*
        - 现任南昌大学超算队队长
        - 参与 ASC24、ASC25 超算竞赛，获二等奖
        - 主导实验室网站 GOODPAge 设计
        - 2024 年第十四届 MATHORCUP 数学应用挑战赛全国一等奖
      ],
    )
  }

  let goodpage = {
    let ghLink = githublink("LEtorpedo/GoodPage")
    translate(
      en: cventry(
        tl: [*NCU GOOD Lab Homepage (GoodPage)*, Led the design and development of the lab's official website.],
        tr: ghLink,
      )[
        - Frontend built with Next.js (App Router), TypeScript, Tailwind CSS, and Framer Motion.
        - Integrated Prisma with SQLite for data management (e.g., members, publications).
        - Responsible for overall architecture, UI/UX design, and key feature implementation.
      ],
      zh: cventry(
        tl: [*南昌大学 GOOD 实验室主页 (GoodPage)*，主导设计和开发实验室官方网站],
        tr: ghLink,
      )[
        - 前端使用 Next.js (App Router), TypeScript, Tailwind CSS, Framer Motion 构建。
        - 集成 Prisma 和 SQLite 进行数据管理（如成员、出版物信息）。
        - 负责整体架构、UI/UX 设计及核心功能实现。
      ],
    )
  }

  let skills = {
    translate(
      en: [- *Programming Languages:* Proficient in Python, C++; Familiar with JavaScript.],
      zh: [- *编程语言:* 精通 Python, C++; 熟悉 JavaScript。]
    )
    translate(
      en: [- *Frameworks & Libraries:* Familiar with PyTorch (ML/DL), Next.js (Web).],
      zh: [- *框架与库:* 熟悉 PyTorch (机器学习/深度学习), Next.js (Web)。]
    )
    translate(
      en: [- *Tools & Technologies:* In-depth understanding of CUDA (HPC); Familiar with Git, Docker, Linux.],
      zh: [- *工具与技术:* 深入理解 CUDA (高性能计算); 熟悉 Git, Docker, Linux。]
    )
    translate(
      en: [- *Domains:* Artificial Intelligence, Machine Learning, Deep Learning, High-Performance Computing (HPC), Web Development.],
      zh: [- *领域知识:* 人工智能, 机器学习, 深度学习, 高性能计算 (HPC), Web 开发。]
    )
  }

  let misc = {
    translate(
      en: [- Languages: Chinese - Native, English - CET-4 (508)],
      zh: [- 语言: 汉语 - 母语, 英语 - CET-4 (508分)]
    )
  }

  // Start of the document

  translate(en: [= #smallcaps[Pinye Wang]], zh: [= #smallcaps[王品烨]])

  [#link("mailto:at0rp1d0i@gmail.com")[at0rp1d0i\@gmail.com] $dot.c$ #iconlink("https://github.com/LEtorpedo", icon: "github")]

  edu

  translate(en: [== Related Projects], zh: [== 项目经历])
  goodpage

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc
}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
