;;; rezochiang-theme.el --- for install themes and powerlines
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

(require 'powerline)
;; get rid "Loading a theme can run Lisp code. Really load? (y or n) "
(setq sml/no-confirm-load-theme t)
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
;; For dark theme
(setq sml/theme 'powerline)
;; with t can get rid "Loading a theme can run Lisp code. Really load? (y or n) "
;; (load-theme 'molokai t)

;; For light theme
(setq sml/theme 'light-powerline)
(load-theme 'leuven t)
;; (load-theme 'solarized-light t)
(sml/setup)
;; 2018/10/10 亮色主题下修复undo-tree不可见问题
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "white" :foreground "#1B1D1E"))))
 '(undo-tree-visualizer-active-branch-face ((t (:inherit default :foreground "#403D3D" :weight bold))))
 '(undo-tree-visualizer-current-face ((t (:foreground "#1E0E10"))))
 '(undo-tree-visualizer-default-face ((t (:inherit shadow))))
 '(undo-tree-visualizer-register-face ((t (:foreground "#E6DB74"))))
 '(undo-tree-visualizer-unmodified-face ((t (:foreground "#66D9EF")))))


(provide 'rezochiang-theme)
;;; rezochiang-theme.el ends here
