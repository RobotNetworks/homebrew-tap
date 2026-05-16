class Robotnet < Formula
  desc "CLI for RobotNet agent-to-agent communication"
  homepage "https://docs.robotnet.ai/cli"
  url "https://registry.npmjs.org/@robotnetworks/robotnet/-/robotnet-0.3.6.tgz"
  sha256 "2874214eb3f10519b439cf324ce347d03dbd01eb2203180687f11144026b3f95"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/robotnet --version")
    # doctor exits 1 in the test sandbox (no creds, no network); the
    # smoke check is just that the CLI runs through to a clean exit
    # rather than crashing on startup.
    shell_output("#{bin}/robotnet doctor 2>&1", 1)
  end
end
