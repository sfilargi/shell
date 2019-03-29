
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-strict-missing-semi-warning nil)
 '(package-selected-packages
   (quote
    (tide markdown-mode ivy protobuf-mode rust-mode flycheck-golangci-lint go-autocomplete auto-complete ag alchemist js2-mode closure-lint-mode clojure-mode ace-window go-mode elixir-mode flycheck-rebar3 erlang flycheck-elixir rubocop flycheck helm-projectile zenburn-theme helm projectile monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; disable the "Insert" key
(define-key global-map [(insert)] nil)
;; disable backup~ files
(setq make-backup-files nil)
;; disable #autosave# files
(setq auto-save-default nil)

;; disable the menu bar
(menu-bar-mode -1)


(load-theme 'monokai t)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
;;(projectile-global-mode)

(defun flycheck-python-setup ()
  (flycheck-mode))
(add-hook 'python-mode-hook #'flycheck-python-setup)

(setq flycheck-python-pylint-executable "/Users/sfilargi/.pythons/python3.6/bin/pylint")

;;(require 'helm-config)
;;(helm-mode 1)

;;(desktop-save-mode 1)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))


;;(add-hook 'before-save-hook
;;          (lambda ()
;;            (untabify (point-min) (point-max))))

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Replace with helm versions
;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
;; (global-set-key (kbd "C-x C-f") #'projectile-find-file)

;; Autocomplete
;; (ac-config-default)
;; (require 'go-autocomplete)
;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)


(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))


(global-whitespace-mode 1)

(eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

;; C/C++
(setq c-default-style "linux"
      c-basic-offset 4)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-cont-nonempty '+)))

(add-hook 'python-mode-hook
          '(lambda ()
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-cont-nonempty '+)))

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-enable-caching t)


;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

