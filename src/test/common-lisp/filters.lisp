(in-package #:djula-test)

(in-suite djula-test)

(defun filter (name &rest args)
  (apply (get name 'djula::filter) args))

(test filters
  (is (string= "Capfirst" (filter :capfirst "capfirst")))
  (is (string= "cutout"   (filter :cut "cutITout" "IT")))
  (is (string= "default"  (filter :default "" "default")))
  (is (string= "lower"    (filter :lower "LOWER")))
  (is (string= "short..." (filter :truncatechars "short message" 5)))
  (is (string= "UPPER"    (filter :upper "upper")))
  (is (=        6         (filter :length "length"))))

(test apply-filters
  (is (string= "SHORT..."
               (djula::apply-filters "short message" '((:truncatechars 5) (:upper))))))
