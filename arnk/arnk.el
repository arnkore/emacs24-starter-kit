(starter-kit-load "eshell")
(starter-kit-load "org")

(starter-kit-load "lisp")
(starter-kit-load "js")
(starter-kit-load "scala")
(starter-kit-load "ruby")
(starter-kit-load "python")

;; 设置默认字体
(set-default-font "Ubuntu Mono-15")

;; 设置主题
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)

;; 显示行号
(global-linum-mode t)

;; 时间设置
(display-time-mode 1) ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期

(mouse-avoidance-mode 'animate) ; 光标移动到鼠标下时，鼠标自动弹开
(fset 'yes-or-no-p 'y-or-n-p) ; 将yes/no替换为y/n

;; insert-date
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y年%m月%e日 %l:%M %a %p")))

(global-set-key [f11] 'my-fullscreen)

;; 全屏
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

;; 最大化
;;该函数用于最大化,状态值为1说明最大化后不会被还原
;;因为这里有两次最大化 (分别是水平和垂直)
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(my-maximized) 

;; 启动时最大化
(my-maximized)
