Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90838C5B552
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 05:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mPyPqOohXXvTddm3xF8dctlb/vnPecy4zReWJway9E=; b=TlC9I4aWw7OIyZuc9YbIHESWEG
	BuUfrdLbNbrx6jUtFsUZ2Tf8fS5f+GevMdQY/QaN8ZnEOF7m0yBcwYFDWGeBc9elPBG3kmGxRRaql
	03YkAgn0xqzqCjPtc6syQeEEdIGXqRl+YzCFnepuRwHFBwEWFbQoayQutJXMBUmHL7voRNt4B+u3d
	IkH3rRnMcnomTnF2/4harWC/hOins8Lt0YByOLTjt1ZicrY7TEnFXqCah/5tokLLOiQgu9n66g+iX
	+x5mMg6yKvtzkfowiZMDCkMkQ1EjfAsVg7gCPT6YYHyfvQ9I6EKbT82JNAdi39n5nficu0H4W+qwL
	jA4rMxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMh3q-0000000Ce0y-1F41;
	Wed, 04 Jun 2025 05:53:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMh3n-0000000Ce0e-0JZP
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 05:53:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553KQGSu028363
	for <ath12k@lists.infradead.org>; Wed, 4 Jun 2025 05:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6mPyPqOohXXvTddm3xF8dctlb/vnPecy4zR
	eWJway9E=; b=QSU/0jchxWJZ9JtRr65e9TuGTWO35kEehGwyHVeGAeIF8dOfyxY
	9IqDvm+3UwxgooNA/Lsc9C8qZ653XtzwynxC8v1Q2b6dLpob7rV/4qm4EAK1wlKb
	DrEqbmgErzFTCFswOZVYYczr1JeW1mGk7oPgT9pxxWXVIGUMon8jUBZpwvjbUmAQ
	2BOPwyXT9Q+0xJM1rjP0TwjLpyq+EauBvQBtwOov80klwXcn/zvGQXrAJEQPBWMn
	LeYe4FOoB+6vde8Mbd8M76+K6QMIVZnyHaIE/W6uycWdxwjx41fweDA7QrvIfm5C
	pVAV5FyA3amtP7csrcfodvyRNweJ6Kvc/fg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8tvyu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 05:53:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7462aff55bfso5241108b3a.2
        for <ath12k@lists.infradead.org>; Tue, 03 Jun 2025 22:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749016387; x=1749621187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mPyPqOohXXvTddm3xF8dctlb/vnPecy4zReWJway9E=;
        b=U7TwEaAxKggT3EbSOqhgX6GIyuF8T7seNrRYf6XRybFJiyVHDyK173e7zMHWmZy+9s
         ApQRRo8shUQivIKyoEsKQ3uSQgp3r7kQios8cReF6EnnL9/LAlHVVxTUfmwhRHKtfzeG
         RJI/5VlVjYnTSxy6vV2brvmd65TyMkirmt4Gu3fnMdPzJ/2SPI0gzMkmoWmzROEVDTfr
         zhpZxwdtQig5haF28qravS60oJD+MxtYsWvagMpkEljpYg/dTEVLvlWPPcIltZuFgDM1
         S5wBIF0ueLFa6q4z9YDyfiquOAbJGMETlsh287qkz344OEX6fCf8m7/EjSzJRNPZYY4/
         lDRw==
X-Gm-Message-State: AOJu0YwsQTwrL/y9MnySFz6IdbmdS3Yg6t4lL23XB/rYgyOnxRruYRdR
	pELWvfQd8NEMkJZ44jnplkjf++QRiht0rK9dZM/3tLETdkCDg3sHSEZ6+Qqz4WsahqXguy2kM1S
	f9ZJ4tmIBtk9QF0v3RO/8OUjfSgJ4odIArGi1Na0y52v6VlHlTSJOFy98PNswtSFO
X-Gm-Gg: ASbGncs74/0BaPEsEB05Vissgn9Dc0etU7ZI47eMS6SD1dl3l/DmakxRz9EzXR3RbNe
	hWBuIgy7ntZ/fu1NAD8ba4acMIXR/OH0s023XiYeZ/Yym3MOryvkwiAPi/CFNsk71HANP0I5hGo
	+q+BLMcaVgiI19LbZ0kSMsBodYJuNBIVUiQlGDs6fZsbnjsjhaqLPaM2iWj2RyN0/rY+8VDlNq/
	fhoEsCMP7uWETx31SuhTgw7StDaTbhb0sEJlODfKI2yKDTx9mlOjmRmiFPdpjIW/+BcvEQXAs85
	yNRRyHFFYcixK5FYYmxyRnlqBvbse6UyHuhXFJsnvMYYHnXZ9yEL+SL5mAdAfw7NR5ahOso=
