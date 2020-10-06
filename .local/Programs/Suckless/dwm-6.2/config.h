/* See LICENSE file for copyright and license details. */

/* appearance */
static unsigned int snap      = 32;       /* snap pixel */
static int showbar            = 1;        /* 0 means no bar */
static int topbar             = 1;        /* 0 means bottom bar */
static int floatposgrid_x           = 5;        /* float grid columns */
static int floatposgrid_y           = 5;        /* float grid rows */
static const char *fonts[]          = {
    /* "Hack Nerd Font Mono:pixelsize=14:antialias=true:autohint=true", // Powerline */
    "Noto Sans Emoji:pixelsize=14:antialias=true:autohint=true", // Unicode (emojis)
    /* "Symbola:pixelsize=14:antialias=true:autohint=true", // Unicode (emojis) */
	"monospace:size=10"
 };
static const char dmenufont[]       = "Fira Code Nerd Font:size=10";
/* static char selbordercolor[]        = "#eeeeee"; //border of selected window */
static unsigned int borderpx  = 3;        /* border pixel of windows */
static char selbordercolor[]        = "#770000"; //border of selected window
static char selbgcolor[]            = "#005577";
static const unsigned int gappih    = 20; // def 10     /* horiz inner gap between windows */
static const unsigned int gappiv    = 20; // def 10     /* vert inner gap between windows */
static const unsigned int gappoh    = 20; // def 10     /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 20; // def 10     /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int swallowfloating    = 1;        /* 1 means swallow floating windows by default */
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char col_urgborder[]   = "#ff0000";
#include "/home/solus/.cache/wal/colors-wal-dwm.h"
/* static char *colors[][3] = { */
/*        /1*               fg           bg           border   *1/ */
/*        [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor }, */
/*        [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  }, */
/*        [SchemeUrg]  = { col_gray4, col_cyan,  col_urgborder  }, */
/* }; */

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {"st", "-n", "spterm", "-f", "monospace:size=8", NULL };
const char *spcmd2[] = {"st", "-n", "spfm", "-g", "144x41", "-e", "ranger", NULL };
const char *spcmd3[] = {"st", "-n", "spman", "-f", "monospace:size=10", "-e", "bash", "-c", "openManPage;$SHELL",  NULL };
const char *spcmd4[] = {"st", "-n", "sptab", "-f", "monospace:size=10", "-e", "bash", "-c", "tableContents;$SHELL",  NULL };
const char *spcmd5[] = {"st", "-n", "spcalc", "-f", "monospace:size=16", "-e", "bc", "-lq", NULL };
const char *spcmd6[] = {"st", "-n", "sppydoc", "-f", "monospace:size=12", "-e", "bash", "-c", "python_docs;$SHELL", NULL };
/* const char *spcmd6[] = {"station", NULL }; */
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spfm",        spcmd2},
	{"spman",       spcmd3},
	{"sptab",       spcmd4},
	{"spcalc",      spcmd5},
	{"sppydoc",      spcmd6},
	/* {"spstat",      spcmd6}, */
};

