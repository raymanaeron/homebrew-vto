class Vto < Formula
  desc "viato.me tunnel client — expose localhost to the internet"
  homepage "https://viato.me"
  version "0.1.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/darwin-arm64"
    sha256 "3e7327993c3c4a5686e1ee35e5d78d3c910f82a352d3abfa740c03525df68706"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://viato.me/api/v1/releases/linux-amd64"
    sha256 "f5d350efc90b36a73bc05e7ad2828f17115bc751cbfb36b89cdbb376336a69d6"
  end

  def install
    bin.install Dir.glob("*").first => "vto"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/vto --version")
  end
end
