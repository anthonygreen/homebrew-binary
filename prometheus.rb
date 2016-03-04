class Prometheus < Formula
  desc "service monitoring system and time series database"
  homepage "https://prometheus.io"

  version "0.17.0"

  if MacOS.prefer_64_bit?
    url "https://github.com/prometheus/prometheus/releases/download/0.17.0/prometheus-0.17.0.darwin-amd64.tar.gz"
    sha256 "74aa4f9044eec6b7b0bf9010dded28b053ab6893d4bc62e65fccaaf479b6d36f"
  else
    url "https://github.com/prometheus/prometheus/releases/download/0.17.0/prometheus-0.17.0.darwin-386.tar.gz"
    sha256 "678619d1f9a4a5b243fd780f555b6ca6b9c7c33b95944604da5d9b2b4fc9635d"
  end

  def install
    bin.install "promtool"
    bin.install "prometheus"
    libexec.install "consoles"
    libexec.install "console_libraries"
  end

  test do
    system "#{bin}/prometheus", "--version"
    system "#{bin}/promtool", "version"
  end
end
