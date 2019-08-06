;;; rezo-lsp-php.el --- Emacs Prelude: js-mode configuration.
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
(prelude-require-packages '(lsp-php php-mode))
(require 'lsp-mode)
(require 'lsp-ui)

(setq lsp-clients-php-iph-server-command '("intelephense" "--stdio"))
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection lsp-clients-php-iph-server-command)
                  :major-modes '(php-mode)
                  :priority -1
                  :ignore-messages '("indexing\\(Started\\|Ended\\)")
                  :server-id 'iph))

(add-hook 'php-mode-hook #'lsp)
(add-hook 'php-mode-hook 'lsp-ui-mode)
(add-hook 'php-mode-hook 'flycheck-mode)

(provide 'rezo-lsp-php)

;;; rezo-lsp-php.el ends here
