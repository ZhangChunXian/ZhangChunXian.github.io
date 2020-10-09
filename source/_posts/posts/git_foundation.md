---
title: Git 基础回顾
url: git_foundatoin_url
tags:
  - 软件应用
  - 开发
categories:
  - 软件应用
  - 开发
date: 2020-10-01 12:00:00
---

前言: 最近换了一台新笔记本,  需要花费大量时间个人定制笔记本上的编程环境. 对于一个计算机专业的学生来说, git肯定是必不可少的. 说来惭愧, 本人在初次用命令行学习git后就转向了Github Desktop和vscode的图形化界面来进行日常的代码版本控制, 没有很好的将命令行运用在平时的学习中. 加上九月份Github Cli 稳定版发布, Github上的操作也可以用命令行完成, 故趁部署个人开发环境之机回顾所学Git知识与操作, 培养命令行操作的习惯.

更重要的原因是, 在旁听某个Linux操作系统通识课时, w接触到一位熟练掌握Linux命令行和快捷键的大二软件工程专业学长, 全程脱离鼠标,仅仅在键盘上就完成了平时开发的各项操作. 顿时感到钦佩, 真正领略到了命令行的魅力,并长叹“我要这鼠标有何用”(狗头), 并在学长好基友的怂恿下“入了教”, 悉心向教主学习. 

**注: 本文仅仅涉及到git的冰山一角, 仅仅满足学生日常小项目开发需求, 更多操作可参考书籍或git官方文档**

#  Git 基础回顾

<!-- more -->

## 1. git基本工作流程

Git基本工作区域可以分为以下三部分

1. Working Directory(工作区)

   添加, 编辑, 修改文件等动作

2. 暂存区

   暂存已经修改的文件统一提交到git仓库中. 
   
3.  Git Repository(Git仓库)

   最终确定的文件保存在仓库, 成为一个新的版本. 

## 2.git本地操作

### 基本信息设置(全局)

在工程项目文件夹中右键选择`Git Bash Here`, 打开`git`命令行.

设置用户名(username即为Github用户名)

```shell
git config --global user.name "username"
```

设置用户名邮箱(useremail即为Github注册邮箱, **不用加引号**)

```shell
git config --global user.email useremail
```

使用下列命令查看是否设置成功

```shell
git config --list
```

在下面出现的信息中出现`user.name:`, `user.email` , 以及后面信息均正确则说明配置成功.

> 常用Linux命令
>         `pwd`查看当前动作目录, 返回当前工作目录的绝对路径
>
> `ls`查看在此文件夹中的文件(非隐藏文件)
> 		ls -a 查看所有文件包括隐藏文件.  比如git初始化后生成的`.git`文件夹就是隐藏文件, ls命令是看不到的.

### 初始化一个Git仓库

1. 创建文件夹(在Git bash中运用Linux命令)

   ```shell
   mkdir foldername
   ```

   foldername对应与创建文件夹的名字
   
2. 在文件内初始化Git(创建git仓库)

   通过Linux命令进入文件夹.

   ```shell
   cd foldername
   ```

   逆操作: 返回上一级文件夹

   ```shell
   cd ..
   ```

   初始化Git
   
   ```shell
   git init
   ```
   
   之后在新创建文件夹中会出现隐藏文件`.git`(如果看不到的话设置电脑显示隐藏文件)

### 向仓库中添加文件

**一开始的操作均是在本地工作区(Working Directory)**

1. 新建文件

   ```shell
   touch filename
   ```

   文件夹中便会出现目标文件

   > git常用命令
   >
   > git status 可以查看当前工作目录的状态.
   
   在git bash中输入Linux命令 `git status`, 输出
   
   ```shell
   On branch master					# 当前处于仓库中的master分支
   
   No commits yet						# 还没有commit
   
   Untracked files:
     (use "git add <file>..." to include in what will be committed)	# 检测到未提交(add)的改变
           filename
   
   nothing added to commit but untracked files present (use "git add" to track)
   
   ```
   
   
   
