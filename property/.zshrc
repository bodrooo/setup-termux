PROMPT='%F{blue}%~%f $ '

alias ls="lsd"
alias lt="lsd --tree"
alias x="exit"
alias n="nvim"
alias rm="rm -rf"
alias resetup-neovim="rm .config .local && cd storage/shared/setup-termux && zsh neovim-setup.sh && cd && echo '\nSuccesFully\n'"

function run {
  local apk_name="$1"
  case "$apk_name" in
    "bstation")
      package_name="com.bstar.intl"
      launcher_activity="tv.danmaku.bili.ui.splash.SplashActivity"
      ;;
    "brave")
      package_name="com.brave.browser"
      launcher_activity="com.google.android.apps.chrome.Main"
      ;;
    "acode")
      package_name="com.foxdebug.acode"
      launcher_activity="com.foxdebug.acode.MainActivity"
      ;;
    "anime-indo")
      package_name="me.onenrico.animeindo"
      launcher_activity="me.onenrico.animeindo.ui.splash.SplashActivity"
      ;;
    "ml")
      package_name="com.mobile.legends"
      launcher_activity="com.moba.unityplugin.MobaGameMainActivityWithExtractor"
      ;;
    "wa")
      package_name="com.whatsapp"
      launcher_activity="com.whatsapp.Main"
      ;;
    "drive")
      package_name="com.google.android.apps.docs"
      launcher_activity="com.google.android.apps.docs.app.NewMainProxyActivity"
      ;;
    "google-play-store")
      package_name="com.android.vending"
      launcher_activity="com.android.vending.AssetBrowserActivity"
      ;;
    "zar")
      package_name="ru.zdevs.zarchiver"
      launcher_activity="ru.zdevs.zarchiver.ZArchiver"
      ;;
    "file-manager")
      package_name="com.mi.android.globalFileexplorer"
      launcher_activity="com.android.fileexplorer.FileExplorerTabActivity"
      ;;
    "galeri")
      package_name="com.miui.gallery"
      launcher_activity="com.miui.gallery.activity.HomePageActivity"
      ;;
    "setelan")
      package_name="com.android.settings"
      launcher_activity="com.android.settings.Settings"
      ;;
    "yt")
      package_name="org.schabi.newpipe"
      launcher_activity="org.schabi.newpipe.MainActivity"
      ;;
    *)
      echo "Not Found Shortcut: $apk_name"
      return 1
      ;;
  esac
  am start -n "$package_name/$launcher_activity"
}

function pi {
  pkg install "$1" -y
}

function pu {
  pkg uninstall "$1" -y
}

function gc {
  git clone "$1"
}

function mdir {
  mkdir -p "$1" && cd "$1"
}

