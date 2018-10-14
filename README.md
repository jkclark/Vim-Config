# Vim Config
A script to configure my Vim environment, along with necessary files

## install.sh
Even with comments, sometimes it's hard to understand what's going on in bash
scripts, especially if you're new to bash or Vim. I know I had to spend some time figuring
out what was going on. Here's what's happening:

1. Set a flag to force the script to exit immediately if it encounters an error.
2. Create directories where files are going to be installed.
3. Copy the colorscheme files (colors/\*.vim) to the colors directory we just made (~/.vim/colors).
4. Install Vundle, the Vim package manager I like to use. We clone (copy) it from Github.
5. Copy the contents of .vimrc (the configuration file where a lot of the magic happens) to its home (~/.vim).
6. Open Vim, call ':PluginInstall', which installs all of our plugins, then quit Vim.
7. Install fonts that have been patched and adjusted to work with the "Powerline" plugin.
   + At this point we follow the instructions from the Powerline plugin.
8. Lastly, we remind ourselves that the fonts _are_ installed, but the symbols won't appear until
	we select one in whatever terminal we are using.

## colors
I'm currently happy with Brogrammer, a colorscheme I was using when I coded with Sublime
Text 2. I found [vim-brogrammer-theme] and modified it slightly. Here are the changes I made:
+ Comment changed from ![#626262][comment-original] to ![#9e9e9e][comment-new]
+ NonText changed from ![#0000ff][nontext-original] to ![#ff0087][nontext-new]
+ SpecialKey changed from ![#0000ff][specialkey-original] to ![#0087ff][specialkey-new]
+ Number changed from ![5f5fd7][number-original] to ![ffaf5f][number-new]

[vim-brogrammer-theme]: https://github.com/marciomazza/vim-brogrammer-theme
[comment-original]: https://placehold.it/15/626262/000000?text=+ "#626262"
[comment-new]: https://placehold.it/15/9e9e9e/000000?text=+ "#9e9e9e"
[nontext-original]: https://placehold.it/15/0000ff/000000?text=+ "#0000ff"
[nontext-new]: https://placehold.it/15/ff0087/000000?text=+ "#ff0087"
[specialkey-original]: https://placehold.it/15/0000ff/000000?text=+ "#0000ff"
[specialkey-new]: https://placehold.it/15/0087ff/000000?text=+ "#0087ff"
[number-original]: https://placehold.it/15/5f5fd7/?text=+ "#5f5fd7"
[number-new]: https://placehold.it/15/ffaf5f/?text=+ "#ffaf5f"

## .vimrc
### Layout
My .vimrc follows this basic layout:
1. [Settings](https://github.com/jkclark/Vim-Setup/blob/master/.vimrc#L8)
2. [Mappings](https://github.com/jkclark/Vim-Setup/blob/master/.vimrc#L102)
3. [Plugins](https://github.com/jkclark/Vim-Setup/blob/master/.vimrc#L136)

### Settings
Many of the settings in .vimrc were taken from [nvie's .vimrc](https://github.com/nvie/vimrc/blob/master/vimrc).
You can look up any individual setting and find out more about what it does. Some settings worth mentioning:
+ `set list`: Show invisible characters by default. Some people might not like this. I find that it makes me
pay more attention to indenting and style than I normally would. It also helps me compare indentation levels
of lines that are far apart.
+ `set cmdheight=2`: Show a status bar that is 2 lines high. This way, nothing gets inadvertently covered up
by vim-airline.

### Mappings
The mappings are pretty self-explanatory. Most of them have comments explaining what they do.

### Plugins
+ [Vundle][Vundle] (short for _Vim Bundle_) is a package manager for Vim. There are many options for plugin managers, this is
just the one that I prefer.
+ [Vim colorschemes][Vim colorschemes] is a one stop shop for colorschemes for Vim.
+ [NERD Commenter][NERD Commenter] supercharges your commenting abilities.
+ [Auto Pairs][Auto Pairs] lets you insert brackets, parentheses, etc. in pairs.
+ [surround.vim][Surround.vim] makes "surrounding" blocks of code with brackets, parens, etc. easy.
+ [Supertab][Supertab] allows you to use <Tab> for all your insertion needs.
+ [NERD Tree][NERD Tree] is a tree explorer plugin for Vim.
+ [vim-gitgutter][vim-gitgutter] shows a git diff in the sign column of Vim.
+ [vim-airline][vim-airline] draws a nice statusbar at the bottom of each Vim window.
+ [vim-airline-themes][vim-airline-themes] are themes for vim-airline.
+ [fugitive.vim][fugitive.vim] is a Git wrapper for Vim.
+ [UltiSnips][UltiSnips] is a fast code snippet plugin for Vim.
+ [vim-go][vim-go] is a Go development plugin for Vim.
+ [Syntastic][Syntastic] is a code syntax checking plugin for Vim.

[Vundle]: https://github.com/VundleVim/Vundle.vim
[Vim colorschemes]: https://github.com/flazz/vim-colorschemes
[NERD Commenter]: https://github.com/scrooloose/nerdcommenter
[Auto Pairs]: https://github.com/jiangmiao/auto-pairs
[surround.vim]: https://github.com/tpope/vim-surround
[Supertab]: https://github.com/ervandew/supertab
[NERD Tree]: https://github.com/scrooloose/nerdtree
[vim-gitgutter]: https://github.com/airblade/vim-gitgutter
[vim-airline]: https://github.com/vim-airline/vim-airline
[vim-airline-themes]: https://github.com/vim-airline/vim-airline-themes
[fugitive.vim]: https://github.com/tpope/vim-fugitive
[UltiSnips]: https://github.com/SirVer/ultisnips
[vim-go]: https://github.com/fatih/vim-go
[Syntastic]: https://github.com/vim-syntastic/syntastic
