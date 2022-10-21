services {
  id = "web3001"
  name = "web"
  tags = [
    "primary"
  ]
  address = ""
  port = 3001
  checks = [
    {
      args = ["/bin/check_redis", "-p", "3001"]
      interval = "5s"
      timeout = "20s"
    }
  ]
}
services {
  id = "web3002"
  name = "web"
  tags = [
    "delayed",
    "secondary"
  ]
  address = ""
  port = 3002
  checks = [
    {
      args = ["/bin/check_redis", "-p", "3002"]
      interval = "30s"
      timeout = "60s"
    }
  ]
}