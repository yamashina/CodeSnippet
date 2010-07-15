# -------------------------------------------------
# �K�w���f�B���N�g���쐬���t�@�C���R�s�[
# �����f�[�^(music.mp3)���R�s�[���ĉ��L�c���[��̃f�[�^�����
# CurrentDir
# ��Fld01
#   ��Fld01_Track10.mp3
#   ���E�E�E
#   ��Fld01_Track10.mp3
#   ��Fld02
#     ��Fld02_Track10.mp3
#     ���E�E�E
#     ��Fld02_Track10.mp3
#     ��Fld03
#       ��
#       �E�E�E�E�E
#               ��Fld10
#                 ��Fld10_Track01.mp3
#                 ���E�E�E
#                 ��Fld10_Track10.mp3
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
