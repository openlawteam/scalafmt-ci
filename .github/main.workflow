workflow "Test lint on push" {
  on = "push"
  resolves = ["scalafmt-verify"]
}

# test ourselves by running in a way we expect to pass on our testdata
action "scalafmt-verify" {
  uses="./"
  args="-c .github/testdata/.scalafmt.conf --exclude .github/testdata/Bad.scala"
}
