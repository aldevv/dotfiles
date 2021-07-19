------------------------------------------------------------------------------
-- |
-- Module: Xmobar.Config.Defaults
-- Copyright: (c) 2018, 2019 Jose Antonio Ortega Ruiz
-- License: BSD3-style (see LICENSE)
--
-- Maintainer: jao@gnu.org
-- Stability: unstable
-- Portability: portable
-- Created: Sun Nov 25, 2018 22:26
--
--
-- Default values for Xmobar configurations and functions to access
-- configuration files and directories.
--
------------------------------------------------------------------------------


module Xmobar.App.Config (defaultConfig,
                          xmobarConfigDir,
                          xmobarDataDir,
                          xmobarConfigFile) where

import Control.Monad (when)

import System.Environment
import System.Directory
import System.FilePath ((</>))
import System.Posix.Files (fileExist)

import Xmobar.Plugins.Date
import Xmobar.Plugins.StdinReader
import Xmobar.Config.Types
import Xmobar.Run.Runnable

-- | The default configuration values
defaultConfig :: Config
defaultConfig =
    Config { font = "-misc-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
           , additionalFonts = []
           , wmClass = "xmobar"
           , wmName = "xmobar"
           , bgColor = "#000000"
           , fgColor = "#BFBFBF"
           , alpha   = 255
           , position = Top
           , border = NoBorder
           , borderColor = "#BFBFBF"
           , borderWidth = 1
           , textOffset = -1
           , iconOffset = -1
           , textOffsets = []
           , hideOnStart = False
           , lowerOnStart = True
           , persistent = False
           , allDesktops = True
           , overrideRedirect = True
           , pickBroadest = False
           , iconRoot = "."
           , commands = [ Run $ Date "%a %b %_d %Y * %H:%M:%S" "theDate" 10
                        , Run StdinReader]
           , sepChar = "%"
           , alignSep = "}{"
           , template = "%StdinReader% }{ " ++
                        "<fc=#00FF00>%uname%</fc> * <fc=#FF0000>%theDate%</fc>"
           , verbose = False
           }

-- | Return the path to the xmobar configuration directory.  This
-- directory is where user configuration files are stored (e.g, the
-- xmobar.hs file).  You may also create a @lib@ subdirectory in the
-- configuration directory and the default recompile command will add
-- it to the GHC include path.
--
-- Several directories are considered.  In order of
-- preference:
--
--   1. The directory specified in the @XMOBAR_CONFIG_DIR@ environment variable.
--   2. The @~\/.xmobar@ directory.
--   3. The @XDG_CONFIG_HOME/xmobar@ directory.
--
-- The first directory that exists will be used.  If none of the
-- directories exist then (1) will be used if it is set, otherwise (2)
-- will be used.
xmobarConfigDir :: IO String
xmobarConfigDir =
    findFirstDirWithEnv False "XMOBAR_CONFIG_DIR"
      [ getAppUserDataDirectory "xmobar"
      , getXdgDirectory XdgConfig "xmobar"
      ]

-- | Return the path to the xmobar data directory.  This directory is
-- used by Xmobar to store data files such as the run-time state file
-- and the configuration binary generated by GHC.
--
-- Several directories are considered.  In order of preference:
--
--   1. The directory specified in the @XMOBAR_DATA_DIR@ environment variable.
--   2. The @XDG_DATA_HOME/xmobar@ directory.
--   3. The @~\/.xmobar@ directory.
--
-- The first directory that exists will be used.  If none of the
-- directories exist then (1) will be used if it is set, otherwise (2)
-- will be used.  Either way, a directory will be created if
-- necessary.
xmobarDataDir :: IO String
xmobarDataDir =
    findFirstDirWithEnv True "XMOBAR_DATA_DIR"
      [ getXdgDirectory XdgData "xmobar"
      , getAppUserDataDirectory "xmobar"
      ]

-- | Helper function that will find the first existing directory and
-- return its path.  If none of the directories can be found,
-- optionally create and return the first from the list.  If the list
-- is empty this function returns the historical @~\/.xmobar@
-- directory.
findFirstDirOf :: Bool -> [IO FilePath] -> IO FilePath
findFirstDirOf create [] = findFirstDirOf create [getAppUserDataDirectory "xmobar"]
findFirstDirOf create possibles = do
    found <- go possibles
    case found of
      Just path -> return path
      Nothing ->  do
        primary <- head possibles
        when create (createDirectoryIfMissing True primary)
        return primary
  where
    go [] = return Nothing
    go (x:xs) = do
      exists <- x >>= doesDirectoryExist
      if exists then x >>= return . Just else go xs

-- | Simple wrapper around @findFirstDirOf@ that allows the primary
-- path to be specified by an environment variable.
findFirstDirWithEnv :: Bool -> String -> [IO FilePath] -> IO FilePath
findFirstDirWithEnv create envName paths = do
    envPath' <- lookupEnv envName
    case envPath' of
      Nothing -> findFirstDirOf create paths
      Just envPath -> findFirstDirOf create (return envPath:paths)

xmobarConfigFile :: IO (Maybe FilePath)
xmobarConfigFile =
  ffirst [ xdg "xmobar.hs", xdg "xmobarrc", home ".xmobarrc"]
  where xdg p = fmap (</> p) xmobarConfigDir
        home p = fmap (</> p) getHomeDirectory
        ffirst [] = return Nothing
        ffirst (f:fs) =
          f >>= fileExist >>= \e -> if e then fmap Just f else ffirst fs
