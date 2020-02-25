terraform {
    backend "remote" {
    hostname     = "app.terraform.io"
    organization = "devsecops-nttsg"
    workspaces {
      name = "webgoat"
    }
  }
}

