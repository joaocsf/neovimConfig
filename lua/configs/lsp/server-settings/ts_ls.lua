return {
  _hooks_ = {
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end
  }
}
