#!/bin/bash

TODAY=$(date +%m%d)
OFF=$(gawk "/^${TODAY} / {print \$2}" <$BASH_SOURCE)
ON=$(gawk "/^${TODAY} / {print \$4}" <$BASH_SOURCE)

# swallows at's stderr, but no other way to silence it for cron
echo "~/bin/fs20_send.sh 1 off" | at $OFF 2>/dev/null
echo "~/bin/fs20_send.sh 1 on" | at $ON 2>/dev/null
echo "~/bin/rfm_send.sh relay 2 0" | at $OFF 2>/dev/null
echo "~/bin/rfm_send.sh relay 2 1" | at $ON 2>/dev/null

exit 0

## DATA
0101 08:47 - 16:39
0102 08:47 - 16:41
0103 08:47 - 16:42
0104 08:47 - 16:43
0105 08:46 - 16:44
0106 08:46 - 16:45
0107 08:45 - 16:47
0108 08:45 - 16:48
0109 08:44 - 16:49
0110 08:44 - 16:51
0111 08:43 - 16:52
0112 08:42 - 16:54
0113 08:41 - 16:55
0114 08:41 - 16:57
0115 08:40 - 16:59
0116 08:39 - 17:00
0117 08:38 - 17:02
0118 08:37 - 17:03
0119 08:36 - 17:05
0120 08:35 - 17:07
0121 08:33 - 17:08
0122 08:32 - 17:10
0123 08:31 - 17:12
0124 08:30 - 17:14
0125 08:28 - 17:16
0126 08:27 - 17:17
0127 08:26 - 17:19
0128 08:24 - 17:21
0129 08:23 - 17:23
0130 08:21 - 17:25
0131 08:20 - 17:26
0201 08:18 - 17:28
0202 08:16 - 17:30
0203 08:15 - 17:32
0204 08:13 - 17:34
0205 08:11 - 17:36
0206 08:10 - 17:38
0207 08:08 - 17:39
0208 08:06 - 17:41
0209 08:04 - 17:43
0210 08:02 - 17:45
0211 08:01 - 17:47
0212 07:59 - 17:49
0213 07:57 - 17:51
0214 07:55 - 17:52
0215 07:53 - 17:54
0216 07:51 - 17:56
0217 07:49 - 17:58
0218 07:47 - 18:00
0219 07:45 - 18:02
0220 07:43 - 18:04
0221 07:41 - 18:05
0222 07:39 - 18:07
0223 07:36 - 18:09
0224 07:34 - 18:11
0225 07:32 - 18:13
0226 07:30 - 18:14
0227 07:28 - 18:16
0228 07:26 - 18:18
0301 07:24 - 18:20
0302 07:21 - 18:22
0303 07:19 - 18:23
0304 07:17 - 18:25
0305 07:15 - 18:27
0306 07:12 - 18:29
0307 07:10 - 18:31
0308 07:08 - 18:32
0309 07:06 - 18:34
0310 07:03 - 18:36
0311 07:01 - 18:38
0312 06:59 - 18:39
0313 06:56 - 18:41
0314 06:54 - 18:43
0315 06:52 - 18:45
0316 06:50 - 18:46
0317 06:47 - 18:48
0318 06:45 - 18:50
0319 06:43 - 18:52
0320 06:40 - 18:53
0321 06:38 - 18:55
0322 06:36 - 18:57
0323 06:33 - 18:58
0324 06:31 - 19:00
0325 06:29 - 19:02
0326 06:26 - 19:04
0327 06:24 - 19:05
0328 06:22 - 19:07
0329 06:19 - 19:09
0330 06:17 - 19:10
0331 07:15 - 20:12
0401 07:13 - 20:14
0402 07:10 - 20:16
0403 07:08 - 20:17
0404 07:06 - 20:19
0405 07:03 - 20:21
0406 07:01 - 20:22
0407 06:59 - 20:24
0408 06:57 - 20:26
0409 06:54 - 20:27
0410 06:52 - 20:29
0411 06:50 - 20:31
0412 06:48 - 20:33
0413 06:45 - 20:34
0414 06:43 - 20:36
0415 06:41 - 20:38
0416 06:39 - 20:39
0417 06:37 - 20:41
0418 06:35 - 20:43
0419 06:32 - 20:45
0420 06:30 - 20:46
0421 06:28 - 20:48
0422 06:26 - 20:50
0423 06:24 - 20:51
0424 06:22 - 20:53
0425 06:20 - 20:55
0426 06:18 - 20:56
0427 06:16 - 20:58
0428 06:14 - 21:00
0429 06:12 - 21:01
0430 06:10 - 21:03
0501 06:08 - 21:05
0502 06:06 - 21:07
0503 06:04 - 21:08
0504 06:03 - 21:10
0505 06:01 - 21:11
0506 05:59 - 21:13
0507 05:57 - 21:15
0508 05:56 - 21:16
0509 05:54 - 21:18
0510 05:52 - 21:20
0511 05:51 - 21:21
0512 05:49 - 21:23
0513 05:47 - 21:24
0514 05:46 - 21:26
0515 05:44 - 21:27
0516 05:43 - 21:29
0517 05:41 - 21:30
0518 05:40 - 21:32
0519 05:39 - 21:33
0520 05:37 - 21:35
0521 05:36 - 21:36
0522 05:35 - 21:38
0523 05:34 - 21:39
0524 05:32 - 21:40
0525 05:31 - 21:42
0526 05:30 - 21:43
0527 05:29 - 21:44
0528 05:28 - 21:46
0529 05:27 - 21:47
0530 05:26 - 21:48
0531 05:25 - 21:49
0601 05:25 - 21:50
0602 05:24 - 21:51
0603 05:23 - 21:52
0604 05:23 - 21:53
0605 05:22 - 21:54
0606 05:21 - 21:55
0607 05:21 - 21:56
0608 05:20 - 21:57
0609 05:20 - 21:58
0610 05:20 - 21:58
0611 05:19 - 21:59
0612 05:19 - 22:00
0613 05:19 - 22:00
0614 05:19 - 22:01
0615 05:19 - 22:01
0616 05:19 - 22:02
0617 05:19 - 22:02
0618 05:19 - 22:03
0619 05:19 - 22:03
0620 05:19 - 22:03
0621 05:19 - 22:03
0622 05:20 - 22:04
0623 05:20 - 22:04
0624 05:20 - 22:04
0625 05:21 - 22:04
0626 05:21 - 22:04
0627 05:22 - 22:04
0628 05:22 - 22:03
0629 05:23 - 22:03
0630 05:24 - 22:03
0701 05:24 - 22:03
0702 05:25 - 22:02
0703 05:26 - 22:02
0704 05:27 - 22:01
0705 05:28 - 22:01
0706 05:29 - 22:00
0707 05:29 - 22:00
0708 05:30 - 21:59
0709 05:31 - 21:58
0710 05:33 - 21:57
0711 05:34 - 21:57
0712 05:35 - 21:56
0713 05:36 - 21:55
0714 05:37 - 21:54
0715 05:38 - 21:53
0716 05:40 - 21:52
0717 05:41 - 21:51
0718 05:42 - 21:49
0719 05:43 - 21:48
0720 05:45 - 21:47
0721 05:46 - 21:46
0722 05:48 - 21:44
0723 05:49 - 21:43
0724 05:50 - 21:42
0725 05:52 - 21:40
0726 05:53 - 21:39
0727 05:55 - 21:37
0728 05:56 - 21:36
0729 05:58 - 21:34
0730 05:59 - 21:33
0731 06:01 - 21:31
0801 06:02 - 21:29
0802 06:04 - 21:28
0803 06:06 - 21:26
0804 06:07 - 21:24
0805 06:09 - 21:22
0806 06:10 - 21:20
0807 06:12 - 21:19
0808 06:13 - 21:17
0809 06:15 - 21:15
0810 06:17 - 21:13
0811 06:18 - 21:11
0812 06:20 - 21:09
0813 06:21 - 21:07
0814 06:23 - 21:05
0815 06:25 - 21:03
0816 06:26 - 21:01
0817 06:28 - 20:59
0818 06:30 - 20:57
0819 06:31 - 20:55
0820 06:33 - 20:53
0821 06:34 - 20:51
0822 06:36 - 20:48
0823 06:38 - 20:46
0824 06:39 - 20:44
0825 06:41 - 20:42
0826 06:43 - 20:40
0827 06:44 - 20:37
0828 06:46 - 20:35
0829 06:47 - 20:33
0830 06:49 - 20:31
0831 06:51 - 20:29
0901 06:52 - 20:26
0902 06:54 - 20:24
0903 06:56 - 20:22
0904 06:57 - 20:19
0905 06:59 - 20:17
0906 07:01 - 20:15
0907 07:02 - 20:12
0908 07:04 - 20:10
0909 07:05 - 20:08
0910 07:07 - 20:06
0911 07:09 - 20:03
0912 07:10 - 20:01
0913 07:12 - 19:59
0914 07:14 - 19:56
0915 07:15 - 19:54
0916 07:17 - 19:52
0917 07:18 - 19:49
0918 07:20 - 19:47
0919 07:22 - 19:44
0920 07:23 - 19:42
0921 07:25 - 19:40
0922 07:27 - 19:37
0923 07:28 - 19:35
0924 07:30 - 19:33
0925 07:32 - 19:30
0926 07:33 - 19:28
0927 07:35 - 19:26
0928 07:36 - 19:23
0929 07:38 - 19:21
0930 07:40 - 19:19
1001 07:41 - 19:16
1002 07:43 - 19:14
1003 07:45 - 19:12
1004 07:47 - 19:10
1005 07:48 - 19:07
1006 07:50 - 19:05
1007 07:52 - 19:03
1008 07:53 - 19:00
1009 07:55 - 18:58
1010 07:57 - 18:56
1011 07:58 - 18:54
1012 08:00 - 18:52
1013 08:02 - 18:49
1014 08:04 - 18:47
1015 08:05 - 18:45
1016 08:07 - 18:43
1017 08:09 - 18:41
1018 08:11 - 18:39
1019 08:12 - 18:36
1020 08:14 - 18:34
1021 08:16 - 18:32
1022 08:18 - 18:30
1023 08:19 - 18:28
1024 08:21 - 18:26
1025 08:23 - 18:24
1026 08:25 - 18:22
1027 07:27 - 17:20
1028 07:28 - 17:18
1029 07:30 - 17:16
1030 07:32 - 17:14
1031 07:34 - 17:12
1101 07:36 - 17:11
1102 07:37 - 17:09
1103 07:39 - 17:07
1104 07:41 - 17:05
1105 07:43 - 17:03
1106 07:45 - 17:02
1107 07:46 - 17:00
1108 07:48 - 16:58
1109 07:50 - 16:57
1110 07:52 - 16:55
1111 07:53 - 16:54
1112 07:55 - 16:52
1113 07:57 - 16:51
1114 07:59 - 16:49
1115 08:00 - 16:48
1116 08:02 - 16:47
1117 08:04 - 16:45
1118 08:06 - 16:44
1119 08:07 - 16:43
1120 08:09 - 16:42
1121 08:11 - 16:40
1122 08:12 - 16:39
1123 08:14 - 16:38
1124 08:15 - 16:37
1125 08:17 - 16:36
1126 08:19 - 16:35
1127 08:20 - 16:35
1128 08:22 - 16:34
1129 08:23 - 16:33
1130 08:25 - 16:32
1201 08:26 - 16:32
1202 08:27 - 16:31
1203 08:29 - 16:30
1204 08:30 - 16:30
1205 08:31 - 16:29
1206 08:32 - 16:29
1207 08:34 - 16:29
1208 08:35 - 16:29
1209 08:36 - 16:28
1210 08:37 - 16:28
1211 08:38 - 16:28
1212 08:39 - 16:28
1213 08:40 - 16:28
1214 08:41 - 16:28
1215 08:42 - 16:28
1216 08:42 - 16:28
1217 08:43 - 16:29
1218 08:44 - 16:29
1219 08:44 - 16:29
1220 08:45 - 16:30
1221 08:46 - 16:30
1222 08:46 - 16:31
1223 08:46 - 16:31
1224 08:47 - 16:32
1225 08:47 - 16:33
1226 08:47 - 16:34
1227 08:47 - 16:34
1228 08:48 - 16:35
1229 08:48 - 16:36
1230 08:48 - 16:37
1231 08:48 - 16:38
