# dotfiles

[GNU Stow](https://www.gnu.org/software/stow/) 기반 dotfiles 저장소.

## 구조

```
~/dotfiles/
├── Brewfile              # Homebrew 패키지 목록
├── git/                  # Git 설정
│   ├── .gitconfig
│   └── .gitconfig.user.example
├── ghostty/              # 터미널 에뮬레이터
│   └── .config/ghostty/config
├── neovim/               # Neovim 에디터
│   └── .config/nvim/
│       ├── init.lua
│       ├── lazy-lock.json
│       ├── lazyvim.json
│       └── lua/config/
│           ├── autocmds.lua
│           ├── keymaps.lua
│           ├── lazy.lua
│           └── options.lua
├── sheldon/              # Zsh 플러그인 매니저
│   └── .config/sheldon/plugins.toml
├── starship/             # 쉘 프롬프트
│   └── .config/starship.toml
├── tmux/                 # 터미널 멀티플렉서
│   └── .tmux.conf
├── vim/                  # Vim 에디터
│   └── .vimrc
├── yazi/                 # 터미널 파일 매니저
│   └── .config/yazi/
│       ├── yazi.toml
│       ├── theme.toml
│       └── package.toml
└── zsh/                  # Zsh 쉘 설정
    └── .zshrc
```

## 설치

### 1. Homebrew 설치

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. 저장소 클론

```bash
git clone git@github.com:sbywww/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. 패키지 설치

```bash
brew bundle --file=Brewfile
```

### 4. 심링크 생성

원하는 패키지만 선택해서 적용한다.

```bash
stow git
stow zsh
stow sheldon
stow starship
stow tmux
stow ghostty
stow neovim
stow vim
stow yazi
```

### 5. 초기 설정

```bash
bash install.sh
```

### 6. Git 사용자 정보 설정

```bash
cp ~/.gitconfig.user.example ~/.gitconfig.user
```

`~/.gitconfig.user`에 name, email을 입력한다.

## 패키지 관리

```bash
# 패키지 추가
stow <패키지명>

# 패키지 제거
stow -D <패키지명>

# Brewfile 업데이트 (현재 설치된 패키지 기준)
brew bundle dump --force --file=~/dotfiles/Brewfile
```

## 새 도구 추가 방법

```bash
# 1. 패키지 디렉토리 생성 (홈 디렉토리 구조를 미러링)
mkdir -p ~/dotfiles/<tool>/.config/<tool>

# 2. 설정 파일 작성
# 3. 심링크 생성
cd ~/dotfiles && stow <tool>

# 4. 커밋
git add <tool> && git commit -m "Add <tool> config"
```

## Starship 테마 변경

[Starship Presets](https://starship.rs/presets/)에서 원하는 테마를 적용할 수 있다.

```bash
# Gruvbox Rainbow
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# Tokyo Night
starship preset tokyo-night -o ~/.config/starship.toml

# Catppuccin Powerline
starship preset catppuccin-powerline -o ~/.config/starship.toml
```

변경 후 터미널을 재시작하거나 `exec zsh`로 즉시 적용한다.

## 사용 도구

| 도구 | 역할 |
|------|------|
| [bat](https://github.com/sharkdp/bat) | `cat` 대체 (구문 강조) |
| [eza](https://github.com/eza-community/eza) | `ls` 대체 (아이콘, 트리) |
| [fd](https://github.com/sharkdp/fd) | `find` 대체 |
| [fzf](https://github.com/junegunn/fzf) | 퍼지 파인더 |
| [git-delta](https://github.com/dandavison/delta) | Git diff 강화 |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `cd` 대체 |
| [sheldon](https://github.com/rossmacarthur/sheldon) | Zsh 플러그인 매니저 |
| [starship](https://starship.rs) | 크로스쉘 프롬프트 |
| [tmux](https://github.com/tmux/tmux) | 터미널 멀티플렉서 |
| [neovim](https://neovim.io) | 하이퍼텍스트 에디터 |
| [fnm](https://github.com/Schniz/fnm) | Node.js 버전 매니저 |
| [bash](https://www.gnu.org/software/bash/) | 최신 Bash (tmux 플러그인 호환) |
| [ghostty](https://ghostty.org) | 터미널 에뮬레이터 |
| [yazi](https://github.com/sxyazi/yazi) | 터미널 파일 매니저 |
