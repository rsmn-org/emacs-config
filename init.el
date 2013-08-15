(require 'package)
(add-to-list 'package-archives
           '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(defvar my-packages 
  '(clojure-mode
    cyberpunk-theme
    paredit
    nrepl
    ac-nrepl
    popup
    auto-complete
    highlight-parentheses))


(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p)))

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(setq tab-always-indent 'complete)

(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)

(require 'highlight-parentheses)

(load-theme 'cyberpunk t)

;;repairing the cursor color issues 
;;black cursor on black background
(defun frame-bg (frame)
  "Custom behaviours for new frames."
  (with-selected-frame frame
    (set-cursor-color "#ffffff")))
(frame-bg (selected-frame))
(add-hook 'after-make-frame-functions 'frame-bg)
