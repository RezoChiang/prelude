;;; rezo-js.el --- Emacs Prelude: js-mode configuration.
;;
;; Copyright © 2011-2018 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for js-mode.

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

(require 'prelude-programming)
(prelude-require-packages '(js2-mode json-mode ag xref js2-refactor xref-js2 js-doc))

(require 'js2-mode)
(require 'js2-refactor)
(require 'xref-js2)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(eval-after-load 'js2-mode
  '(progn
     (defun rezo-js-mode-defaults ()
       ;; electric-layout-mode doesn't play nice with smartparens
       (setq-local electric-layout-rules '((?\; . after)))
       ;; 2018/11/27 因为在大文件(2w行+)删除括号时, smartparens会导致卡顿, 所以关闭之
       (smartparens-mode nil)
       (setq mode-name "JS2"))
       ;; 2018/11/27 因为打开和编辑大文件卡顿, 且该功能使用很少, 注释之
       ;; (js2-imenu-extras-mode +1))
     (setq prelude-js-mode-hook 'rezo-js-mode-defaults)

     (define-key js2-mode-map (kbd "M-.") nil)
     (add-hook 'js2-mode-hook (lambda ()
                                (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
     (add-hook 'js2-mode-hook #'js2-refactor-mode)
     (add-hook 'js2-mode-hook (lambda () (run-hooks 'rezo-js-mode-hook)))))

(provide 'rezo-js)

;;; rezo-js.el ends here
