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

(prelude-require-packages '(evil goto-chg evil-surround evil-visualstar evil-numbers evil-leader))

(require 'evil-visualstar)

(setq evil-mode-line-format 'before)

(setq evil-emacs-state-cursor  '("red" box))
(setq evil-normal-state-cursor '("gray" box))
(setq evil-visual-state-cursor '("gray" box))
(setq evil-insert-state-cursor '("gray" bar))
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
  "3" 'ido-switch-buffer
  "4" 'counsel-M-x
  "0" 'delete-window
  "%" 'evilmi-jump-items
  "-" 'hs-hide-level
  "=" 'hs-toggle-hiding
  "["  'previous-buffer
  "]"  'next-buffer

  "bb" 'ido-switch-buffer
  "bc" 'clone-indirect-buffer
  "bd" 'ediff-buffers
  "bi" 'ibuffer
  "bk" 'kill-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer

  "eei" 'indent-region
  "eee" 'mc/edit-lines
  "eep" 'pop-global-mark
  "eem" 'mc/mark-all-like-this
  "edf" 'ediff
  "eff" 'hs-hide-level
  "efe" 'hs-toggle-hiding
  "efh" 'hs-minor-mode

  "eme" 'emms-start
  "emE" 'emms-stop
  "emf" 'emms-next
  "emd" 'emms-previous
  "emp" 'emms-pause
  "emi" 'emms-show
  "emh" 'emms-shuffle
  "eml" 'emms-playlist-mode-go
  "emr" 'emms-toggle-repeat-track
  "emR" 'emms-toggle-repeat-playlist


  "fb" 'ido-find-file-other-window
  "ff" 'ido-find-file
  "fp" 'projectile-find-file
  "fr" 'recentf-open-files

  "cr" 'read-only-mode
  "j" 'avy-goto-char

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

  "sn" 'evil-search-forward
  "so" 'occur
  "sp" 'evil-search-backward
  "ss" 'swiper
;;  "ss" 'helm-swoop

  "wd" 'delete-window
  "ww" 'other-window
  "wq" 'quit-window
  "wp" 'winner-undo
  "wn" 'winner-redo
  "ws" 'split-window-horizontally
  "wv" 'split-window-vertically

  "xb" 'ido-switch-buffer
  "xB" 'ibuffer
  "xd" 'dired
  "xf" 'ido-find-file
  "xF" 'ido-find-file-other-window
  "xi" 'indent-region
  "xk" 'ido-kill-buffer
  "xo" 'other-window
  "xnd" 'narrow-to-defun
  "xne" 'org-narrow-to-element
  "xnw" 'widen
  "xrr" 'point-to-register
  "xrj" 'jump-to-register
  "xri" 'insert-register
  "xs" 'save-buffer
  "xu" 'undo-tree-visualize
  "xw" 'write-file
  "xx" 'exchange-point-and-mark
  "x0" 'delete-window
  "x1" 'delete-other-windows
  "x2" 'split-window-below
  "x3" 'split-window-right

  "y" 'easy-kill
  )

(provide 'rezo-evil)
