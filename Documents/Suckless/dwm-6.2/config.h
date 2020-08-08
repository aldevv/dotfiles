/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static unsigned int borderpx  = 1;        /* border pixel of windows */
static unsigned int snap      = 32;       /* snap pixel */
static int showbar            = 1;        /* 0 means no bar */
static int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#eeeeee"; //border of selected window
static char selbgcolor[]            = "#005577";
static const unsigned int gappih    = 20; // def 10     /* horiz inner gap between windows */
static const unsigned int gappiv    = 20; // def 10     /* vert inner gap between windows */
static const unsigned int gappoh    = 20; // def 10     /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 20; // def 10     /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Gimp",    NULL,     NULL,           0,         1,          0,           0,        -1 },
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
	{ "Code",    NULL,     NULL,           1 << 2,    0,          0,          -1,        -1 },
	{ "Station", NULL,     NULL,           1 << 0,    0,          0,          -1,        -1 },
	{ "St",      NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
	//{ "Station", NULL,     NULL,         (1 << 8)-1,    0,          0,          -1,        -1 }, selects all tags except the 9th
};

/* layout(s) */
static float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

#include "vanitygaps.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "[D]",      deck },
 	{ "[@]",      spiral },
 	{ "[\\]",      dwindle },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
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
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", NULL };

/*
 * Xresources preferences to load at startup
 */
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
	{ MODKEY|ShiftMask,             XK_Tab,    togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	STACKKEYS(MODKEY,                          focus)
	STACKKEYS(MODKEY|ShiftMask,                push)
	{ MODKEY|ShiftMask,             XK_u,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_l,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_i,      setmfact,       {.f = +0.05} },
	{ MODKEY|Mod1Mask,              XK_t,      togglegaps,     {0} },
	{ MODKEY|ControlMask,           XK_0,      defaultgaps,    {0} },
	{ MODKEY|Mod1Mask,              XK_z,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_x,      incrgaps,       {.i = -1 } },
	{ MODKEY,                       XK_t,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|Mod1Mask,              XK_1,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|Mod1Mask,              XK_2,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|Mod1Mask,              XK_3,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|Mod1Mask,              XK_4,      setlayout,      {.v = &layouts[3]} },
    { MODKEY|Mod1Mask,              XK_5,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY|Mod1Mask,              XK_6,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY|Mod1Mask,              XK_7,      setlayout,      {.v = &layouts[6]} },
	{ MODKEY|Mod1Mask,              XK_8,      setlayout,      {.v = &layouts[7]} },
	{ MODKEY|Mod1Mask,              XK_9,      setlayout,      {.v = &layouts[8]} },
	{ MODKEY|Mod1Mask,              XK_0,      setlayout,      {.v = &layouts[9]} },
	//{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[3]} },
	//{ MODKEY,                       XK_o,      setlayout,      {.v = &layouts[4]} },
	//{ MODKEY,                       XK_c,      setlayout,      {.v = &layouts[3]} },
	//{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_s,      togglesticky,   {0} },
	{ MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	/* { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } }, */
	/* { MODKEY,                       XK_period, focusmon,       {.i = +1 } }, */
	/* { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } }, */
	/* { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } }, */
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