/* tagging */
static const char *tags[] = { "一", "ニ", "三", "四", "五", "六", "七", "八", "九", "ゼロ" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
/* layout(s) */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor     floatpos     */
    /* https://github.com/bakkeby/patches/wiki/floatpos */
	/* { "Gimp",    NULL,     NULL,           0,         1,          0,           0,        -1,       0 }, */
	{ "Firefox", NULL,     NULL,           1 << 8,       0,          0,           0,        -1,  "50% 50% 800W 800H"    },
	{ "Code",    NULL,     NULL,           1 << 2,       0,          0,           0,        -1,  "50% 50% 800W 800H"    },
	{ "Station", NULL,     NULL,           1 << 0,       0,          0,           0,        -1,  "50% 50% 800W 800H"     },
	{ "meh",      NULL,     NULL,           0,           1,          1,           1,        -1,  "100% 100% 100W 700H"   },
	{ NULL,      NULL,     "Event Tester", 0,            0,          0,           1,        -1,  "50% 50% 800W 800H"     },
	{ NULL,		  "spterm",		NULL,	SPTAG(0),	     1,		     1,           0,        -1,  "50% 50% 800W 500H"      },
	{ NULL,		  "spfm",		NULL,	SPTAG(1),	     1,		     1,           0,        -1,  "0% 0% 500W 500H"      },
	{ NULL,		  "spman",      NULL,	SPTAG(2),	     1,		     1,           0,        -1,  "50% 50% 800W 800H"      },
	{ NULL,		  "sptab",		NULL,	SPTAG(3),	     1,		     1,           0,        -1,  "100% 0% 300W 400H"      },
	{ NULL,		  "spcalc",		NULL,	SPTAG(4),	     1,		     1,           0,        -1,  "50% 50% 800W 800H"     },
	{ NULL,		  "sppydoc",	NULL,	SPTAG(5),	     1,		     1,           0,        -1,  "50% 50% 800W 800H"     },
	/* { NULL,		  "keepassxc",	NULL,		SPTAG(2),		0,			 -1 }, */
	//{ "Station", NULL,     NULL,         (1 << 8)-1,    0,          0,          -1,        -1 }, selects all tags except the 9th
};
/* example */
/* class      instance    title       tags mask     isfloating   floatpos                 monitor */
/* { "e1",       NULL,       NULL,       0,            1,           "0x 0y 800W 800H",       -1 }, */
/* { "e2",       NULL,       NULL,       0,            1,           "9999X 0y 800W 800H",    -1 }, */
/* { "e3",       NULL,       NULL,       0,            1,           "0x 9999y 800W 800H",    -1 }, */
/* { "e4",       NULL,       NULL,       0,            1,           "9999x 9999y 800W 800H", -1 }, */
/* { "e5",       NULL,       NULL,       0,            1,           "-1x -1y 9999W 800H",    -1 }, */
/* { "e6",       NULL,       NULL,       0,            1,           "-1x 9999y 9999W 800H",  -1 }, */
/* { "e7",       NULL,       NULL,       0,            1,           "-1x -1y 800W 9999H",    -1 }, */
/* { "e8",       NULL,       NULL,       0,            1,           "9999x -1y 800W 9999H",  -1 }, */
/* { "e9",       NULL,       NULL,       0,            1,           "50% 50% 800W 800H",     -1 }, */
/* { "e10",      NULL,       NULL,       0,            1,           "-1x -1y 50% 50%",       -1 }, */
/* { "e11",      NULL,       NULL,       0,            1,           "0% 0% 800W 800H",       -1 }, */
/* { "e12",      NULL,       NULL,       0,            1,           "100% 0% 800W 800H",     -1 }, */
/* { "e13",      NULL,       NULL,       0,            1,           "0% 100% 800W 800H",     -1 }, */
/* { "e14",      NULL,       NULL,       0,            1,           "100% 100% 800W 800H",   -1 }, */
/* { "e15",      NULL,       NULL,       0,            1,           "-1x -1y 100% 800H",     -1 }, */
/* { "e16",      NULL,       NULL,       0,            1,           "-1x 100% 100% 800H",    -1 }, */
/* { "e17",      NULL,       NULL,       0,            1,           "-1x -1y 800W 100%",     -1 }, */
/* { "e18",      NULL,       NULL,       0,            1,           "100% -1y 800W 100%",    -1 }, */
/* { "e19",      NULL,       NULL,       0,            1,           "50% 50% 50% 50%",       -1 }, */
/* { "e20",      NULL,       NULL,       0,            1,           NULL,                    -1 }, */




/* layout(s) */
/* static float mfact     = 0.55; /1* factor of master area size [0.05..0.95] *1/ */
static float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

#include "vanitygaps.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[D]",      deck },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
 	{ "[\\]",      dwindle },
 	{ "[@]",      spiral },
	{ "TTT",      bstack },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	/* { "===",      bstackhoriz }, */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ Mod1Mask|Mod5Mask,            KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ Mod1Mask|ShiftMask,           KEY,      toggletag,      {.ui = 1 << TAG} },
