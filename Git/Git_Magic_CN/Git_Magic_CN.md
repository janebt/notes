#Git 魔法
##1. 入门
###1.1. 游戏人生
###1.2. 版本控制
###1.3. 分布控制
####1.3.1. 一个误区
###1.4. 冲突合并
##2. 基本技巧
###2.1. 保存状态
* 应该牢记，或放到脚本里

		$git init
		$git add .
		$git commit -m "My first backup"
* 文件编辑乱了

		$git reset --hard
		$git commit -a -m "Another backup

####2.1.1. 添加、删除、重命名
	$git add NEWFILES...
	$git rm OLDFILES...
	$git mv OLDFILE NEWFILE

###2.2. 进阶撤销、重做
* 只想把某个时间点之后的所有改动都回滚掉

		$git log	显示最近提交列表和SHA1 哈希值
		$git reset --hard SHA1_HASH		删除比他新的存档
			
* 简单地跳到一个旧状态
		
		$git checkout SHA1_HASH		带回过去，同时保存较新提交
		$git checkout master		带到当下
				PS：git checkout		加载旧游戏存档，以后任何记录都保存另一个分支中。
	
*不喜欢剪切粘贴哈希值

		$git checkout "@{10minutes ago}

* 其他的时间格式 
	
		$git checkout "@{5}"	倒数第五次保存状态

####2.2.1 还原
*还原特定哈希值的提交

	$git commit -a
	$git revert SHA1_HASH

###2.3. 下载文件

	$git clone git://server/path/to/files
	$git clone git://git.or.cz/gitmagic.git

###2.4. 前沿
* 已用 git clone 命令得到了一个项目的一份拷贝，你可以更新到最新版：

		$git pull

###2.5. 即时发布
* 进入你的脚本所在目录：

		$git init
		$git add .
		$git commit -m "First release"

* 假设有ssh权限，告诉你的用户去运行来下载你的脚本：

		$git clone your.computer:/path/to/script

* 如果他们没有权限，需要运行 git daemon 并告诉你的用户去运行：

		$git clone git://your.computer/path/to/script

* 从现在开始，每次你的脚本准备好发布时，就运行：

		$git commit -a -m "Next release "

* 你的用户可以通过进入包含你脚本的目录，并键入下列命令，来更新他们的版本：

		$git pull

###2.6. 我们已经做了什么？
* 找出上次提交之后的改变：

		$git diff

* 或者自昨天：

		$git diff "@{yesterday}"

* 或者一个特定的版本和版本2之间：

		$git diff SHA1_HASH "@{2}"

* 有时我也用 qgit 浏览历史（http://sourceforge.net/projects/qgit）；或者用 tig（http://jonas.nitro.dk/tig）；安装一个Web 服务器，运行 git instaweb

##3. 克隆进阶
###3.1. 计算机间的同步
* 在一个机器上初始化一个 Git 资源库并提交你的文件。然后转另一台机器上：

		$git clone other.computer:/path/to/files

* 创建这些文件和 Git 资源库的第二个拷贝:

		$git commit -a
		$git pull other.computer:/path/to/files

###3.2. 典型源码控制
* 初始化 Git 资源库：

		$git init
		$git add .
		$git commit -m "Initial commit"

* 在中心服务器，初始化一个空的 Git 资源库，如果需要的话，启动 Git 守护进程：

		$GIT_DIR=proj.git git init
		$git daemon --detach #it might already be running

* 把你的项目推到中心服务器：

		$git push git://central.server/path/to/proj.git HEAD

* 开发人员可以这样 checkout 源码：
		$git clone git://central.server/path/to/proj.git

* 在做了改动之后，checkin 源码到主服务器：

		$git commit -a
		$git push

* 如果主服务器已经更新了，最新版在 push 之前需要 checkout。同步到最新版：
		$git commit -a
		$git pull

###3.3. 项目分叉
###3.4. 终极备份
###3.5. 轻快多任务
##4. 分支向导
###4.1. 老板键
	$git checkout -b boss # 之后似乎没啥改变
	$git checkout master
	$git checkout boss
	可以在两个版本之间相切多少次就切多少次，而且每个版本都可以独立提交。

###4.2. 脏活
* 想之后保存临时变更:

		$git checkout -b dirty

