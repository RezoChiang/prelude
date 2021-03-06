;;; rezo-evil.el --- Emacs Prelude: evil-mode configuration.
;;
;; Copyright © 2011-2018 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://batsov.com/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for evil-mode.

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

;;; goto-chg lets you use the g-; and g-, to go to recent changes
;;; evil-visualstar enables searching visual selection with *
;;; evil-numbers enables vim style numeric incrementing and decrementing
;;; evil-leader lets you use leaderkey space like spacemacs;

(prelude-require-packages '(evil goto-chg evil-surround evil-visualstar evil-numbers evil-leader evil-ediff evil-magit))

(require 'evil-visualstar)
(require 'evil-ediff)
(require 'evil-magit)

(setq evil-mode-line-format 'before)

(setq evil-emacs-state-cursor  '("red" box))
(setq evil-normal-state-cursor '("#000" box))
(setq evil-visual-state-cursor '("gray" box))
(setq evil-insert-state-cursor '("orange" bar))
(setq evil-motion-state-cursor '("gray" box))

;; prevent esc-key from translating to meta-key in terminal mode
(setq evil-esc-delay 0)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-mode 1)
(global-evil-surround-mode 1)

;; 数字增减
(define-key evil-normal-state-map (kbd "C-A")
  'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-S-A")
  'evil-numbers/dec-at-pt)

;;
;; Other useful Commands
;;
(evil-ex-define-cmd "W"     'evil-write-all)
(evil-ex-define-cmd "Tree"  'speedbar-get-focus)
(evil-ex-define-cmd "linum" 'linum-mode)
(evil-ex-define-cmd "Align" 'align-regexp)

(defun prelude-yank-to-end-of-line ()
  "Yank to end of line."
  (interactive)
  (evil-yank (point) (point-at-eol)))

(define-key evil-normal-state-map
  (kbd "Y") 'prelude-yank-to-end-of-line)

(defun prelude-shift-left-visual ()
  "Shift left and restore visual selection."
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun prelude-shift-right-visual ()
  "Shift right and restore visual selection."
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(define-key evil-visual-state-map (kbd ">") 'prelude-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'prelude-shift-left-visual)

;; 2021/02/20 - 纠正回退不起作用的问题
(define-key evil-normal-state-map (kbd "u") 'undo-tree-undo)
(define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)

;; Scrolling
(defun rezo-evil-scroll-down-other-window ()
  (interactive)
  (scroll-other-window))

(defun rezo-evil-scroll-up-other-window ()
  (interactive)
  (scroll-other-window '-))

(define-key evil-normal-state-map
  (kbd "C-S-d") 'rezo-evil-scroll-down-other-window)

(define-key evil-normal-state-map
  (kbd "C-S-u") 'rezo-evil-scroll-up-other-window)

(evil-leader/set-key
  "<SPC>" 'keyboard-quit
  "<ESC>" 'keyboard-quit
  "1" 'delete-other-windows
  "2" 'winner-undo
  "3" 'counsel-switch-buffer
  "4" 'counsel-M-x
  "5" 'lsp-execute-code-action
  "0" 'delete-window
  "%" 'evilmi-jump-items
  "-" 'hs-hide-level
  "=" 'hs-toggle-hiding
  "["  'previous-buffer
  "]"  'next-buffer

  "bb" 'counsel-switch-buffer
  "bc" 'clone-indirect-buffer
  "bd" 'ediff-buffers
  "bi" 'ibuffer
  "bk" 'kill-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer

  "eei" 'indent-region
  "eee" 'iedit-mode
  "eep" 'pop-global-mark
  "eem" 'mc/mark-all-like-this
  "edf" 'ediff
  "eff" 'hs-hide-level
  "efe" 'hs-toggle-hiding
  "efh" 'hs-minor-mode

  "emb" 'emms-previous
  "emf" 'emms-next
  "emi" 'emms-volume-raise
  "emd" 'emms-volume-lower
  "emp" 'emms-pause
  "ems" 'emms-show
  "emS" 'emms-stop
  "emh" 'emms-shuffle
  "emg" 'emms-playlist-mode-go
  "eml" 'emms-toggle-repeat-track
  "emL" 'emms-toggle-repeat-playlist


  "fb" 'ido-find-file-other-window
  "fd" 'counsel-find-file
  "ff" 'projectile-find-file
  "fl" 'counsel-locate
  "fp" 'projectile-find-file
  "fr" 'counsel-recentf
  ;; fzf required
  "fz" 'counsel-fzf

  "cr" 'read-only-mode

  ;; for git operations
  "cgg" 'magit-status
  "cgb" 'magit-blame
  "cgd" 'magit-diff
  "cgl" 'magit-log-buffer-file
  "cgt" 'git-timemachine
  "cgm" 'smerge-ediff

  ;; for for projectile
  "cpp" 'projectile-switch-project
  "cpd" 'projectile-dired
  "cpf" 'projectile-find-file
  "cpF" 'projectile-find-file-in-known-projects

  ;; for lsp mode
  "cla" 'lsp-ui-sideline-apply-code-actions
  "cld" 'lsp-find-definition
  "clD" 'lsp-find-declaration
  "cli" 'lsp-find-implementation
  "clr" 'lsp-find-references

  "j" 'avy-goto-char
  "g" 'lsp-find-definition

  "kk" 'kill-this-buffer

  "oa" 'org-agenda
  "od" 'org-todo
  "oo" 'org-capture
  "occ" 'org-clock-goto
  "ocb" 'org-clock-in
  "oce" 'org-clock-out
  "ott" 'org-timer-set-timer
  "otb" 'org-timer-start
  "ote" 'org-timer-stop
  "osb" 'org-schedule
  "ose" 'org-deadline

  "rr" 'anzu-query-replace-at-cursor
  "rs" 'anzu-query-replace
  "ra" 'anzu-query-replace-regexp

  "sa" 'swiper-all
  "sc" 'swiper-thing-at-point
  "sr" 'counsel-rg
  "so" 'occur
  "sp" 'counsel-projectile-rg
  "si" 'counsel-imenu
  "ss" 'swiper
  ;;  "ss" 'helm-swoop

  "wd" 'delete-window
  "ww" 'other-window
  "wq" 'quit-window
  "wp" 'winner-undo
  "wn" 'winner-redo
  "ws" 'split-window-horizontally
  "wv" 'split-window-vertically

  "xb" 'counsel-switch-buffer
  "xB" 'ibuffer
  "xd" 'dired
  "xf" 'counsel-find-file
  "xF" 'ido-find-file-other-window
  "xi" 'indent-region
  "xk" 'ido-kill-buffer
  "xo" 'other-window
  "xnd" 'narrow-to-defun
  "xne" 'org-narrow-to-element
  "xnw" 'widen
  "xr" 'read-only-mode
  "xs" 'save-buffer
  "xu" 'undo-tree-visualize
  "xw" 'write-file
  "xx" 'exchange-point-and-mark
  "x0" 'delete-window
  "x1" 'delete-other-windows
  "x2" 'split-window-below
  "x3" 'split-window-right
  "x;" 'comment-line

  "y" 'easy-kill
  )

(provide 'rezo-evil)
