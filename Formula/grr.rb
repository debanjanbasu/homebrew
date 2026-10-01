class Grr < Formula
  desc "Google tools from the terminal, at maximum performance (Gmail, Calendar, Drive, Contacts, Chat, Forms)"
  homepage "https://grr-cli.pages.dev"
  version "0.6.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.6.0/grr-v0.6.0-macos-aarch64.tar.zst"
    sha256 "a781efad1827cfb2ead13f609f4dc3351cd7d7d1a8d0626967efba7d64086241"
  end

  on_linux do
    on_arch :arm do
      url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.6.0/grr-v0.6.0-linux-aarch64.tar.zst"
      sha256 "4fdd0499c73114202b61dfa1aca1f8c6dc1425740df885d4483236feffff6342"
    end
    on_arch :x86_64 do
      url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.6.0/grr-v0.6.0-linux-x86_64.tar.zst"
      sha256 "45db6a9f2387413bea1781ba4303ec02971a3a1c8c577e9304721aec6e465a50"
    end
  end

  def install
    bin.install "grr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grr --version")
  end
end