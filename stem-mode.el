;;; stem-mode.el -*- lexical-binding: t; -*-


(defvar stem-constants
  '("E"
    "PI"))

(defvar stem-builtins
  '("def" "undef" "dip" "compose" "quote" "eval" "curry" "swap" "drop" "dsc" "cut" "read" "nop" "strquote" "exit"))

(defvar stem-functions
  '("map" "filter" "reduce" "range" "loop" "abs" "neg" "factorial" "sin" "cos" "exp"))

(defvar stem-operators
  '("+" "-" "*" "/" "<=" ">=" "!=" "=" ">" "<"))

(defvar stem-tab-width 4 "Width of a tab for stem mode")

(defvar stem-font-lock-defaults
  `((
     ;; stuff between double quotes
     ("\"\\.\\*\\?" . font-lock-string-face)
     ("[\\|]" . font-lock-bracket-face)
     ( ,(regexp-opt stem-builtins 'words) . font-lock-builtin-face)
     ( ,(regexp-opt stem-constants 'words) . font-lock-constant-face)
     ("[a-zA-Z_'0-9]+" . font-lock-function-name-face)
     ( ,(regexp-opt stem-functions 'words) . font-lock-keyword-face)
     ( ,(regexp-opt stem-operators 'words) . font-lock-operator-face)
     ("\\([0--9]+\\.[0-9]+\\)" . font-lock-number-face))))


(define-derived-mode stem-mode fundamental-mode "stem script"
  "stem mode is a major mode for editing stem files"
  ;; you again used quote when you had '((stem-hilite))
  ;; I just updated the variable to have the proper nesting (as noted above)
  ;; and use the value directly here
  (setq font-lock-defaults stem-font-lock-defaults)

  (when stem-tab-width
    (setq tab-width stem-tab-width))

  (setq comment-start "#")
  (setq comment-end "")

  (modify-syntax-entry ?# "< b" stem-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" stem-mode-syntax-table))


(provide 'stem-mode)
