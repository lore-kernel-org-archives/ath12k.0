Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091AAC56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=; b=SiXFRNseJu2uIKfi9QqC/iARqG
	A27k3XEEbSgkb7LRKkGZuh2Fz/Kk33fPsSnvHyQ/CasTDRq+dOGE95KQ1gDUUSa9Psr3BZDq2tJu/
	PCj2ABPuXDuvE3PP90n27HET/plH6QM0kLeta2ngCfsLiBK8hIWv+YZAMsVyOMREfO4RWoxT69SUw
	OArqooinFHZdw07dWEZM7DAQF5SBN9hedbD/pRXpdjNjBE5djmDlz88x8q1QpyVLDKv5BsdAajh5H
	dl+zbZuePY0KaC4lRApN0pdWNtPuanVvODktcAOGVKI5uc1UdcVpvD14UDHNn/X/amwYil9zIEP/+
	yDZ0+3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5b-00000005si8-3B59;
	Thu, 06 Aug 2026 13:24:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5Z-00000005shV-16lo
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 13:24:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nqo91579434
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 13:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F9NgGZc76LN
	UHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=; b=LLtXywaQDYrCb5BxyJM3qiSJmaQ
	XsILKGW8utbScoP2K2jkpbxW49NZUpo4rClGQvoaI03Qse+sOs+CqrUh9TzZ+WKD
	+AFZ6hT7obEpdMoRZMq92TEIOi98JiX7v34U2fp54zgtOtXkVZxrtvR3ZEnTm8gb
	TrlFIyjldxNIdIwOwL1Ok2aIOZmE2BdXtFJnt/GFgki0YEn1MRxjsfjt3MpTSViS
	2alqtSaTnolZyDEuPFUSgtzuDJzgRp1jRQORMuGCSWWnVtqRqPobmmnn4vCiOkQS
	gAbzCCFZ7SsYert9qKZKQz4tLxqR8OwJ4cKyk/I635wQlAjWMr8tSQzpFNQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8jc1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 13:24:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84eee2147ffso2836199b3a.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022687; x=1786627487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=;
        b=XMBlY+EZJkeegTGjWezssJr5YhOFDrzsNauvsQcpMsp7XccTrlxUObsLr31zN3/qG/
         Ef6R6bw5uBX6cqV+wAm3DqwABLXjBdF8zpHgSGjt7e+dLdvVp1WDRQS/Bw6JT4RAIVTu
         iZ/SEcHLxPc22qhcD9q8aHOIcSgBINfcXtNAWgQy/Pv0QdykezU20sly+IuwaU2o9VtY
         xnvnEUtJd05wOl1lEjPxDnzmC+F5MxRkc833eQmA8CIYy0vCKmPITr2yRImPnk/aqFrk
         MYOx/v6ulRyqsmS2ydPi4UjD4FoUUxdO3/m3cldA3RHbLqLt+qd8R2j8/JHhkw9d+Egn
         HwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022687; x=1786627487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=;
        b=BmP41i3m+FwSoosUJy4tYeCN4QB+MiJblhTLhj4xZEV0BdyeIj3tlkf3yUzW03a+K5
         Yzm+jnZSCQGWkfrAftWGNw8yPFzFKwqvFg+Zctwq3vlKbFTl/BbOhIvZ1ikYL78xnbku
         ot4dWXRrxdQxcZSLbv+KXK3UJZoVjV2ZJAKBvKX6isJalAv+OmUGfkPGN6CBIKbglrcw
         NyoYuUQeHupY1Z21n0JWAA0A/Wui/qaIKGzFSQP7D+dWA3mFp9/mCxcYDev6ylmb8OlL
         aaXCu6BXFszNF52MjFNeVhNbv/PfV1EUT9TU1GbK0sfZLjfwaNf3/PWXNmpb0HxxIr/n
         FjPQ==
