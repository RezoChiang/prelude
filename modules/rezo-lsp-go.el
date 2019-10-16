;;; rezo-lsp-go.el --- Emacs Prelude: cc-mode configuration.
;;
;; Copyright © 2011-2018 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for cc-mode and the modes derived from it.
;; use bingo/gopls backend; bingo has stoped develop cause  #13 collaborating on golsp;
;; bingo better than gopls: ui better

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
(prelude-require-packages '(go-mode))
(require 'lsp-mode)
(require 'lsp-ui)

(add-to-list 'auto-mode-alist '("\\.go\\'"    . go-mode))

(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook 'lsp-ui-mode)
(add-hook 'go-mode-hook 'flycheck-mode


          (add-hook 'go-mode-hook #'lsp-deferred))

(provide 'rezo-lsp-go)

;;; rezo-lsp-go.el ends here
