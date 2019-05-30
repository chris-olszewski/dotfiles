;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(load-theme 'doom-nord t)

(setq doom-font (font-spec :family "Fira Mono" :size 12))
(setq evil-escape-key-sequence "fd")

;; If file starts with shebang sh open in sh-mode
(add-to-list 'magic-mode-alist '("# .bashrc" . sh-mode))

;; Remove b prefix for default cargo bindings
(after! rust-mode
  (map! :map rust-mode-map
        :localleader
        :desc "cargo build" "b" (λ! (compile "cargo build --color always"))
        :desc "cargo check" "c" (λ! (compile "cargo check --color always"))
        :desc "cargo run" "r" (λ! (compile "cargo run --color always"))
        :desc "cargo test" "t" (λ! (compile "cargo test --color always"))
        :desc "cargo fmt" "f" (λ! (compile "cargo fmt"))
        :desc "cargo bench" "B" (λ! (compile "cargo bench"))
        :desc "cargo clippy" "C" (λ! (compile "cargo clippy"))))
