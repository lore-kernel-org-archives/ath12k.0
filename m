Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F270EC369AB
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3SyUdMW04qFzJTxNWJA3RWA/E6h9+fNCuPWqTh3yVPA=; b=3Qliv7jpOhu+Z1VUHG8iyW152t
	ybxkf5GSmuU/xfnBUPhHqpK8NouIIwfncWU3kd4Hv4l/rOI/8B1cRDOwV5gCTj4ii3Zv2bt2p5mdj
	7anIGJWdaxbH3HkGQUAoGGMCZFzMA9FppsBn1IO2CxMjzkfecpTPDcsgVBxMOAIwdH7JjFLv7Kz//
	pTIzsiLNP0bFkU7P39J8js1lu9X64X6gRde9uxl1WxkguLVblyD5yT7ZpzMJFHgZfCot78MvuIjh7
	OZmYHNPMDz+70kF59x5TA4hfdBNaVai05wgrqFaq4pJLZq4f2Uc80vPZJEvOVN61koRKCcTrlYNU3
	IrzSLpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83NL-0000000FMJN-31RP;
	Thu, 24 Apr 2025 20:40:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83LA-0000000FM38-0ac7
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 20:38:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJnI4N028551
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 20:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3SyUdMW04qFzJTxNWJA3RW
	A/E6h9+fNCuPWqTh3yVPA=; b=P3g5oAkBsV1IAXrv8HnNnqAx+ErFnKAahxINog
	tGIaFdmAdSuSDV3FZ5quSVhVN2OX383ZTCVUlw507TfRBtah0KLnR+AyMnWop3Dh
	eFA92Ue/LFV/qfwyR1TUxsMG4vp8aopV8fBkLyRkyY8kNytNyRSv1fLOSeroDHFm
	yyXrahfbO9OScZDyndn5g6sVN4v5Dz+fpe2CkNlBC1nDZnTx83n9BtBi17S3D/TZ
	I4sHxi9D/7IoRLgoNAOKlkIh4I90olsIClgSkodnBoxXDqltbrvV8KVX3PZVIv0A
	AF6GAIVgA11PNLZiqSlyX2QEqBQh2vHK5H0+HdN69BU8XLsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0psss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 20:38:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2265a09dbfcso21828795ad.0
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 13:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745527113; x=1746131913;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3SyUdMW04qFzJTxNWJA3RWA/E6h9+fNCuPWqTh3yVPA=;
        b=SjJ9Nc2RLso62kc6h5OjDqf7m8kSTbVw1p2tCuxEVgu5gFcf7jp+YgAL0Z5jlr2ASz
         ++9Ik/nKLivR/4waUk7vZqke43XYsmpCeUpQAX5KZxAsF9t37aX5380nEnjAVzNqWUyU
         61VjX8fiwQtaoYl3l9SfRnT81CluAzoLppcSOU50b3tvMYw+baBvq63clyMw58JTvMOi
         o26AlNmS/nQv9yCJ6pEmRvnfW26MoHHTnhiWFCA6aUaKS6ueFAl/nzVUnBGRFuWL74je
         Q1CvKcPHW5plZqSnNmUTdVsUXd0E9O9T11j3I2q7h7/kJDV5ltvKHV+yd/adHK0nPGLg
         KVTg==
X-Forwarded-Encrypted: i=1; AJvYcCUJg1QagRCAJzlvqIwN+GWYpOo9r8YP9A3kdPR93Dy2I92jc0820MhKMtmoVF/LQHjU7HumLD0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjgFtxEBotYy7CLPOORnzOlhql6nH614nnZU1EUoTgkTcj0uTL
	e1y05I0Lrt2ftyzFHYpit5IxX/zZe+GLl/b+cI99RzQWpjPaX7J+ezZSeL1PuW5oUDOFqq09VGL
	v2z9WRFdRiyCutUarEEL15qtpedEmbuMO/HPxvakmUyYYcoN+AkxbLqaX8ekf
