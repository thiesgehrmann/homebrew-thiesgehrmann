	class Asperaconnect < Formula
  desc "Aspera connect package"
  homepage "http://asperasoft.com//"
  url "http://download.asperasoft.com/download/sw/connect/3.6.2/aspera-connect-3.6.2.117442-linux-64.tar.gz"
  @@tarball = stable.url.split('/').last.chomp(".tar.gz")
  version "3.6.2"
  sha256 "4f69f2cd410ee770dbd81002af7be79715a6de77cbb84fc1bf12ad7a2751a457"

  def install
    skip = `awk '/^__ARCHIVE_FOLLOWS__/ { print NR + 1; exit 0; }' #{@@tarball}.sh`.chomp
    system "tail -n +#{skip} #{@@tarball}.sh | tar xzpo -C ./ -f -"
    system "cp -r bin lib etc #{prefix}"
  end

  test do
    system "false"
  end
end
