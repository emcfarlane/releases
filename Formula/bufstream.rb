class Bufstream < Formula
  desc "Drop-in replacement for Apache Kafka with improved data quality and lower costs"
  homepage "https://buf.build/product/bufstream"
  version "0.3.11"
  url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Darwin-arm64" # Default URL for stable bottle generation
  sha256 "TODO" # Default SHA for the above URL

  checksums = {
    "darwin-arm64" => "TODO",
    "darwin-x86_64" => "TODO",
    "linux-arm64" => "TODO",
    "linux-x86_64" => "TODO",
  }

  on_macos do
    on_intel do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Darwin-x86_64"
      sha256 checksums["darwin-x86_64"]
    end
    on_arm do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Darwin-arm64"
      sha256 checksums["darwin-arm64"]
    end
  end

  on_linux do
    on_intel do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Linux-x86_64"
      sha256 checksums["linux-x86_64"]
    end
    on_arm do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Linux-aarch64"
      sha256 checksums["linux-arm64"]
    end
  end

  def install
    bin.install "bufstream-v#{version}-#{OS.kernel_name}-#{Hardware::CPU.arch}" => "bufstream"
  end

  test do
    system "#{bin}/bufstream", "--version"
  end
end
