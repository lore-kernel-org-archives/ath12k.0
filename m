Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E272ACD343F
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 01:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VdxRsPjdTBsC7e7Sg3Bl18uS5fzDNNIQr8vSLmb2Vpw=; b=srGZZPRHTKYQap0y02Gr2L4EFG
	LGhyU/bOpa3nzZH8Wby3ENUZWBmMp+B6Zpy+TNfT45ibog7kQQoa6UFzgbXUIaEN2Lt8BUfZJwz5Q
	7icQ2QSHe4de02+xv7escqF2Zf4O0F0LBlzF5oCpUM2xMaNu+0/W3fpFjEwqQ1VyjXrcwIC68Huoj
	8PpypHJiyKBiClzv0XN02oG1H2JyhCNPM9JOFOYKA0yq8dqMLvhxE9A01wkDodY8Yma7zNkxMqrMQ
	sdnidcPlw7cKxomnr8ZQ2bKwhWpFgz87vPfF8peqngsGAI+eO3z/yUMRPJiMGCejq10aqhv4sW3Wk
	r2KEXiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP94X-0000000HLAq-2UGg;
	Tue, 19 May 2026 01:16:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP94T-0000000HL9s-3xu8
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 01:16:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IKTZTA2438007
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VdxRsPjdTBsC7e7Sg3Bl18uS5fzDNNIQr8v
	SLmb2Vpw=; b=FFmWWLYU57FPP/sWa7tHOnKhGaWzkob4MiRRZvRppNylAMqDAK5
	OSsuYA8OJmOrTg6xRLNfStWu+48VEJ1IwKBGhK7N13IYiEQxF+5dHfKDsrim1eDP
	j92ohorklVBC+115bQnPj2oXODtVr22CscfjQlT+VxLHKxlcb7rpg6cN6xdpw94T
	5G38CD3JVjXDinxfnyvKQuD5PGJgHsBBF0QOIDSueN9Wy5E2d6Y4W8G+qulniJEm
	cgIzCb7TBzKn+OBYoD+OKZKT2mniq6nF9grViJb6+qYVZ+LOg+kLZAzr906engBQ
	mArYqQYDB15JfwS31dLvfTxvLk/kAUlCOFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v2f5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:16:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba115ab6bbso32002865ad.3
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779153392; x=1779758192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VdxRsPjdTBsC7e7Sg3Bl18uS5fzDNNIQr8vSLmb2Vpw=;
        b=XhvhMXZQv2dSUOL14Q8GjNa9m7Hg196tqYvWN9MpfrMi1BNJaJw3E5U77KfL8LdqNv
         08mBMDK9TTFHMle58lUZQcEfixHdXQOJtDrwyDTqvSWQ6UREWT5I56KRQxmj6NonKCAX
         qe/etS/oGTXWriQXSsTFYxj5KL/WoB8XcFOkPB3gITqGQy347LnpItMlygOI3lSH+iYd
         fmYnJ/oOiQfcxgePVNZQLcAyZSNO4Fv3jG/KXmUkf4VZCel4zUIGLlIJuDsxqLISItrT
         6ePExRrQWBzMc23xGoTWtR0UOurqeWK3wP53N6JGqoDqw704RBxb/IIWkWT7oXjH93Cr
         MITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779153392; x=1779758192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdxRsPjdTBsC7e7Sg3Bl18uS5fzDNNIQr8vSLmb2Vpw=;
        b=U4A4PpfdeMZXV3oLhwDpuXT2N9+AOjLnk1ErRuvzCYvt9MGiaj49dwspYhjIdFHr4v
         8b9MPVXYgucmJjh3j38KV+elDd5vfIfhhDbXXQjpS9N5mQopCfgHxTeUpO5M4eGI7kpe
         hLN5SSFUqLr59B0RgiUYsXfskNu1KEBQMTZRPgvE9zaShHk1sVc0M7Zqw86MXlTJvIvf
         AcoefqIBbbjUESpaE78+kDmORgjkURg2h/R0ShAyraNqYCrsoXep/NLY+WcfTnDqE0BL
         wFuPlp92E2QMUlPFvAvlWJxRSDQOx9f7BiOxKWmn0MMNxweaIpo3Rz0k3NgiFiJ9oPg4
         rUkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8V2/+kA49BDZvCXUlXkcV3wvW+BFLb7Kt7g/tVqGlIjq2pnB0DPdZ/3kVgeDK5d6WbmbgeoV0=@lists.infradead.org
X-Gm-Message-State: AOJu0YysuajZyC2Xihclm6/4B3wTWzLP1GiCRDVMPEFRjBQWYWVfhX8e
	6E30wUkWvXvLdjTJvtjFQbV/Qx3J06fLwCR5NgsXcJ0aXxbuGQ9ZpiiHSsffsGGiqr9wt7YK+V5
	t04mFBubvJO3Zz6VdhZ9/dbGa7Mwrb8dOYrbjg9E+L4v0Q3wiM0Yo2yCdnfiDfKr1uKgDJl9i