2. 编辑(修改)新文件(可选)

   在git bash中输入以下命令

   ```shell
   vim filename                           # 在命令行中打开vim编辑器修改文件
   ```

 会出现许多以`-`开头的空行,并在下方显示`filename [unix] (time date) `                                                                                                                                                                                                          		在空行区域即可用vim编辑文件, 注意先按 “i”键进入插入模式再开始编辑!

题外话: vim编辑器是知乎, 学长, Google等都在推荐的编辑器, 目前为止我还不是习惯vim这种极简的编辑器(当然以后会折腾vim的配置), 正在努力适应.

当然也可以用编辑器或者IDE来编辑(修改文件), 在git bash中输入以下命令

````shell
code .						# 使用vscode打开当前文件夹
````

​	3. 退出文件修改并保存(命令行中, 可选)

按esc键(结束输入), 并在下方输入`:wq`,退出编辑.

>Linux命令
>
>cat filename				// 查看当前文件中的内容

4.  将修改文件提交到暂存区

   在修改文件所在文件夹中打开git bash 输入以下命令

   ```shell
   git add 'filename'				# 将新文件提交到 暂存区
   ```
   当改变的文件较多，git add 逐个提交命令繁琐或者不上传新文件，被删除文件时，以用如下的命令

   ```shell
   git add -A  # 提交所有变化
   git add -u  # 提交被修改(modified)和被删除(deleted)文件，不包括新文件(new)
   git add .  #提交新文件(new)和被修改(modified)文件，不包括被删除(deleted)文件
   ```
>此时输入 git status 会显示如下
>
>On branch master
>
>No commits yet
>
>Changes to be committed:
>   (use "git rm --cached <file>..." to unstage)
>        new file:   filename																// 显示暂存区内的新文件

**此时文件从本地工作区提交到暂存区.**

5. 将暂存区文件添加到仓库

   在git bash 中输入以下命令

   ```shell
   git commit -m "Your description about this change"			# ''中填写你对本次修改的说明(必须)
   ```

6.  删除文件并提交到仓库

   Linux命令从工作区中删除文件

   ```shell
   rm -rf filename											 # 删除文件
   ```

   从git中删除文件

   ```shell
   git rm filename											# filename指的是需要操作的文件名
   ```

   提交操作

   ```shell
   git commit -m 'Your description about this change'		# ''中填写你对本次修改的说明(必须)
   ```

##  3. Git管理远程仓库

   作用: 备份, 实现代码共享集中化管理.

1. 将Github远程仓库clone到本地

   ```shell
   git clone repository_location				# repository location指的是需要复制的远程仓库地址
   ```
2. 对克隆到本地的Github仓库进行操作(详见2.git本地操作)

3. 将本地仓库同步到git远程仓库中

   ```shell
   git push
   ```

4. （可选）在本地已经有工作区，需要从GitHub远程仓库更新到本地工作区

   ```shell
   git pull origin branchname	// branchname指的是需要更新的分支的名称
   ```

   使用git pull 更新，相当于是从远程获取最新版本并merge到本地

## 4. 拓展

> Git website: http://git-scm.com
>
> Free on-line book: http://git-scm.com/book
>
> Reference page for Git:http://gitref.org/index.html
>
> Git tutorial :http://schacon.github.com/git/gittutorial.html
>
> Git for Computer Scientists: http://eagain.net/articles/git-for-computer-scientists/ 

在命令行中, 输入以下指令获取更多git指令

```shell
git help verb     # verb = config, add, commit, etc
```

推荐书籍:

# Pro Git

[![Pro Git](https://img9.doubanio.com/view/subject/s/public/s4245786.jpg)](https://img9.doubanio.com/view/subject/l/public/s4245786.jpg)

作者: [Scott Chacon](https://book.douban.com/author/4560652/)
		出版社: Apress
		出版年: 2009-8-27
		页数: 288
		定价: USD 34.99
		装帧: Paperback
		ISBN: 9781430218333





结语: 仅仅掌握这些是远远不够的, 真实的项目开发要复杂的多, git也不是一篇两篇文章可以掌握的. 后续会参考一些书籍与视频, 完善git从入门到精通的种种操作,  争取将git熟练运用于真实的项目开发中.