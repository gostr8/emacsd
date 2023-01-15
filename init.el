;;
;; init.el
;; 

;; set shell path for macosx
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; for melpa...
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; for use-package...
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)



;; lsp-mode
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-mode lsp-deferred)
  :hook (go-mode . lsp-deferred)
  :config (progn
	    (setq lsp-prefer-flymake nil)))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
    :config (progn
            (setq lsp-ui-sideline-enable nil)
            (setq lsp-ui-doc-enable nil)))

;; company
(use-package company
  :ensure t
  :config (progn
            (setq company-idle-delay 0)
            (setq company-minimum-prefix-length 1)
            (setq company-tooltip-align-annotations t)))


;; snippet...
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package go-snippets
  :ensure t)

;; flycheck
(use-package flycheck
  :ensure t)


;; go-mode
(defun golang-before-save ()
  "Formatting buffer and organize imports in Go mode..."
  (when (eq major-mode 'go-mode)
    (lsp-organize-imports)
    (lsp-format-buffer)))

(use-package go-mode
  :ensure t
  :hook (before-save . golang-before-save))



;;
;; NO EDIT...
;; ...
;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(exec-path-from-shell magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
