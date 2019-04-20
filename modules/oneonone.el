;; (defvar endless/popup-frame-parameters
;;   '((name . "MINIBUFFER")
;;     (minibuffer . only))
;;   "Parameters for the minibuffer popup frame.")

;; (defvar endless/minibuffer-frame
;;   (let ((mf (make-frame endless/popup-frame-parameters)))
;;     (iconify-frame mf) mf)
;;   "Frame holding the extra minibuffer.")

;; (defvar endless/minibuffer-window
;;   (car (window-list endless/minibuffer-frame t))
;;   "")

;; ;; (defmacro with-popup-minibuffer (&rest body)
;;   "Execute BODY using a popup minibuffer."
;;   (let ((frame-symbol (make-symbol "selected-frame")))
;;     `(let* ((,frame-symbol (selected-frame)))
;;        (unwind-protect
;;            (progn
;;              (make-frame-visible endless/minibuffer-frame)
;;              (when (fboundp 'point-screen-height)
;;                (set-frame-parameter
;;                 endless/minibuffer-frame
;;                 'top (point-screen-height)))
;;              (select-frame-set-input-focus endless/minibuffer-frame 'norecord)
;;              ,@body)
;;          (select-frame-set-input-focus ,frame-symbol)))))

;; (defun use-popup-minibuffer (function)
;;   "Rebind FUNCTION so that it uses a popup minibuffer."
;;   (let* ((back-symb (intern (format "endless/backup-%s" function)))
;;          (func-symb (intern (format "endless/%s-with-popup-minibuffer"
;;                                     function)))
;;          (defs `(progn
;;                   (defvar ,back-symb (symbol-function ',function))
;;                   (defun ,func-symb (&rest rest)
;;                     ,(format "Call `%s' with a poupup minibuffer." function)
;;                     ,@(list (interactive-form function))
;;                     (with-popup-minibuffer
;;                      (apply ,back-symb rest))))))
;;     (message "%s" defs)
;;     (when (and (boundp back-symb) (eval back-symb))
;;       (error "`%s' already defined! Can't override twice" back-symb))
;;     (eval defs)
;;     (setf (symbol-function function) func-symb)))

;; ;;; Try at own risk.
;; (use-popup-minibuffer 'read-from-minibuffer)
;;; This will revert the effect.
;; (setf (symbol-function #'read-from-minibuffer) endless/backup-read-from-minibuffer)
;; (setq endless/backup-read-from-minibuffer nil)

(provide 'oneonone)
