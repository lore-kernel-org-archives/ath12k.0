Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21C5C5DF82
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 05:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usIhDXNMfu50PPG0W9yN2mbSyklvwcQZEXUGI2Y4qbI=; b=0ITt/Rn2dQEb1d4mJKY71YI1lg
	CgRECTf1XaFXAbRJ8wnPHCFUNx7XteDpajzelk7BaYME8WgXwPOtZMDi1sNSBGmXJz/HBtkUKafuj
	GWr5edPV+A/J/zQUAO1rRMP4Mp/iV/DrBqn+tURDynng5L5cI5kYi36amzX5FRRszODH6opsilZdd
	jFjzPQd8padUpDWprP7ENlzCyPxztOnwYJ/VYqqEFS0F2Us5h1LtdxaLbRFGUo4lRZ0NW3N4vXrUL
	++mH2FL/PWh9X712BgVrZaFkUzGnUr6CF/MimcK22e8ZAA93f7sRFG2SLkDoP1XEJ/iC0tyg61FCc
	/rFYga/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdY-0000000ArUU-1jZI;
	Thu, 20 Aug 2026 05:48:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdW-0000000ArTk-2n9N
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 05:48:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL870T491129
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=usIhDXNMfu5
	0PPG0W9yN2mbSyklvwcQZEXUGI2Y4qbI=; b=ZwND/ZZ1wyPLgz+vd3FVdh4lrmu
	9w2L2SMGKzWrqqB9VkL1HLR4LPsSR59LpcMJWJAglnuydnD9rQHhSwGKWwVVHaTp
	uz4aPeNvXtNRjSWBzPqHydM0FHUEK51FKsCblVUAa8zBGotHnpPmxg3Wy/dorq0d
	WJRBsdRI9QeERJekxcG21zPSjGS6/j5Za/BPQDDsfJSQMJAqjknkcfc5X+ekOq3h
	iFM/UxQl0g1AUaA1ATpJj3ASG127HczrHQzKp6APQO2b4zU5nEmIbBQ+tRLokT7x
	oLvxf6Vusxt3iMKgRoXsb5j6KsQBgz5lCn+7QAo6amHMrsqCeCj7Q53Xjmg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervkcvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso2503981a91.1
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 22:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787204901; x=1787809701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usIhDXNMfu50PPG0W9yN2mbSyklvwcQZEXUGI2Y4qbI=;
        b=gtmT47UEMoYpcSDgyzh33Stc+oQubtC/yHR8tXcFBeXlephEgxjQElpiJe2G5OMSOl
         nKIuxDiiaszNdJcYivIRcq5ZeK6EQqFc/tYRwiTNYZZ96awXNTYpUEmBkRMXsEA1tOBW
         yHmgF1if64jlpKnsSYMvDOxX9vKaM7EnSWoAIFmGphRghdvmepbId3uavSBtQxaorLNf
         QzT20woC+HGuRMq6FFXi4T+bUsC+GaOk1RltN5bjfJ294FuKX9vmMjtN6EQp1T3T7Wse
         TlajPkHhsgXDERw/XRpVkJIKry1OodZtkcITwsOIU9Kxw0SkMnR1zp9YLP3zgsBchkU+
         u9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204901; x=1787809701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=usIhDXNMfu50PPG0W9yN2mbSyklvwcQZEXUGI2Y4qbI=;
        b=BOaKB4spORdBTc1YKSvtwuXwD/la/vKE/t9a1TNFB7o3Vc/QdwBkCri9wTH4bA9nxp
         GZY8Ao4Nqn6ZPC5fkjHgYFTTFjarfjTvoqMgvKudlULSs0pHr0b0MxQFmH3W7/54/M7s
         rahqnXiopFSQv4NIPZtl3502DcMrKWPKRJ0+9GLq8/2XrdWUQViGeZCj4pEJeGL6KtHb
         sUL5h/C+TSWzOugx2GsIl5zx3ztcRIVtdnK2qToki4k8Q1liwjgn+IHtShpzuLOiOHsn
         /z5ltMCCO7Dbt6wnjGw5zT0kkXprzXE51Jf0geBMsAynZgS1fC2q0fSqTsQy6xfkEtpi
         nnrw==
X-Gm-Message-State: AFuF++lIh1NzPCOE2DtybF2tO42WEIqTfUfoKQzs3TomU4aLFuonea4s
	sRKFhvl82tGAV3ZVnfFu0meHbJIp30S4oVaLH47kDcVhWG47pJMZnA7RaX2Ydl6q78HurKIvXg7
	gbOVC7dfv84yvefCZBBAjRLtxT0DCumKr/03R3b6R377CYBWSODN6l44y3c4miIoEsOieZJuW
