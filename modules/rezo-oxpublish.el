;;; rezo-oxpublish.el --- org publish to html.
;;
;; Copyright © 2011-2018 Rezo.Chiang.
;;
;; Author: Rezo.Chiang <rezo@live.cn>
;; URL: https://github.com/Rezo/prelude
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
(prelude-require-package 'htmlize)
(require 'ox-publish)

(setq org-publish-project-alist
      '(
        ("blog_assets"
         :base-directory "/data/blog/source/assets"
         :base-extension "html\\|xml\\|css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|zip\\|gz\\|csv\\|m\\|R"
         :recursive t
         :base-extension "org"
         :publishing-directory "/data/blog/publish/assets"
         :publishing-function org-publish-attachment
         )

        ("blog_html"
         :base-directory "/data/blog/source/"
         :base-extension "org"
         :publishing-directory "/data/blog/publish/"
         :recursive t
         :auto-sitemap t
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :language "zh-cn"
         :preserve-breaks t   ; 换行变为br
         :with-creator nil    ; Disable the inclusion of "Created by Org" in the postamble.
         :with-email nil      ; Disable the inclusion of "(your email)" in the postamble.
         :with-author nil       ; Disable the inclusion of "Author: Your Name" in the postamble.
         :publishing-function org-html-publish-to-html
         :headline-levels 1             ; Just the default for this project.
         :auto-preamble t;         ; Enable auto preamble
         :auto-postamble t         ; Enable auto postamble
         :table-of-contents t        ; Set this to "t" if you want a table of contents, set to "nil" disables TOC.
         :toc-levels 2               ; Just the default for this project.
         :section-numbers nil        ; Set this to "t" if you want headings to have n
         :html-head "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0,maximum-scale=1,user-scalable=no\" />\n<meta name=\"apple-touch-fullscreen\" content=\"yes\"/>\n<meta name=\"apple-mobile-web-app-capable\" content=\"yes\"/>\n<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\"/>\n<meta name=\"format-detection\" content=\"telephone=no,email=no\"/>\n<meta name=\"x5-fullscreen\" content=\"true\"/>\n<meta name=\"screen-orientation\" content=\"portrait\"/>\n<meta name=\"browsermode\" content=\"application\"/>\n<meta name=\"x5-orientation\" content=\"portrait\"/>\n<meta name=\"x5-page-mode\" content=\"app\"/>\n<meta name=\"mobile-web-app-capable\" content=\"yes\"/>\n<link href=\"https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css\" rel=\"stylesheet\"/>\n<link rel=\"stylesheet\" type=\"text/css\" href=\"/assets/css/all.css\" />\n<script src=\"https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js\"></script>\n<script src=\"https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js\"></script>\n<script src=\"/assets/js/all.js\"></script>\n"
         :html-link-home "index.html"
         :html-link-up "index.html"
         :html-container "div"
         :html-doctype "xhtml5"
         :html-html5-fancy t
         )
        ("blog"
         :components ("blog_assets" "blog_html")
         )
        ))

(defun publish-project (project no-cache)
  (interactive "sName of project: \nsNo-cache?[y/n] ")
  (if (or (string= no-cache "y")
          (string= no-cache "Y"))
      (setq org-publish-use-timestamps-flag nil))
  (org-publish-project project)
  (setq org-publish-use-timestamps-flag t))

(defun publish-project ()
  (org-publish-project "blog")
  )

(provide 'rezo-oxpublish)

;;; rezo-oxpublish.el ends here
