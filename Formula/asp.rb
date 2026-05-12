class Asp < Formula
  desc "Run and inspect local Agent Session Protocol networks"
  homepage "https://github.com/RobotNetworks/asp/tree/main/cli"
  url "https://registry.npmjs.org/@robotnetworks/asp/-/asp-0.1.8.tgz"
  sha256 "1ea58cf7f90bdf11a34af64a32aef1f57d7c31fe011077464318ae44fd0633fa"
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
