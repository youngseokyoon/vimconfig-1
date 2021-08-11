#!/bin/sh

croot=`pwd`
symbol_dir=`basename $croot`

unlink ${HOME}/${symbol_dir}
ln -s ${croot} $HOME/$symbol_dir

if [ -e $HOME/.vimrc -o -e $HOME/.vim ]; then
    echo "경고: 설치를 진행하려면 ~/.vim/ 디렉토리와 ~/.vimrc 파일을 삭제해야 합니다."
    exit 1
fi

echo "심볼릭 릭크 생성..."
ln -sfv ${croot}/vimrc ~/.vimrc

echo "vundle 다운로드중..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

echo "vundle 설치중..."
vi -c :BundleInstall -c :qa
