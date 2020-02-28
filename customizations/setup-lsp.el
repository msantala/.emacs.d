(require 'lsp-mode)

;; company-lsp
(require 'company-lsp)
(push 'company-lsp company-backends)

;; lsp-ui
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; terraform
(add-hook 'terraform-mode-hook #'lsp)
(add-hook 'terraform-mode-hook 'flycheck-mode)
