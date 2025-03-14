# Lade die Liste der benötigten Pakete
packages <- read.table("~/work/Verbrauchsanalysen/Wasserverbrauch/requirements.R", sep = "=", header = FALSE, col.names = c("Package", "Version"))

# Installiere fehlende Pakete in der richtigen Version
install_if_missing <- function(pkg, ver) {
  if (!requireNamespace(pkg, quietly = TRUE) || packageVersion(pkg) != ver) {
    install.packages(pkg, dependencies = TRUE)
  }
}

apply(packages, 1, function(x) install_if_missing(x["Package"], x["Version"]))
