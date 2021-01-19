(setq prelude-theme 'leuven )
(setq sml/theme 'light-powerline)
;; for dark theme
;; (setq prelude-theme 'molokai )
;; (setq sml/theme 'powerline)

(defvar rezo-const-full-date "%Y-%m-%d" "完整日期格式")
(defvar rezo-const-full-datetime "%Y-%m-%d %H:%M" "完整日期时间格式")
(defvar rezo-const-short-date "%m.%d" "时间格式")

;; 用户信息: 注意FreeBSD无法通过getenv获取到当前用户名
(defvar rezo-name-user "rezo" "用户名")
(defvar rezo-name-full "Rezo.Chiang" "用户全名")
(defvar rezo-email-address "rezo AT live.cn" "email地址")

(defvar rezo-dir-home (getenv "HOME") "定义用户根目录" )
(defvar rezo-dir-default (expand-file-name "files" rezo-dir-home) "各项目文件存放根路径" )

(defvar rezo-emms-dir (expand-file-name "private/music/" rezo-dir-default) "音乐文件存放根路径" )

(defvar rezo-gtd-dir (expand-file-name "private/org/" rezo-dir-default) "gdt根目录" )
(defvar rezo-gtd-dict (expand-file-name "dictionary.org" rezo-gtd-dir) "术语词汇文件路径" )
(defvar rezo-gtd-inbox (expand-file-name "inbox.org" rezo-gtd-dir) "GDT杂项文件存放路径" )

;; 2019-08-07 Fix:error: Package ‘undo-tree-’ is unavailable
;; From https://github.com/bbatsov/prelude/issues/1225
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; For Flyspell and Ispell
(ispell-change-dictionary "american" t)
(cond
 ((executable-find "hunspell")
  (setq ispell-program-name (executable-find "hunspell"))
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
          )))

 ((executable-find "aspell")
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))
