Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986ADC56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=; b=OKJlw7n6IGEe9b8W8wXK5ljP12
	o4O7iyZBcLV5aPm8h6yf/TW55IRuLMfevBjIEtqtxPNhijR66od/RRZUJn9RfAD0Aabn9I4wI03l8
	rzdx8vI/VXC0Q3dWEW+qgmy9EgL2hKJGw+w/dLdt68dLr+2h2wWeEimHNuUCg1OK1hl486S64WMhS
	nXHDXbmNHYHEE11xzbDWnjDnmFeAkHt8k3zjEuWimeotoJcxeS6o2Bv7+3mkWpN+2yAdQydq428/D
	sfsYEx5484UAOXKtEueSe9SajcU0rOE+Ui2oEc2NCKqZnrLRiZqBKI6+EIBrHDPgSEaatC02Mv2/E
	MWB036Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0d-00000005VDJ-1Kf9;
	Thu, 06 Aug 2026 10:07:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0a-00000005VBk-1Bmf
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 10:07:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nrH11278074
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 10:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F9NgGZc76LN
	UHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=; b=CjI/S44ATALsLoexzZ2tCxhEjW1
	t1honXpvDfO51PRwj0A65PnkivJ6LccKC7ver63hyW40Arx9n3M2CaP/5K/Sidq7
	60xgbrdPVBcjceqS6CkV7Ueq2M/sJonkYLLHLkkceHZqpcWUVfUB16ahJ2BB/46R
	YqrfbUHunSubTgyO1fQa/p6cqJjX7K527AFxr+5/P93qaYWKS8vOwT8uNM/gnChS
	Pw9nRJYovdeoB+zKn05vfBFpeIMcl829ly4+QXynPFS6LSrRdnytiMonmY2A5Qdp
	yUGPtl+kVgmRhzKQBNLy9rD2hH1PcatB3MER1WRuuS1Xb+bInBuRfz1wabw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjueheqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 10:07:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso2863622a91.3
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 03:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010847; x=1786615647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=;
        b=DjiyGl3j9789YJQes5kbv5pxOcCh0q6dEepqdSQCiKUTbx3/1n8Be/OXlOIToYBuv7
         fzWtjm1FT5Siu7rwnG+lQEtj1VGIVFjb+L6DW6vRqZwXXteVDrhdcx5VOmYajZthanhm
         0hHd5x8UhNwhfAWDpc8A0kqtmNKZlt5lTSG51wjJ75Hkls3fd2UDmvlqUII7bd1pTC5i
         LH+bBFOhr2RDc1P5eLce2lGyZN8o4eJuIlUed/Nb/L7xhADCZIvXrQcagzyhtrmkKUZN
         91WelTshZufIlTrY6b9NOVjE77x+uEZkQWHoCm2jNEz0gvM9by1zy2d3+iFVLAagF1cz
         Tn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010847; x=1786615647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=;
        b=Hi3SEjJnSOTSInQUCtJe8p+LPafyJb97ulpo2CFdfw1v5xRSDZ9H8LNZiRTV3/8p4m
         sI2tMqGEpAu8pJ8bY44DZxSmMLGjci0PnaUB/ai8A2D81FRUnfmIL6msvTojJeoKYgez
         4cTFgbhm3cI4URlcU8VTw14q7CzVb9K7OpJmCbZTINSqvHrYkWRDmEnNFUg9aO5jeNLn
         spOn0YH2DzzQGW4Ek1BKV/mzvebtEhAYgH8WdafEx08FPXTjeYcyAQeAzvJhy2r5mHfR
         R8/T0YRXz6DfI33qI0dAKNiV3gy8nQn6QVwOlbevtQwpP36Mwz7CUhovcRDzBCttmbhd
         mwxw==