#define STACKKEYS(MOD,ACTION) \
	{ MOD, XK_n,     ACTION##stack, {.i = INC(+1) } }, \
	{ MOD, XK_e,     ACTION##stack, {.i = INC(-1) } }, \
	{ MOD, XK_v,     ACTION##stack, {.i = 0 } }, \
	//{ MOD, XK_g,     ACTION##stack, {.i = PREVSEL } }, \
	//{ MOD, XK_a,     ACTION##stack, {.i = 1 } }, \
	//{ MOD, XK_z,     ACTION##stack, {.i = 2 } }, \
	//{ MOD, XK_x,     ACTION##stack, {.i = -1 } },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "st", NULL };
/* static const char scratchpadname[] = "scratchpad"; */
/* static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", NULL }; */

/*
 * Xresources preferences to load at startup
 */
// only uncomment if you are gonna manually set them in Xresources file
ResourcePref resources[] = {
		{ "normbgcolor",        STRING,  &normbgcolor },
		{ "normbordercolor",    STRING,  &normbordercolor },
		{ "normfgcolor",        STRING,  &normfgcolor },
		{ "selbgcolor",         STRING,  &selbgcolor },
		{ "selbordercolor",     STRING,  &selbordercolor },
		{ "selfgcolor",         STRING,  &selfgcolor },
		{ "borderpx",          	INTEGER, &borderpx },
		{ "snap",          		INTEGER, &snap },
		{ "showbar",          	INTEGER, &showbar },
		{ "topbar",          	INTEGER, &topbar },
		{ "nmaster",          	INTEGER, &nmaster },
		{ "resizehints",       	INTEGER, &resizehints },
		{ "mfact",      	 	FLOAT,   &mfact },
};

//#include <X11/XF86keysym.h>
/* basics */
//static const char *brightup[]   = { "/usr/bin/xbacklight", "-inc", "10", NULL };
//static const char *brightdown[] = { "/usr/bin/xbacklight", "-dec", "10", NULL };
//static const char *upvol[]   = { "/usr/bin/pactl", "set-sink-volume", "0", "+5%",     NULL };
//static const char *downvol[]    = { "/usr/bin/pactl", "set-sink-volume", "0", "-5%",     NULL };
//static const char *mutevol[]    = { "/usr/bin/pactl", "set-sink-mute",   "0", "toggle",  NULL };
//
/* commands */
static const char *firefox[]  = { "firefox", NULL };

static Key keys[] = {

    /* volume */
    //{ 0,                            XF86XK_AudioLowerVolume,    spawn,      {.v = downvol } },
    //{ 0,                            XF86XK_AudioMute,           spawn,      {.v = mutevol } },
    //{ 0,                            XF86XK_AudioRaiseVolume,    spawn,      {.v = upvol   } },
    //{ 0,                            0x1008ff02,                 spawn,      {.v = brightup } },
    //{ 0,                            0x1008ff03,                 spawn,      {.v = brightdown } },

	/* modifier                     key        function        argument */
	//{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_w,      spawn,          {.v = firefox} },
	{ MODKEY,            			XK_c,  	   togglescratch,  {.ui = 0 } },
	{ MODKEY|ShiftMask,    			XK_c,	   togglescratch,  {.ui = 1 } },
    // this is alt-gr
	{ Mod5Mask,     			    XK_m,	   togglescratch,  {.ui = 2 } },
	{ Mod5Mask|ShiftMask,           XK_m,      togglescratch,  {.ui = 3 } },
	{ MODKEY,   		            XK_a,      togglescratch,  {.ui = 4 } },
	{ Mod5Mask,   		            XK_p,      togglescratch,  {.ui = 5 } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	STACKKEYS(MODKEY,                          focus)
	STACKKEYS(MODKEY|ShiftMask,                push)
	{ MODKEY|ShiftMask,             XK_u,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_l,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_i,      setmfact,       {.f = +0.05} },
	{ MODKEY,						XK_t,      togglegaps,     {0} },
	/* { MODKEY|ControlMask,           XK_0,      efaultgaps,    {0} }, */
	{ MODKEY|ControlMask,           XK_0,      defaultgaps,    {0} },
	{ MODKEY,						XK_z,      incrgaps,       {.i = +1 } },
	{ MODKEY,						XK_x,      incrgaps,       {.i = -1 } },
	/* { MODKEY,                       XK_t,      zoom,           {0} }, */
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ Mod1Mask,                     XK_1,      setlayout,      {.v = &layouts[0]} },
	{ Mod1Mask,                     XK_2,      setlayout,      {.v = &layouts[1]} },
	{ Mod1Mask,                     XK_3,      setlayout,      {.v = &layouts[2]} },
	{ Mod1Mask,                     XK_4,      setlayout,      {.v = &layouts[3]} },
    { Mod1Mask,                     XK_5,      setlayout,      {.v = &layouts[4]} },
	{ Mod1Mask,                     XK_6,      setlayout,      {.v = &layouts[5]} },
	{ Mod1Mask,                     XK_7,      setlayout,      {.v = &layouts[6]} },
	{ Mod1Mask,                     XK_8,      setlayout,      {.v = &layouts[7]} },
	{ Mod1Mask,                     XK_9,      setlayout,      {.v = &layouts[8]} },
	/* { MODKEY|Mod1Mask,              XK_0,      setlayout,      {.v = &layouts[9]} }, */
	{ Mod1Mask,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_s,      togglesticky,   {0} },
	{ MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ Mod5Mask,                     XK_comma,  tagswapmon,     {.i = +1 } },
	{ Mod5Mask,                     XK_period, tagswapmon,     {.i = -1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	//TAGKEYS(                        XK_0,                      9)
	{ MODKEY|ControlMask,             XK_q,       quit,        {0} },

    /* Gaps */
	//{ MODKEY|Mod4Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
	//{ MODKEY|Mod4Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
	//{ MODKEY|Mod4Mask|ControlMask,  XK_h,      incrigaps,      {.i = +1 } },
	//{ MODKEY|Mod4Mask|ControlMask,  XK_l,      incrigaps,      {.i = -1 } },
	//{ MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	//{ MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	//{ MODKEY|ControlMask,           XK_y,      incrivgaps,     {.i = +1 } },
	//{ MODKEY|ControlMask,           XK_o,      incrivgaps,     {.i = -1 } },
	//{ MODKEY|Mod4Mask,              XK_y,      incrohgaps,     {.i = +1 } },
	//{ MODKEY|Mod4Mask,              XK_o,      incrohgaps,     {.i = -1 } },
	//{ MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
	//{ MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

void
setlayoutex(const Arg *arg)
{
	setlayout(&((Arg) { .v = &layouts[arg->i] }));
}

void
viewex(const Arg *arg)
{
	view(&((Arg) { .ui = 1 << arg->ui }));
}

void
viewall(const Arg *arg)
{
	view(&((Arg){.ui = ~0}));
}

void
toggleviewex(const Arg *arg)
{
	toggleview(&((Arg) { .ui = 1 << arg->ui }));
}

void
tagex(const Arg *arg)
{
	tag(&((Arg) { .ui = 1 << arg->ui }));
}

void
toggletagex(const Arg *arg)
{
	toggletag(&((Arg) { .ui = 1 << arg->ui }));
}

void
tagall(const Arg *arg)
{
	tag(&((Arg){.ui = ~0}));
}

/* signal definitions */
/* signum must be greater than 0 */
/* trigger signals using `xsetroot -name "fsignal:<signame> [<type> <value>]"` */
static Signal signals[] = {
	/* signum           function */
	{ "focusstack",     focusstack },
	{ "setmfact",       setmfact },
	{ "togglebar",      togglebar },
	{ "incnmaster",     incnmaster },
	{ "togglefloating", togglefloating },
	{ "focusmon",       focusmon },
	{ "tagmon",         tagmon },
	{ "zoom",           zoom },
	{ "view",           view },
	{ "viewall",        viewall },
	{ "viewex",         viewex },
	{ "toggleview",     view },
	{ "toggleviewex",   toggleviewex },
	{ "tag",            tag },
	{ "tagall",         tagall },
	{ "tagex",          tagex },
	{ "toggletag",      tag },
	{ "toggletagex",    toggletagex },
	{ "killclient",     killclient },
	{ "togglefullscr",  togglefullscr},
	{ "quit",           quit },
	{ "setlayout",      setlayout },
	{ "setlayoutex",    setlayoutex },
};