X-Gm-Gg: AR+sD11iYPauMdQBPlTCIQLYhvT/8Tjo13TIlDYVOvFvugFi5HbRPrVMVaTLYICRB4+
	el2regi45iVjk0rPzQRthfi5thFg804sZsfm4yDjEfh4sJhxr4PFNAnQa+DfX2oe19TiHcRKDIz
	hXHM1iZOgqxzEnH6zAmvJDWPC2/q9NAfiHL67BzMu174CuXCKR1L+PQsEAHfgW6YFxWp5Thj1ny
	GR6wSa9GsyM8XVJs5TUFx2qGcNkbqL4ApGr77l3O/iZb3OtefxODmi5YYg1xu7BzzRohb3viH9Y
	p4GgjuUJO4e9D89JIOQHPCwpxkeBtHArOtK619ArS1olWpXaNb26Axts9U1pEL59sTqDD3KgqN3
	gARh/HdAAgOYCEwkl3Xg2yBUCP/w+NulKYNrZU5/jm79BKcf3bZVNBcJfxsTCKEWvBcmx5uvwLx
	DyCUZ+E3PedhXXfl0a1FGSvBo=
X-Received: by 2002:a17:90b:4a46:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3958083fc60mr18558731a91.4.1787204901421;
        Wed, 19 Aug 2026 22:48:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3958083fc60mr18558659a91.4.1787204900954;
        Wed, 19 Aug 2026 22:48:20 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbf3dc2sm5440931a91.17.2026.08.19.22.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:48:20 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 3/7] wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
Date: Thu, 20 Aug 2026 11:18:00 +0530
Message-Id: <20260820054804.3222296-4-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x5t5thkzYBCYQzuaH1OdTgTip_bCGAIK
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a869526 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cZMQY5532DquS9h7jwgA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX1Z2BjDw5IGsA
 r1o+qdCCIWr1v7MES1IwF17cShRPzFfM2SDDbgHu7tuiKYhEccxCuW/K0jyAEKU1V5r8f0LZWzN
 MXgKHN1gSIp6+kzHrHjFrKsAZzeXpx/8Zn5RWRz6KkyvSOrYM1mexZNY21ZXIWJ+rili84wLKFh
 OvkVt28ilgUFAxMircWR/c/JXBDlfK4HOvQZduGTkneJE6yE62EloS4Ik1X1qnRVOS5d/XHkFH4
 xu3zBoprD3+skubLkOPWTTyc+Sg/KDuYOogCpsJoMlEHOQLTEy3h8KDrSBZO7koM2h0zQWaGdnv
 8OsiJm1pAEzCqVvKCTMcnl7t2qfCaYdIBQlfTTuemTFhOubW13Xfya2fY+yPlZFcoBP0TQ6RlJQ
 GskBTqgKeTSGjhfrFNhxYFaSRYCqPMGi1bpTOP9UOAprrWQfEKNca0CXde3fsgtaEUCj/2ff3mR
 8ot6g0nZ761xTMZPFcQ==
X-Proofpoint-ORIG-GUID: x5t5thkzYBCYQzuaH1OdTgTip_bCGAIK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX2P09kyoTQ1/w
 dYHWR+V5OOhdLgcn8SQuzozrQINOvb18g7KVuwhl/PFwYxsoJhSYvoWaQT9P6DloiAM3ojPPU3t
 v27JmQ7RcrzSxawMoPRj+FYiWQ7d4pM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_224822_709466_5BE5469B 
X-CRM114-Status: GOOD (  13.55  )
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

Replace DP_RXDMA_MONITOR_BUF_RING_SIZE macro with
ath12k_dp_rxdma_monitor_buf_ring_size() static inline helper. Pass the DP
profile parameters explicitly to improve type safety and make the interface
explicit.

No functional change intended.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    | 8 ++++++--
 drivers/net/wireless/ath/ath12k/dp_rx.c | 4 +++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 6540b3453cc6..9081655eae77 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -216,8 +216,6 @@ struct ath12k_pdev_dp {
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
 #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
-#define DP_RXDMA_MONITOR_BUF_RING_SIZE(ab) \
-	((ab)->profile_param->dp_params.rxdma_monitor_buf_ring_size)
 #define DP_RXDMA_MONITOR_DST_RING_SIZE(ab) \
 	((ab)->profile_param->dp_params.rxdma_monitor_dst_ring_size)
 #define DP_RXDMA_MONITOR_DESC_RING_SIZE	4096
@@ -692,6 +690,12 @@ ath12k_dp_tx_comp_ring_size(const struct ath12k_dp_profile_params *p)
 	return p->tx_comp_ring_size;
 }
 
+static inline u32
+ath12k_dp_rxdma_monitor_buf_ring_size(const struct ath12k_dp_profile_params *p)
+{
+	return p->rxdma_monitor_buf_ring_size;
+}
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8fa0e90b4531..efc419d41d21 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1692,6 +1692,8 @@ int ath12k_dp_rx_htt_setup(struct ath12k_base *ab)
 
 int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 {
+	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
+	u32 monitor_buf_ring_size = ath12k_dp_rxdma_monitor_buf_ring_size(dp_params);
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct dp_srng *srng;
 	int i, ret;
@@ -1736,7 +1738,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 		ret = ath12k_dp_srng_setup(ab,
 					   &dp->rxdma_mon_buf_ring.refill_buf_ring,
 					   HAL_RXDMA_MONITOR_BUF, 0, 0,
-					   DP_RXDMA_MONITOR_BUF_RING_SIZE(ab));
+					   monitor_buf_ring_size);
 		if (ret) {
 			ath12k_warn(ab, "failed to setup HAL_RXDMA_MONITOR_BUF\n");
 			return ret;
-- 
2.34.1


