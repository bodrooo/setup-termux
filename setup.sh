#1/bin/bash

clear

packages=('git' 'tree' 'python' 'gh' 'curl' 'wget')
for package in $packages;
do 
  pkg install $package -y
done

pip_package=('autopep8')
for pip in $ip_package;
do 
  pkg install $pip -y
done


cd $HOME

touch .bashrc

echo '
alias cls="clear"
alias gc="git commit -m"
alias ga="git add ."
alias gb="git branch -M"
alias py="python"

alias rm="rm -rf"

function create-repo {
  gh repo create $1 --${2:-public} --remote=upstream --source=. --push
}

function venv {
  base_dir=$(pwd)
  cd $HOME
  python -m venv $1
  source $1/bin/activate
  pip install --upgrade pip
  cd $base_dir
}
'
exit