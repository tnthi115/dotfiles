;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; FONTS
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13.2 :weight 'light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 13.2 :weight 'regular)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 20))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic))

;; TRANSPARENT BACKGROUND
;; (only when window is focused)
;; (set-frame-parameter nil 'alpha-background 69')
;; (add-to-list 'default-frame-alist '(alpha-background . 69))
;; (doom/set-frame-opacity 69)

;; NO WINDOW TITLE
(add-to-list 'default-frame-alist '(undecorated-round . t))

;; MARKDOWN
(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "CaskaydiaCove Nerd Font"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2)))))

;; SHELLS
(setq shell-file-name "/opt/homebrew/bin/fish"
      vterm-max-scrollback 5000)
;; (map! :leader
;;       :desc "Vterm popup toggle" "t t" #'+vterm/toggle)

;; SETTINGS
(setq confirm-kill-emacs nil)
(setq scroll-margin 8)
;; (add-hook! 'doom-init-ui-hook (fringe-mode 8))
;; (add-hook! 'doom-init-ui-hook (global-git-gutter-mode))

;; KEYBINDINGS
(after! evil
  (map! :desc "Switch to previous tab." :n "L" #'+tabs:next-or-goto)
  (map! :desc "Switch to next tab." :n "H" #'+tabs:previous-or-goto))
;; (after! evil
;;   (evil-define-key* 'normal 'global
;;     (kbd "C-h") #'+tabs:next-or-goto
;;     (kbd "C-l") #'+tabs:previous-or-goto))
;; (evil-define-key ('normal 'global)
;;   (kbd "L") #'+tabs:next-or-goto
;;   (kbd "H") #'+tabs:previous-or-goto)
(map! :leader
      :desc "Toggle treemacs" "e" #'treemacs)
;; (map! :leader
;;       :desc "Toggle neotree" "e" #'neotree)
(map! :desc "Toggle vterm popup" :n "C-/" #'+vterm/toggle)
(map! "C-h" #'evil-window-left)
(map! "C-j" #'evil-window-down)
(map! "C-k" #'evil-window-up)
(map! "C-l" #'evil-window-right)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (after! flycheck-inlinje
;;   (with-eval-after-load 'flycheck
;;     (add-hook 'flycheck-mode-hook #'global-flycheck-inline-mode)))
;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'global-flycheck-inline-mode))
;; (after! flycheck
;;   (add-hook 'flycheck-mode-hook #'global-flycheck-inline-mode))

;; (after! git-gutter
;;   (global-git-gutter-mode))


(setq lsp-go-analyses '((shadow . t)
                        (simplifycompositelit . :json-false)))

;; (use-package lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred

;; (lsp-headerline-breadcrumb-mode)

(after! which-key
  (setq which-key-idle-delay 0.01))

;; centaur tabs


(after! centaur-tabs
  (centaur-tabs-group-by-projectile-project) ;;for https://github.com/ema2159/centaur-tabs/issues/181#issuecomment-1075806796
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "wave"
        centaur-tabs-height 24
        centaur-tabs-set-icons t
        centaur-tabs-gray-out-icons #'buffer
        ;; centaur-tabs-set-bar #'under
        x-underline-at-descent-line t
        centaur-tabs-close-button "×"
        centaur-tabs-modified-marker "•"
        centaur-tabs-show-new-tab-button nil
        ;; centaur-tabs-show-count t
        centaur-tabs-show-navigation-buttons t)
  ;; (defun centaur-tabs-hide-tab (x)
  ;;   "Do no to show buffer X in tabs."
  ;;   (let ((name (format "%s" x)))
  ;;     (or
  ;;      ;; Current window is not dedicated window.
  ;;      (window-dedicated-p (selected-window))

  ;;      ;; Buffer name not match below blacklist.
  ;;      (string-prefix-p "*epc" name)
  ;;      (string-prefix-p "*helm" name)
  ;;      (string-prefix-p "*Helm" name)
  ;;      (string-prefix-p "*Compile-Log*" name)
  ;;      (string-prefix-p "*lsp" name)
  ;;      (string-prefix-p "*company" name)
  ;;      (string-prefix-p "*Flycheck" name)
  ;;      (string-prefix-p "*tramp" name)
  ;;      (string-prefix-p " *Mini" name)
  ;;      (string-prefix-p "*help" name)
  ;;      (string-prefix-p "*straight" name)
  ;;      (string-prefix-p " *temp" name)
  ;;      (string-prefix-p "*Help" name)
  ;;      (string-prefix-p "*mybuf" name)

  ;;      (string-prefix-p "*doom" name)
  ;;      (string-prefix-p "*scratch*" name)
  ;;      (string-prefix-p "*Messages" name)

  ;;      ;; cpp
  ;;      (string-prefix-p "*clangd" name)
  ;;      (string-prefix-p "*clangd::stderr" name)
  ;;      (string-prefix-p "*ccls*" name)
  ;;      (string-prefix-p "*ccls::stderr*" name)
  ;;      (string-prefix-p "*format-all-errors*" name)

  ;;      ;; bash
  ;;      (string-prefix-p "*bash-ls*" name)
  ;;      (string-prefix-p "*bash-ls::stderr*" name)

  ;;      ;; org
  ;;      (string-prefix-p "*Org Preview LaTeX Output*" name)
  ;;      (string-prefix-p "*elfeed-log*" name)

  ;;      ;; python
  ;;      (string-prefix-p "*pyright*" name)
  ;;      (string-prefix-p "*pyright::stderr*" name)

  ;;      ;; other
  ;;      (string-prefix-p "*Native-compile-Log*" name)
  ;;      (string-prefix-p "*httpd*" name)
  ;;      (string-prefix-p "*Shell Command Output" name)

  ;;      ;; Is not magit buffer.
  ;;      (and (string-prefix-p "magit" name)
  ;;           (not (file-name-extension name)))
  ;;      )))
  (map! :leader :prefix "b"
        ;; "t n" #'centaur-tabs-forward
        ;; "t p" #'centaur-tabs-backward
        :desc "Move buffer to the right" ">" #'centaur-tabs-move-current-tab-to-right
        :desc "Move buffer to the left" "<" #'centaur-tabs-move-current-tab-to-left
        (:prefix ("g" . "Tab groups")
         :desc "Next tab group" ">" #'centaur-tabs-forward-group
         :desc "Previous tab group" "<" #'centaur-tabs-backward-group)))

(defun tdr/fix-centaur-tabs ()
  (centaur-tabs-mode -1)
  (centaur-tabs-mode)
  (centaur-tabs-headline-match))
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (tdr/fix-centaur-tabs)))
              (tdr/fix-centaur-tabs)))
