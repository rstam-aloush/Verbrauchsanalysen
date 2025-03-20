# Fixed package versions for OL_Gasverbrauch project
packages <- list(
  "dplyr"        = "1.1.4",
  "tibble"       = "3.2.1",
  "data.table"   = "1.15.4",
  "lubridate"    = "1.9.3",
  "caret"        = "6.0-94",
  "rsample"      = "1.2.1",
  "jtools"       = "2.3.0",
  "httr"         = "1.4.7",
  "highcharter"  = "0.9.4",
  "DT"           = "0.33",
  "knitr"        = "1.46"
)

# Ensure 'remotes' is installed
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install and load packages without updates
for (pkg in names(packages)) {
  target_version <- packages[[pkg]]
  
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message(sprintf("Installing %s version %s ...", pkg, target_version))
    remotes::install_version(pkg, version = target_version, repos = "https://cloud.r-project.org", upgrade = "never")
  } else {
    current_version <- as.character(packageVersion(pkg))
    if (current_version != target_version) {
      message(sprintf("Package %s is version %s – installing required version %s ...", pkg, current_version, target_version))
      remotes::install_version(pkg, version = target_version, repos = "https://cloud.r-project.org", upgrade = "never")
    }
  }
  library(pkg, character.only = TRUE)
}
