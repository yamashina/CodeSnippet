# -------------------------------------------------
# 階層化ディレクトリ作成＆ファイルコピー
# 音声データ(music.mp3)をコピーして下記ツリー状のデータを作る
# CurrentDir
# ┗Fld01
#   ┣Fld01_Track10.mp3
#   ┣・・・
#   ┣Fld01_Track10.mp3
#   ┗Fld02
#     ┣Fld02_Track10.mp3
#     ┣・・・
#     ┣Fld02_Track10.mp3
#     ┗Fld03
#       ┣
#       ・・・・・
#               ┗Fld10
#                 ┣Fld10_Track01.mp3
#                 ┣・・・
#                 ┗Fld10_Track10.mp3
# -------------------------------------------------
use strict;
use warnings;

use File::Copy;

my $i;
my $dir;
for ($i=1; $i<=10; $i++) {
	$dir .= sprintf("Fld%02d", $i);
	
	if (mkdir $dir, 0777) {
		print "mkdir ".$dir." succeeded.\n";
		
		my $j;
		for ($j=1; $j<=10; $j++) {
			my $file = sprintf("Fld%02d_Track%02d.mp3", $i, $j);
			
			if (copy "music.mp3", $dir."/".$file) {
				print sprintf("copy Fld%02d_Track%02d succeeded.\n", $i, $j);
			}
			else {
				print sprintf("copy Fld%02d_Track%02d failed.\n", $i, $j);
			}
		}
		
		$dir .= "/";
	}
	else {
		print sprintf("mkdir Fld%02d failed.\n", $i);
	}

}


__END__
