# dotfiles

macOS 개발 환경을 [GNU Stow](https://www.gnu.org/software/stow/)로 관리하는 개인 dotfiles 저장소.

이 저장소는 Homebrew 패키지 설치, 설정 파일 심링크, 런타임 및 터미널 플러그인 초기화를 분리해서 관리한다.

## 구성

```
~/dotfiles/
├── Brewfile              # Homebrew CLI 도구, GUI 앱, 폰트 목록
├── bootstrap.sh          # mise 런타임, vim-plug, tmux TPM 초기화
├── cmux/                 # cmux 설정
│   └── .config/cmux/
│       ├── cmux.json
│       └── settings.json
├── ghostty/              # Ghostty 터미널 설정
│   └── .config/ghostty/config
├── git/                  # Git 공통 설정
│   ├── .gitconfig
│   ├── .gitconfig.user.example
│   └── .stow-local-ignore
├── karabiner/            # Karabiner-Elements 키 매핑
│   └── .config/karabiner/karabiner.json
├── sheldon/              # Zsh 플러그인 매니저 설정
│   └── .config/sheldon/plugins.toml
├── starship/             # Starship 프롬프트 설정
│   └── .config/starship.toml
├── tmux/                 # tmux 설정
│   └── .tmux.conf
├── vim/                  # Vim 설정
│   └── .vimrc
├── yazi/                 # Yazi 파일 매니저 설정
│   └── .config/yazi/
│       ├── package.toml
│       ├── theme.toml
│       └── yazi.toml
└── zsh/                  # Zsh 설정
    ├── .zshrc
    └── .zshrc.extra
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

`Brewfile`은 Stow, Zsh/Shell 도구, tmux, GitHub CLI, mise, Java LSP, Ghostty, Karabiner-Elements, Nerd Font를 설치한다.

`cmux`, `lazygit`, `claude`는 설정 파일에서 참조되지만 현재 `Brewfile`에는 포함되어 있지 않다. 해당 단축키를 쓰려면 별도로 설치되어 있어야 한다.

### 4. 설정 파일 심링크

필요한 패키지만 골라 적용하거나, 아래처럼 현재 저장소의 전체 설정을 적용한다.

```bash
stow cmux
stow ghostty
stow git
stow karabiner
stow sheldon
stow starship
stow tmux
stow vim
stow yazi
stow zsh
```

이미 같은 위치에 파일이 있으면 Stow가 충돌을 보고한다. 기존 설정을 백업한 뒤 다시 실행한다.

### 5. Git 사용자 정보 설정

공통 Git 설정은 `git/.gitconfig`에서 관리하고, 이름과 이메일은 홈 디렉토리의 비공개 파일로 분리한다.

```bash
cp ~/dotfiles/git/.gitconfig.user.example ~/.gitconfig.user
```

`~/.gitconfig.user`의 `name`, `email` 값을 개인 정보로 수정한다.

### 6. 초기화 스크립트 실행

```bash
bash bootstrap.sh
```

`bootstrap.sh`가 처리하는 작업:

- `mise`로 Java 21, 17, 11, Node.js LTS, Python latest, Maven latest, Gradle latest 설치
- Vim 플러그인 매니저 `vim-plug` 설치
- Tmux Plugin Manager(`tpm`) 설치
- 실행 중인 tmux 세션이 있으면 설정 리로드 및 플러그인 설치/정리

tmux 세션이 없는 상태에서는 TPM만 설치된다. 이후 tmux 안에서 `prefix + I`로 플러그인을 설치할 수 있다.

## 설정 요약

| 영역 | 설정 내용 |
|------|-----------|
| Zsh | `sheldon`, `zoxide`, `fzf`, `starship`, `mise` 초기화 |
| Zsh 추가 설정 | `ls`, `ll`, `cat`, `diff`, `git`, `tmux` 계열 alias와 Yazi `y` 래퍼 |
| Git | `delta` pager, rebase 기반 pull, `main` 기본 브랜치, patience diff, 자주 쓰는 alias |
| tmux | `Ctrl+Space` prefix, Vim 스타일 pane 이동/리사이즈, popup terminal/lazygit/claude, Catppuccin 테마 |
| Vim | line number, relative number, Nord 테마, vim-airline, 4-space indent, system clipboard |
| Ghostty | Nord 테마, JetBrainsMono Nerd Font + Noto Sans KR, 한글 셀 높이 보정, Option-as-Alt |
| Karabiner | CapsLock tap=Esc/hold=LeftCtrl, `Ctrl+[` to Esc, 오른쪽 Command/Option 일부를 F18로 매핑 |
| Yazi | 숨김 파일 표시, 디렉토리 우선 정렬, 2:4:3 레이아웃, preview 크기 제한 |
| cmux | `Ctrl+Space` 기반 pane 이동/분할 단축키, Markdown cmux viewer 열기 |

## 주요 도구

| 도구 | 역할 |
|------|------|
| [stow](https://www.gnu.org/software/stow/) | dotfiles 심링크 관리 |
| [bat](https://github.com/sharkdp/bat) | `cat` 대체, 구문 강조 |
| [eza](https://github.com/eza-community/eza) | `ls` 대체, 아이콘/트리 표시 |
| [fd](https://github.com/sharkdp/fd) | `find` 대체 |
| [fzf](https://github.com/junegunn/fzf) | 퍼지 파인더 |
| [git-delta](https://github.com/dandavison/delta) | Git diff/pager 개선 |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | 사용 빈도 기반 디렉토리 이동 |
| [sheldon](https://github.com/rossmacarthur/sheldon) | Zsh 플러그인 관리 |
| [starship](https://starship.rs) | 크로스쉘 프롬프트 |
| [tmux](https://github.com/tmux/tmux) | 터미널 멀티플렉서 |
| [vim-plug](https://github.com/junegunn/vim-plug) | Vim 플러그인 관리 |
| [mise](https://mise.jdx.dev) | Java, Node.js, Python, Maven, Gradle 런타임 관리 |
| [gh](https://cli.github.com/) | GitHub CLI |
| [jdtls](https://github.com/eclipse-jdtls/eclipse.jdt.ls) | Java LSP |
| [Ghostty](https://ghostty.org) | 터미널 에뮬레이터 |
| [Karabiner-Elements](https://karabiner-elements.pqrs.org) | macOS 키보드 커스터마이저 |
| [Yazi](https://github.com/sxyazi/yazi) | 터미널 파일 매니저 |

## 설정에서 참조되는 별도 도구

| 도구 | 참조 위치 |
|------|-----------|
| [cmux](https://github.com/manaflow-ai/cmux) | `cmux/.config/cmux/` 설정 |
| [lazygit](https://github.com/jesseduffield/lazygit) | tmux `prefix + Ctrl+g` popup |
| [Claude Code](https://claude.com/product/claude-code) | Zsh `cl` alias, tmux `prefix + Ctrl+c` popup |

## 패키지 관리

```bash
# 새 설정 패키지 적용
stow <패키지명>

# 적용 해제
stow -D <패키지명>

# 적용 전 시뮬레이션
stow -nvt ~ <패키지명>

# Homebrew 설치 목록 갱신
brew bundle dump --force --file=~/dotfiles/Brewfile
```

## 새 도구 추가

Stow 패키지는 홈 디렉토리 구조를 그대로 미러링한다.

```bash
# 예: ~/.config/example/config.toml 을 관리하고 싶은 경우
mkdir -p ~/dotfiles/example/.config/example
$EDITOR ~/dotfiles/example/.config/example/config.toml

cd ~/dotfiles
stow example
```

설정 파일이 `~/.example`처럼 홈 바로 아래에 위치한다면 `~/dotfiles/example/.example` 형태로 둔다.

## 개인/로컬 설정 분리

- Git 개인 정보는 `~/.gitconfig.user`에 둔다.
- 머신별 Zsh 설정은 `~/.zshrc.local`에 둔다.
- 저장소에 공유해도 되는 Zsh alias와 helper는 `zsh/.zshrc.extra`에서 관리한다.

이렇게 나누면 저장소에는 재사용 가능한 기본값만 남기고, 민감하거나 장비별로 다른 값은 홈 디렉토리에서만 유지할 수 있다.
