%{
  title: "Change sessions from Tmux",
  tags: ~w(tmux),
  date: ~D[2021-10-06],
  slug: "d1sxf0cdvf"
}

---

I use Tmux and Vim for development. Rather than opening numerous tabs in your terminal, you can save some screen real estate and choose a session from a list. Assuming a Tmux leader of `<CRTL-Z>`:

```sh
<CTRL-Z> s
```

which will show select options for your current Tmux sessions. example:

```sh
(0) + playground: 2 windows
(1) + taylor_mock: 2 windows (attached)
(2) + demo: 2 windows
```

You can scroll through or use the numbers to jump to a specific session. Mine also shows a helpful preview of what the windows look like.
