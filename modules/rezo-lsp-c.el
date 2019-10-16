;;; rezo-lsp-c.el --- Emacs Prelude: cc-mode configuration.
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
(prelude-require-packages '(ccls))
(require 'ccls)
(require 'dap-gdb-lldb)

(dap-mode 1)
(dap-ui-mode 1)
(dap-gdb-lldb-setup)
(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)

;; set indent
(defun rezo-lsp-c-mode-common-defaults ()
  (setq c-default-style "k&r"
        c-basic-offset 4)
  (c-set-offset 'substatement-open 0))

(setq rezo-lsp-c-mode-common-hook 'rezo-lsp-c-mode-common-defaults)

;; this will affect all modes derived from cc-mode, like
;; java-mode, php-mode, etc
(add-hook 'c-mode-common-hook (lambda ()
                                (run-hooks 'rezo-lsp-c-mode-common-hook)))

(defun prelude-makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t ))

(setq prelude-makefile-mode-hook 'prelude-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'prelude-makefile-mode-hook)))
(defun ccls//enable ()
  (condition-case nil
      (lsp)
    (user-error nil)))

(add-hook 'c-mode-hook #'ccls//enable)
(add-hook 'c++-mode-hook #'ccls//enable)
;; (dap-register-debug-provider
;;  "programming-language-name"
;;  (lambda (conf)
;;    (plist-put conf :debugPort 1234) (plist-put conf :host "localhost")
;;    conf))

;; (dap-register-debug-template "Example Configuration"
;;                              (list :type "java"
;;                                    :request "launch"
;;                                    :args ""
;;                                    :name "Run Configuration"))

(provide 'rezo-lsp-c)

;;; rezo-lsp-c.el ends here
