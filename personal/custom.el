;; 出问题可开, 另外启动时可使用 --debug-init参数
;; (setq debug-on-error t)

; 设置字体字号, 第二条语句设置daemon模式下的字体
(set-frame-font "DejaVu Sans Mono 9")
(set-face-attribute 'org-table nil :family "Noto Sans CJK SC Light")
(setq default-frame-alist '((font . "DejaVu Sans Mono 9")))

;; 新增自定义包
(prelude-require-packages '(
                            evil-matchit
                            markdown-mode
                            php-mode
                            ivy
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
                            swiper
                            wgrep
                            iedit
                            ))

;; for org-babel support

;; 定义特定后缀major mode
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))

;; 2018/11/27 垂直分割
(setq swoop-window-split-direction: 'split-window-vertically)

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
 '(browse-url-browser-function (quote eww-browse-url))
 '(delete-by-moving-to-trash t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(lua-indent-level 4)
 '(org-capture-templates
   (quote
    (("t" "Term" plain
      (file rezo-gtd-dict)
      "%(rezo-org-capture-tpl-term)")
     ("n" "Note" plain
      (file rezo-gtd-inbox)
      "%(rezo-org-capture-tpl-note)")
     ("p" "Plain" plain
      (file rezo-gtd-inbox)
      "%(rezo-org-capture-tpl-plain)"))))
 '(org-todo-keywords
   (quote
    ((sequence "MAYBE(m!)" "TODO(t@/!)" "PROCESSED(p@/!)" "WAITTING(w@/!)" "|" "DONE(d@/!)" "ABORT(a@/!)"))))
 '(package-selected-packages
   (quote
    (protobuf-mode typescript-mode rjsx-mode evil-matchit js-doc helm-swoop ag xref-js2 js2-refactor company-tern solarized-theme sunburn-theme dockerfile-mode window-number hydra emms yaml-mode web-mode scss-mode geiser lua-mode yari inf-ruby company-anaconda anaconda-mode json-mode js2-mode gotest go-projectile go-eldoc company-go go-mode rainbow-mode elisp-slime-nav rainbow-delimiters coffee-mode evil-numbers evil-visualstar evil-surround evil company counsel swiper ivy smart-mode-line-powerline-theme smart-mode-line powerline twilight-bright-theme twilight-theme molokai-theme zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
