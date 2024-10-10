lazy val root = (project in file("."))
  .settings(
    name := "$name$",
    version := "0.1.0",
    scalaVersion := "3.3.3",
    libraryDependencies ++= Dependencies.test,
    (Compile / compile) := ((Compile / compile) dependsOn (Compile / scalafmtSbtCheck, Compile / scalafmtCheckAll)).value
  )
