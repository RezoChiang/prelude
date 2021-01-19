;;; rezo-org.el --- Emacs Prelude: org-mode configuration.
;;
;; Copyright © 2011-2018 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for org-mode.

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

(server-mode)
(prelude-require-packages '(gnuplot))
(require 'org-protocol)

;; org后缀自动启动org-mode
(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))

;; 定义org-agenda读取的文件
(setq org-agenda-files (list rezo-gtd-inbox))

;; for maxima
(org-babel-do-load-languages
 'org-babel-load-languages
 '((maxima . t)))
(visual-line-mode t)
;; org-babel 相关设定
(setq-default
 org-babel-C-compiler "clang"
 org-babel-C++-compiler "clang++"
 org-log-done 'time
 org-log-done 'note
 )
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
                             (gnuplot . t)
                             (plantuml . t)
                             (java . t)
                             (emacs-lisp . t)
                             (python . t)
                             (ruby . t)
                             (perl . t)
                             (js . t)
                             (shell . t)
                             (sql . t)
                             (lua . t)
                             ))
;; todo 关键词设定
(setq org-todo-keywords '((sequence "MAYBE(m!)" "TODO(t@/!)" "PROCESSED(p@/!)" "WAITTING(w@/!)" "|" "DONE(d@/!)" "ABORT(a@/!)")))

(defun rezo/org-capture-tpl-plain()
  "Return an empty template for org capture."
  (concat "** [" (format-time-string "%H:%M" (current-time)) "] %?\t:未归类:")
  )

(defun rezo/org-capture-tpl-note()
  "Return an note template with keywords for org capture."
  (concat "** [" (format-time-string "%H:%M" (current-time)) "] %^{title}\t%^g\n%?")
  )

(defun rezo/org-capture-tpl-term()
  "Return an keyword template with keywords for org capture."
  (concat "* " (format-time-string "%Y-%m-%d" (current-time)) " %?")
  )

(setq org-capture-templates
      '(("t" "Term" plain (file rezo-gtd-dict) "%(rezo/org-capture-tpl-term)")
        ("n" "note" plain (file rezo-gtd-inbox) "%(rezo/org-capture-tpl-note)")
        ("p" "plain" plain (file rezo-gtd-inbox) "%(rezo/org-capture-tpl-plain)")
	("s" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
         "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
         "* %? [[%:link][%:description]] \nCaptured On: %U")
        ))

(defun rezo/org-protocol-capture-p ()
  "Return true if this capture was initiated via org-protocol."
  (equal (buffer-name (org-capture-get :original-buffer)) " *server*"))

(defun rezo/org-capture-initialize ()
  "Make sure frame has only one window if capture was initiated via org-protocol"
  (if (rezo/org-protocol-capture-p) (delete-other-windows)))

(defun rezo/org-capture-after-finalize ()
  "Delete frame if capture was initiated via org-protocol"
  (if (rezo/org-protocol-capture-p) (delete-frame)))

(add-hook 'org-capture-mode-hook 'rezo/org-capture-initialize)
(add-hook 'org-capture-after-finalize-hook 'rezo/org-capture-after-finalize)
(add-hook 'org-agenda-mode-hook 'delete-other-windows)

(provide 'rezo-org)

;;; rezo-org.el ends here
