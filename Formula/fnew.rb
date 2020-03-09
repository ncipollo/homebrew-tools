class Fnew < Formula
    desc "A command line tool for creating a new project. "
    url  "https://github.com/ncipollo/fnew.git",
        :tag => "0.8.3"

    depends_on "go" => :build
    depends_on "make" => :build

    def install
        ENV["GOPATH"] = buildpath
        ENV["VERSION"] = version
        src_path = buildpath/"src/fnew"
        # Copy all files from their current location (GOPATH root)
        # to $GOPATH/src/github.com/ncipollo/fnew
        src_path.install Dir["*",".??*"]
        cd src_path do
            system "make", "deps"
            system "make", "build"
            build_path = src_path/"build/release/fnew"
            bin.install build_path

            zsh_completion.install "completions/_fnew"
        end
    end

    test do 
        assert_match "fnew version: #{version}", shell_output("#{bin}/fnew --version")
    end
end