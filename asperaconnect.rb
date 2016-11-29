# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Asperaconnect < Formula
  desc "Aspera connect package"
  homepage "http://asperasoft.com//"
  url "http://download.asperasoft.com/download/sw/connect/3.6.2/aspera-connect-3.6.2.117442-linux-64.tar.gz"
  @@tarball = stable.url.split('/').last.chomp(".tar.gz")
  version "3.6.2"
  sha256 "4f69f2cd410ee770dbd81002af7be79715a6de77cbb84fc1bf12ad7a2751a457"

  def install
    #tarball = "aspera-connect-3.6.2.117442-linux-64.tar.gz"
    skip = `awk '/^__ARCHIVE_FOLLOWS__/ { print NR + 1; exit 0; }' #{@@tarball}.sh`.chomp
    system "tail -n +#{skip} #{@@tarball}.sh | tar xzpo -C ./ -f -"

    bin.install "bin/asperaconnect"
    bin.install "bin/asperaconnect.bin"
    bin.install "bin/ascp"
    bin.install "bin/asperacrypt"
    lib.install "lib/libpng12.so.0"
    lib.install "lib/libaudio.so.2"
    lib.install "lib/libgcc_s.so.1"
    lib.install "lib/libstdc++.so.6"
    lib.install "lib/libQtSql.so.4"
    lib.install "lib/libQtXml.so.4"
    lib.install "lib/libQtNetwork.so.4"
    lib.install "lib/libQtGui.so.4"
    lib.install "lib/libQtCore.so.4"
    lib.install "lib/libnpasperaweb_3.6.2.117442.so"
    etc.install "etc/localhost.key"
    etc.install "etc/localhost.crt"
    etc.install "etc/asperaconnect.path"
    etc.install "etc/asperaweb_id_dsa.putty"
    etc.install "etc/asperaweb_id_dsa.openssh"
    etc.install "etc/aspera_web_key.pem"
    etc.install "etc/aspera_web_cert.pem"
    etc.install "etc/aspera-license"
    etc.install "etc/aspera.conf"

  end

  test do
    system "false"
  end
end
