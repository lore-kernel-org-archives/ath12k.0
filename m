Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCB2C531CB
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 12:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uosMbuo5mUL+wpsJKBaRkdlSOd/ZPwbep/HNPlBi0YI=; b=w1P/pzVg8bluzvbNoCkszy8WyO
	jxRUIdmx284lUuAq0gpEcYEpcs+K0wWkeGtoApmpiCT7gM3ZHwfmYyGtz5nodhdggqwQAr+B7ypJr
	m9LQ2aEEbtTL5kUerweh1sqN10B/wAiTMHB8y31FzaEwModCxTsyxz+UdB4fHfudJ0DNZShiBNSpa
	md9g7OTMHKln0Q/f2bSrHsYPfM6motiEcEuUd4X7dqDuF0H3r8RulFIz5O1cQ1ZmQxXUjYwfkwp7m
	cia0rcIecAuM4kD/TidBwTvFt+VrWT6SXBcD5eb/mt3vLXXjbDwBdiRwJiR8tvZFPD2guKPuz9wjb
	6mWzmVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxG-0000000EHdo-3JXM;
	Thu, 23 Jul 2026 12:55:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxE-0000000EHcU-3IEX
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 12:55:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qcgV3606151
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uosMbuo5mUL
	+wpsJKBaRkdlSOd/ZPwbep/HNPlBi0YI=; b=NkXh3iwgJDmnXgqlJNIsFwSNFk0
	QjeJBGODDGScSZhlp64Xz2wq94IkeMcme4HA33cBlnkAhxGjaNcOfER7rix1SLvs
	CoC63VRYwf/9UizXOEEsfg0EzSSZgXZ0yBlsnvyKrR5uUelU1IyTJ64lN3PU+ytU
	MLgGIWVyWalVPAoPcYDRDy7NWKkqyF0VQFsgg4FRMHfBKxMCILS+OWf/0JpBTf51
	8Ks0oS+QGDAXod3h5l2SA/MPJaxKBFzadiedtiaHRCgf4gw+8qpkP5ENN+rVHatG
	hmgPu4cR1E3M94OXZNN7edRngzuYtPg+F0H7CYQXqwaBvNEeLdxlCCRGD4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qhcbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso13029575ad.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811311; x=1785416111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uosMbuo5mUL+wpsJKBaRkdlSOd/ZPwbep/HNPlBi0YI=;
        b=FW+i1dyAWG/XxJtvzS7QHm+2pI7Ewg1GMJV0XhAw5zyYu4kwsdqNPtudifuuwlxOkB
         BU91uYcgjBn/qiS0UUczrhgGSmxgHk1jWujA2sqRbPw1/Jbjfy6tLHRH4x0g3dr+r17z
         Ve6+iFB7jXOhYC4QNcXYeWfPk64IWSnNfhf6xd6TIPH8BhZDIMiWpKyfWJWvyEvtt4lT
         rvHAlJkCWS1Z7SMVrILMBNBCVRiWwuw+kjP65WCop4X5qCOjjXAGmudcdSGPw81tZKzy
         FIUug/z7GWz+V5fSDC1LGYp/973+EMuorTiGTCunJJn8ww9CSTBXtk56GGcvPT6x4Omy
         kxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811311; x=1785416111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uosMbuo5mUL+wpsJKBaRkdlSOd/ZPwbep/HNPlBi0YI=;
        b=fXf3FW7sbVO/DrxztIJcXW2IK9HawPInTRpOjtlZT5tjjHol0NvGqk9FRRktDU1nwH
         ih+7OSh16JoeAtNRoXVGNIKnVk8zt8U7rT+KJGMIDQE6XPNABW7hG9g2fnSKOH0ciqtj
         xpZkUwxOo4f/aMVaYFZQK56WBn5X8qIZgvaCWrrkRL6NFTBrHvcKctRPcubsK+3ObHS5
         orH1d/GzFHT/cGWjqC+0g9oula/9eUd4cNfoFRmHRWNZJNvmOvxGKWeZUl8fr7uAwJm1
         vQIFWdVfUpUa+ZopLycA03sCcCEJwLM7DMtWa5r15/5FHa0qZQx5Uncm4a4wHl34ceZV
         wd2g==
X-Gm-Message-State: AOJu0Ywodbri7NAOr31OlpYSeLzCFQHZCqQ0L2gBnZLAva0yblLWqhLa
	esSqgyNfcl5R7AT+7ctqFxqFJO5mtTACyKRfTU3BAyzDSEPHHL2knO3S2JZnftQn83oCm44Aeme
	/+MiNZeO6nE2Hko4rWLK2ugpCNsLTJRP1iLRynGwnfmNSNb5lvIZ2Jw5nQqW0hOEOhSQINQmv
