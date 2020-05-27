;; 出问题可开, 另外启动时可使用 --debug-init参数
;; (setq debug-on-error t)

;; 2020-03-05 pgp配置，否则加密解密会报错
(setf epa-pinentry-mode 'loopback)

;; 新增自定义包
(prelude-require-packages '(
                            evil-matchit
                            markdown-mode
                            php-mode
                            rainbow-mode
                            rainbow-delimiters
                            smex
                            yasnippet
                            multiple-cursors
                            highlight-parentheses
                            mic-paren
                            keyfreq
                            tiny
;;                            helm-swoop
                            wgrep
                            iedit
                            ))

;; for org-babel support

;; 定义特定后缀major mode
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))

;; 2018/11/27 垂直分割
;; (setq swoop-window-split-direction: 'split-window-vertically)

;; 定义编码
(defvar rezo-coding-default 'utf-8 "默认编码设置")

;; 配置快捷键记录
(setq keyfreq-excluded-commands
      '(self-insert-command
        abort-recursive-edit
        forward-char
        backward-char
        previous-line
        next-line))
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)


(highlight-parentheses-mode t)
(rainbow-delimiters-mode t)
;;(show-paren-mode t)

;; 手动启动即可
;; (paredit-mode t)
;; 因为打开js文件导致操作迟缓，默认关闭 projectile模式
(projectile-mode -1)

;; 隐藏工具，菜单和滚动条
;; 注意在24里0是不能修改成nil的
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(display-time-mode 1)
;; (electric-quote-mode -1)
(ido-mode t)
(ivy-mode t)
(rainbow-mode t)
(yas-global-mode t)


(setq-default
 pathname-coding-system rezo-coding-default
 line-spacing 3
 display-time-interval 10
  ;; 取消自动备份
 make-backup-files nil)

(defun rezo-org-capture-tpl-term()
  (concat "* " (format-time-string "%Y-%m-%d" (current-time)) " %?")
  )

(defun rezo-org-capture-tpl-note()
  (concat "** [" (format-time-string "%H:%M" (current-time)) "] %^{keywords, cause or purpose}\t%^g\n%?")
  )

(defun rezo-org-capture-tpl-plain()
  (concat "** [" (format-time-string "%H:%M" (current-time)) "] %?\t:未归类:")
  )

;; 定义org-agenda读取的文件
(setq org-agenda-files (list rezo-gtd-leagcy rezo-gtd-inbox))

;; 设置回收站目录, 要与 delete-by-moving-to-trash 配合使用
(setq trash-directory "~/Trash")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(emms-player-mplayer-parameters (quote ("-slave" "-quiet" "-really-quiet" "-novideo")))
 '(package-selected-packages
   (quote
    (pdf-tools origami vdiff gradle-mode inf-mongo nyan-mode geben ansible groovy-mode nginx-mode lsp-php htmlize emms gnuplot go-mode csv-mode rg oneonone zop-to-char zenburn-theme yaml-mode xref-js2 window-number which-key wgrep web-mode volatile-highlights use-package typescript-mode twilight-theme twilight-bright-theme tiny super-save smex smartrep smartparens smart-mode-line-powerline-theme scss-mode rainbow-mode rainbow-delimiters protobuf-mode projectile php-mode operate-on-number move-text molokai-theme mic-paren magit lua-mode lsp-ui lsp-java keyfreq json-mode js2-refactor js-doc imenu-anywhere iedit ido-completing-read+ hl-todo highlight-parentheses guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck flx-ido expand-region exec-path-from-shell evil-visualstar evil-surround evil-numbers evil-matchit evil-leader editorconfig easy-kill dockerfile-mode discover-my-major diminish diff-hl crux cquery counsel company-lsp browse-kill-ring beacon anzu ag ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
