;;; rezochiang-hydra.el --- configure hydra key bindings..
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
(prelude-require-package 'hydra)
(require 'hydra)

;; For org operations.
;; from: https://www.reddit.com/r/emacs/comments/3ba645/does_anybody_have_any_real_cool_hydras_to_share/
;; (defhydra hydra-global-org ()
;;   ("t" org-timer-start :exit t)
;;   ("s" org-timer-stop :exit t)
;;   ("r" org-timer-set-timer :exit t)
;;   ("p" org-timer :exit t)
;;   ("w" (org-clock-in '(4)) :exit t)
;;   ("o" org-clock-out :exit t)
;;   ;; Visit the clocked task from any buffer
;;   ("j" org-clock-goto :exit t)
;;   ("l" org-capture-goto-last-stored :exit t)
;;   ("c" hydra-global-all/body :exit t)
;;   ("q" nil)
;;   )


;; For projectile operations.
(defhydra hydra-global-projectile ()
  "projectile"
  ("f" projectile-find-file :exit t)
  ("g" projectile-grep :exit t)

  ("c" hydra-global-all/body :exit t)
  ("q" nil)
  )


;; For emms control.
(defhydra hydra-global-emms ()
  "emms-control"
  ("e" emms-start :exit t)
  ("E" emms-stop :exit t)
  ("f" emms-next)
  ("d" emms-previous)
  ("p" emms-pause :exit t)
  ("i" emms-show :exit t)
  ("h" emms-shuffle)
  ("l" emms-playlist-mode-go)
  ("r" emms-toggle-repeat-track :exit t)
  ("R" emms-toggle-repeat-playlist :exit t)

  ("c" hydra-global-all/body :exit t)
  ("q" nil)
  )

(defhydra hydra-narrow()
  ("d" narrow-to-defun :exit t)
  ("n" narrow-to-region :exit t)
  ("w" widen :exit t)

  ("q" nil)
  )

(defhydra hydra-global-emacsx(:color pink :hint nil)
  "
Alias C-x^
-----------------------------------------------------------------------
_rr_ : point to register        _rj_ : jump to register        _ri_ : insert register
_q_ : exit
"
  ("b" ido-switch-buffer :exit t)
  ("B" ibuffer :exit t)
  ("f" ido-find-file :exit t)
  ("F" ido-find-file-other-window :exit t)
  ("i" indent-region :exit t)
  ("k" ido-kill-buffer :exit t)
  ("o" other-window :exit t)

  ("rr" point-to-register :exit t)
  ("rj" jump-to-register :exit t)
  ("ri" insert-register :exit t)

  ("s" save-buffer :exit t)
  ("u" undo-tree-visualize :exit t)
  ("w" write-file :exit t)

  ("0" delete-window :exit t)
  ("1" delete-other-windows :exit t)
  ("2" split-window-below :exit t)
  ("3" split-window-right :exit t)

  ("q" nil)
  )

(defhydra hydra-global-emacsc()
  ("r" read-only-mode :exit t)

  ("q" nil)
  )


(defhydra hydra-global-misc()
  ("d" dired :exit t)
  ("D" dired-other-window :exit t)
  ("e" ediff-buffers :exit t)
  ("h" hs-minor-mode :exit t)
  ("i" imenu-anywhere :exit t)
  ("g" git-timemachine :exit t)
  ("t" tiny-expand :exit t)

  ("q" nil)
  )

(defhydra hydra-hs-mode()
  ("/" hs-show-all :exit t)
  ("1" hs-hide-block :exit t)
  ("!" hs-show-block :exit t)
  ("2" hs-hide-level :exit t)
  ("@" hs-show-level :exit t)

  ("q" nil)
  )

;; Main Entrance.
(defhydra hydra-global-all(:color pink :hint nil)
  "
Shortcuts Buffer^
-----------------------------------------------------------------------
_bb_ : ido-switch-buffer         _bi_ : ibuffer
_bp_ : previous-buffer           _bn_ : next-buffer
_bc_ : clone-buffer              _b4c_ : clone-indirect-buffer-other-window
[_c_] : emacs C-c functions
[_ee_] : emms-mode-control
_ff_ : ido-find-file             _fb_ : ido-find-file-ow
_fp_ : projectile-find-file      _jj_ : avy-goto-char
_kk_ : kill-this-buffer          _ki_ : ido-kill-buffer
[_m_] : misc functions
_oa_ : org-agenda                _oo_ : org-capture
_occ_: org-clock-goto           _ocb_ : org-clock-in          _oce: org-clock-out
_ott_: org-timer-set-timer      _ocb_ : org-timer-start       _oce: org-timer-stop
_osb_: org-schedule             _ose_ : org-deadline          _oa_ : org-agenda
_oo_ : org-capture
_so_ : occur                     _ss_ : swiper                _sx_ : smex
_ww_ : delete-other-windows      _wp_ : winner-undo           _wn_ : winner-redo
_w1_ : delete-window             _w2_ : split-window-below    _w3_ : split-window-right
[_x_] : emacs C-x functions
_q_ : exit
"
  ("bb" ido-switch-buffer :exit t)
  ("bi" ibuffer :exit t)
  ("bp" previous-buffer :exit t)
  ("bn" next-buffer :exit t)
  ("bc" clone-indirect-buffer :exit t)
  ("bk" kill-this-buffer :exit t)
  ("b4c" clone-indirect-buffer-other-window :exit t)
  ("ee" hydra-global-emms/body :exit t)
  ("ff" ido-find-file :exit t)
  ("fb" ido-find-file-other-window :exit t)
  ("fp" projectile-find-file :exit t)
  ("jj" avy-goto-char :exit t)
  ("kk" kill-this-buffer :exit t)
  ("ki" ido-kill-buffer :exit t)
  ("m" hydra-global-misc/body :exit t)
  ("oa" org-agenda :exit t)
  ("oo" org-capture :exit t)
  ("occ" org-clock-goto :exit t)
  ("ocb" org-clock-in :exit t)
  ("oce" org-clock-out :exit t)
  ("ott" org-timer-set-timer :exit t)
  ("otb" org-timer-start :exit t)
  ("ote" org-timer-stop :exit t)
  ("osb" org-schedule :exit t)
  ("ose" org-deadline :exit t)
  ("so" occur :exit t)
  ("ss" swiper :exit t)
  ("sx" smex :exit t)
  ("ww" delete-other-windows :exit t)
  ("wp" winner-undo :exit t)
  ("wn" winner-redo :exit t)
  ("w1" delete-window :exit t)
  ("w2" split-window-below :exit t)
  ("w3" split-window-right :exit t)


  ("x" hydra-global-emacsx/body :exit t)
  ("c" hydra-global-emacsc/body :exit t)
  ("q" nil)
)


;; (global-unset-key (kbd "C-z"))

;; 如果是GUI下,取消退出快捷键
(if (not(eq window-system 'nil))
    (global-unset-key (kbd "C-x C-c")))

 ;; 纠正终端下emacs的删除显示帮助(C-h还可用F1),注意这里如果加了尖括号就没有效果了
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)


(define-key evil-normal-state-map (kbd "SPC") 'hydra-global-all/body)
(global-set-key (kbd "M-]") 'hydra-global-all/body)

(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'isearch-forward-regexp)


(global-unset-key (kbd "<f12>"))
(global-set-key (kbd "<f12>") 'smex)

(provide 'rezochiang-hydra)
;;; rezochiang-hydra.el ends here