X-Gm-Gg: AR+sD12mrlvS3a30HXPZrBM6t7xmm/ZRrppgehzagW5r/5XuktiH0oJG7zNHU+iUfb3
	NtaFb4WColH/hFby3KKKG1X9AY0CzWQJrkjnWnqVLiOGUltADAUW99DrI85fBudAE6eqsAQZuUA
	vshAgxxhKK1b1CSVkrxgeW0VUOFROLI/zbFfEQfaXHDxN3aPjLZnQGHwC3v//8e0JAjZSPTadxg
	L204XvAyNFRaUkKpXSTQYCRFh/ySZTn27zv4ABK8v5tqGydBUaiKGCBD03WHscG4kFGP6/5K7d+
	0ySHj+PvFPG4N++77V2W9JP81XZp6llM5UhI9qmP+Q/iHQbrY1NB3sEOzIgN7YTndGRG8xdv0da
	5rsUfhtCRdcGvudfP7Uceo1GmstX4gxC/pBjgDqDlawJX/9SEWQvx
X-Received: by 2002:a17:903:124c:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2cfa6b7dbcamr34960275ad.14.1784811310824;
        Thu, 23 Jul 2026 05:55:10 -0700 (PDT)
X-Received: by 2002:a17:903:124c:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2cfa6b7dbcamr34959925ad.14.1784811310363;
        Thu, 23 Jul 2026 05:55:10 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350475sm32998385ad.70.2026.07.23.05.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:55:09 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 3/8] wifi: ath12k: add TCL ring TX buffer allocation failure counter
Date: Thu, 23 Jul 2026 18:24:43 +0530
Message-Id: <20260723125448.922361-4-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX1cOnTHqGF0JP
 vG2eKEcNQ/rw+xyuOIH30SlRt5d5+pgx5WK/NFzHO1rMIMdZk6eUJlVfdemVB9RkYPCIVBGBDV6
 ch3UEzRSAhzlOhXcKCCrJag56KGseyU=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a620f2f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EdzCd4oJGJVa484SHGUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: IMELJrAxNAdR4G5O4-VWtRUXYvL2-_bY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX3SFfZLIy3Ej1
 dDImIsjAwgzVOnLLQbXdPZbC1MKPAgfwJkMnikQs5Q83MWc3r+MsRgHSeG1KiS6Asn7rhL//+kO
 h6zvwB7xKdQlNbBvSj4lQOCSILYuGfQvDDJKS6MG2LahFu2UT0Cp7HkICjiQne+EnVKR6VdtPFl
 jcnV+0OnYgl8P/XVHXyTcKd9EuGTjPbR6qSknI2i68kqMyFnyT3JTfaR3dFYnBI5Ql51lFCdf5D
 d8TklwpKyPjk7cjHy3yGmxV22pEZwptEmGoY9g25wONI8eukG47DQW65X5ec/rBoE9Yg+AI4c/0
 JaBfIzQwwZkHhv3WBZd0xAoWVjdRK3T5hEFQDN1HKow9jHzrtfG6M9BgK01/QVMEBvbWFXegR7z
 K3OhtQaUMkvfwOR7vzVE/sfCMBfuC4MmZDLLklpjj3c4JvuQAazlLrNqEIMReiIUGm4N8mhYACM
 KTo4lLLX80+Cx5xrt9A==
X-Proofpoint-ORIG-GUID: IMELJrAxNAdR4G5O4-VWtRUXYvL2-_bY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055512_958893_A61531F1 
X-CRM114-Status: GOOD (  16.73  )
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

From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>

When ath12k_dp_tx_assign_buffer() fails, the TX path returns -ENOMEM
silently with no per-ring visibility into how often this occurs.
Without a counter, buffer pool exhaustion on a specific TCL ring is
invisible during debugging.

Add txbuf_na[] to ath12k_device_dp_tx_err_stats to track per-ring TX
buffer allocation failures and increment it on assign failure in the
TX path. Expose the per-ring counts in debugfs under a new 'TCL Ring
Buffer Alloc Failures' section.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 5 +++++
 drivers/net/wireless/ath/ath12k/dp.h          | 2 ++
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 4 +++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index d54995b7adb2..0f8b458200a8 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1117,6 +1117,11 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
 				 i, device_stats->tx_err.desc_na[i]);
 
+	len += scnprintf(buf + len, size - len, "\nTCL Ring Buffer Alloc Failures:\n");
+	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
+		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
+				 i, device_stats->tx_err.txbuf_na[i]);
+
 	len += scnprintf(buf + len, size - len,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&device_stats->tx_err.misc_fail));
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index a94bbc337df4..ac125adde258 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -428,6 +428,8 @@ struct ath12k_dp_arch_ops {
 struct ath12k_device_dp_tx_err_stats {
 	/* TCL Ring Descriptor unavailable */
 	u32 desc_na[DP_TCL_NUM_RING_MAX];
+	/* TCL Ring Buffers unavailable */
+	u32 txbuf_na[DP_TCL_NUM_RING_MAX];
 	/* Other failures during dp_tx due to mem allocation failure
 	 * idr unavailable etc.
 	 */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index a0e409452a19..ca0e1369af21 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -123,8 +123,10 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 	tx_ring = &dp->tx_ring[ti.ring_id];
 
 	tx_desc = ath12k_dp_tx_assign_buffer(dp, pool_id);
-	if (!tx_desc)
+	if (!tx_desc) {
+		dp->device_stats.tx_err.txbuf_na[ti.ring_id]++;
 		return -ENOMEM;
+	}
 
 	dp_link_vif = ath12k_dp_vif_to_dp_link_vif(&ahvif->dp_vif, arvif->link_id);
 
-- 
2.34.1


