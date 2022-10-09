{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Classical_DPLL_SAT_solver (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/harigovind/.cabal/bin"
libdir     = "/home/harigovind/.cabal/lib/x86_64-linux-ghc-8.8.4/Classical-DPLL-SAT-solver-0.1.0.0-inplace-_"
dynlibdir  = "/home/harigovind/.cabal/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/harigovind/.cabal/share/x86_64-linux-ghc-8.8.4/Classical-DPLL-SAT-solver-0.1.0.0"
libexecdir = "/home/harigovind/.cabal/libexec/x86_64-linux-ghc-8.8.4/Classical-DPLL-SAT-solver-0.1.0.0"
sysconfdir = "/home/harigovind/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Classical_DPLL_SAT_solver_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Classical_DPLL_SAT_solver_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Classical_DPLL_SAT_solver_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Classical_DPLL_SAT_solver_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Classical_DPLL_SAT_solver_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Classical_DPLL_SAT_solver_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
