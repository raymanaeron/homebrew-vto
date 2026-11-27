class Vto < Formula
  desc "viato.me tunnel client — expose localhost to the internet"
  homepage "https://viato.me"
  version "0.1.7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/darwin-arm64"
    sha256 "48b029e44460a8e3b82b4fd19265d144e5684b0ad6ae636e10b7f57cfbc16400"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/linux-arm64"
    sha256 "7d99ddfd02e5312e7d0d85a5f20e276db93f6eb25e01c3fdc65d03f7147b2e70"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://viato.me/api/v1/releases/linux-amd64"
    sha256 "372e9dc41152e3f1f76f30b6f344092d69860c0cd5d26ebe966a6c5b97b794ec"
  end

  def install
    bin.install Dir.glob("*").first => "vto"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/vto --version")
  end
end
