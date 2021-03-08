;;; Code:

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(use-package org
  :ensure org-plus-contrib
  :pin org)
;;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))

(put 'narrow-to-region 'disabled nil)
