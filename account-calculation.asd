;;;; account-calculation.asd

(asdf:defsystem #:account-calculation
  :serial t
  :description "Helps us with our accounts monthly."
  :author "Florian Margaine <florian@margaine.com>"
  :license "MIT License"
  :components ((:file "package")
               (:file "account-calculation")))
