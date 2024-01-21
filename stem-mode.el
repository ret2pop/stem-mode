;;; stem-mode.el --- a major mode for the stem programming language                    -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Preston Pan

;; Author: Preston Pan <preston@nullring.xyz>
;; Keywords: lisp stem
;; Version: 0.0.1
;; URL: https://stemdoc.nullring.xyz
;; Package-Requires: ((emacs "24.3"))

;;; Commentary:

;; Provides syntax highlighting for stem.

;;; Code:
(defvar stem-constants
  '("E"
    "PI"))

(defvar stem-builtins
  '("def" "undef" "vat" "eval" "curry" "cut" "nop" "strquote" "include" "read" "exit" "loop" "if" "when" "sort"))

(defvar stem-functions
  '("map" "filter" "reduce" "range" "while" "keep" "abs" "neg" "factorial" "sin" "cos" "exp"))

(defvar stem-stack-builtins
  '("compose" "quote" "swap" "swap2" "swap3" "swapd" "swapt" "drop" "dsc" "len" "dip" "dip2" "dip3" "dup" "dup2" "dup3" "dup4" "dupd" "dupt" "dupq" "dsc2" "dsc3" "dscd" "dsct" "dscq" "over" "over2" "over3" "over4" "read"))

(defvar stem-operators
  '("+" "-" "*" "/" "<=" ">=" "!=" "=" ">" "<" "?" "."))

(defvar stem-typeops
  '("type" "tostr" "stoi"))

(defvar stem-tab-width 4 "Width of a tab for stem mode.")

(defvar stem-font-lock-defaults
  `((
     ;; stuff between double quotes
     ("\"\\.\\*\\?" . font-lock-string-face)
     ( ,(regexp-opt stem-functions 'words) . font-lock-builtin-face)
     ( ,(regexp-opt stem-stack-builtins 'words) . font-lock-builtin-face)
     ( ,(regexp-opt stem-constants 'words) . font-lock-constant-face)
     ;; ("[a-zA-Z_][a-zA-Z0-9]*" . font-lock-warning-face)
     ( ,(regexp-opt stem-builtins 'words) . font-lock-keyword-face)
     ( ,(regexp-opt stem-typeops 'words) . font-lock-type-face)
     ( ,(regexp-opt stem-operators 'symbols) . font-lock-constant-face)
     ("\\(\\b[0-9]+\\|\\)\\(\\.\\)\\([0-9]+\\(e[-]?[0-9]+\\)?\\([lL]?\\|[dD]?[fF]?\\)\\)\\b" . font-lock-string-face)
     ("\\b\\(\\(0\\|[1-9][0-9]*\\)[uUlL]*\\)\\b" . font-lock-string-face))))




(define-derived-mode stem-mode fundamental-mode "stem script"
  "Stem mode is a major mode for editing stem files."
  (setq font-lock-defaults stem-font-lock-defaults)

  (when stem-tab-width
    (setq tab-width stem-tab-width))

  (setq comment-start "#")
  (setq comment-end "")

  (modify-syntax-entry ?# "< b" stem-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" stem-mode-syntax-table))


(provide 'stem-mode)
;;; stem-mode.el ends here
