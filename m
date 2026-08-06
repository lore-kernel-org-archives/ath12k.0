Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B73CC56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=; b=P/v1gT2RVIBEm+Pkta+exEfHZK
	b5RW7ijeZpdz/ELqh2gr2ohVQwBIup/w5lNFpElF31MylVFD6mjUVFIi6jd16bJnzhvaf+iHKrC4A
	nOvejpwp/ReOoKFs5qoMY7qXPP/tjniisslD4EZAe7I0GkGJHVsRrUtbMWlTyjcb9xKYCeRDar0il
	lwhgfePugeZWFPrTKuryjEvJVyR5oO6jmMpOKv/AdLpq95m2O/OLPcfuEkw1pq1B6iP/K93suBhfV
	aaXiQevMYBnvmRZ2km0g46QGi3bWyr1/uoP8f5R3xPjir9lgKCEWtIovwiSjdOyOst1/4jCAKCPOd
	aEk8ULkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv9-00000005iRu-0d0d;
	Thu, 06 Aug 2026 12:09:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv6-00000005iQ2-27Md
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 12:09:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neLm1533987
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 12:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F9NgGZc76LN
	UHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=; b=VQC/pnVQ4NjGCofxW51CHiZeZOv
	60Wq14b5J058cOlogrSBAHXJoPRhkPP+6qKPI3/xj2Jpkc1FBW9Z73s0vPS67Eat
	tyJH+Wcoo6HwSE//5ZvvzZ6dkyq/ivzb4L6lL5nT7UnzDnhIUa4z96ZWD1H4QovK
	pHxyunIFvd5z7JPzE7jHmPO1Z3eJLxMwrL0ENBfUbqmPjHMONQyUormnwG2lb+El
	R9eYjb3an1ukegDXi3IlyzNnxZp1haXM88u2xIvVGwruIZyI9K6sfq5VEbsMe/u6
	xomus5XH10NBl/wkHUnAm1cdEcfgEKzyb9JMLKT3IN8Xrs4ok1X1+xvMGMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8psdcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 12:09:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2316977a91.1
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018191; x=1786622991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=;
        b=cdhaiHww4ZawvFpY6RFWA2yLUX6ugkH7dwlzu2py53htyWFBEabsPF2O6AE0uhGrs/
         d9GiKzBEXM9m/4XHKO9NNDkWuip28WgFBwvMPHUj8SISlbBhuWpf5BngDJAuyw03ekIN
         EHR5rXYIlNaEyvhyboZy3F2zsaZW5CM5hLkaudwaH/gOZ83EL4hN4k2EgVoS7Nkk8dsZ
         /jO2ubsyW7sEjnbm79M6LqUdBr9vVdWgCitrlXmXr0fvdiiu9ZkSBLheS1CqF3tm1h39
         5EReHuYvN5FZtwoAPdPVtAqnKtC2H1FgiZ0AGpIVF7b8pMZSD5EeTed/EkXan1FoM1dz
         c1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018191; x=1786622991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9NgGZc76LNUHikIUHtgwQ2SJJPhwF2P8xwlxp+fmjs=;
        b=Y2xCCrlcMnrgbEGPB1LlSmHdHkGTLVC9YhyConiAL9l4zbd67fB16TVbAtvGcSGfdj
         QS6SXu4cEnKSLZhxCfni5DSWSjRtzuZFH/SPu5o1JbfBiOCEeSMIbNDQalSkKkqljCVE
         TeBrKd4bSPbfq69ij74c4jfLWAPJ+7O0AptXBH81ucKs6fdAlfDoZYd4PxyVagJVtz1i
         c1Tz/bwjVguwiVRb0xdnc3Ld02CAY50Vbn6QEcU1E/tnAaZkmQ4tgOLdgHMBxJDPxNP9
         9LlBl0KysvWXzuWGp8/JIjrvPYL7LcpE4FxYH4dr+GyPNRCU+xnhW6RWnn3PKomlevrR
         ew2w==
