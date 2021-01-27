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

;; 设置回收站目录, 要与 delete-by-moving-to-trash 配合使用
(setq trash-directory "~/Trash")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dockerfile-mode jinja2-mode lsp-java jenkinsfile-mode yaml-mode rainbow-mode php-mode evil-matchit lua-mode web-mode scss-mode tide json-mode js2-mode flycheck-plantuml plantuml-mode nginx-mode counsel-projectile counsel swiper ivy smex ido-completing-read+ flx-ido dap-mode lsp-ui company-lsp company gnuplot evil-magit evil-ediff evil-leader evil-numbers evil-visualstar evil-surround evil window-number smart-mode-line-powerline-theme smart-mode-line powerline twilight-bright-theme twilight-theme molokai-theme use-package exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number nlinum move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring anzu ag ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
