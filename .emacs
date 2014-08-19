;; emacs config mostly for python-mode
;; el get setup script
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;Global lisp packages
(add-to-list 'load-path "/home/alexandr/.emacs.d/lisp/")
;; Solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/emacs-color-theme-solarized/")
(load-theme 'solarized-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;disable toolbar
(tool-bar-mode -1)
;; disable autosave mode
(setq auto-save-default nil)
;; disable menu bar
(menu-bar-mode -1)

;;ido mode
;;(require 'ido)
;;(ido-mode t)

;; full screen emacs
;;(defun toggle-fullscreen ()
;;  (interactive)
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;;)
;;(toggle-fullscreen)

;; virtualenvwrappers support for emacs
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(setq venv-location "/home/alexandr/.virtualenvs/")

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
;; jedi settings
(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-.") 'jedi:jump-to-definition)
             (local-set-key (kbd "C-,") 'jedi:jump-back)
             (local-set-key (kbd "C-c d") 'jedi:show-doc)
             (local-set-key (kbd "C-<tab>") 'jedi:complete)
	     (fci-mode)))


;; flycheck
;;(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save new-line))
;; fill-columt-indicator
(require 'fill-column-indicator)
;;(setq fci-rule-column 80)
(setq fci-rule-color "#586e75")
(setq fci-rule-width 1)
(fci-mode t)
(setq-default default-tab-width 4)

;; set font
(set-default-font "UbuntuMono-10")
;; sr-speedbar
(require 'sr-speedbar)

;; coffeescript
(custom-set-variables
 '(coffee-tab-width 4))

;;comment
(global-set-key [(control \#)] 'comment-or-uncomment-region)

;;set line num on 
(global-linum-mode t)

;; enable helm
(require 'helm-config)
(helm-mode 1)

;; helm settings
(global-set-key (kbd "M-x") 'helm-M-x)  ;; pretty smart M-x
(global-set-key (kbd "C-x b") 'helm-mini)  ;; ido analog
(global-set-key (kbd "M-y") 'helm-show-kill-ring)  ;; view copy-paste blocks
(global-set-key (kbd "C-x C-f") 'helm-find-files)  ;; helm find files
(global-set-key (kbd "C-c h o") 'helm-occur)   ;; search in current buffer interactive aka grep