X-Gm-Gg: Acq92OEoG6RdhjkgI5tU2nvXnmSvyWNpSOlygaytDoA5fBo/I7ay8tpyqWevkvWWsSP
	5W5bOS4U9KZYRZNmo3XZqcvf5eXT6G3RJfZjtMQ2PX8215LCM1g9p4k+X3enztPzjSyJW1inAxK
	AWQ1Ic9uSu2kednecmdPuqPfhXhL8E8gLmF4r5jXyGe5rSwzjDE0PZgVimCMtWTAbddqDSQlRFA
	N9HmbHQRNOemIkZ08B8GyTtTtncUCL8Brbzxgz4Eev4sm5SCvtlXcPSJ9N8AGOid7/sKfttQF3O
	JCa4HQ+4+0tPiPuxnh6SN2Jh7kmY2apSOO8/6f3B5Z8EoA+rVo1BsCQe9j6+xVAMpNr9Ok0Zwzz
	mlQETI4nZQyX1tWX9EmO6x1aaGiGcoTjGkhp1fF8mUoD16CWal39EojIsBrun5UXPuvti7FvS2P
	+KcxQfVDXWHQ==
X-Received: by 2002:a17:902:da90:b0:2ba:6ebe:4897 with SMTP id d9443c01a7336-2bd7e8ae0afmr202208395ad.3.1779153392465;
        Mon, 18 May 2026 18:16:32 -0700 (PDT)
X-Received: by 2002:a17:902:da90:b0:2ba:6ebe:4897 with SMTP id d9443c01a7336-2bd7e8ae0afmr202208075ad.3.1779153391987;
        Mon, 18 May 2026 18:16:31 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49a4sm151727265ad.38.2026.05.18.18.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:16:31 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: tglx@kernel.org, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/2] genirq/ath12k: fallback to threaded NAPI when IRQ affinity is unavailable
Date: Tue, 19 May 2026 09:16:25 +0800
Message-Id: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0bb9f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=wq-1lD5fFhYcRPXe29MA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: tcw5Jmrk3PUyxSNIgbaeZckF_NHlElk2
X-Proofpoint-GUID: tcw5Jmrk3PUyxSNIgbaeZckF_NHlElk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwOSBTYWx0ZWRfX3cgmmROeGWBW
 ehELljmgr940Gy2aZ76lMgcH4nIhp7t6uXJKvXJt8P/1DlHe7C50x6B+hZ7+EpgZeqdPGRuvSqZ
 qahNbDt4jUVbuYqY4fZTgNRryn9zm2AswU0fkPOPkvifr89KWYI9L5qYX0Lbs6LBZEi03K2Uygz
 2nAXVhYZgY8im1NGoes2N2m08h70wMRm/70M/YKsxJ73AAVEE7dAVUtBE7I0MX/2jsNMlwuR6pW
 agjtwQjXkDxk0lvZQ4XmTIMLBGMfRkEdjKqntGvJG6nmoVQdW0oboTUJeZLxDlOHNKSOLDSAVuU
 gbMIKyPA8bVK5VDUWi0Znh4H2tNY2CFmNP1eA6HqWMVQQtSHm5SZRj9vG6sxT+wERUAtv1bx3oK
 SvShzu4SB/ktNNjto3puG6t+hu1erZ8O8+rlmtMpIkR9JFFvVuzfIdPxE3B7IzsG4E7psgeQhT7
 +r2s9W9ltPWHU+HTqEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_181633_990203_B73202C6 
X-CRM114-Status: GOOD (  10.66  )
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

This series improves ath12k datapath behavior on platforms where the
effective IRQ path for WLAN MSI interrupts does not support affinity
setting.

In such setups, DP processing cannot be distributed as intended and can
become CPU-constrained. The ath12k change switches to threaded NAPI when
runtime IRQ capability indicates affinity is unavailable.

Patch 1 exports irq_can_set_affinity() for module drivers so they can
reuse the IRQ core helper instead of open-coding equivalent checks.

Patch 2 uses irq_can_set_affinity() in ath12k PCI to enable threaded NAPI
for DP interrupt groups only when affinity cannot be set.

On RB3Gen2 with QCC2072, EHT160 UDP downlink throughput improved from
802 Mbps to 2.58 Gbps after enabling threaded NAPI.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Thanks,
Hangtian Zhu

Hangtian Zhu (2):
  genirq: export irq_can_set_affinity() for module drivers
  wifi: ath12k: enable threaded NAPI when DP IRQ affinity is unavailable

 drivers/net/wireless/ath/ath12k/pci.c | 11 ++++++++++-
 kernel/irq/manage.c                   |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: db17e958184be9fe2b6242b7c5b7b261c0ce7110
-- 
2.25.1


