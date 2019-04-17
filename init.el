;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; package管理
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(add-to-list 'load-path "/usr/local/share/gtags")

;;package-installeするとNot Foundがでてくるとき
;;M-x package-refresh-contents

(package-initialize)
;;(set-face-background 'default "gray20")
;;(add-to-list 'default-frame-alist '(foreground-color . "white"))
;; ごとの色
;;(add-hook 'font-lock-mode-hook
;;'(lambda ()
;;(set-face-foreground 'font-lock-comment-face "lightgreen")
;;(set-face-foreground 'font-lock-string-face "LightSalmon")
;;(set-face-foreground 'font-lock-keyword-face "Cyan1")
;; (set-face-foreground 'font-lock-keyword-face "green2")  ; 微調整
;;(set-face-foreground 'font-lock-builtin-face "LightSteelBlue")
;;(set-face-foreground 'font-lock-function-name-face "LightSkyBlue")
;;(set-face-foreground 'font-lock-variable-name-face "Pink")
;;(set-face-foreground 'font-lock-type-face "green2")
;;(set-face-foreground 'font-lock-constant-face "red")
;;(set-face-foreground 'font-lock-warning-face "Pink")
;;)
;; )
(add-to-list 'custom-theme-load-path "~/.emacs.d/atom-one-dark-theme/")
(load-theme 'atom-one-dark t)

(setq default-frame-alist
  '(
    (width . 95)
    (height . 50)
   ))


;; line numberの表示
(require 'linum)
(global-linum-mode 1)

;; tabサイズ
;;(setq tab-width 4)
;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

(setq c-basic-offset 4)
(setq c-argdecl-indent 0)       ; 関数の引数行のインデント
                                ; 但し引数行で明示的にタブを押さない
                                ; 場合は、インデントしない
(setq c-auto-newline nil)             ; 自動改行
(c-set-offset 'substatement-open 0) ; { を書く時のインデント
(c-set-offset 'inline-open 0)
(c-set-offset 'c-indent-level 4)               ; { を書いた後のインデント
(setq c-label-offset 0)              ; ラベルの深さ
(setq c-tab-always-indent t)          ; タブ記号を押した時にユーザーが
                                      ; 任意にタブ記号を入れることは不可

; スペース、タブなどを可視化する
;(global-whitespace-mode 1)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;;;;;;;; ^M をとる(問題あるかも?)
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;; カーソルの点滅をやめる
(blink-cursor-mode 0)

;; カーソル行をハイライトする
;;(global-hl-line-mode t)

;;選択行をハイライト
(transient-mark-mode t)

(setq ac-use-fuzzy t)

;; 対応する括弧を光らせる
(show-paren-mode 1)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "LightSkyBlue")
(set-face-foreground 'show-paren-match-face "black")

;;; 起動時の画面はいらない
(setq inhibit-startup-message t)

;; 選択範囲に色をつける
(transient-mark-mode t)
(set-face-background 'region "gray60") ;選択範囲の色

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "MediumBlue"))))
 '(transient ((t (:background "red")))))

;;; mozc
(require 'mozc)                                 ; mozcの読み込み
(set-language-environment "Japanese")           ; 言語環境を"japanese"に
(setq default-input-method "japanese-mozc")     ; IMEをjapanes-mozcに
(prefer-coding-system 'utf-8)                   ; デフォルトの文字コードをUTF-8に
(global-set-key [zenkaku-hankaku] 'mozc-mode)
;;
;; Auto Complete
;;

;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(ahs-default-range (quote ahs-range-whole-buffer))
 ;;'(package-selected-packages
 ;;  (quote
;;	(golden-ratio company-irony-c-headers company-irony ctags-update helm-gtags highlight-symbol python-mode js2-mode neotree auto-complete))))

;;補完

(add-hook 'c-mode-hook
          (lambda ()
            (require 'auto-complete)))

(add-hook 'c++-mode-hook
          (lambda ()
            (require 'auto-complete)))

(add-hook 'java-mode-hook
          (lambda ()
            (require 'auto-complete)))

;(add-hook 'js2-mode-hook
;          '(lambda ()
;             (when (locate-library "tern")
;               (setq tern-command '("tern" "--no-port-file")) ;; .term-port を作らない
;               (tern-mode t)
;               (eval-after-load 'tern
;                 '(progn
;                    (require 'tern-auto-complete)
;                    (tern-ac-setup)))
;               )
;             ))

;;treeを表示
(require 'neotree)
(global-set-key "\C-t" 'neotree-toggle)

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(3 ((shift) . 5)))

;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; 行末の空白を強調表示
;;(setq-default show-trailing-whitespace t)
;;(set-face-background 'trailing-whitespace "#b14770")


;;括弧2個
(add-hook 'c-mode-common-hook
          (lambda ()
         ;;(define-key c-mode-base-map "\"" 'electric-pair)
         ;;(define-key c-mode-base-map "\'" 'electric-pair)
         (define-key c-mode-base-map "(" 'electric-pair)
         (define-key c-mode-base-map "[" 'electric-pair)
		 (define-key c-mode-base-map "" 'electric-pair)
         (define-key c-mode-base-map "{" 'electric-pair)))

(add-hook 'java-mode-common-hook
          (lambda ()
         ;;(define-key c-mode-base-map "\"" 'electric-pair)
         ;;(define-key c-mode-base-map "\'" 'electric-pair)
         (define-key java-mode-base-map "(" 'electric-pair)
         (define-key java-mode-base-map "[" 'electric-pair)
		 (define-key java-mode-base-map "" 'electric-pair)
         (define-key java-mode-base-map "{" 'electric-pair)))

;;括弧2個
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))

(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;;pythonの時の色指定
;;(require 'python-mode)
;;(set-face-foreground 'py-variable-name-face "red")
;;(set-face-foreground 'py-import-from-face "pink1")
;;(set-face-foreground 'py-builtins-face "maroon2")

;; auto-java-complete
(add-hook  'java-mode-hook 'ajc-java-complete-mode
	  (lambda ()
(require 'ajc-java-complete-config)
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 4) ; デフォルトは4
(setq company-selection-wrap-around t))) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

(add-hook 'c-mode-hook
	  (lambda ()
(require 'company)
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 4) ; デフォルトは4
(setq company-selection-wrap-around t))) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

(add-hook 'c++-mode-hook
	  (lambda ()
(require 'company)
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 4) ; デフォルトは4
(setq company-selection-wrap-around t))) ; 候補の一番下でさらに下に行こうとすると一番上に戻る


(require 'epc)
(require 'auto-complete-config)
(require 'python)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;(add-hook 'js-mode-hook #'js-auto-format-mode)
;(add-hook 'js-mode-hook #'add-node-modules-path)

;;全検索のショートカットキー 設定

(setq tags-table-list '("~/.emacs.d/soccer_tag"))
;;定義ジャンプのショートカットキー

(define-key global-map "\C-a" 'isearch-forward)

;;(require 'ace-isearch)
;;(global-ace-isearch-mode +1)
;;(setq ace-isearch-use-function-from-isearch nil)
;;(define-key isearch-mode-map (kbd "\C-a") 'helm-multi-swoop-all-from-isearch)

(define-key global-map "\C-l" 'goto-line)
(define-key global-map "\C-r" 'query-replace )

;; ファイル内検索（いらないメッセージは消去）
(define-key global-map (kbd "C-f") 'rgrep)
;; rgrepのheader messageを消去
(defun delete-grep-header ()
  (save-excursion
    (with-current-buffer grep-last-buffer
      (goto-line 5)
      (narrow-to-region (point) (point-max)))))
(defadvice grep (after delete-grep-header activate) (delete-grep-header))
(defadvice rgrep (after delete-grep-header activate) (delete-grep-header))

;; rgrep時などに，新規にwindowを立ち上げる
(setq special-display-buffer-names '("*Help*" "*compilation*" "*interpretation*" "*grep*" ))

(define-key global-map "\C-w" 'xref-find-definitions)
(define-key global-map "\C-e" 'pop-tag-mark)
(define-key global-map "\C-s" 'save-buffer)
(define-key global-map (kbd "C-S-f") 'find-file)
(define-key global-map "\C-z" 'advertised-undo)
(define-key global-map (kbd "C-S-c") 'copy-region-as-kill)
(define-key global-map (kbd "C-S-v") 'yank)
(define-key global-map "\C-q" 'save-buffers-kill-emacs)
(define-key global-map (kbd "C-S-t") 'compile)
(define-key global-map "\C-n" 'next-error)
(define-key global-map (kbd "C-S-p") (kbd "C-M-p"))
(define-key global-map (kbd "C-p") (kbd "C-M-n"))
(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
(global-set-key (kbd "C-S-s") 'shell-pop)

(define-key global-map (kbd "C-S-x") 'kill-region)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;;指定文字のハイライト
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 4) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

(add-hook 'c-mode-hook '(lambda () (setq tab-width 4)))
(add-hook 'c++-mode-hook '(lambda () (setq tab-width 4)))

;; メニューバーを消す
(menu-bar-mode -1)

;; ツールバーを消す
(tool-bar-mode -1)

;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)

;;UTF-8
(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;;時計セット
(display-time)
(setq display-time-string-forms
 '((format "%s/%s(%s)%s:%s"
		 month day dayname
		 24-hours minutes
		 )))

(load "saveplace")
(setq-default save-place t)

;; # 画面分割
(defun split-window-automatically ()
  (interactive)
  (if (> (window-width) (* 2.5 (window-height)))
      (split-window-horizontally)
    (split-window-vertically)))
(global-set-key (kbd "C-S-a") 'split-window-automatically)
;; C-ウィンドウに移動
(global-set-key (kbd "C-<left>")  'windmove-left)
(global-set-key (kbd "C-<down>")  'windmove-down)
(global-set-key (kbd "C-<up>")    'windmove-up)
(global-set-key (kbd "C-<right>") 'windmove-right)
;; C-x q で現在カーソルがあるウィンドウ以外のウィンドウを全て削除
(define-key global-map (kbd "C-S-q") (kbd "C-x 1"))
(define-key global-map (kbd "C-S-z") (kbd "C-x 0"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (fuzzy ## company-c-headers ctags-update jedi-direx mozc rainbow-delimiters company-tern golden-ratio-scroll-screen javap-mode yasnippet-snippets auto-auto-indent java-imports tern-auto-complete tern auto-complete-c-headers js2-mode add-node-modules-path js-auto-format-mode flycheck-pos-tip package-utils ace-isearch yasnippet python-mode neotree jedi golden-ratio company auto-highlight-symbol atom-one-dark-theme))))
