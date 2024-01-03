return {
  {
    type = 'scala',
    request = 'launch',
    name = 'RunOrTest',
    metals = {
      runType = 'runOrTestFile'
    },
  },
  {
    type = 'scala',
    name = 'Attach to localhost:5005',
    request = 'attach',
    hostName = 'localhost',
    port = 5005,
    buildTarget = 'adforecaster-simulator'
  }
}
