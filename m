Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7732C5B572
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 05:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDc+pb3v6MfSQtwl3l04JeLhGdo7Yuk7Oq1L+GHXJBo=; b=ervzP9m8lAtpT1odCr8Is8OH1v
	ZKKY8+5xzKtoyvhdJ5ZZxL0MKVmKGt2dWtnvs2D0nkyhuw2+5dLlvm9ECMu1trYmYOFcbVoSjMJqX
	B2JCH8xeBZG1tGzIUo42CX0Gu6PDOvC6DdpZlV75GueS8DBy5Bi0Wfoy5KQUqjDxLOGJji+NOIgbQ
	Ir496n8bA7CgC8TFocspaL/ryQiz/k8rRrPyhbpE1cdUzE90BsDMTajrjKc/HcXapwxfL4ytiCQmb
	DReLsr4r/uJPnAEVauthOO52+hzNopg7Xjwbv5X53YUAJv19SkXa25hJ91yaaAiIFKJrmWMCXds4b
	UCxRSc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvP-0000000916p-1BEI;
	Wed, 19 Aug 2026 05:33:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvH-0000000914F-2iyu
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 05:33:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I0kt3518263
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CDc+pb3v6Mf
	SQtwl3l04JeLhGdo7Yuk7Oq1L+GHXJBo=; b=o6C7kcBmV6zl491SjbMeKbn39Xu
	6VV8I7jqnVCMyM8sBCyKVrHClGqNugO94wHGeLpIi3KRMyDa/ULG+osC2VcXhToa
	ia5brpNpNqTiwPplVNpSWCZfxrjD/4ZgNWlISUsUz0PfyqmjfmYiYaRTzvlupdyt
	XPYU7MIevBRmaBksx2xrMCc3PwagdxL+z4w3fR2iwavtldmwwt0xvLrcy+f1qcg/
	S+KGpnF8kaT4qKfQ493/+8G9lSiegcexgLXtBQEU0gCPRqfQWIXQXRRErDt9XFZc
	8Cefd4R74h7EcDRFAuXRRAbxbUtlBFy59XZFojf8NR6JmIM6axj6zDPFcHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk9gms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso414882a12.0
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 22:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117589; x=1787722389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDc+pb3v6MfSQtwl3l04JeLhGdo7Yuk7Oq1L+GHXJBo=;
        b=buAmeyNfObGsFjeHcPoVvT1+BAU3vr4kaUoYL9GPsIg/q2pYpJlYxC+G1WGKUd07eO
         rkySKQp93Xi+98huFVtMN02/Kryj2KR930xvEUngXBDyq03o4MewyoxzpPH0p926eyDj
         xrCcawZ8KGnY61mTz0F20yAOEcWLp8vAV7ohhb5kPkKxCFZfMsD5FCmsdyu4iLIcVYDc
         qcdD88EZiW+dCXjEBKouFuAmCsXUzumTyS/pifxvRs0BoClnbJggJZgxf0jMXFXS2of3
         SdiGwM2w8qTrjBfyjnJdET5cVv2+nBIk5uDtqphMEXxmOzX2Q3doNYY3LghVsngnxrlg
         YjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117589; x=1787722389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDc+pb3v6MfSQtwl3l04JeLhGdo7Yuk7Oq1L+GHXJBo=;
        b=OI60lDfuhAa68R8TLoXcXwHzLYt5NLly1boZEquZ7hEitSK/eE2u8epRgivTCl084m
         BQVOrLAlqQ0JDN6zl5YK5DDq8mUObQM6YctFtN24It4SeAPRwuDf1UrkeGc+xCNmQhSi
         9GjohM4OSRbhP3D4aJ6scE+TyRTdEOgmmckP2Ob6UhZuBm51WCYfU/sy/ECwjHq3x+iU
         tEf7FBXi7B9v6P4q/Xetvd/RDPuSFojng6Lh50oVv1IG44eDHBrQFA/r0GviBBoT2C1b
         rlefjNblkIbXov8NK63deP4GPXyjobZSo6Y/5i3vMTaIvfbnj7PTw9yhwM1vihcYaCH7
         7IfA==
X-Gm-Message-State: AOJu0Yyo5VaoRwQY/S9HVOnysgXp28yDbh7fZcd0jWKOSoXHgtwXIAp7
	8PXBIgw76yAIeoK9Slr/HOU73VKcYH8NwdTsfKlIoo5T/D8o3NXXlCoKbr53P3T7u9XYW9rvbrL
	D6WGe20N/RCUCWsoos7GS+vYtkZbW3tNWljp06+IwthTGZyEZXZ9aLaObGAPWzJ6NwPXlMLA/
