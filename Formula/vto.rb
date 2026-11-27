class Vto < Formula
  desc "viato.me tunnel client — expose localhost to the internet"
  homepage "https://viato.me"
  version "0.1.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/darwin-arm64"
    sha256 "774a6fb0d11378b210ca39e1e9f0744597de1ca2dbde149d63bfd0e4c7a6b133"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/linux-arm64"
    sha256 "b548f783b6f0eb8360853b43a919e635879f6dd2c81f109f486befb7e599e66e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://viato.me/api/v1/releases/linux-amd64"
    sha256 "23aeca852bd7626c58f7450adaca6b13253aa61ab3f01f00b923bd3441884933"
  end

  def install
    bin.install Dir.glob("*").first => "vto"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/vto --version")
  end
end
