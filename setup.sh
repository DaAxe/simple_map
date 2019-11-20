#!/bin/sh

echo 'Installing bundler'
gem install bundler

echo 'Setting up bundler'
bundle init

echo 'Adding Bundled Gems'
bundle add colorize
bundle add terminal-table
bundle add tty

echo 'Installing Bundled Gems'
bundle install

#bundle exec 
# echo 'Installing Gem: Colorize'
# gem install colorize
# echo 'colorize Installed'
# echo 'Installing Gem: Terminal-Table'
# sudo gem install terminal-table
# echo 'Terminal-Table Installed'
