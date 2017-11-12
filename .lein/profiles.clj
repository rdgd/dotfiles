{:user {:plugins [[lein-cljfmt  "0.5.6"]
                  [test2junit  "1.2.2"]
                  [lein-cloverage  "1.0.6"]
                  [lein-kibit  "0.1.2"]
                  [jonase/eastwood  "0.2.3"]]
        :aliases  {"validate"  ["do"  ["clean"]  ["deps"]  ["cljfmt" "check"] ["cloverage"]  ["kibit"]  ["eastwood"]]}
        :dependencies [[cheshire  "5.6.1"]
                       [cljfmt "0.5.3"]]}}
