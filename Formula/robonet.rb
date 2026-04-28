class Robonet < Formula
  desc "CLI for RoboNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robonet/-/robonet-0.1.11.tgz"
  sha256 "2cc0bda7f46d376d5508e143ee556c05285061907bf1bcbe95d4506bee298892"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/robonet --version")
  end
end
