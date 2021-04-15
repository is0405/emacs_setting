;;; init.el --- 
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
(setq tab-width 4)
;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

(setq c-basic-offset 4)
(setq c-argdecl-indent 0)       ; 関数の引数行のインデント
                                ; 但し引数行で明示的にタブを押さない
                                ; 場合は、インデントしない
(setq c-auto-newline t)             ; 自動改行
(c-set-offset 'substatement-open 0) ; { を書く時のインデント
(c-set-offset 'inline-open 0)
(c-set-offset 'c-indent-level 0)               ; { を書いた後のインデント
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

;;;; for ctags.el
(require 'ctags nil t)
(setq tags-revert-without-query t)
(setq ctags-command "ctags -R --fields=\"+afikKlmnsSzt\" ")
(global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table)

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

(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

(defun electric-pair2 ()
  "Insert character pair without sournding spaces2"
  (interactive)
  (let (parens-require-spaces)
    (newline)
    (indent-to 4)
    (insert-pair)
    (newline-and-indent)
    (newline-and-indent)))


;;ALL
(require 'company)
(company-mode t) ; 全バッファで有効にする
(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 3) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)

;; ivy設定
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 10) ;; minibufferのサイズを拡大！（重要）
(setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))


;;全検索のショートカットキー 設定

;;(setq tags-table-list '("~/.emacs.d/soccer_tag"))
;;定義ジャンプのショートカットキー

;; (define-key global-map "\C-a" 'isearch-forward)

;; counsel設定
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file) ;; find-fileもcounsel任せ！
;; (setq counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))

;; (when (locate-library "counsel")
;;   (require 'counsel)
;;   (counsel-mode 1)
;; )

;; (when (locate-library "swiper")
;;   (require 'swiper)
;;   (global-set-key (kbd "C-c a") 'swiper)
;; )
(when (require 'swiper nil t)
  ;; キーバインドは一例です．好みに変えましょう．
  (global-set-key (kbd "C-a") 'swiper-thing-at-point)
  (setq swiper-include-line-number-in-search t) ;; line-numberでも検索可能
)

;; migemo + swiper（日本語をローマ字検索できるようになる）
;; (require 'avy-migemo)
;; (avy-migemo-mode 1)
;; (require 'avy-migemo-e.g.swiper)


;;(require 'ace-isearch)
;;(global-ace-isearch-mode +1)
;;(setq ace-isearch-use-function-from-isearch nil)
;;(define-key isearch-mode-map (kbd "\C-a") 'helm-multi-swoop-all-from-isearch)

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

(setq dumb-jump-mode t)
(setq dumb-jump-force-searcher 'rg)
(setq dumb-jump-selector 'ivy)
(setq dumb-jump-use-visible-window t)
(define-key global-map "\C-w" 'dumb-jump-go)
(define-key global-map "\C-e" 'dumb-jump-back)
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
(define-key global-map "\C-l" 'goto-line)
(define-key global-map "\C-r" 'query-replace )
;(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
;(global-set-key (kbd "C-S-s") 'shell-pop)

(define-key global-map (kbd "C-S-x") 'kill-region)
;;指定文字のハイライト
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;;時計セット
;;(display-time)
;;(setq display-time-string-forms
;; '((format "%s/%s(%s)%s:%s"
;;		 month day dayname
;;		 24-hours minutes
;;		 )))

;;(load "saveplace")
;;(setq-default save-place t)

;; スクリーンの最大化
(set-frame-parameter nil 'fullscreen 'maximized)
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

;;定型文挿入
(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-alist
      (append '(
                (("\\.py$" . "python template")
                 nil
                 "import sys, os, math\n"
                 "import numpy as np\n"
                 "import scipy as sp\n"
                 "\n"
                 _
                 )) auto-insert-alist))
(setq auto-insert-alist
      (append '(
                (("\\.sh$" . "shell script template")
                 nil
                 "#!/bin/bash\n"
                 "\n"
                 _
                 )) auto-insert-alist))
(setq auto-insert-alist
      (append '(
                (("\\.cpp$" . "C++ script template")
                 nil
                 "#include<bits/stdc++.h>\n"
                 "#define rep(i,n) for(int i = 0; i < (n); ++i)\n"
                 "using namespace std;\n"
                 "#define pri(str) cout << str << endl;\n"
                 "using ll = long long;\n"
                 "using P = pair<int, int>;\n"
                 "\n"
                 "const ll MX = 1e18;\n"
                 "const long double PI = acos(-1);\n"
                 "\n"
                 "template<class T> inline bool chmin(T& a, T b) {\n"
                 "    if (a > b) {\n"
                 "        a = b;\n"
                 "        return true;\n"
                 "    }\n"
                 "    return false;\n"
                 "}\n"
                 "\n"
                 "template<class T> inline bool chmax(T& a, T b) {\n"
                 "    if (a < b) {\n"
                 "        a = b;\n"
                 "        return true;\n"
                 "    }\n"
                 "    return false;\n"
                 "}\n"
                 "\n"
                 "\n"
                 "int main()\n"
                 "{\n"
                 "    "_"\n"
                 "    return 0;\n"
                 "}\n"
                 )) auto-insert-alist))


;;C, C++
(add-hook 'c-mode-hook '(lambda () (setq tab-width 4)))
(add-hook 'c++-mode-hook '(lambda () (setq tab-width 4)))

;;補完
(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'c-mode-hook
          (lambda ()
            (require 'auto-complete)))

(add-hook 'c++-mode-hook
          (lambda ()
            (require 'auto-complete)))
(add-hook 'c-mode-hook
          (lambda ()
            (require 'company)
            (setq company-idle-delay 0) ; デフォルトは0.5
            (setq company-minimum-prefix-length 2) ; デフォルトは4
            (setq company-selection-wrap-around t))) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

(add-hook 'c++-mode-hook
          (lambda ()
            (require 'company)
            (setq company-idle-delay 0) ; デフォルトは0.5
            (setq company-minimum-prefix-length 2) ; デフォルトは4
            (setq company-selection-wrap-around t))) ; 候補の一番下でさらに下に行こうとすると一番上に戻る


(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-base-map "\"" 'electric-pair)
            (define-key c-mode-base-map "\'" 'electric-pair)
            (define-key c-mode-base-map "(" 'electric-pair)
            (define-key c-mode-base-map "[" 'electric-pair)
            (define-key c-mode-base-map "" 'electric-pair)
            (define-key c-mode-base-map "{" 'electric-pair2)))
(add-hook 'c++-mode-hook
          (lambda ()
            (define-key c-mode-base-map "\"" 'electric-pair)
            (define-key c-mode-base-map "\'" 'electric-pair)
            (define-key c-mode-base-map "(" 'electric-pair)
            (define-key c-mode-base-map "[" 'electric-pair)
            (define-key c-mode-base-map "" 'electric-pair)
            (define-key c-mode-base-map "{" 'electric-pair2)))
;;java
;;補完
(add-hook 'java-mode-hook
          (lambda ()
            (require 'auto-complete)))

(add-hook 'java-mode-common-hook
          (lambda ()
            ;;(define-key c-mode-base-map "\"" 'electric-pair)
            ;;(define-key c-mode-base-map "\'" 'electric-pair)
            (define-key java-mode-base-map "(" 'electric-pair)
            (define-key java-mode-base-map "[" 'electric-pair)
            (define-key java-mode-base-map "" 'electric-pair)
            (define-key java-mode-base-map "{" 'electric-pair2)))

;; auto-java-complete
(add-hook  'java-mode-hook 'ajc-java-complete-mode
           (lambda ()
             (require 'ajc-java-complete-config)
             (setq company-idle-delay 0) ; デフォルトは0.5
             (setq company-minimum-prefix-length 1) ; デフォルトは4
             (setq company-selection-wrap-around t))) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

;;Golang

(add-hook 'go-mode-hook '(lambda () (setq tab-width 4)))
;;補完
(add-hook 'go-mode-hook
          (lambda ()
            (require 'auto-complete)))
(add-hook 'go-mode-hook
          (lambda ()
            (require 'company)
            (setq company-idle-delay 0) ; デフォルトは0.5
            (setq company-minimum-prefix-length 2) ; デフォルトは4
            (setq company-selection-wrap-around t))) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(add-hook 'go-mode-hook (lambda()
                          (add-hook 'before-save-hook' 'gofmt-before-save)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)
                          ))

(add-hook 'go-mode-hook
          (lambda ()
            (define-key go-mode-map "\"" 'electric-pair)
            (define-key go-mode-map "\'" 'electric-pair)
            (define-key go-mode-map "(" 'electric-pair)
            (define-key go-mode-map "[" 'electric-pair)
            (define-key go-mode-map "{" 'electric-pair2)))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)

;;Python
;;補完
(add-hook 'python-mode-hook '(lambda () (setq tab-width 4)))
;;(add-hook 'python-mode-hook
;;          (lambda ()
;;            (require 'auto-complete)))
;(add-hook 'python-mode-hook
;	  (lambda ()
;(require 'company)
;(setq company-idle-delay 0) ; デフォルトは0.5
;(setq company-minimum-prefix-length 1) ; デフォルトは4
;(setq company-selection-wrap-around t))) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

(require 'epc)
(require 'auto-complete-config)
(require 'python)
(require 'jedi)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(add-hook 'python-mode-hook 'jedi:setup)

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair2)))

;;pythonの時の色指定
;;(require 'python-mode)
;;(set-face-foreground 'py-variable-name-face "red")
;;(set-face-foreground 'py-import-from-face "pink1")
;;(set-face-foreground 'py-builtins-face "maroon2")

;;matlab
;;補完
(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)

(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
(add-hook 'matlab-mode-hook
          (lambda ()
            (require 'auto-complete)))


;;js

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


;(add-hook 'js-mode-hook #'js-auto-format-mode)
;(add-hook 'js-mode-hook #'add-node-modules-path)


;;; yatex
(require 'yatex)                ;; パッケージ読み込み
(add-to-list 'auto-mode-alist '("\\.tex\\'" . yatex-mode)) ;;auto-mode-alistへの追加
(setq tex-command "platex")       ;; 自分の環境に合わせて""内を変えてください
(setq bibtex-command "pbibtex")    ;; 自分の環境に合わせて""内を変えてください
(setq tex-run-command "ptex2pdf -u -e -ot '-synctex=1 -interaction=nonstopmode'")
;(setq tex-run-command "luatex -synctex=1 -interaction=nonstopmode")
(setq latex-run-command "ptex2pdf -u -l -ot '-synctex=1 -interaction=nonstopmode'")
(setq tex-command "latexmk -pvc")
;;(setq tex-command "latexmk -c")
;(setq latex-run-command "lualatex -synctex=1 -interaction=nonstopmode")
(setq tex-bibtex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 -interaction=nonstopmode %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq tex-print-file-extension ".pdf")
(setq tex-dvi-view-command "evince")

(setq YaTeX-kanji-code 4   ; 1: SJIS, 2: JIS, 3: EUC, 4: UTF-8
      YaTeX-latex-message-code 'utf-8  ; 文字化けしないようにする
      )
;reftex-mode
(add-hook 'yatex-mode-hook
         #'(lambda ()
              (reftex-mode 1)
              (define-key reftex-mode-map
                (concat YaTeX-prefix ">") 'YaTeX-comment-region)
              (define-key reftex-mode-map
                (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

(setq reftex-default-bibliography '("~/Desktop/paper/bibliography.tex"))

(require 'dbus)
(defun un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))
(defun evince-inverse-search (file linecol &rest ignored)
  (let* ((fname (decode-coding-string (url-unhex-string (un-urlify file)) 'utf-8))
         (buf (find-file fname))
         (line (car linecol))
         (col (cadr linecol)))
    (if (null buf)
        (message "[Synctex]: %s is not opened..." fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
        (move-to-column col))
      (x-focus-frame (selected-frame)))))
(dbus-register-signal
 :session nil "/org/gnome/evince/Window/0"
 "org.gnome.evince.Window" "SyncSource"
 'evince-inverse-search)

(require 'helm)
(require 'helm-config)

;;
;; RefTeX with TeX mode
;;
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook'(lambda ()(setq auto-fill-function nil)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-migemo-function-names
   (quote
    (swiper--add-overlays-migemo
     (swiper--re-builder :around swiper--re-builder-migemo-around)
     (ivy--regex :around ivy--regex-migemo-around)
     (ivy--regex-ignore-order :around ivy--regex-ignore-order-migemo-around)
     (ivy--regex-plus :around ivy--regex-plus-migemo-around)
     ivy--highlight-default-migemo ivy-occur-revert-buffer-migemo ivy-occur-press-migemo avy-migemo-goto-char avy-migemo-goto-char-2 avy-migemo-goto-char-in-line avy-migemo-goto-char-timer avy-migemo-goto-subword-1 avy-migemo-goto-word-1 avy-migemo-isearch avy-migemo-org-goto-heading-timer avy-migemo--overlay-at avy-migemo--overlay-at-full)))
 '(package-selected-packages
   (quote
    (swiper-helm swiper auto-complete-exuberant-ctags helm auto-complete-auctex smartparens go-complete go-errcheck dumb-jump company-ctags company-go go-eldoc go-autocomplete go-mode auto-indent-mode irony matlab-mode magit avy-flycheck ace-jump-mode ac-mozc yatex atom-dark-theme fuzzy ## company-c-headers ctags-update jedi-direx mozc rainbow-delimiters company-tern golden-ratio-scroll-screen javap-mode yasnippet-snippets auto-auto-indent java-imports tern-auto-complete tern auto-complete-c-headers js2-mode add-node-modules-path js-auto-format-mode flycheck-pos-tip package-utils ace-isearch yasnippet python-mode neotree jedi golden-ratio company auto-highlight-symbol atom-one-dark-theme))))
