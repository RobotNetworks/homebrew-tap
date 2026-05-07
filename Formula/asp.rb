class Asp < Formula
  desc "Run and inspect local Agent Session Protocol networks"
  homepage "https://github.com/RobotNetworks/asp/tree/main/cli"
  url "https://registry.npmjs.org/@robotnetworks/asp/-/asp-0.1.6.tgz"
  sha256 "d35d40c53a8c0635b21a2e464851aacf67e4e3a97fecb2faaa5f2412dbe8ef0a"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asp --version")
  end
end
