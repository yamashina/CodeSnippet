# -------------------------------------------------
# ディレクトリ作成＆ファイルコピー
# 下記ツリー状のデータを作る
# CurrentDir
# ┣Folder001
# ┃┣Folder001_Track01
# ┃┣・・・
# ┃┗Folder001_Track10
# ┣Folder002
# ┃┣Folder002_Track01
# ┃┣・・・
# ┃┗Folder002_Track10
# ・
# ・
# ・
# ┗Folder192
#   ┣Folder192_Track01
#   ┣・・・
#   ┗Folder192_Track10
# -------------------------------------------------
use strict;
use warnings;

use File::Copy;

my $i;
for ($i=1; $i<=192; $i++) {
	my $dir = sprintf("Folder%03d", $i);
	
	if (mkdir $dir, 0777) {
		print sprintf("mkdir Folder%03d succeeded.\n", $i);
		
		my $j;
		for ($j=1; $j<=10; $j++) {
			my $file = sprintf("Folder%03d_Track%02d.mp3", $i, $j);
			
			if (copy "music.mp3", $dir."/".$file) {
				print sprintf("copy Folder%03d_Track%02d succeeded.\n", $i, $j);
			}
			else {
				print sprintf("copy Folder%03d_Track%02d failed.\n", $i, $j);
			}
		}
	}
	else {
		print sprintf("mkdir Folder%03d failed.\n", $i);
	}

}

__END__
