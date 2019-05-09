;;; rezo-lsp-css.el --- Emacs Prelude: scss support
;;
;; Copyright © 2011-2018 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://www.batsov.com/emacs-prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for scss-mode.

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

(prelude-require-packages '(lsp-css scss-mode))
(require 'lsp-mode)
(require 'lsp-ui)

(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))

;; mode启动后需要一些配置
(eval-after-load 'css-mode
  '(progn
     (prelude-require-packages '(rainbow-mode))

     (setq css-indent-offset 2)

     (defun prelude-css-mode-defaults ()
       (rainbow-mode +1)
       (run-hooks 'prelude-prog-mode-hook))

     (setq prelude-css-mode-hook 'prelude-css-mode-defaults)

     (add-hook 'css-mode-hook (lambda ()
                                (run-hooks 'prelude-css-mode-hook)))))

(add-hook 'css-mode-hook #'lsp)
(add-hook 'css-mode-hook 'lsp-ui-mode)
(add-hook 'css-mode-hook 'flycheck-mode)

;; turn off annoying auto-compile on save
(setq scss-compile-at-save nil)

(provide 'rezo-lsp-css)
;;; rezo-lsp-css.el ends here
