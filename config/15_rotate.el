(defadvice rotate-layout (after rotate-layout-with-golden-ratio)
  (golden-ratio))
(ad-activate 'rotate-layout 'rotate-layout-with-golden-ratio)