X-Gm-Message-State: AOJu0Yx89Trknq22usAmMe6bi0AMUv26ev1E6vh7V78ivx9LaNHRJVBR
	rZOW1sEqZmd15MxIUw1W6z2lpeeXArNvUYLH/bDNPhoFJSLhc9seJycO6+2HZBM+Ua71At/1DGI
	/UR1vEREC2rKigLnQ+Czi36dXmBG6z87BJ9yvU0uPkPgKxYawYQf5IqpV6v4rmUdpwqHjO0Hz
X-Gm-Gg: AR+sD11G1wqw1HyjOTTQAJF/I4SkRHQHj1ynMH32RxbsgcJCW+5M2382Z2EVq0YfiUI
	bW+RAqiOCYERXkHIp5uEN6ctv1Ci3fbimvl4jKSOHBWiau7v5owVc1t0Y2haffq62XJpYav+DUg
	dpgCM8hAMhKttBVTwYVwpnZofGgtbUQ9ZqtSY8gH1HnVFBkBp+vLS159Ue5Vlb0Z9dQLpoEMEQx
	cfsX1XZnutXhuXiXsAg7Yf49YRUQpw1+p9RCZ/m19U4LX3UZn8iNCVC3z8WOsSW0u5kXk2NuSce
	2XygidLz1oTt41jUNOQeyuAhAzKa87R031FkJz8V7s66xDBGmXsuAQlkqn8wM+ewcVrfLPLm4xQ
	taj/2Hvhw/lR4jw+JMA9fQP7lN2RIR+tPdrqC6Ja21ZJ5OBoup74v
X-Received: by 2002:a17:903:184c:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2d0caa040e3mr173970095ad.18.1786010846750;
        Thu, 06 Aug 2026 03:07:26 -0700 (PDT)
X-Received: by 2002:a17:903:184c:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2d0caa040e3mr173969475ad.18.1786010846339;
        Thu, 06 Aug 2026 03:07:26 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0b6fbf2c6sm24027115ad.34.2026.08.06.03.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:07:25 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 3/8] wifi: ath12k: add TCL ring TX buffer allocation failure counter
Date: Thu,  6 Aug 2026 15:36:57 +0530
Message-Id: <20260806100702.3479326-4-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a745cdf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=vo2QL9yUnAtzEB9pKL0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: r-kiVZU06ogok4DckP_q03LjcPCB_6lq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX+KIMI7HM71l5
 Ov+b0E0P3fUj+Is51grouTTU43b0P6dF8aw0RqbeiWNsPVH6RSE+NDllUTxdlc1vlyCznkwAoPO
 UEFFJ8V3MmohWKQ+5aamy6MfFE9AxZ35sdDff8N9eec8+zYBytWRBrvxb0u1hfRbwt011wzfx3i
 5IspbgbDhI+djW+1L6+aBqMbq/Wc61DjOBtPf+DF8dD2HK3HGoPK5RhtYi/al7Vp792bo3qMHBq
 v+J5Zauj4YGDy0z+ljYRvstK4qhoE4+rD0CXunoiB/QDlY9wBn7hhz8KNZvH4geCfbRbXMhcfE8
 AxH0Vhjs45mLEVWOQVGhB2WIk5Ek1/eDBM8Rm5REyP2jOXRn8nz+leUPFbx/0Mld/U9KMjVLALS
 CFSxUCuXv4uzOmX2U+rNZhntkOFDeSlDAlpDELdO88m9iGIZNB8tfj+6vM6l+NmeiLjVmA1A8zq
 Z0DMfzIl3nHKlDCkuaw==
X-Proofpoint-ORIG-GUID: r-kiVZU06ogok4DckP_q03LjcPCB_6lq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX0ZiaUsWQ4k4P
 CK9BKRTaliJ9ECZbuc5GUY+a1ww9yukRQ3/r+FzGpMq/bxJ6fVFsP3ClMrmddn0p6xvVFN70oVU
 IUURkZuG358sdAkByIYG5teq1F3DPJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030728_328566_22059515 
X-CRM114-Status: GOOD (  15.73  )
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
index d46a3d14f018..f572aa581d11 100644
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