X-Gm-Gg: AR+sD10cNosxrq+Fm5X+XO8LERNyUCu22mg/Gwp8CeQsBpMQDj/BaWdPkL9eHWXpZ/1
	ozgg3B7sLl/9fDtRezQusiNgujku+xcLrgfX4oe+bOiHDby5FqHQq8w4p5B+Ps9ravf5lxA64I1
	9bydYbDBjDFK3gtP8rhbskUQjMK7lsR8u8R6+95Fi8MnHA9hU09a4sRzCeawJjMAmK6AzLdbkiR
	+Sa4yKCc0/d1HFKZOz0aLTeE01HL6xXm0gYCmkGKBG/JOIE4rRT702Zp3Bprb2Ww48YA4hqcK8X
	SqUj2uHWvtwLbDHzjgl1d+W6o/zPqbiBnrvI+phk2zUGU8ZxeQR1cCcVmAHixhr/FT78yFRRIGO
	aTJDFOtwDd2IJfpIqJVNtjnTLuAm4zbg+zMlS17r5Nw34ajxWLOku
X-Received: by 2002:a17:90b:37cb:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3958046ce9cmr4173458a91.0.1787117589250;
        Tue, 18 Aug 2026 22:33:09 -0700 (PDT)
X-Received: by 2002:a17:90b:37cb:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3958046ce9cmr4173411a91.0.1787117588786;
        Tue, 18 Aug 2026 22:33:08 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4c9918sm404261a91.0.2026.08.18.22.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:33:08 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v4 3/8] wifi: ath12k: add TCL ring TX buffer allocation failure counter
Date: Wed, 19 Aug 2026 11:02:42 +0530
Message-Id: <20260819053247.1420393-4-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PAbkBXMmCl8okfJOtvfkvk1unupxJB3g
X-Proofpoint-ORIG-GUID: PAbkBXMmCl8okfJOtvfkvk1unupxJB3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX0ND+C7VKaSyI
 6X/h4VUDU7y0Zu972U1A0BePhsQzVdaWCHzwmyFKzDqa0QEDMh2I0IWxt3iuUQmQsSS//cnZKf5
 aCU2KTvgyFc7pN6pKm2/LhFMcUNe+CF8WXXGQzSKjLTTRpDsuXActt/GDqNJKWYw0xAGyGBPpgM
 iiI9cg4p1C2Rzp7i8w0CrMZa6epEjJHK6BTuLQR5yjn+E36VKHQRAT27wsxCxFCgSjlNy7G15pP
 aqLaMg8HVlHPp78lSEJku/Ge+4+6wFH6F8qJ8/uuRHiCJs8GRf/lAPO37kEX25DqY9FCpZJj8WN
 A4paOMyzEMrxGokLvz+m3LkkBJANxsphg7ybdD0EqpdHsAyEXp/OuwG4/pGyEJuK462AFv7+VVE
 fFofOE134SnWBgHC1lv3ybWWPFVNwr5NS3yUOpZojo18bTSD9ktVEyDeQt2xwfhBe/q4Z5Vvtqt
 85BqThd4HH1vBvDkE/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX5EKg5lRB5wL3
 zT5qaVOCPt9PG9nivJa+OlSYxPRM2GIWLYBoEPY6oTku5nue1Bmj5371gaIRj8i5VmkYb+O82/C
 T/zGFNOpSkaVO7OsLZJuL5R8mubVZSM=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a854016 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vo2QL9yUnAtzEB9pKL0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_223311_842591_B4C20696 
X-CRM114-Status: GOOD (  16.63  )
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
silently with no visibility into which traffic class is affected.
Without a counter, TX descriptor pool exhaustion is invisible during
debugging.

Add txbuf_na[] indexed by pool_id to ath12k_device_dp_tx_err_stats to
track TX descriptor pool allocation failures per traffic class and
increment it on assign failure in the TX path. Expose the per-pool
counts in debugfs under a new 'TX Descriptor Pool Alloc Failures'
section.

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
index d54995b7adb2..ec49692107a8 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1117,6 +1117,11 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
 				 i, device_stats->tx_err.desc_na[i]);
 
+	len += scnprintf(buf + len, size - len, "\nTX Descriptor Pool Alloc Failures:\n");
+	for (i = 0; i < ATH12K_HW_MAX_QUEUES; i++)
+		len += scnprintf(buf + len, size - len, "pool%d: %u\n",
+				 i, device_stats->tx_err.txbuf_na[i]);
+
 	len += scnprintf(buf + len, size - len,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&device_stats->tx_err.misc_fail));
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index bef0f2ba0560..16675210806a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -429,6 +429,8 @@ struct ath12k_dp_arch_ops {
 struct ath12k_device_dp_tx_err_stats {
 	/* TCL Ring Descriptor unavailable */
 	u32 desc_na[DP_TCL_NUM_RING_MAX];
+	/* TX descriptor pool exhausted (per pool_id / traffic class) */
+	u32 txbuf_na[ATH12K_HW_MAX_QUEUES];
 	/* Other failures during dp_tx due to mem allocation failure
 	 * idr unavailable etc.
 	 */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index a8afc1cb0712..11048c568331 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -167,8 +167,10 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 	tx_ring = &dp->tx_ring[ti.ring_id];
 
 	tx_desc = ath12k_dp_tx_assign_buffer(dp, pool_id);
-	if (!tx_desc)
+	if (!tx_desc) {
+		dp->device_stats.tx_err.txbuf_na[pool_id]++;
 		return -ENOMEM;
+	}
 
 	dp_link_vif = ath12k_dp_vif_to_dp_link_vif(&ahvif->dp_vif, arvif->link_id);
 
-- 
2.34.1


