;;; rezo-lsp-lua.el --- Emacs Prelude: lua-mode configuration.
;; https://github.com/emacs-lsp/lsp-mode/wiki/Install-EmmyLua-Language-server
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
(prelude-require-packages '(json-mode))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((lua-mode) . lsp)
  :config
  )

;; (use-package company-lsp
;;   :ensure t
;;   :after lsp-mode
;;   :config
;;   (setq company-lsp-enable-recompletion t)
;;   (setq lsp-auto-configure nil)         ;该功能会自动执行(push company-lsp company-backends)
;;   )

(use-package lsp-lua-emmy
  :demand
  :ensure nil
  :load-path "~/.emacs.d/personal/lsp-lua-emmy"
  :hook (lua-mode . lsp)
  :config
  (setq lsp-lua-emmy-jar-path (expand-file-name "EmmyLua-LS-all.jar" user-emacs-directory))
  )

(defun set-company-backends-for-lua()
  "Set lua company backend."
  (setq-local company-backends '(
                                 (
                                  company-lua
                                  company-keywords
                                  company-gtags
                                  company-yasnippet
                                  )
                                 company-capf
                                 company-dabbrev-code
                                 company-files
                                 )))

(use-package lua-mode
  :ensure t
  :mode ("\\.lua" "\\.LUA")
  :interpreter "lua"
  :hook (lua-mode . set-company-backends-for-lua)
  :config
  (setq lua-indent-level 2)
  (setq lua-indent-string-contents t)
  (setq lua-prefix-key nil)
  )

(flycheck-define-checker lua
  "A Lua syntax checker using luacheck."
  :command ("luacheck" "--no-color" source)
  :error-patterns
  ((error line-start
          ;; Skip the name of the luac executable.  We also skip the file name,
          ;; because luac is stupid enough as to abbreviate file names in its
          ;; output, which for obvious reasons breaks our file name
          ;; detection. See https://github.com/flycheck/flycheck/issues/251
          (minimal-match (zero-or-more not-newline))
          ":" line ":" (message) line-end))
  :modes lua-mode)

(provide 'rezo-lsp-lua)
;;; rezo-lsp-lua.el ends here
