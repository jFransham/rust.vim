# rust.vim

## Description

This is a vim plugin that provides [Rust][r] file detection, syntax highlighting, and (optional) autoformatting.

This fork adds cargo support (runs `cargo rustc -Zno-trans`, which just checks the
code and does not compile) and cargo-clippy support (requires [cargo-clippy][cl] to be
installed and on your `$PATH`).

## Installation

### Using [Vundle][v]

1. Add `Plugin 'jFransham/rust.vim'` to `~/.vimrc`
2. `vim +PluginInstall +qall`

*Note:* Vundle will not automatically detect Rust files properly if `filetype
on` is executed before Vundle. Please check the [quickstart][vqs] for more
details.

### Using [Pathogen][p]

```shell
git clone --depth=1 https://github.com/jFransham/rust.vim.git ~/.vim/bundle/rust.vim
```

[r]: https://www.rust-lang.org
[v]: https://github.com/gmarik/vundle
[vqs]: https://github.com/gmarik/vundle#quick-start
[p]: https://github.com/tpope/vim-pathogen
[nb]: https://github.com/Shougo/neobundle.vim
[cl]: https://github.com/arcnmx/cargo-clippy

### Using [NeoBundle][nb]

1. Add `NeoBundle 'jFransham/rust.vim'` to `~/.vimrc`
2. Re-open vim or execute `:source ~/.vimrc`

## Enabling autoformat

This plugin can optionally format your code using [rustfmt][rfmt] every time a
buffer is written. Simple put `let g:rustfmt_autosave = 1` in your `.vimrc`.

## Help

Further help can be found in the documentation with `:Helptags` then `:help rust`.

## License

Like Rust, rust.vim is primarily distributed under the terms of both the MIT
license and the Apache License (Version 2.0). See LICENSE-APACHE and
LICENSE-MIT for details. 
