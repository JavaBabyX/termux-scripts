# vim or nano depending on your preference but it's not neccessary
# pkg install vim
pkg install proot -y
pkg install proot-distro -y
# use "proot-distro" to learn more about the available builds...
proot-distro install archlinux
# this allows you to access your data in this isolated shell environment (--termux-home)
proot-distro login archlinux --termux-home
