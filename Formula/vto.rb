class Vto < Formula
  desc "viato.me tunnel client — expose localhost to the internet"
  homepage "https://viato.me"
  version "0.1.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://viato.me/api/v1/releases/darwin-arm64"
    sha256 "fbf0bb567fd350ec69ae1745b481e08598ca94dd59c45459416783891c1b1e68"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://viato.me/api/v1/releases/linux-amd64"
    sha256 "e5537e506f60b94b1f737ec82da9c27395c9f71a761793aa275e943eb87e7cfd"
  end

  def install
    bin.install Dir.glob("*").first => "vto"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/vto --version")
  end
end
