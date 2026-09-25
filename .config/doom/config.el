;; :: c a u s t i c  c o m p u t i n g ::
;; ~/.config/doom/config.el
;; host: $HOSTNAME
;; DOOM Emacs configuration file
;; created <2026-09-25> :: last modified <2026-09-25T14:33-06:00>
;;
;; --- BEGIN CONFIGURATION FILE ---

;; :: fonts ::
(setq doom-font                (font-spec :family "JetBrains Mono Slashed" :size 17)
      doom-variable-pitch-font (font-spec :family "Inter" :size 15)
      doom-serif-font          (font-spec :family "FreeSerif" :size 19)
      doom-symbol-font         (font-spec :family "JetBrains Mono Slashed" :size 17)
      doom-big-font            (font-spec :family "JetBrains Mono Slashed" :size 24))

;; :: theme ::
(setq doom-theme 'doom-outrun-electric)

;; :: line numbers ::
(setq display-line-numbers-type t)

;; :: editor ::
;; 2 space tabs, no tabs.
(setq-default tab-width 2
              indent-tabs-mode nil)

;; :: scrolling ::
(setq scroll-preserve-screen-position t)

;; :: autosave :: 
(setq auto-save-default nil)

;; :: vterm ::
(setq vterm-shell "/usr/bin/zsh")
(setq vterm-max-scrollback 10000)
(setq vterm-timer-delay 0.01)

;; :: org mode ::
(setq org-directory "~/SyncPool/DBs/PKMS/Master/Org")

;; :: org mode ::
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; --- END CONFIGURATION FILE ---
