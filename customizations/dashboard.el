(require 'dashboard)
(dashboard-setup-startup-hook)

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(setq dashboard-items '((recents . 5)
                        (bookmarks . 5)
                        (projects . 5)))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(setq dashboard-startup-banner 'logo)
