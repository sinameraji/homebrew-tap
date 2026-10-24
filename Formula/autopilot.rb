class Autopilot < Formula
  desc "Terminal coding agent for any model provider, with your own key"
  homepage "https://github.com/sinameraji/autopilot"
  url "https://registry.npmjs.org/autopilot-ai/-/autopilot-ai-2.4.3.tgz"
  sha256 "e97aa743df3ede3627d41872cf1364377d3e933b07fdea280f3052a044a4282d"
  license "MIT"

  depends_on "node@22"

  def install
    node_bin = formula_opt_bin("node@22")
    system node_bin/"npm", "install", "--global", "--prefix", libexec,
           "--omit=dev", "--no-audit", "--no-fund", cached_download

    (bin/"autopilot").write_env_script libexec/"bin/autopilot", PATH: node_bin
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/autopilot --help")
  end
end
