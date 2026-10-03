class Grr < Formula
  desc "Google tools from the terminal, at maximum performance (Gmail, Calendar, Drive, Contacts, Chat, Forms)"
  homepage "https://grr-cli.pages.dev"
  version "0.7.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.7.0/grr-v0.7.0-macos-aarch64.tar.zst"
    sha256 "9d7e65b4b44ccde68a28444bd907bc4461a0ab2b8b517b37b55479a1a061c0f8"
  end

  on_linux do
    on_arch :arm do
      url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.7.0/grr-v0.7.0-linux-aarch64.tar.zst"
      sha256 "ed282f550c3a6eb7f5e62604c608937056c17e28208002882ae388c0dd4b327b"
    end
    on_arch :x86_64 do
      url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.7.0/grr-v0.7.0-linux-x86_64.tar.zst"
      sha256 "e8a54ef1be51b644b03cb12add02e09a3739af016948f233d5ca07e2bd8f6544"
    end
  end

  def install
    # The release tarballs store the binary under its target name
    # (macos-aarch64, linux-x86_64, linux-aarch64), so map it to `grr` here.
    target = if OS.mac?
      "macos-aarch64"
    elsif Hardware::CPU.arm?
      "linux-aarch64"
    else
      "linux-x86_64"
    end
    bin.install target => "grr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grr --version")
  end
end
