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
(prelude-require-package 'powerline)
(prelude-require-package 'smart-mode-line)
(prelude-require-package 'smart-mode-line-powerline-theme)
(require 'powerline)
(setq sml/no-confirm-load-theme t)
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
;; For dark theme
;; (setq sml/theme 'powerline)
(setq sml/theme 'light-powerline)
(sml/setup)

(prelude-require-package 'twilight-theme)
(prelude-require-package 'twilight-bright-theme)
;; (require 'twilight-bright-theme)
(load-theme 'leuven)

;; For org operations.
;; from: https://www.reddit.com/r/emacs/comments/3ba645/does_anybody_have_any_real_cool_hydras_to_share/
(provide 'rezochiang-theme)
;;; rezochiang-theme.el ends here
