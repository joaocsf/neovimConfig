function ldConf(package)
  return function()
    local ok, conf = pcall(require, package)
    if ok then
      conf()
    else
      error('Config Setup not found: ' .. package)
    end
  end
end

function setupConf(package, setup)
  return function()
    local ok, pkg = pcall(require, package)
    if ok then
      setup(pkg)
    else
      error('Setup Config: Package not found: ' .. package)
    end
  end
end

