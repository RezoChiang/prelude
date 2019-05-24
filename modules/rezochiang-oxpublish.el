;;; rezochiang-oxpublish.el --- org publish to html.
;;
;; Copyright © 2011-2018 Rezo.Chiang.
;;
;; Author: Rezo.Chiang <rezo@live.cn>
;; URL: https://github.com/RezoChiang/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; publish org files to html for blog

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
(require 'ox-publish)

;; From https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html#org41273ed
(setq org-publish-project-alist
      '(
        ("blog"
         :base-directory "/data/blog/source/"
         :base-extension "org"
         :publishing-directory "/data/blog/publish/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :author "Rezo.Chiang"
         :email "rezo AT live.cn"
         )
        ))
(defun publish-project (project no-cache)
  (interactive "sName of project: \nsNo-cache?[y/n] ")
  (if (or (string= no-cache "y")
          (string= no-cache "Y"))
      (setq org-publish-use-timestamps-flag nil))
  (message rezo-blog-source-dir)
  (org-publish-project project)
  (setq org-publish-use-timestamps-flag t))

(defun publish-project ()
  (org-publish-project "blog")
)

(provide 'rezochiang-oxpublish)

;;; rezochiang-oxpublish.el ends here
