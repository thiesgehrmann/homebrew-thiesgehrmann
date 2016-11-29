class CanuGit < Formula
  desc "Canu Assembler"
  homepage "https://github.com/marbl/canu"
  url "https://github.com/marbl/canu/archive/fedf298b13c759a4d8dfe9e65f1a88a18ff54e81.zip"
  version "999"
  sha256 "9b7fdc074593969a00a6ab3cd5c3d70d5348f9c25d194d08856a486ee097380b"

  def install
    Dir.chdir("src")
    system "make -j 12"
    system "find ../ > /tmp/loc"
    Dir.chdir("../")
    pkgshare.install "Linux-amd64"
    system "ln -s #{pkgshare}/Linux-amd64/bin/canu  #{ENV["HOMEBREW_PREFIX"]}/bin"
  end

  test do
    system "false"
  end
end