X-Gm-Gg: ASbGnct5NlJLcYMS3QIUhGslTt1UzcgUL5cnliFk0Gkaw76qMHYzGQtobOdPRRaVgfE
	p2f6VezO7xp/o7tfUQSZvynhpgpBpphaRdud+OYgwpNhgylpKHyw8qA73m77ZAJyPIlIsQjLGcL
	q/0x2fGvq8MRZQY4Owkcfv6E3up5OVkjIFQwkABAZ8AaVDzUfW3eZhGIQ3QKY4Rgb4KJFU+0E9w
	4eoU5HqnTh6yaeh1SdZe9So3Vg541gXgUFye9Lgjdp32bNAcNVr4zJp4Y1sP/tRJA6Aox+6krCl
	bnbqIfQlvxZdfX0Gh8f7U3Okh0Jddb9YQ03ZndtHD9xzEVmkBZ8EJoQmwnz4t5vObPcAi+Wpmwq
	Ig3Bh
X-Received: by 2002:a17:903:1aa8:b0:224:23be:c569 with SMTP id d9443c01a7336-22dbd423f55mr14612035ad.22.1745527113286;
        Thu, 24 Apr 2025 13:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOssOO9EMlEhSWXpnlt0d7EeCfY5WHRuv9lpuIv/YQVdg/51RxVXr3vI3U4gwYL/f1Cu9COw==
X-Received: by 2002:a17:903:1aa8:b0:224:23be:c569 with SMTP id d9443c01a7336-22dbd423f55mr14611775ad.22.1745527112895;
        Thu, 24 Apr 2025 13:38:32 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a8dsm18088275ad.136.2025.04.24.13.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:38:32 -0700 (PDT)
Message-ID: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 13:38:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
Subject: [PULL linux-firmware] ath11k and ath12k firmware 20250424
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 01YqkddGmlNJHpPo9uRun3HjGkYkzBSx
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680aa14a cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=c5pCFXJUQfKAI649l18A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 01YqkddGmlNJHpPo9uRun3HjGkYkzBSx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0NSBTYWx0ZWRfXz1ryYGbIZk0c L85Nw2VVBJsGyp1G0MVV+XleHXbyMt2MYSYZY+k7+8pNWHCpwAVkMx3e9NSs+TFT+8ROoy/eY6x nY2f6jVNFu5cA/KhoaAsnkbScmWuNoiWWLmv14Ha/1IJEmCnc9XPXThOe8lUD28whJ269wI5Jfh
 RnOBMtQ/zdtSAw7SHiYgSZkq/IxA0so5oP1owQUMWa/d45a4dhejpsvdFUQM98RY0EdiLenjwLT kpGkv/DdpnyZodtWnokpFEoncAFbBHE0fHNUafyb1OUxgdasWYh8NjZ+esGXafYGRSlhv4FcRyZ eiamoODsBhZZnIgKwxbHIVeZQHJlbc8BbGBxLba7xAilxPpyytpqutnQ/85jWf1bVz9Ty6seCZ5
 9aCIn/Zw2SYNRlivO8pQIcEO+Ymq20EFWqVvE/WcrW35GdLmNnE8LnPHDl7x6o2y7kTJi4yw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=872 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_133836_308850_5138911B 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,
Here's a new pull request for ath11k and ath12k.

For ath11k, update the firmware for IPQ5018 and update the board file
for WCN6855. For ath12k, update the firmware for WCN7850 and update
the board file for QCN9274.

Please let me know if there are any problems.

/jeff

The following changes since commit 490c0af1d6b9ffca0523edcfad27ba483b9d6da3:

  Merge branch 'robot/pr-0-1745490027' into 'main' (2025-04-24 13:46:05 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250424

for you to fetch changes up to ce13d29c3933f77674cf45855668485c48d3eba0:

  ath11k: WCN6855 hw2.0: update board-2.bin (2025-04-24 13:04:20 -0700)

----------------------------------------------------------------
Jeff Johnson (4):
      ath12k: QCN9274 hw2.0: update board-2.bin
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
      ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01300-QCAHKSWPL_SILICONZ-1
      ath11k: WCN6855 hw2.0: update board-2.bin

 WHENCE                           |    4 +-
 ath11k/IPQ5018/hw1.0/Notice.txt  | 3918 +++-----------------------------------
 ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2334720 -> 2334720 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269220 -> 269252 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99456 -> 99456 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7072 -> 7080 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
 ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6429240 -> 6429240 bytes
 ath12k/QCN9274/hw2.0/board-2.bin |  Bin 1308544 -> 2626240 bytes
 ath12k/WCN7850/hw2.0/amss.bin    |  Bin 6000704 -> 6082624 bytes
 ath12k/WCN7850/hw2.0/m3.bin      |  Bin 299660 -> 299660 bytes
 15 files changed, 315 insertions(+), 3607 deletions(-)

