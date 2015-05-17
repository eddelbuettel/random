

getVectorNewApi <- function(key=getOption("randomOrgAPIkey")) {
    
    params <- list(apiKey = jsonlite::unbox(key),
                   n = jsonlite::unbox(10), min = jsonlite::unbox(0), max = jsonlite::unbox(100))
    body <- list(jsonrpc = jsonlite::unbox("2.0"),
                 method  = jsonlite::unbox("generateIntegers"),
                 params  = params,
                 id      = jsonlite::unbox("123"))

    r <- httr::POST("https://api.random.org/json-rpc/1/invoke",
              body = body,
              encode="json")
    ##verbose())

    ##content(r)
    res <- httr::content(r, "parsed")
    vec <- do.call(c, res$result$random$data)
}
