/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "Noto Sans Emoji:pixelsize=13:antialias=true:autohint=true", // Unicode (emojis)
    /* "JoyPixels:pixelsize=15:antialias=true:autohint=true" //not working in solus */
    /* "Hack Nerd Font Mono:pixelsize=14:antialias=true:autohint=true", // Powerline */
    /* "Inconsolata for Powerline:pixelsize=12:antialias=true:autohint=true", */  
    /* "Symbola:pixelsize=16:antialias=true:autohint=true", // Unicode (emojis) */
    /* "Noto Sans Emoji:pixelsize=13:antialias=true:autohint=true", // Unicode (emojis) */
	"monospace:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
#include "/home/solus/.cache/wal/colors-wal-dmenu.h"
// better colors
	/* [SchemeNorm] = { "#edc3ee", "#0d0911" }, */
	/* [SchemeSel] = { "#edc3ee", "#62329E" }, */
	/* [SchemeOut] = { "#edc3ee", "#AA5BD5" }, */

/* /1* static const char *colors[SchemeLast][2] = { *1/ */
/* 	/1*     fg         bg       *1/ */
/* 	[SchemeNorm] = { "#bbbbbb", "#222222" }, */
/* 	[SchemeSel] = { "#eeeeee", "#005577" }, */
/* 	[SchemeOut] = { "#000000", "#00ffff" }, */
/* }; */
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
