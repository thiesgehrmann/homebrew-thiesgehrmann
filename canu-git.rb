# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class CanuGit < Formula
  desc "Canu Assembler"
  homepage "https://github.com/marbl/canu"
  url "https://github.com/marbl/canu/archive/fedf298b13c759a4d8dfe9e65f1a88a18ff54e81.zip"
  version "999"
  sha256 "9b7fdc074593969a00a6ab3cd5c3d70d5348f9c25d194d08856a486ee097380b"

  # depends_on "cmake" => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    #system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    Dir.chdir("src")
    system "make -j 12"
    system "find ../ > /tmp/loc"
    Dir.chdir("../")
    pkgshare.install "Linux-amd64"
    system "ln -s #{pkgshare}/Linux-amd64/bin/canu  #{ENV["HOMEBREW_PREFIX"]}/bin"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test canu`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
