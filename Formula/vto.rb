class Vto < Formula
  desc "viato.me tunnel client — expose localhost to the internet"
  homepage "https://viato.me"
  version "0.1.9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/darwin-arm64"
    sha256 "3a1274006e25c122738fcfd26371c5b84267b034bf70bc3b54362f70751f485b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/linux-arm64"
    sha256 "c3c094dc835eb07a3873e1059bbc374711ff77919bce09b17cd1d1c0e09273a1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://viato.me/api/v1/releases/linux-amd64"
    sha256 "a9c42aba9d9a3398bcbe57e959f24107412b3f687fce8c853b9ef10d041d10fb"
  end

  def install
    bin.install Dir.glob("*").first => "vto"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/vto --version")
  end
end
