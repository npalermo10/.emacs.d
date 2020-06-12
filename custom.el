(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-safe-themes
   (quote
    ("024efcde8a841ff45df8b871d5b693d4c9a7e03f0a02a1af496e79acb5e2f745" "e4e97731f52a5237f37ceb2423cb327778c7d3af7dc831788473d4a76bcc9760" default)))
 '(elfeed-goodies/entry-pane-position (quote bottom))
 '(elfeed-goodies/entry-pane-size 0.7)
 '(elfeed-goodies/tag-column-width 10)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(erc-nick "synthstutter")
 '(fci-rule-color "#383838")
 '(org-capture-templates
   (quote
    (("b" "buy list" entry
      (file "~/org/agenda/buy.org")
      "")
     ("Q" "qbic" entry
      (file "~/org/agenda/qbic.org")
      "")
     ("s" "school" entry
      (file "~/org/agenda/school.org")
      "")
     ("w" "work" entry
      (file "~/org/agenda/work.org")
      "")
     ("h" "home" entry
      (file "~/org/agenda/home.org")
      "")
     ("l" "lab" entry
      (file "~/org/agenda/lab.org")
      ""))))
 '(org-catch-invisible-edits (quote error))
 '(org-structure-template-alist
   (quote
    (("p" "#+BEGIN_SRC python :results output
?
#+END_SRC " "")
     ("s" "#+BEGIN_SRC ?

#+END_SRC" "<src lang=\"?\">

</src>")
     ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE" "<example>
?
</example>")
     ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE" "<quote>
?
</quote>")
     ("v" "#+BEGIN_VERSE
?
#+END_VERSE" "<verse>
?
</verse>")
     ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM" "<verbatim>
?
</verbatim>")
     ("c" "#+BEGIN_CENTER
?
#+END_CENTER" "<center>
?
</center>")
     ("l" "#+BEGIN_LaTeX
?
#+END_LaTeX" "<literal style=\"latex\">
?
</literal>")
     ("L" "#+LaTeX: " "<literal style=\"latex\">?</literal>")
     ("h" "#+BEGIN_HTML
?
#+END_HTML" "<literal style=\"html\">
?
</literal>")
     ("H" "#+HTML: " "<literal style=\"html\">?</literal>")
     ("a" "#+BEGIN_ASCII
?
#+END_ASCII" "")
     ("A" "#+ASCII: " "")
     ("i" "#+INDEX: ?" "#+INDEX: ?")
     ("I" "#+INCLUDE: %file ?" "<include file=%file markup=\"?\">"))))
 '(package-selected-packages
   (quote
    (elfeed-org elfeed-goodies hyperbole zotxt zotelo zenburn-theme wiki-summary web-mode use-package swiper smartparens rainbow-delimiters python-mode pdf-tools multiple-cursors magit ledger-mode key-chord jedi impatient-mode helm git flycheck elpy ein dropdown-list drag-stuff auto-indent-mode auctex arduino-mode ace-jump-mode)))
 '(py-shell-switch-buffers-on-execute nil)
 '(python-shell-buffer-name "ipython")
 '(send-mail-function (quote mailclient-send-it))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-search-feed-face ((t (:foreground "pale green"))))
 '(elfeed-search-tag-face ((t (:foreground "SkyBlue4"))))
 '(elfeed-search-title-face ((t (:foreground "gray70")))))