X-Gm-Message-State: AOJu0Yz2Q/6P43S12fq2L/V6DPiBgIZaK7hfUaWMe2c2v0ZcRUkXzKQE
	BQPfHtW9mjukPEwXokXNhmBTzMGJLIeaCfknAhrbdBc3cYMia8uSZsvQDnnlAfzuyRqDkR7j+ZI
	v0/wjgfGml4c6ifSMOFb5D6FAJKdGwgdlx4NiUF+rgFfGcHi9twQbB5jmUmD45YixcdpO9qUC
X-Gm-Gg: AR+sD110fOsTAF4B1eOZzMAudF6OOkVPg1GMMS1AQQOHNqBVWOuVEb3tKXAR5yByIiq
	pI/dkrJCJSVAFAqmL81pe7PZDAQZ59+OfiVsGm+dz3YSWB/dLKZ9w+fobIuiG7pKX4lRQugFD8b
	WUgzVpTLuT/wVxclSXhTdMuy+gWKQETalWbttlk78ANFiUXZfRx0OOFS+XITVpy2k8Y/3AL028h
	lHN/6DYBhdkZWcYemwPzisKn+SNhrNkDtRg4/DM2WzbVtRT/jYsdM+Uis39GfJxcssB+s4sM/W7
	OWCaqlBjYsAtxOa9oqlwVtllsRURScti5DygiZv9goHt3QZk3i68WG92ZMRiVidPieyQI8ZMkWp
	jNR5g1qSWjSxIz5FCj2EHYmHr4TfC743xj3al0MNW+kKElim7P9UC
X-Received: by 2002:a05:6a00:2c95:b0:84c:3900:95d4 with SMTP id d2e1a72fcca58-84f2e0149fcmr17254663b3a.11.1786022687198;
        Thu, 06 Aug 2026 06:24:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2c95:b0:84c:3900:95d4 with SMTP id d2e1a72fcca58-84f2e0149fcmr17254595b3a.11.1786022686614;
        Thu, 06 Aug 2026 06:24:46 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b785dsm1411637b3a.36.2026.08.06.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:24:45 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/8] wifi: ath12k: add TCL ring TX buffer allocation failure counter
Date: Thu,  6 Aug 2026 18:54:22 +0530
Message-Id: <20260806132427.3704828-4-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aQKr0EevyTLW4nyPRNSVT7DHMc2eubDG
X-Proofpoint-ORIG-GUID: aQKr0EevyTLW4nyPRNSVT7DHMc2eubDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfXz+Q7q5RRo8f9
 c2PAZ8XpPNe5tmwcCBYVSGKvhu29KGM+dkx/bkRBN1JeYfvL10GgqLYJZ7493b+TAB+688+0r61
 91+6FF/EUYkE+UVlgAlFEbByzjJB6imy1M/f0fmBbj3+lkxrJymjgPZYHaOgh6/7pTrK1QDHyU9
 J6qaXFfpAD6kXaA+CiQL1bp8kaDl0/Hf8jkzUOaqSApgmgEcZwYSE4x6yJ1y6tvffKDLY71PocE
 G9VFlsbCtnZCC0V18RBMAaeSH+CaL3pTgXcBIBsKmY4WvbS8gFoEvocvYMGWirnj4KTO499zLYz
 vIT5inWa8jkFAnNehqH36yF4N1yPECPduS0gQih6DAdl5MPUiaBWDK0/T9++GwThuABevrK3dxp
 KLiZ/PVlnNToK/He8qVe3fF0MnYURDITmsz/xWnLoTRchbXaadw09V/62C+U6KFsxaLk7+6cmB5
 wjSiLD3HBQsNGF5deNA==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a748b20 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vo2QL9yUnAtzEB9pKL0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfXyoOIMlzg2lf9
 1pEbmByMQShPiv/LUVJbwse37jQtQfJ9OVBStavNm8/QZZ8Z/QXEetEEeN7FQBNPKd13HkNMG75
 +h8L9PO/PXARbw3lY3UI4jOGamue5I8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062449_415100_89152AF2 
X-CRM114-Status: GOOD (  16.23  )
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