X-Gm-Message-State: AOJu0YyyRHNoVniLe1c0PSYDltCgr/GZ5EFbglo8xE0s0b7UnBZAw+wx
	TtyiK9SXfSCIomHCKvFXepju7DUccoEb0UavEPsd5uhRBfRrjjayjxq76uiInPjKdqdwkBYD3jS
	WYzbOFZLoApz0J2gTZtE6Lor+26r11k4gbOKxRNUyH+uuVjFi3Rjhhgy2JLD4Q057qBzeUGIx
X-Gm-Gg: AR+sD12gyQXMtHoDtyO+a0feiy3dnTVZoLoTlGxPBJzU0JGh1W9NoCTFhrxOJMGz/wR
	inuAvzZmBY8dOKh+J1ZDaLdlUQ/qQceX4J+7pzK5gj6mpDF3O4N7qrE3KX1TuGC4kuRtHWeHQ6B
	QMIqmqIqUQcZBSP9GK6SZeJexakAWmLzhfXiR+OLnXnsGUClq20jdXNosLphVv+TmhUIa5kw508
	Z18MfrZmXBBM6qTMXVk6lobtKC7vuwYaJ2EYhmLSwjuzspwQcd6yTdGErioYjekHuwB2QXH0I+l
	FaEHh3fHhGiEpSkX7I3uatf4qiTglnAgiXJX9WPPRWbq7LDLhoupk+yO7dTp4JHbb8M/sCsGldN
	a3hAOD+EiwBlP8T3QCkePgjdLyGAFRYT2cPbtxSssYlyslIVOriIT
X-Received: by 2002:a17:90a:d443:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3903c594637mr16075476a91.10.1786018191342;
        Thu, 06 Aug 2026 05:09:51 -0700 (PDT)
X-Received: by 2002:a17:90a:d443:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3903c594637mr16075375a91.10.1786018190858;
        Thu, 06 Aug 2026 05:09:50 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085db4a6csm1469079a91.3.2026.08.06.05.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:09:50 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/8] wifi: ath12k: add TCL ring TX buffer allocation failure counter
Date: Thu,  6 Aug 2026 17:39:22 +0530
Message-Id: <20260806120927.3607733-4-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfXyq9Tqy7SkHYx
 1LdsrTfyCwFeu/vJNwWkxJxJ/QzQaR5zqHMhlyjTS3Gdkw6kaNM+oEaWqmn4zlrovKadurhIDvz
 eLUGeEyI8Pb5D6+CasglueSAZxazydA=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a747993 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vo2QL9yUnAtzEB9pKL0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Bq5pWgVz0_BOvz84VhLykP6bFBUx7OIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfXzEn5dtP1FZI3
 PTCx4VmD8FuezlTEBlsaqJybWWIqhG+yncQJMv9MG4tA5XWocJ/DRmHFdTHczhZ4AtxSVXN4dwv
 QVkOAiVl6GwO+6Ci93U1N9QnbPN4B/YPfAOCddsEyARpinzlOQWn9cebK99Iw91pluc+KAig9du
 mgkJv/FydFbmSihq3IaqypzAKdAznN1OS4Lou6BtFux9roE5FPDkqhz3GGZ4JOhThgWkrwdLZ/G
 mKQV4mc/YX8M1CYDFVrw8IqlIi1IIQvT2ruoWmC1c7BvMecYUfcXCyVqTUUr0DnnpguBgmuaofV
 5T3cJRMwPEDO3kTddXUUxmYx0zTPr7/cANx9ovZ1bFACe8H5gX0G4MdyLTvKF1v2TQRUOpUiBB8
 ef7jem5WTxfaeoco8PWdmQaGOkOIbZ9ahQ4I+90rxkMj9h91i/cfVzDeAigto+vlN3hmkBlW700
 G+RnEyrRGvAL/5KyFMw==
X-Proofpoint-ORIG-GUID: Bq5pWgVz0_BOvz84VhLykP6bFBUx7OIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_050956_652878_2E0AF140 
X-CRM114-Status: GOOD (  16.15  )
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


