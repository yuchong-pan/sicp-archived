;; When serialized-exchange is called, any other procedure in the serialized
;; set of the serializers of both accounts is forced to wait until the
;; execution of serialized-exchange has finished. However, serialized-exchange
;; will call (account1 'withdraw) and (account2 'deposit), which are serialized
;; by the serializers of the first and second accounts, respectively, meaning
;; that these two calls cannot proceed within the call to serialized-exchange.
;; Hence, with Louis' reasoning, serialized-exchange will not be executed.
