class Vto < Formula
  desc "viato.me tunnel client — expose localhost to the internet"
  homepage "https://viato.me"
  version "0.1.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/darwin-arm64"
    sha256 "8bd77a7c8f76bb491c39ef69c19b77284f3156c47146482e6af1c3732a615783"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/linux-arm64"
    sha256 "0e215c9ed1f7e5509045bf176003b41825af1ca2216bceb6e7c1e9c03d24df40"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://viato.me/api/v1/releases/linux-amd64"
    sha256 "edb9f0b1e281b9244072f28f818861477e4fe9f3d49ff13aa5117b6b8896e9bf"
  end

  def install
    bin.install Dir.glob("*").first => "vto"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/vto --version")
  end
end