* 并且在切换到主分支之前提交。无论你什么时候想返回脏的变更，只需键入：

		$git checkout dirt

* 换一个说法，在 checkout 一个旧状态之后，Git 自动把你放到一个新的，未命名的分支，这个分支可以使用 gitcheckout
-b 来命名和保存。

###4.3. 快速修订
* 正在做某件事的当间，被告知先停下来所有的事情去修理一个新近发现的臭虫：

		$git commit -a
		$git checkout -b fixes SHA1_HASH
		$git commit -a -m "Bug fixed"
		$git push # 到中心资源库
		$git checkout master

###4.4. 不间断工作流
	$git checkout -b part2
	$git checkout master
	$git merge part2
	$git branch -d part2 # 不在需要这个分支

###4.5. 重组杂乱
* 开启一对分支：
	
		$git checkout -b sanitized
		$git checkout -b medley

* 在“sanitized”分支应用给定提交

		$git checkout sanitized
		$git cherry-pickSHA1_HASH

###4.6. 管理分支
* 使用-d -m 选项来删除、移动（重命名）分支

###4.7. 临时分支
* 保存当前状态到一个临时的地方（一个隐藏的地方）并且恢复之前状态。

		$git stash

* 当你想回到隐藏状态的时候，键入：

		$git stash apply # 你可能需要解决一些冲突

* 4.8. 按你希望的方式工作

##5. 关于历史

###5.1. 改正标准
*改变上一条信息：

		$git commit --amend

* 希望在上次提交里包括多一点的改动

		$git commit --amend -a

###5.2. 在这之后
* 后 10 个提交会出现在你喜爱的$EDITOR

		$git rebase -i HEAD~10
* 把一个提交标记为可编辑

		$git rebase --continue

###5.3. 本地变更最后部分

###5.4. 重写历史
* 从所有的提交记录中彻底删除这个文件：

		$git filter-branch --tree-filter `rm top/secret/file`HEAD

###5.5. 制造历史
	$mkdir project;cd project;git init
	$git fast-import </tmp/history

###5.6. 哪儿错了？
* Git 还是可以精确的找出问题所在：

		$git bisect start
		$git bisect bad SHA1_OF_BAD_VERSION
		$git bisect good SHA1_OF_GOOD_VERSION

* 如果还是错误的：

		$git bisect bad

* 如果可以工作了，则把"bad"替换成"good。Git 会再次帮你找到一个以确定的好版本和坏版本之间的状态，通过这种方式缩小范围。一旦完成了问题定位的调查，你可以返回到原始状态，键入：

		$git bisect reset

* 执行如下命令可以自动的完成上面的搜索：

		$git bisect run COMMAND

* Git 使用指定命令的返回值来决定一次改动是否是正确的：命令退出时的代码 0 代表改动是正确的，125 代表要跳过对这次改动的检查，1 到 127 之间的其他数值代表改动是错误的。返回负数将会中断整个 bisect的检查。

###5.7. 谁让事情变糟了？
* 标注出一个指定的文件里每一行内容的最后修改者，和最后修改时间

		$git blame FILE

###5.8. 个人经验
##6. Git 大师
###6.1. 源码发布
	$git archive --format=tar --prefix=proj-1.2.3/ HEAD

###6.2. 历史记录生成
	$git log >Changelog

###6.3. 通过 SSH，HTTP 使用 Git
* 在你的 Web 目录里创建一个 Git 资源库：

		$GIT_DIR=proj.git git init

* 在目录“proj.git”目录，运行

		$git --bare update-server-info
		$chmod a+xhooks/post-update

* 从你的计算机通过 SSH 推送：
		
		$git push we.server:/path/to/proj.git master

* 别人可以通过如下命令，得到你的项目：

		$git clone http://web.server/proj.git

###6.4. 提交变更
* 当你加入、删除、重命名一些文件时，告诉 Git 这个操作是有困难的

		$git add .
		$git add -u

* 单独的一行完成以上的任务。这里-z 和-0 选项可以避免文件名中包含特殊字符带来的错误。注意该命令也添加应该被忽略的文件。这时你或许希望使用-x 或-X 选项。
	
		$git ls-files -d -m -o -z | xargs -0git update-index--add --remove

