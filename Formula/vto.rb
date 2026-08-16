class Vto < Formula
  desc "viato.me tunnel client — expose localhost to the internet"
  homepage "https://viato.me"
  version "0.1.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/darwin-arm64"
    sha256 "84a9d7a81c298b89d3e6404dc5e20d446ece94827d6ce41a2fbe48f2d10e81a6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/linux-arm64"
    sha256 "35da27cb04b5cc8d4f6ee1478b27b3d671a4e522de5c0127d2fae78759d4fa11"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://viato.me/api/v1/releases/linux-amd64"
    sha256 "67e6ec1c2dc468b7c137ac1d2a71a52a9ba2caa08f7d83d7f881ed0abdd34bfc"
  end

  def install
    bin.install Dir.glob("*").first => "vto"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/vto --version")
  end
end
