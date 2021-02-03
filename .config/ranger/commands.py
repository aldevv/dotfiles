from ranger.api.commands import *
from ranger.container.file import File
from ranger.ext.get_executables import get_executables
import subprocess
import os


class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        import os.path

        if self.quantifier:
            # match only directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
            # not working
            # command="rg . --hidden --follow -g '!{**/node_modules/*,.git,miniconda3,env,envs,__pycache__, libs,lib,.wine,core,.npm,.icons,.vscode,*/nvim/backups,.emacs.d/**,.cache}' |fzf"
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip("\n"))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class YankContent(Command):
    """
    Copy the content of image file and text file with xclip
    """

    def execute(self):
        if "xclip" not in get_executables():
            self.fm.notify("xclip is not found.", bad=True)
            return

        arg = self.rest(1)
        if arg:
            if not os.path.isfile(arg):
                self.fm.notify("{} is not a file.".format(arg))
                return
            file = File(arg)
        else:
            file = self.fm.thisfile
            if not file.is_file:
                self.fm.notify("{} is not a file.".format(file.relative_path))
                return

        relative_path = file.relative_path
        cmd = ["xclip", "-selection", "clipboard"]
        if not file.is_binary():
            with open(file.path, "rb") as fd:
                subprocess.check_call(cmd, stdin=fd)
        elif file.image:
            cmd += ["-t", file.mimetype, file.path]
            subprocess.check_call(cmd)
            self.fm.notify("Content of {} is copied to x clipboard".format(relative_path))
        else:
            self.fm.notify("{} is not an image file or a text file.".format(relative_path))

    def tab(self, tabnum):
        return self._tab_directory_content()
