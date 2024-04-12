Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAC3C04FF8
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THroAguNRlZTaU9UglbQ3U8cc011cYRJtxNRMZTW1U4=; b=TrVR0APwcSRmWLY441hSmNqs09
	E7fto6ZaUW+M+S9IsAF7iZq6+AenkxR6OJLfOtkjp1lvmoJ9cjV0kiQ1YK7cVNVRRve4gNqeDkiKy
	Foo9hZBwO0vOtvGUzW8WFwkv4b7DSb0z0x+rYGKiPfgu5doWevhc5mtB2pNAm4fti0+P2aq7nncV1
	+Byg7IM3hjPSupexnwGbiBHAxrVQ5wHOAo7RoExYYERcnuIWj/pT9DlcbWOn8yjogh00GDKtGEvF8
	92+V7tJf6CvPZUIpvJprkcO3XQrh4X2KGcI0H3AmeMrnn5AUZfaPOIrLNsZKj/gjVCujRcgs/IP3t
	xAdKJnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3o-0000000FV83-3YMm
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3k-0000000FV4X-1J8U
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C4RuWI006597;
	Fri, 12 Apr 2024 06:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=THroAguNRlZTaU9UglbQ3U8cc011cYRJtxNRMZTW1U4=; b=Wa
	/8QaXcIRbb5Xmm6bdPa3y/xWr24NwbFWeQpfHVGX7iGDOfn6x8PGf9WZzHCzMU0F
	HhdbF1+yseSB2i0LidAVozEcyWrU8eDmWl6aS6mZTfVVSWw70VC87SGOC5O+p1Kk
	gnjTs3BJ2ETAMtC/4zyN3BK7aVCX9bCZy1bO52nGqBmS40SDLg8VmXPRyzrTY5O5
	uerA3JAKcDBLuL4PBGkMB+3poXf/Wcufw1v3Z+qH1nBAjffAYu9l85Z/E8ERRng1
	zHy9SBmEKi+Vo8KeYeV7hIFtABjSVV8iAzpPTrtiLvA2zRVqA2+Hud6wVwHENIT6
	HuqQA6aw9CwUq5dhdPgQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xem8m195c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66kwO032465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:46 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:44 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 07/10] wifi: ath12k: no need to handle pktlog during suspend/resume
Date: Fri, 12 Apr 2024 14:06:17 +0800
Message-ID: <20240412060620.27519-8-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412060620.27519-1-quic_bqiang@quicinc.com>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6_XLWY9--PXHcK4qagxQWBXFKrACCogI
X-Proofpoint-GUID: 6_XLWY9--PXHcK4qagxQWBXFKrACCogI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 mlxlogscore=676 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230648_531311_F47A0FEB 
X-CRM114-Status: GOOD (  13.08  )
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

Currently pktlog is stopped in suspend callback and started in
resume callback, and in either scenarios it's basically to
delete/modify ab->mon_reap_timer and to purge related rings.
For WCN7850 it's pointless because pktlog is not enabled: both
ab->mon_reap_timer and those rings are not initialized.

So remove pktlog handling in suspend/resume callbacks. And
further, remove these two functions and related callee because
no one is calling them.

Other chips are not affected because now only WCN7850 supports
suspend/resume.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c  | 21 -----------
 drivers/net/wireless/ath/ath12k/dp_rx.c | 48 -------------------------
 drivers/net/wireless/ath/ath12k/dp_rx.h |  2 --
 3 files changed, 71 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index dfec390b66c6..aeb7f9e43cc4 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -64,20 +64,6 @@ int ath12k_core_suspend(struct ath12k_base *ab)
 	}
 	rcu_read_unlock();
 
-	ret = ath12k_dp_rx_pktlog_stop(ab, true);
-	if (ret) {
-		ath12k_warn(ab, "failed to stop dp rx (and timer) pktlog during suspend: %d\n",
-			    ret);
-		return ret;
-	}
-
-	ret = ath12k_dp_rx_pktlog_stop(ab, false);
-	if (ret) {
-		ath12k_warn(ab, "failed to stop dp rx pktlog during suspend: %d\n",
-			    ret);
-		return ret;
-	}
-
 	ath12k_hif_irq_disable(ab);
 	ath12k_hif_ce_irq_disable(ab);
 
@@ -106,13 +92,6 @@ int ath12k_core_resume(struct ath12k_base *ab)
 	ath12k_hif_ce_irq_enable(ab);
 	ath12k_hif_irq_enable(ab);
 
-	ret = ath12k_dp_rx_pktlog_start(ab);
-	if (ret) {
-		ath12k_warn(ab, "failed to start rx pktlog during resume: %d\n",
-			    ret);
-		return ret;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index a593beecdd12..dd6d9b2a5bcf 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -239,28 +239,6 @@ static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_base *ab,
 	return ab->hal_rx_ops->rx_desc_get_msdu_src_link_id(desc);
 }
 
-static int ath12k_dp_purge_mon_ring(struct ath12k_base *ab)
-{
-	int i, reaped = 0;
-	unsigned long timeout = jiffies + msecs_to_jiffies(DP_MON_PURGE_TIMEOUT_MS);
-
-	do {
-		for (i = 0; i < ab->hw_params->num_rxmda_per_pdev; i++)
-			reaped += ath12k_dp_mon_process_ring(ab, i, NULL,
-							     DP_MON_SERVICE_BUDGET,
-							     ATH12K_DP_RX_MONITOR_MODE);
-
-		/* nothing more to reap */
-		if (reaped < DP_MON_SERVICE_BUDGET)
-			return 0;
-
-	} while (time_before(jiffies, timeout));
-
-	ath12k_warn(ab, "dp mon ring purge timeout");
-
-	return -ETIMEDOUT;
-}
-
 static size_t ath12k_dp_list_cut_nodes(struct list_head *list,
 				       struct list_head *head,
 				       size_t count)
@@ -4264,29 +4242,3 @@ int ath12k_dp_rx_pdev_mon_attach(struct ath12k *ar)
 
 	return 0;
 }
-
-int ath12k_dp_rx_pktlog_start(struct ath12k_base *ab)
-{
-	/* start reap timer */
-	mod_timer(&ab->mon_reap_timer,
-		  jiffies + msecs_to_jiffies(ATH12K_MON_TIMER_INTERVAL));
-
-	return 0;
-}
-
-int ath12k_dp_rx_pktlog_stop(struct ath12k_base *ab, bool stop_timer)
-{
-	int ret;
-
-	if (stop_timer)
-		del_timer_sync(&ab->mon_reap_timer);
-
-	/* reap all the monitor related rings */
-	ret = ath12k_dp_purge_mon_ring(ab);
-	if (ret) {
-		ath12k_warn(ab, "failed to purge dp mon ring: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 25940061ead5..6b8e22a5b43c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -123,8 +123,6 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab,
 int ath12k_dp_rx_pdev_mon_attach(struct ath12k *ar);
 int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id);
 
-int ath12k_dp_rx_pktlog_start(struct ath12k_base *ab);
-int ath12k_dp_rx_pktlog_stop(struct ath12k_base *ab, bool stop_timer);
 u8 ath12k_dp_rx_h_l3pad(struct ath12k_base *ab,
 			struct hal_rx_desc *desc);
 struct ath12k_peer *
-- 
2.25.1


