return function(body,url)
requests = (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or http_request or request
requests(
    {
        Url = url,
        Body = body,
        Headers = {["Content-Type"] = "application/json"},
        Method = "POST"
    }
)
end
