class KotlinTix < Formula
    desc "A command line utility for generating jira, etc tickets from a markdown document."
    url  "https://github.com/ncipollo/tix-cli.git", :tag => "0.13.0"

    depends_on "openjdk@11" => :build

    def install
        java_home = Language::Java.java_home_env("11")[:JAVA_HOME]
        ENV["JAVA_HOME"] = java_home
        ENV["TIX_INSTALL_PATH"] = buildpath
        ENV["IS_TIX_RELEASE"] = 'true'
        system "./gradlew install"
        bin.install buildpath/"tix"

        zsh_completion.install 'completions/zsh/_tix'
    end

    test do 
        assert_match "🚀 tix version #{version}", shell_output("#{bin}/tix --version")
    end
end
