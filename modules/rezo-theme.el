;;; rezo-theme.el --- for install themes and powerlines
;;
;; Copyright © 2011-2017 Rezo.Chiang.
;;
;; Author: Rezo.Chiang <rezo@live.cn>
;; URL: https://github.com/RezoChiang/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; configure hydra key bindings...

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.
;;; Code:

(prelude-require-package 'molokai-theme)
(prelude-require-package 'twilight-theme)
(prelude-require-package 'twilight-bright-theme)

(prelude-require-package 'powerline)
(prelude-require-package 'smart-mode-line)
(prelude-require-package 'smart-mode-line-powerline-theme)

;; ediff 垂直分割
(setq ediff-split-window-function 'split-window-horizontally)
(global-nlinum-mode -1)

;; 设置字体字号, 第二条语句设置daemon模式下的字体
(defun rezo/better-font()
(interactive)
;; english font
(if (display-graphic-p)
    (progn
        (set-face-attribute 'default nil :font (format   "%s:pixelsize=%d" "Inconsolata" 14)) ;; 11 13 17 19 23
        ;; chinese font
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "Sarasa Mono SC")))) ;; 14 16 20 22 28
  ))

(defun rezo|init-font(frame)
(with-selected-frame frame
    (if (display-graphic-p)
        (rezo/better-font))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions #'rezo|init-font)
  (rezo/better-font))

(require 'powerline)
;; get rid "Loading a theme can run Lisp code. Really load? (y or n) "
(setq sml/no-confirm-load-theme t)
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))

;; for dark theme
;; (setq sml/theme 'powerline)
;; with t can get rid "Loading a theme can run Lisp code. Really load? (y or n) "
;; (load-theme 'molokai t)

;; For light theme
;; (setq sml/theme 'light-powerline)
;;(load-theme 'leuven t)
;; (load-theme 'solarized-light t)
(sml/setup)

(provide 'rezo-theme)
;;; rezo-theme.el ends here
