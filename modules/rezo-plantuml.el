;;; rezo-plantuml.el --- Emacs Prelude: js-mode configuration.
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
(prelude-require-packages '(plantuml-mode flycheck-plantuml))
(require 'plantuml-mode)
(require 'flycheck-plantuml)
(setq plantuml-jar-path (expand-file-name "~/.local/bin/plantuml.jar"))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

(flycheck-plantuml-setup)

(provide 'rezo-plantuml)
;;; rezo-plantuml.el ends here