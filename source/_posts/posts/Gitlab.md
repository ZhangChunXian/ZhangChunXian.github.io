# gitlab 克隆仓库前的操作

https://blog.csdn.net/Alvin_Lam/article/details/90513353

通过SSH克隆远程仓库（GitLab）到本地

由于不是任何用户都能从远程仓库克隆到本地的，也是需要鉴别的，因此本地需要用git bash 创建一个公钥，而远程仓库也要把这个公钥保存下来，进而本地才可以从远程download。主要步骤如下：

1.首先需要下载一个git for windows，成功安装。

2.在github或者gitlab上有自己的账户。

3.打开git bash.exe 输入ssh-keygen -t rsa -C "your_email@example.com" 使用你的邮箱用ssh-keygen命令创建密码对。注意ssh-keygen命令中间没有空格，如果在ssh后面加上空格，会得到Bad escape character 'ygen'.的错误。

4.在目录C:\Users\your_name\.ssh 目录下找到生成的公钥文件id_rsa.pub，记事本打开，将里面的内容复制到剪贴板。

5.打开新建的github或者gitlab账户，找到SSH Keys选项如图：

![](../../images/20170616000042021)
将剪贴板内容粘贴到内容框中，title可以用默认的邮箱名字，最后点击add。这就代表这个用户被远程仓库所承认了，接下来就可以克隆仓库了。

6.可以先选择一个空文件夹用来储存克隆下来的项目，然后鼠标右键选择git bash here，然后输入命令 git clone + 自己Git库的地址，如图

![](../../images/20170616001413481)

Receiving objects :100% Resolving deltas:100%  代表远程仓库项目已经下载到本地。

创建SSH的目的：

创建SSH KEY(这个作用是来识别你的电脑，相当于人的身份证号)，在你的c盘用户目录下面（我的目录--C:\Users\LX）看看有没有.ssh目录，如果有，再看看这个目录下有没有id_rsa和id_rsa.pub这两个文件，如果已经有了，可直接跳到下一步。如果没有，打开Shell（Windows下打开Git Bash），创建SSH Key：$ ssh-keygen -t rsa -C "youremail@example.com"，
你需要把邮件地址换成你自己的邮件地址，然后一路回车，使用默认值即可，由于这个Key也不是用于军事目的，所以也无需设置密码。
如果一切顺利的话，可以在用户主目录里找到.ssh目录，里面有id_rsa和id_rsa.pub两个文件，这两个就是SSH Key的秘钥对，id_rsa是私钥，不能泄露出去，id_rsa.pub是公钥，可以放心地告诉任何人。