X-Received: by 2002:a05:6a00:b93:b0:73e:30af:f479 with SMTP id d2e1a72fcca58-7480b4b3643mr2310630b3a.19.1749016387484;
        Tue, 03 Jun 2025 22:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSnPzCsfA2iQIrtlqFTnD1joMbqRjSXjSD1ZpPYgu1ZIxTqFBm47Nxh1QE+SXu2zjtHXscYw==
X-Received: by 2002:a05:6a00:b93:b0:73e:30af:f479 with SMTP id d2e1a72fcca58-7480b4b3643mr2310609b3a.19.1749016387142;
        Tue, 03 Jun 2025 22:53:07 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff725asm10702500b3a.172.2025.06.03.22.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 22:53:06 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: fix uaf in ath12k_core_init()
Date: Wed,  4 Jun 2025 13:52:50 +0800
Message-Id: <20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C9NMTDUdrkAYWI-xz43m-UV0aF75woBf
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=683fdf44 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=TzEngFNX8HBHNH07LrEA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA0NyBTYWx0ZWRfX+mjykL4u8+H7
 1546vQI2axWzuFCpmGOZO38dKiPe7IAOcga7tRhH8VLAlJUDH3QUbkgwbfdoGm8DgcQi3NzP3Y3
 Qz01aO2kXaIqkPPpbrVHatZwr7c4LCuH1dyZKKVRkSda+dGKHojrFrnstcGZ0pbealuegwOuSiv
 LU661TsuWb7llCvV0J/+GyMCcY8SBVMPSPs73NyUBYfGwVeucdw8EL5SFPxGHg7RPxvMgQpvSmJ
 f+gCEq2F+NuKJK5WmtfqgH13PfAgnXV8dW0JPtpkoINy9WhpHVRISYdSjH+ZXbyo0F8/QO5jaZe
 PzXhK9ctCxnxOeKWj/xHGC9C5XjkN7CYp1XPBdtehLG1x7mmqNFJ2F5TBtb+k6lHSZJ6ZmPrOlH
 2+Kh6ZHwQ/KOTcMMwg6zA/4G6fwFTlQkVdvBZ1js97CtaP6TyA8+Z6V0TB7eEvLj1IEgEaaW
X-Proofpoint-ORIG-GUID: C9NMTDUdrkAYWI-xz43m-UV0aF75woBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_225311_229933_F34C2AAC 
X-CRM114-Status: GOOD (  13.52  )
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

When the execution of ath12k_core_hw_group_assign() or
ath12k_core_hw_group_create() fails, the registered notifier chain is not
unregistered properly. Its memory is freed after rmmod, which may trigger
to a use-after-free (UAF) issue if there is a subsequent access to this
notifier chain.

Fixes the issue by calling ath12k_core_panic_notifier_unregister() in
failure cases.

Call trace:
 notifier_chain_register+0x4c/0x1f0 (P)
 atomic_notifier_chain_register+0x38/0x68
 ath12k_core_init+0x50/0x4e8 [ath12k]
 ath12k_pci_probe+0x5f8/0xc28 [ath12k]
 pci_device_probe+0xbc/0x1a8
 really_probe+0xc8/0x3a0
 __driver_probe_device+0x84/0x1b0
 driver_probe_device+0x44/0x130
 __driver_attach+0xcc/0x208
 bus_for_each_dev+0x84/0x100
 driver_attach+0x2c/0x40
 bus_add_driver+0x130/0x260
 driver_register+0x70/0x138
 __pci_register_driver+0x68/0x80
 ath12k_pci_init+0x30/0x68 [ath12k]
 ath12k_init+0x28/0x78 [ath12k]

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 31d851d8e688..ebc0560d40e3 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2129,7 +2129,8 @@ int ath12k_core_init(struct ath12k_base *ab)
 	if (!ag) {
 		mutex_unlock(&ath12k_hw_group_mutex);
 		ath12k_warn(ab, "unable to get hw group\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_unregister_notifier;
 	}
 
 	mutex_unlock(&ath12k_hw_group_mutex);
@@ -2144,7 +2145,7 @@ int ath12k_core_init(struct ath12k_base *ab)
 		if (ret) {
 			mutex_unlock(&ag->mutex);
 			ath12k_warn(ab, "unable to create hw group\n");
-			goto err;
+			goto err_destroy_hw_group;
 		}
 	}
 
@@ -2152,9 +2153,12 @@ int ath12k_core_init(struct ath12k_base *ab)
 
 	return 0;
 
-err:
+err_destroy_hw_group:
 	ath12k_core_hw_group_destroy(ab->ag);
 	ath12k_core_hw_group_unassign(ab);
+err_unregister_notifier:
+	ath12k_core_panic_notifier_unregister(ab);
+
 	return ret;
 }
 

base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
-- 
2.34.1


