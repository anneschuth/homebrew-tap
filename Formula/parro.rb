class Parro < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Parro school communication platform"
  homepage "https://github.com/anneschuth/parro-cli"
  url "https://files.pythonhosted.org/packages/74/e2/5744455fd09b5ec9415f805c17d26526016c8fabc4837c582d0c31876b3a/parro-1.0.2.tar.gz"
  sha256 "91841c250154ab50f9b0869051d31edf2df6550cce1210730d436fe14e24877a"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources(extra_pip_args: ["--extra-index-url", "https://pypi.org/simple"])
    system libexec/"bin/pip", "install", "parro[cli]==#{version}"
  end

  test do
    assert_match "parro", shell_output("#{bin}/parro --help")
  end
end
