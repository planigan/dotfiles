#!/usr/bin/python
# coding=UTF-8
# These glyphs, and the mapping of file extensions to glyphs
# has been copied from the vimscript code that is present in
# https://github.com/ryanoasis/vim-devicons
import re;
import os;

# all those glyphs will show as weird squares if you don't have the correct patched font
# My advice is to use NerdFonts which can be found here:
# https://github.com/ryanoasis/nerd-fonts
file_node_extensions = {
    'styl'     : '',
    'scss'     : '',
    'sass'     : '',
    'htm'      : '',
    'html'     : '',
    'slim'     : '',
    'erb'      : '',
    'ejs'      : '',
    'css'      : '',
    'less'     : '',
    'md'       : '',
    'markdown' : '',
    'json'     : '',
    'js'       : '',
    'jsx'      : '',
    'rb'       : '',
    'ru'       : '',
    'php'      : '',
    'py'       : '',
    'pyc'      : '',
    'pyo'      : '',
    'pyd'      : '',
    'coffee'   : '',
    'mustache' : '',
    'hbs'      : '',
    'conf'     : '',
    'ini'      : '',
    'yml'      : '',
    'bat'      : '',
    'jpg'      : '',
    'jpeg'     : '',
    'bmp'      : '',
    'png'      : '',
    'gif'      : '',
    'ico'      : '',
    'twig'     : '',
    'cpp'      : '',
    'c++'      : '',
    'cxx'      : '',
    'cc'       : '',
    'cp'       : '',
    'c'        : '',
    'hs'       : '',
    'lhs'      : '',
    'lua'      : '',
    'java'     : '',
    'sh'       : '',
    'fish'     : '',
    'ml'       : 'λ',
    'mli'      : 'λ',
    'diff'     : '',
    'db'       : '',
    'sql'      : '',
    'dump'     : '',
    'clj'      : '',
    'cljc'     : '',
    'cljs'     : '',
    'edn'      : '',
    'scala'    : '',
    'go'       : '',
    'dart'     : '',
    'xul'      : '',
    'sln'      : '',
    'suo'      : '',
    'pl'       : '',
    'pm'       : '',
    't'        : '',
    'rss'      : '',
    'f#'       : '',
    'fsscript' : '',
    'fsx'      : '',
    'fs'       : '',
    'fsi'      : '',
    'rs'       : '',
    'rlib'     : '',
    'd'        : '',
    'erl'      : '',
    'hrl'      : '',
    'vim'      : '',
    'ai'       : '',
    'psd'      : '',
    'psb'      : '',
    'ts'       : '',
    'jl'       : ''
}

file_node_exact_matches = {
    'exact-match-case-sensitive-1.txt' : 'X1',
    'exact-match-case-sensitive-2'     : 'X2',
    'gruntfile.coffee'                 : '',
    'gruntfile.js'                     : '',
    'gruntfile.ls'                     : '',
    'gulpfile.coffee'                  : '',
    'gulpfile.js'                      : '',
    'gulpfile.ls'                      : '',
    'dropbox'                          : '',
    '.ds_store'                        : '',
    'Gemfile'                          : '',
    'Guardfile'                        : '',
    'Rakefile'                         : '',
    'Procfile'                         : '',
    '.gitconfig'                       : '',
    '.gitignore'                       : '',
    '.bashrc'                          : '',
    '.bashprofile'                     : '',
    'favicon.ico'                      : '',
    'license'                          : '',
    'node_modules'                     : '',
    'react.jsx'                        : '',
    'procfile'                         : ''
}

def devicon(file):
  if file.is_directory: return ''
  return file_node_exact_matches.get(file.relative_path, file_node_extensions.get(file.extension, ''))