###6.5. 我的提交太大了！
* 为你做的每次修改，Git 将为你展示变动的代码，并询问该变动是否应是下一次提交的一部分。

		$git add -p

*修改了许多地方的许多文件怎么办：

		git add -i
		或
		git commit --interactive

###6.6. 别丢了你的 HEAD
* HEAD通常指向最新提交，随最新提交向前移动。   
将立即向回移动 HEAD 三个提交：   

		$git reset HEAD~3

* 回到将来：   

		如果你有原先 Head 的 SHA1 值：
			$git reset SHA1
		否则：
			$git reset ORIG_HEAD

###6.7. 猎捕 HEAD
* 可以查看在.git/objects 里所有的哈希值并尝试找到你期望的。

* Git 把算出的提交哈希值记录在.git/logs。这个子目录引用包括所有分支上所有活动的历史，同时文件 HEAD 显示它曾经有过的所有哈希值。后者可以被用来分支上一些不小心丢掉的提交的哈希值。

* 命令 reflog 为访问这些日志提供文件友好的接口

		$git reflog

* 期望去为已删除的提交设置一个更长的保存周期：  
意思是一个被删除的提交会在删除 30 天后，且运行git gc 以后，被永久丢弃。

		$git config gc.pruneexpire "30days"

* 关掉 git gc 的自动运行：  
提交将只在你手工运行 git gc 的情况下才永久删除。

		$git config gc.auto 0

###6.8. 在 Git 上编译
* 用 Git内建 alias 命令来缩短你最常用命令的长度：

		$git config --global alias.co checkout
		$git config --global --get-regexp alias # 显示当前别名
		alias.co checkout
		$git co foo # 和 'git checkout foo ' 一样

* 另一个是在提示符或窗口标题上打印当前分支。调用：

		$git symbolic-ref HEAD

* 显示当前分支名。在实际应用中，你可能最想去掉“refs/heads/”并忽略错误：

		$git symbolic-ref HEAD 2>/dev/null |cut -b 12-

###6.9. 大胆的绝技
* Checkout:强制选项销毁你的变更：

		$git checkout -f COMMIT

* 重置：强制其通过，运行：

		$git reset --hard [COMMIT]

* 分支：强制删除，键入：

		$git branch -D BRANCH # 注意不是 -d

* 强制移动分支，键入：

		$git branch -M [SOURCE]TARGET # 注意不是 -m

##7. 解密
###7.1. 大象无形
###7.2. 数据完整性
* 一个 SHA1 哈希值是一个 160 位的 ID 数。对一个文件而言，其整体内容的哈希值可以被看作这个文件的唯一标识 ID 数。
* 所有 Git 处理的文件通过他们的唯一 ID 来引用，而不是通过他们的文件名。所有数据保存在“.git/objects”
子目录里，那里你找不到任何标准的文件名。

###7.3. 智能
###7.4. 索引
###7.5. 裸资源库
* 大多数 Git 命令默认 Git 的索引是存放在.git 目录，但在这些裸资源库上并不是这样，可以设置环境变量 GIT_DIR 来指定裸资源库所在路径，或者在裸资源库的目录里运行 Git 时加上--bare 选项。

###7.6. Git 起源

##8. Git 的缺点
###8.1. 微软 Windows
* Cygwin或Git on MSys

###8.2. 无关的文件
* 一个方案是将你的项目拆成小块，每个都由相关文件组成。

		git submodule

###8.3. 谁在编辑什么？
###8.4. 文件历史
###8.5. 初始克隆
###8.6. 不稳定的项目
###8.7. 全局计数器
###8.8. 空子目录
###8.9. 初始提交
* Git 将从定义零提交中受益：一旦一个资源库被创建起来，HEAD 将被设为包含 20 个零字节的字符串。这个特别的提交代表一棵空的树，没有父节点，早于所有 Git 资源库
* 每个初始提交都隐式地成为这个零提交的后代。例如，重新修订一个不相关的分支将使得整个分支被加入到零提交里。这样，除了初始提交命令之外的所有命令都会被应用，这会导致一个合并冲突。一个绕过的办法是在初始提交上紧跟着 gitcommit -c，再使用 git checkout，之后继续重新修订剩下的。