@echo off
REM Version control must be installed to ensure that we can
REM correctly install the vim git hub dependencies and setup the correct
REM http proxy settings.
call version-control.bat

REM main vim install
choco install vim

REM python2 is needed for many plugins
choco install python2-x86_32

REM python3 is needed for syntax validation
choco install python-x86_32

REM lua is needed for plugins
choco install lua

REM ctags is needed for code navigation
choco install ctags

REM vundle requires curl
choco install curl

REM install vundle package manager for vim
echo Installing Vundle Package Manager
mkdir %USERPROFILE%\vimfiles
mkdir %USERPROFILE%\vimfiles\bundle
git clone https://github.com/gmarik/Vundle.vim.git %USERPROFILE%/vimfiles/bundle/Vundle.vim

echo Installing dot files for vim
mkdir %USERPROFILE%\dotfiles
git clone https://github.com/ianreay/dotfiles.git %USERPROFILE%/dotfiles

mklink /H %USERPROFILE%\_gvimrc %USERPROFILE%\dotfiles\_gvimrc
mklink /H %USERPROFILE%\_vimrc %USERPROFILE%\dotfiles\_vimrc
mklink /H %USERPROFILE%\bundles.vim %USERPROFILE%\dotfiles\bundles.vim
mklink /H %USERPROFILE%\grep.vim %USERPROFILE%\dotfiles\grep.vim

echo "Installing vim plugins"

vim.exe +PluginInstall +qall

echo "Installing vim snippets"

git clone https://github.com/ianreay/ultisnips.git %USERPROFILE%/vimfiles/ultisnips

echo "Please restart command prompt to have environment changes take effect."
