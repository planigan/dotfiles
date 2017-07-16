;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
    ;; Base distribution to use. This is a layer contained in the directory
    ;; `+distribution'. For now available distributions are `spacemacs-base'
    ;; or `spacemacs'. (default 'spacemacs)
    dotspacemacs-distribution 'spacemacs
    ;; Lazy installation of layers (i.e. layers are installed only when a file
    ;; with a supported type is opened). Possible values are `all', `unused'
    ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
    ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
    ;; lazy install any layer that support lazy installation even the layers
    ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
    ;; installation feature and you have to explicitly list a layer in the
    ;; variable `dotspacemacs-configuration-layers' to install it.
    ;; (default 'unused)
    dotspacemacs-enable-lazy-installation 'unused
    ;; If non-nil then Spacemacs will ask for confirmation before installing
    ;; a layer lazily. (default t)
    dotspacemacs-ask-for-lazy-installation t
    ;; If non-nil layers with lazy install support are lazy installed.
    ;; List of additional paths where to look for configuration layers.
    ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
    dotspacemacs-configuration-layer-path '()
    ;; List of configuration layers to load.
    dotspacemacs-configuration-layers
    '(
       python
       octave ;; ----------------------------------------------------------------
       ;; Example of useful layers you may want to use right away.
       ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
       ;; <M-m f e R> (Emacs style) to install them.
       ;; ----------------------------------------------------------------
       helm
       (auto-completion :variables
         auto-completion-enable-snippets-in-popup t)
       better-defaults
       emacs-lisp
       git
       github
       org
       pandoc
       deft
       (ranger :variables ranger-show-preview t)
       (shell :variables
         shell-default-shell 'ansi-term
         shell-default-term-shell "/bin/bash"
         shell-default-height 30
         shell-default-position 'bottom)
       spell-checking
       syntax-checking
       (version-control :variables
         version-control-diff-side 'left)
       github
       themes-megapack
       theming
       ;; vim-powerline
       emoji
       html
       colors
       markdown
       ;; javascript
       ;; react
       aj-javascript
       (ruby :variables
         ruby-version-manager 'rvm
         ;;ruby-enable-enh-ruby-mode t
         )
       ruby-on-rails
       (gtags :variables gtags-enable-by-default t)
       yaml
       go
       (sql :variables sql-capitalize-keywords t)
       vimscript
       shell-scripts
       ;; (erc :variables
       ;;      erc-server-list
       ;;      '(("irc.freenode.net"
       ;;         :port "6697"
       ;;         :ssl t
       ;;         :nick "planigan")
       ;;        ("irc.gitter.im"
       ;;         :port "6667"
       ;;         :ssl t
       ;;         :nick "planigan")))
       ;;osx

       ;; OS conditional layers
       ;; ,@(when (string= system-type "darwin")
       ;; ((if (eq system-type 'darwin)
       ;; '(osx
       ;; (shell :variables shell-default-shell 'ansi-term shell-default-term-shell "/bin/zsh")
       ;; )))
       )
    ;; List of additional packages that will be installed without being
    ;; wrapped in a layer. If you need some configuration for these
    ;; packages, then consider creating a layer. You can also put the
    ;; configuration in `dotspacemacs/user-config'.
    dotspacemacs-additional-packages
    '(
       ;; editorconfig
       react-snippets
       rjsx-mode
       nodejs-repl
       mode-icons
       minimap
       all-the-icons
       (all-the-icons-dired :location (recipe :fetcher github :repo "jtbm37/all-the-icons-dired"))
       )
    ;; A list of packages that cannot be updated.
    dotspacemacs-frozen-packages '()
    ;; A list of packages that will not be installed and loaded.
    dotspacemacs-excluded-packages '()
    ;; Defines the behaviour of Spacemacs when installing packages.
    ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
    ;; `used-only' installs only explicitly used packages and uninstall any
    ;; unused packages as well as their unused dependencies.
    ;; `used-but-keep-unused' installs only the used packages but won't uninstall
    ;; them if they become unused. `all' installs *all* packages supported by
    ;; Spacemacs and never uninstall them. (default is `used-only')
    dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
    ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
    ;; possible. Set it to nil if you have no way to use HTTPS in your
    ;; environment, otherwise it is strongly recommended to let it set to t.
    ;; This variable has no effect if Emacs is launched with the parameter
    ;; `--insecure' which forces the value of this variable to nil.
    ;; (default t)
    dotspacemacs-elpa-https t
    ;; Maximum allowed time in seconds to contact an ELPA repository.
    dotspacemacs-elpa-timeout 5
    ;; If non-nil then spacemacs will check for updates at startup
    ;; when the current branch is not `develop'. Note that checking for
    ;; new versions works via git commands, thus it calls GitHub services
    ;; whenever you start Emacs. (default nil)
    dotspacemacs-check-for-update nil
    ;; If non-nil, a form that evaluates to a package directory. For example, to
    ;; use different package directories for different Emacs versions, set this
    ;; to `emacs-version'.
    dotspacemacs-elpa-subdirectory nil
    ;; One of `vim', `emacs' or `hybrid'.
    ;; `hybrid' is like `vim' except that `insert state' is replaced by the
    ;; `hybrid state' with `emacs' key bindings. The value can also be a list
    ;; with `:variables' keyword (similar to layers). Check the editing styles
    ;; section of the documentation for details on available variables.
    ;; (default 'vim)
    dotspacemacs-editing-style 'vim
    ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
    dotspacemacs-verbose-loading nil
    ;; Specify the startup banner. Default value is `official', it displays
    ;; the official spacemacs logo. An integer value is the index of text
    ;; banner, `random' chooses a random text banner in `core/banners'
    ;; directory. A string value must be a path to an image format supported
    ;; by your Emacs build.
    ;; If the value is nil then no banner is displayed. (default 'official)
    dotspacemacs-startup-banner 'official
    ;; List of items to show in startup buffer or an association list of
    ;; the form `(list-type . list-size)`. If nil then it is disabled.
    ;; Possible values for list-type are:
    ;; `recents' `bookmarks' `projects' `agenda' `todos'."
    ;; List sizes may be nil, in which case
    ;; `spacemacs-buffer-startup-lists-length' takes effect.
    dotspacemacs-startup-lists '((recents . 5)
                                  (projects . 7))
    ;; True if the home buffer should respond to resize events.
    dotspacemacs-startup-buffer-responsive t
    ;; Default major mode of the scratch buffer (default `text-mode')
    dotspacemacs-scratch-mode 'text-mode
    ;; List of themes, the first of the list is loaded when spacemacs starts.
    ;; Press `SPC T n' to cycle to the next theme in the list (works great
    ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(atom-one-dark
                           spacemacs-dark
                           railscasts
                           base16-codeschool
                           monokai
                           pastels-on-dark
                           )
    ;; If non-nil the cursor color matches the state color in GUI Emacs.
    dotspacemacs-colorize-cursor-according-to-state t
    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Source Code Pro"
                                 :size 10
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1)
    ;; The leader key
    dotspacemacs-leader-key "SPC"
    ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
    ;; (default "SPC")
    dotspacemacs-emacs-command-key "SPC"
    ;; The key used for Vim Ex commands (default ":")
    dotspacemacs-ex-command-key ":"
    ;; The leader key accessible in `emacs state' and `insert state'
    ;; (default "M-m")
    dotspacemacs-emacs-leader-key "M-m"
    ;; Major mode leader key is a shortcut key which is the equivalent of
    ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
    dotspacemacs-major-mode-leader-key ","
    ;; Major mode leader key accessible in `emacs state' and `insert state'.
    ;; (default "C-M-m")
    dotspacemacs-major-mode-emacs-leader-key "C-M-m"
    ;; These variables control whether separate commands are bound in the GUI to
    ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
    ;; Setting it to a non-nil value, allows for separate commands under `C-i'
    ;; and TAB or `C-m' and `RET'.
    ;; In the terminal, these pairs are generally indistinguishable, so this only
    ;; works in the GUI. (default nil)
    dotspacemacs-distinguish-gui-tab nil
    ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
    dotspacemacs-remap-Y-to-y$ nil
    ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
    ;; there. (default t)
    dotspacemacs-retain-visual-state-on-shift t
    ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
    ;; (default nil)
    dotspacemacs-visual-line-move-text t
    ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
    ;; (default nil)
    dotspacemacs-ex-substitute-global nil
    ;; Name of the default layout (default "Default")
    dotspacemacs-default-layout-name "Default"
    ;; If non-nil the default layout name is displayed in the mode-line.
    ;; (default nil)
    dotspacemacs-display-default-layout nil
    ;; If non-nil then the last auto saved layouts are resumed automatically upon
    ;; start. (default nil)
    dotspacemacs-auto-resume-layouts nil
    ;; If non-nil, auto-generate layout name when creating new layouts. Only has
    ;; effect when using the "jump to layout by number" commands.
    dotspacemacs-auto-generate-layout-names nil
    ;; Size (in MB) above which spacemacs will prompt to open the large file
    ;; literally to avoid performance issues. Opening a file literally means that
    ;; no major mode or minor modes are active. (default is 1)
    dotspacemacs-large-file-size 1
    ;; Location where to auto-save files. Possible values are `original' to
    ;; auto-save the file in-place, `cache' to auto-save the file to another
    ;; file stored in the cache directory and `nil' to disable auto-saving.
    ;; (default 'cache)
    dotspacemacs-auto-save-file-location 'cache
    ;; Maximum number of rollback slots to keep in the cache. (default 5)
    dotspacemacs-max-rollback-slots 5
    ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
    dotspacemacs-helm-resize nil
    ;; if non-nil, the helm header is hidden when there is only one source.
    ;; (default nil)
    dotspacemacs-helm-no-header nil
    ;; define the position to display `helm', options are `bottom', `top',
    ;; `left', or `right'. (default 'bottom)
    dotspacemacs-helm-position 'bottom
    ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
    ;; in all non-asynchronous sources. If set to `source', preserve individual
    ;; source settings. Else, disable fuzzy matching in all sources.
    ;; (default 'always)
    dotspacemacs-helm-use-fuzzy 'always
    ;; If non-nil the paste micro-state is enabled. When enabled pressing `p'
    ;; several times cycle between the kill ring content. (default nil)
    dotspacemacs-enable-paste-transient-state nil
    ;; Which-key delay in seconds. The which-key buffer is the popup listing
    ;; the commands bound to the current keystroke sequence. (default 0.4)
    dotspacemacs-which-key-delay 0.4
    ;; Which-key frame position. Possible values are `right', `bottom' and
    ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
    ;; right; if there is insufficient space it displays it at the bottom.
    ;; (default 'bottom)
    dotspacemacs-which-key-position 'bottom
    ;; Control where `switch-to-buffer' displays the buffer. If nil,
    ;; `switch-to-buffer' displays the buffer in the current window even if
    ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
    ;; displays the buffer in a same-purpose window even if the buffer can be
    ;; displayed in the current window. (default nil)
    dotspacemacs-switch-to-buffer-prefers-purpose nil
    ;; If non-nil a progress bar is displayed when spacemacs is loading. This
    ;; may increase the boot time on some systems and emacs builds, set it to
    ;; nil to boost the loading time. (default t)
    dotspacemacs-loading-progress-bar t
    ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
    ;; (Emacs 24.4+ only)
    dotspacemacs-fullscreen-at-startup nil
    ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
    ;; Use to disable fullscreen animations in OSX. (default nil)
    dotspacemacs-fullscreen-use-non-native nil
    ;; If non-nil the frame is maximized when Emacs starts up.
    ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
    ;; (default nil) (Emacs 24.4+ only)
    dotspacemacs-maximized-at-startup nil
    ;; A value from the range (0..100), in increasing opacity, which describes
    ;; the transparency level of a frame when it's active or selected.
    ;; Transparency can be toggled through `toggle-transparency'. (default 90)
    dotspacemacs-active-transparency 90
    ;; A value from the range (0..100), in increasing opacity, which describes
    ;; the transparency level of a frame when it's inactive or deselected.
    ;; Transparency can be toggled through `toggle-transparency'. (default 90)
    dotspacemacs-inactive-transparency 90
    ;; If non-nil show the titles of transient states. (default t)
    dotspacemacs-show-transient-state-title t
    ;; If non-nil show the color guide hint for transient state keys. (default t)
    dotspacemacs-show-transient-state-color-guide t
    ;; If non-nil unicode symbols are displayed in the mode line. (default t)
    dotspacemacs-mode-line-unicode-symbols t
    ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
    ;; scrolling overrides the default behavior of Emacs which recenters point
    ;; when it reaches the top or bottom of the screen. (default t)
    dotspacemacs-smooth-scrolling t
    ;; Control line numbers activation.
    ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
    ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
    ;; This variable can also be set to a property list for finer control:
    ;; '(:relative nil
    ;;   :disabled-for-modes dired-mode
    ;;                       doc-view-mode
    ;;                       markdown-mode
    ;;                       org-mode
    ;;                       pdf-view-mode
    ;;                       text-mode
    ;;   :size-limit-kb 1000)
    ;; (default nil)
    dotspacemacs-line-numbers 'relative
    ;; Code folding method. Possible values are `evil' and `origami'.
    ;; (default 'evil)
    dotspacemacs-folding-method 'evil
    ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
    ;; (default nil)
    dotspacemacs-smartparens-strict-mode nil
    ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
    ;; over any automatically added closing parenthesis, bracket, quote, etc…
    ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
    dotspacemacs-smart-closing-parenthesis nil
    ;; Select a scope to highlight delimiters. Possible values are `any',
    ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
    ;; emphasis the current one). (default 'all)
    dotspacemacs-highlight-delimiters 'all
    ;; If non-nil, advise quit functions to keep server open when quitting.
    ;; (default nil)
    dotspacemacs-persistent-server t
    ;; List of search tool executable names. Spacemacs uses the first installed
    ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
    ;; (default '("rg" "ag" "pt" "ack" "grep"))
    dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
    ;; The default package repository used if no explicit repository has been
    ;; specified with an installed package.
    ;; Not used for now. (default nil)
    dotspacemacs-default-package-repository nil
    ;; Format specification for setting the frame title.
    ;; %a - the `abbreviated-file-name', or `buffer-name'
    ;; %t - `projectile-project-name'
    ;; %I - `invocation-name'
    ;; %S - `system-name'
    ;; %U - contents of $USER
    ;; %b - buffer name
    ;; %f - visited file name
    ;; %F - frame name
    ;; %s - process status
    ;; %p - percent of buffer above top of window, or Top, Bot or All
    ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
    ;; %m - mode name
    ;; %n - Narrow if appropriate
    ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
    ;; %Z - like %z, but including the end-of-line format
    dotspacemacs-frame-title-format "%I@%S"
    ;; Format specification for setting the icon title format
    ;; (default nil - same as frame-title-format)
    dotspacemacs-icon-title-format nil
    ;; Delete whitespace while saving buffer. Possible values are `all'
    ;; to aggressively delete empty line and long sequences of whitespace,
    ;; `trailing' to delete only the whitespace at end of lines, `changed'to
    ;; delete only whitespace for changed lines or `nil' to disable cleanup.
    ;; (default nil)
    dotspacemacs-whitespace-cleanup 'trailing
    ;; Either nil or a number of seconds. If non-nil zone out after the specified
    ;; number of seconds. (default nil)
    dotspacemacs-zone-out-when-idle nil
    ;; Run `spacemacs/prettify-org-buffer' when
    ;; visiting README.org files of Spacemacs.
    ;; (default nil)
    dotspacemacs-pretty-docs nil
    ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; Custom functions
  (defun jpl/insert-date-time ()
    (interactive)
    (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

  ;; https://github.com/syl20bnr/spacemacs/issues/8438#issuecomment-283610751
  (defun jpl/message-add-timestamp (args)
    (let ((format-string (car args))
           (substitutaions (cdr args)))
      (if (or (null format-string) (string= format-string ""))
        ;; nil or empty format-string is meant to clear the echo area instead of
        ;; logging a message, so don't modify args in this case
        args
        (cons (concat (format-time-string "[%T] " (current-time)) (car args))
          (cdr args)))))

  ;; (advice-add 'message :filter-args #'jpl/message-add-timestamp)
  ;; (advice-remove 'message :filter-args #'message-add-timestamp)

  ;; Keybindings

  ;; From: TheBB in: https://github.com/syl20bnr/spacemacs/issues/6971#issuecomment-308369438
  ;; Remaps J/K in rebase mode to move line down/up
  (with-eval-after-load 'git-rebase
    (evil-magit-define-key evil-magit-state 'git-rebase-mode-map "K" 'git-rebase-move-line-up)
    (evil-magit-define-key evil-magit-state 'git-rebase-mode-map "J" 'git-rebase-move-line-down))

  ;; C-RET in insert mode will break out of line and start a new line
  (evil-define-key 'insert global-map (kbd "<C-return>") 'evil-open-below)
  (define-key evil-normal-state-map (kbd "C-+") 'spacemacs/scale-up-font)    ;; C-+ to increase font size
  (define-key evil-normal-state-map (kbd "C--") 'spacemacs/scale-down-font)  ;; C-- to decrease font size
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)  ;; map ; to : in normal mode
  (spacemacs/declare-prefix "o" "personal-keybindings")  ;; Set up label in which-key
  (spacemacs/declare-prefix "oi" "insert-bindings")      ;; Set up label in which-key
  (spacemacs/declare-prefix "on" "node-bindings")        ;; Set up label in which-key
  (spacemacs/set-leader-keys "oit" 'jpl/insert-date-time)
  ;; From: https://github.com/syl20bnr/spacemacs/issues/483#issuecomment-269593566
  (spacemacs/set-leader-keys "onr" 'nodejs-repl-send-region)

  ;; From: https://github.com/syl20bnr/spacemacs/issues/2719#issuecomment-310917138
  (defun toggle-search-pattern-highlight ()
    "Toggle the previous search patterns highlight On or Off."
    (interactive)
    (if (evil-ex-hl-active-p 'evil-ex-search)
      (evil-ex-nohighlight)
      (evil-ex-search-activate-highlight evil-ex-search-pattern)))

  (global-set-key (kbd "<f8>") 'toggle-search-pattern-highlight)

  ;; From: https://github.com/syl20bnr/spacemacs/issues/9207#issuecomment-315558541
  (define-key evil-motion-state-map (kbd "C-e") 'evil-end-of-line)
  (define-key evil-motion-state-map (kbd "C-a") 'evil-first-non-blank)
  (define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-visual-line)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-first-non-blank)

  ;; Require additional packages

  ;; Fonts for all-the-icons to work:
  ;; https://github.com/domtronn/all-the-icons.el/blob/master/fonts
  (require 'all-the-icons)
  (setq neo-theme 'icons)
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

  ;; mode-icons
  (spacemacs|do-after-display-system-init
    (mode-icons-mode))
  (remove-hook 'helm-mode-hook 'mode-icons-mode)
  (remove-hook 'helm-minibuffer-set-up-hook 'mode-icons-mode)

  (require 'react-snippets) ;; TODO: move this to lazy-load in a js-mode hook?
  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))
  ;; (use-package magithub
  ;;   :after magit
  ;;   :config (magithub-feature-autoinject t))
  ;; (require magithub)


  ;; gpg settings
  (setq epg-gpg-program "/usr/bin/gpg2")

  ;; Set the escape sequence (fd) to ignore order
  (setq evil-escape-unordered-key-sequence t) (setq evil-escape-delay 0.04)

  ;; Start with menu-bar open -- Not working
  (spacemacs/toggle-menu-bar-on)

  ;; Scrolloff type behavior
  (setq scroll-conservatively 101
    scroll-margin 7
    scroll-preserve-screen-position 't)

  ;; Add mode hooks to include underscore in words rather than a word boundary
  ;; From: https://github.com/syl20bnr/spacemacs/blob/develop/doc/FAQ.org#include-underscores-in-word-motions
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  ;; Configure prettier-js-minor mode for javascript modes
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'react-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (setq prettier-js-args
    '(
       "--trailing-comma" "all"
       "--bracket-spacing" "true"
       ))

  ;; Fix projectile-rails in erb, etc
  ;; This isn't working for me on master. Rather replacing line 30 in the
  ;; framework/ruby-on-rails/package.el file with the following enables it.
  ;; (dolist (mode '(ruby-mode enh-ruby-mode slim-mode haml-mode coffee-mode web-mode js-mode yaml-mode))
  (projectile-rails-global-mode)

  ;; Web-mode config
  ;; See: http://web-mode.org/
  ;; (add-hook 'web-mode-hook #'smartparens-mode) ;; TODO: not working
  (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.sass\\'" . web-mode))
  ;; (setq web-mode-content-types-alist
  ;;       '(("scss" . "\\.sass\\'"))
  ;; )
  (setq web-mode-extra-auto-pairs
    '(("erb"  . (("beg" "end")))
       ("php"  . (("beg" "end")
                   ("beg" "end")))
       ))
  (setq web-mode-auto-quote-style 2) ;; use single quotes
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-extra-snippets
    '(("erb" . (("a" . "<%= link_to | %>"))
        ))
    )

  ;; ERC config
  (erc-track-mode t)
  (setq erc-hide-list '("JOIN" "NICK" "PART" "QUIT"))
  (setq erc-autojoin-channels-alist
    '(("freenode.net" "#emacs" "#emacs-beginners" "#ruby" "#rubyonrails"
        "##javascript" "#node.js" "#reactjs" "#git" "#bash" )
       ("irc.gitter.im" "#syl20bnr/spacemacs")))
  (setq erc-prompt-for-nickserv-password nil)

  ;; Org mode config
  (with-eval-after-load 'org
    (add-to-list 'org-babel-load-languages
      '(ruby . t)
      '(js . t))
    (setq org-src-fontify-natively t)) ;; Syntax highlight source code blocks

  ;; Set deft to use Dropbox
  (setq deft-directory "~/Dropbox/notes")

  ;; Emoji config
  (defun --set-emoji-font (frame)
    "Adjust the font settings of FRAME so Emacs can display emoji properly."
    (if (eq system-type 'darwin)
      ;; For NS/Cocoa
      (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)
      ;; For Linux
      (set-fontset-font t 'symbol (font-spec :family "Symbola") frame 'prepend)))

  ;; For when Emacs is started in GUI mode:
  (--set-emoji-font nil)
  ;; Hook for when a frame is created with emacsclient
  ;; From: https://www.gnu.org/software/emacs/manual/html_node/elisp/Creating-Frames.html
  (add-hook 'after-make-frame-functions '--set-emoji-font)

  ;; Lighten up line numbers in spacemacs theme
  ;; I got this working through the spacemacs-theme by moving the custom-set-variables
  ;; to the proper place down below.
  ;; (setq theming-modifications '((spacemacs-dark (linum :foreground "#666666")
  ;;                                               (linum-relative-current-face :foreground "#d75fd7"))))

  ;; Open things in chrome instead of firefox
  (setq browse-url-browser-function 'browse-url-generic
    engine/browser-function 'browse-url-generic
    ;; browse-url-generic-program "google-chrome")
    browse-url-generic-program "chromium-browser")

  ;; Make mouse scrolling work in terminal
  (unless window-system
    (xterm-mouse-mode -1))

  ;; Fix spaceline in terminal
  (unless window-system
    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
    (set-face-attribute 'spaceline-evil-normal nil :foreground "black")
    (set-face-attribute 'spaceline-evil-insert nil :foreground "black")
    (set-face-attribute 'spaceline-evil-visual nil :foreground "black")
    (set-face-attribute 'spaceline-evil-replace nil :foreground "black")
    )

  ;; @quickner and @jredville from gitter
  ;; open marked files from helm-projectile in open windows
  ;; if you mark more than the number of open windows, the extras open in buffers
  (defun helm-open-buffers-in-windows (buffers)
    (if (= (length buffers) 1) (set-window-buffer nil (car buffers))
      (let ((cur-win 1)
             (num-windows (length (window-list))))
        (cl-loop for buffer in buffers
          do (when (<= cur-win num-windows)
               (set-window-buffer (winum-get-window-by-number cur-win) buffer)
               (setq cur-win (+ cur-win 1)))))))

  (defun helm-find-files-windows (candidate)
    (let* ((files (helm-marked-candidates))
            (buffers (mapcar 'find-file-noselect files)))
      (helm-open-buffers-in-windows buffers)))

  (defun helm-find-buffers-windows (candidate)
    (let* ((buffers (helm-marked-candidates)))
      (helm-open-buffers-in-windows buffers)))

  ;; C-z to see actions in helm-projectile
  (with-eval-after-load 'helm-projectile
    (helm-add-action-to-source "Open marked files in windows" 'helm-find-files-windows helm-source-projectile-files-list)
    (helm-add-action-to-source "Open marked buffers in windows" 'helm-find-buffers-windows helm-source-projectile-buffers-list))

  (define-key helm-projectile-find-file-map (kbd "C-w")
    (lambda ()(interactive)
      (helm-exit-and-execute-action 'helm-find-files-windows)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
;; Lighten up line numbers in spacemacs theme
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (multiple-cursors powerline inf-ruby sqlup-mode org-brain impatient-mode evil-org evil company helm-core magit magit-popup git-commit dash async prettier-js eslintd-fix minimap smartparens helm markdown-mode org-plus-contrib yasnippet rjsx-mode magithub ghub+ apiwrap ghub zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection sql-indent spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor rubocop rspec-mode robe reverse-theme restart-emacs rebecca-theme react-snippets rbenv ranger rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode projectile-rails professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme password-generator paradox pandoc-mode ox-pandoc orgit organic-green-theme org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme nodejs-repl noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mode-icons mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio godoctor go-rename go-guru go-eldoc gnuplot github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flycheck-bashate flx-ido flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emojify emoji-cheat-sheet-plus emmet-mode elisp-slime-nav editorconfig dumb-jump dracula-theme django-theme diff-hl deft define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme company-web company-tern company-statistics company-shell company-go company-emoji company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme browse-at-remote bracketed-paste birds-of-paradise-plus-theme base16-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile atom-one-dark-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme all-the-icons-dired alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(spacemacs-theme-custom-colors (quote ((lnum . "#666666")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
)
