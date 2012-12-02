;;;; account-calculation.lisp

(in-package #:account-calculation)

;;; "account-calculation" goes here. Hacks and glory await!

;; Calculates how much each of us has to pay for the month.
;; The formula is basically like: her amount = (my amount * her salary) / my salary
;; where my amount + her amount = the total we need to pay.
;; So it's a basic equation with two unknowns of the following form:
;;   x = (y * [her salary]) / [my salary]
;;   x + y = [total]
(defun calc (data)
  "data is a plist where :me is my salary, :love is her salary, :total is how much we need for the month"
  (let (her-amount
        my-amount
        (her-salary (getf data :love))
        (my-salary (getf data :me))
        (total (getf data :total)))
    (setf her-amount (round
                      (/
                       (/ (* her-salary total) my-salary)
                       (+ 1
                          (/ her-salary my-salary)))))
    (setf my-amount (round (- total her-amount)))
    (format t "I pay ~A and she pays ~A" my-amount her-amount)))
