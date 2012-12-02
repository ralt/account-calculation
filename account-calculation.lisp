;;;; account-calculation.lisp

(in-package #:account-calculation)

;;; "account-calculation" goes here. Hacks and glory await!

;; Calculates how much each of us has to pay for the month.
;; The formula is basically like: her amount = (my amount * her salary) / my salary
;; where my amount + her amount = the total we need to pay.
;; So it's a basic equation with two unknowns of the following form:
;;   x = (y * [her salary]) / [my salary]
;;   x + y = [total]
(defun calc (my-salary her-salary total)
  (let* ((her-amount (calc-her-amount my-salary her-salary total))
         (my-amount (calc-my-amount total her-amount)))
    (format t "My amount: ~A~%Her amount: ~A" my-amount her-amount)))

(defun calc-her-amount (my-salary her-salary total)
  (round (/ (/ (* her-salary
                  total)
               my-salary)
            (+ 1
               (/ her-salary
                  my-salary)))))

(defun calc-my-amount (total her-amount)
  (round
   (- total her-amount)))
