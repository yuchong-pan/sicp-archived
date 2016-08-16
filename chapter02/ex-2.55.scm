;; The first single quote symbol ' represents that ('abracadabra) is regarded as a symbol by the interpreter; i.e., ''abracadabra is
;; equivalent to '('abracadabra).
;; Since ('abracadabra) is regarded as a symbol, it can be regarded as a list whose first component is quote itself and whose second
;; component is the symbol of abracadabra.
;; In other words, '('abracadabra) is equivalent to '(quote abracadabra).
;; Hence, the value of (car ''abracadabra) is quote.
