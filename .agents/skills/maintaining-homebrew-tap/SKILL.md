---
name: maintaining-homebrew-tap
description: "Maintaining a Homebrew tap: adding formulae, updating versions, computing SHA256 checksums, writing Ruby formula files, auditing, and testing. Use when asked to add a formula, update a formula version, bump a package, or perform any Homebrew tap maintenance."
---

# Maintaining a Homebrew Tap

## Adding a new formula

### Step 1: Gather information

From the upstream project, collect:

- Name, description, homepage, license
- Download URL pattern (source tarball or pre-built binary)
- Supported platforms and architectures
- Build and runtime dependencies

### Step 2: Compute SHA256 checksums

For each download URL:

```sh
curl -sL "<url>" | shasum -a 256
```

### Step 3: Write the formula

Create `Formula/<name>.rb`. Use `brew create <url> --tap zlliang/tap` as a starting point, or write manually.

Pre-built binary template:

```ruby
class Name < Formula
  desc "Short description of the tool."
  homepage "https://example.com"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://example.com/tool-#{version}-darwin-arm64.tar.gz"
      sha256 "<checksum>"
    elsif Hardware::CPU.intel?
      url "https://example.com/tool-#{version}-darwin-x64.tar.gz"
      sha256 "<checksum>"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://example.com/tool-#{version}-linux-arm64.tar.gz"
      sha256 "<checksum>"
    elsif Hardware::CPU.intel?
      url "https://example.com/tool-#{version}-linux-x64.tar.gz"
      sha256 "<checksum>"
    end
  end

  def install
    bin.install "tool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tool --version")
  end
end
```

Source build template (e.g. Go):

```ruby
class Name < Formula
  desc "Short description of the tool."
  homepage "https://example.com"
  url "https://github.com/<owner>/<repo>/archive/refs/tags/v#{version}.tar.gz"
  sha256 "<checksum>"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tool --version")
  end
end
```

### Step 4: Audit and test

```sh
brew install zlliang/tap/<name>
brew test zlliang/tap/<name>
brew audit --strict --online zlliang/tap/<name>
```

Fix any issues reported by `brew audit` before committing.

## Updating a formula to a new version

1. Update `version` (and `url` if not using `#{version}` interpolation)
2. Recompute and replace all `sha256` values
3. Run `brew audit` and `brew test`

## Versioned formulae

Versioned formulae (e.g. `foo@2.rb`) are for pinning at a **major version** when users need to stay on an older major release. They are NOT needed for every minor or patch update.

To create one:

1. Copy `Formula/<name>.rb` to `Formula/<name>@<major-version>.rb`
2. Rename the class to `<Name>AT<digits>` (e.g. `Foo` → `FooAT2` for `foo@2.rb`)
3. Pin the `version` and `sha256` to the desired release
4. Add `keg_only :versioned_formula` if it conflicts with the head formula

Use `brew extract --version=<version> <name> zlliang/tap` to extract a historical formula from homebrew-core.

## Shell completions

If the tool can generate its own completions:

```ruby
def install
  bin.install "tool"
  generate_completions_from_executable(bin/"tool", "completions")
end
```

## Checklist

Before committing:

- [ ] `desc`, `homepage`, `license` are filled and accurate
- [ ] `sha256` checksums verified against downloaded artifacts
- [ ] `test do` block exercises actual functionality
- [ ] `brew audit --strict --online` passes

## References

- [How to Create and Maintain a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Formula API](https://docs.brew.sh/rubydoc/Formula)
- [Taps](https://docs.brew.sh/Taps)
