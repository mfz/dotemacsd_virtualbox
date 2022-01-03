(setq inhibit-startup-message t
      initial-scratch-message nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 1)

(line-number-mode t)
(column-number-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; make xdg-open work, to open files from within emacs
;this messes up ipython
;(setq process-connection-type nil)

;; try fixing slow scrolling
;(setq-default bidi-display-reordering  nil)

;(setq-default indent-tabs-mode nil)
(put 'narrow-to-region 'disabled nil)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-solarized-light t)
					;(load-theme 'doom-one t)
  (doom-themes-org-config))

(use-package all-the-icons ; need to run M-x all-the-icons-install-fonts
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

(use-package solarized-theme
  :disabled
  :ensure t
  :init (load-theme 'solarized-light t))

(use-package window-numbering
 :ensure t
 :init (window-numbering-mode t))

(use-package paren
   :ensure t
   :config
   (show-paren-mode t))

(use-package which-key
    :ensure t
    :config
    (which-key-mode))

(use-package company
    :ensure t
    :init
    (global-company-mode t)
    :bind ("C-;" . company-complete-common)
    )

(use-package company-quickhelp
  :ensure t
  :hook (company-mode . company-quickhelp-mode))

(use-package ivy
  :ensure t
  :init (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "))

(use-package counsel
  :ensure t
  :bind*
  (("M-x"         . counsel-M-x)
   ("C-x C-f"     . counsel-find-file)
   ))

(use-package swiper
  :ensure t
  :bind
  (("C-s" . swiper)))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package pdf-tools
  :ensure t
  :config
  (setq-default pdf-view-display-size 'fit-page)
  (pdf-tools-install :no-query))

(use-package julia-mode
  :ensure t)

(use-package jupyter
  :ensure t
  :config
  (require 'jupyter-python)
  (require 'jupyter-julia)
  (require 'jupyter-R)
  (setq jupyter-eval-use-overlays t))

(use-package org
    :ensure t
    :config
    (setq org-hide-emphasis-markers t)
    ; show inline images
    (org-display-inline-images t t)
    (setq org-startup-with-inline-images "inlineimages")
    ; press RET to follow links
    (setq org-return-follows-link t)
    (setq org-support-shift-select t)
    ; use syntax highlighting in org-file code blocks
    (setq org-src-fontify-natively t)
    (setq org-element-use-cache nil)
    (setq org-latex-to-pdf-process (list "latexmk -pdf %f"))
    (setq org-agenda-files (quote ("/home/florian/Notes")))

    ;; when ESS is used, the julia REPL is started with jupyter-repl-lang-mode as ess-julia-mode
    ;; then we might need to set
    ;;(push '("jupyter-julia" . ess-julia) org-src-lang-modes)

    (org-babel-do-load-languages
     'org-babel-load-languages
     '((python . t)
       (sqlite . t)
       ;(R . t)
       (shell . t)
       (dot . t)
       ;;(julia . t)
       (jupyter . t)))
    (setq org-babel-sh-command "bash")
    ; don't ask for permission when executing code blocks
    (setq org-confirm-babel-evaluate nil)
    (global-set-key (kbd "C-c a") 'org-agenda)
    ;;file to save todo items
    (setq org-agenda-files (quote ("/home/florian/Notes")))
    (define-key global-map (kbd "C-c c") 'org-capture)
    (setq org-capture-templates
	  '(("t" "todo" entry (file+headline "/home/florian/Notes/TODO.org" "Tasks")
	     "* TODO [#A] %?")
	     ("c" "capture" entry (file "/home/florian/Notes/Capture.org")
	     "* %?"
	     :empty-lines 1)
	    ("j" "journal" entry (file+datetree "/home/florian/Notes/Journal.org")
	     "* Item: %?\n  %i\n  from: %a"
	     :empty-lines 1)
	    ))        
)

(use-package org-noter
  :ensure t)

(use-package helm-bibtex
  :ensure t
  :config
  (setq bibtex-completion-bibliography '( "~/Notes/References/Bibliography.bib" ) ;the major bibtex file
	bibtex-completion-library-path '("~/Notes/References/") ;the directory to store pdfs
	bibtex-completion-notes-path "~/Notes/References/" ;the note file for reference notes
	))


(use-package org-ref
		 :after org
		 :ensure t
		 :config
		 (require 'org-ref-helm)
		 (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
		       org-ref-insert-cite-function 'org-ref-cite-insert-helm
		       org-ref-insert-label-function 'org-ref-insert-label-link
		       org-ref-insert-ref-function 'org-ref-insert-ref-link
		       org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))
		 :bind
		 (:map org-mode-map
		       ("C-c ]" . 'org-ref-insert-link)))

(use-package org-pdftools
  :ensure t
  :hook (org-mode . org-pdftools-setup-link))

(set-face-attribute 'org-meta-line nil :height 0.8 :slant 'normal
		    :foreground "#C0C0C0")

(set-face-attribute 'org-block-begin-line nil :height 0.8 :slant 'normal
		    :foreground "light grey")

(set-face-attribute 'org-block-end-line nil :height 0.8 :slant 'normal
		    :foreground "light grey")



;; use Doom theme config instead
;;
;; (setq org-src-block-faces '(("emacs-lisp" (:background "ivory"))
;; 			    ("elisp" (:background "ivory"))
;; 			    ("python" (:background "ivory"))
;; 			    ("julia" (:background "ivory"))
;; 			    ("jupyter-julia" (:background "ivory"))
;; 			    ("jupyter-python" (:background "ivory"))
;; 			    ("shell" (:background "ivory"))
;; 			    ("sh" (:background "ivory"))
;; 			    ("R" (:background "ivory"))
;; 			    ))

(use-package ox-hugo
  :ensure t
  :after ox)

(setq org-roam-v2-ack t)

(use-package org-roam
    :ensure t
    :custom
    (org-roam-directory (file-truename "~/RoamFiles"))
    (org-roam-completion-everywhere t) 
    :bind
    (("C-c n l" . org-roam-buffer-toggle)
     ("C-c n f" . org-roam-node-find)
     ("C-c n i" . org-roam-node-insert)
     :map org-mode-map
     ("C-M-i" . completion-at-point)
     ("C-c n c" . org-id-get-create))
    :config
    (org-roam-setup))

(use-package org-roam-bibtex
  :ensure t
  :after (org-roam)
  :hook org-roam-mode
  :config
  (setq orb-preformat-keywords
     '("citekey" "title" "url" "author-or-editor" "keywords" "file")
     orb-process-file-keyword t
     orb-attached-file-extensions '("pdf"))
   (add-to-list 'org-roam-capture-templates
      	    '("n" "bibliography reference + notes" plain
      	      ""
      	      :if-new
      	      (file+head "/home/florian/Notes/References/${citekey}.org" "#+title: ${citekey}: ${title}\n")))

  (require 'org-ref))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(defvar fz/image-dir "Images")

(defun fz/ensure-directory (path)
  "create directory if it does not exist and user agrees"
  (when (and (not (file-exists-p path))
	     (y-or-n-p (format "Directory %s does not exist. Create it?" path)))
    (make-directory path :parents)))

(defun fz/paste-image-clipboard ()
  "Paste screenshot from clipboard"
  (interactive)
  (fz/ensure-directory (file-name-as-directory fz/image-dir))
  (let ((image-path (concat (file-name-as-directory fz/image-dir)
			    (file-name-base (buffer-name))
			    (format-time-string "_%Y_%m_%d__%H_%M_%S")
			    ".png")))
    (shell-command-to-string (format "xclip -selection clipboard -t image/png -o > %s" image-path))
    (insert "[[file:" image-path "]]\n")
    (org-display-inline-images)))

(setq org-image-actual-width nil)
