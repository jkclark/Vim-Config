# Vim Setup
A script to set up my Vim environment, along with necessary files

## install.sh
Even with comments, sometimes it's hard to understand what's going on in bash
scripts, especially if you're new to Vim. I know I had to spend some time figuring
out what was goign on. Here's what's happening:

1. Set a flag to force the script to exit immediately if it encounters an error.
2. Create directories where files are going to be installed.
3. Copy the colorscheme files (colors/\*.vim) to the colors directory we just made (~/.vim/colors).
4. Install Vundle, the Vim package manager I like to use. We clone (copy) it from Github.
5. Copy the contents of .vimrc (the configuration file where a lot of the magic happens) its home (~/.vim).
6. Open Vim, call ':PluginInstall', which installs all of our plugins, then quit Vim.
7. Install fonts that have been patched and adjusted to work with the "Powerline" plugin.
   + At this point we follow the instructions from the Powerline plugin.
8. Lastly, we remind ourselves that the fonts _are_ installed, but the symbols won't appear until
	we select them in whatever terminal we are using.

## colors
I'm currently happy with Brogrammer, a colorscheme I was using when I coded with Sublime
Text 2. I found [vim-brogrammer-theme] and modified it slightly. Here are the changes I've made:
+ Comments changed from 

[vim-brogrammer-theme]: https://github.com/marciomazza/vim-brogrammer-theme
## .vimrc
### Layout
My .vimrc follows this basic layout:
1. [Settings](#settings)
2. [Mappings](#mappings)
3. [Plugins](#plugins)

### Settings

### Mappings

### Plugins

- ![#f03c15](https://placehold.it/15/f03c15/000000?text=+) `#f03c15`
- ![#c5f015](https://placehold.it/15/c5f015/000000?text=+) `#c5f015`
- ![#1589F0](https://placehold.it/15/1589F0/000000?text=+) `#1589F0`
