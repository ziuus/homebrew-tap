class Orbit < Formula
  desc "Extensible 24/7 terminal workspace and autonomous AI agent cockpit in Rust"
  homepage "https://orbit-tui.vercel.app"
  version "0.11.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ziuus/orbit-tui/releases/download/v0.11.17/orbit-aarch64-apple-darwin.tar.gz"
      sha256 "acdbaeefc936eb03fd8e3df9a6f62d0131635834fffc86d7778cbc6e0a150690"
    else
      url "https://github.com/ziuus/orbit-tui/releases/download/v0.11.17/orbit-x86_64-apple-darwin.tar.gz"
      sha256 "08462146675b5026b8cb6ae169803795aa75e53ae991e7c1b546ec63c76fd51e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ziuus/orbit-tui/releases/download/v0.11.17/orbit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2611f97030415da38c17feb451fade5442315864752f8630a2991c0f93b354fc"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version 2>&1", 0)
  end
end
