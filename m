Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261E3C5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 05:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bq7UXOZwZ1uZy9x92HjJlrEnqrzL1xgS3ZN4+KV7xU4=; b=Tx0zlJuWEUpjvReT2mhEkpafwr
	RFZoCYKvT2Rm+8Vph8kEQ1ge7H3lfzvcRzka0hEXVnSjoDESc1LlXcfdUMKrXUCXaakvmiAmcpjfp
	bApf0OgmebQ8RnrEY8On9CtQ7GPbacjRcd2SWRuTy1baL57MLfMORR+NRwWza+ZM7m019ZW/88juV
	A86nG4jt/NfUeMIi6NOhllX6bzTLygg8jxeyS0mlibawa0JljRnzzOKLHxnH9atzVoYAmXOH01ar8
	pZCw8fF5PsRrfHGgrmmVjpcxXQvB4uc2q5dVLLHtgCUGh2D6ABeTjO4TDaBy6FZ9ZENp/excbMYKh
	YyysuZHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdc-0000000ArVU-28Es;
	Thu, 20 Aug 2026 05:48:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvda-0000000ArUp-0wUs
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 05:48:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7kAT1006347
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bq7UXOZwZ1u
	Zy9x92HjJlrEnqrzL1xgS3ZN4+KV7xU4=; b=FIoEGM77baqq64KV4wLGiSTQPf0
	l92sIqXmB8FixzmW4jK8UOW/XTKItdWSc260+8BnOR0l8GJZOpbH+apABehZskcu
	vtTCsDXV+s/o0FEwXKEpA4FgpjksVHcvkUdR1utsQjC/B+/KYuSfZzpL1DDenp0h
	ot+D8L+wRE7JCwzBuAW36nDrQItx63e5GfFs2spxpM+n/HkKPqZ3lLcQRyv1a7Dv
	4MEYm55bmkICWpNq1xyS02Ep4ueNmnURrSUXETkXTr02t/MNnAX2ZXt01j1yNtcv
	QzBr1MvuF2SaFKqfxnXofk50e47ljzbgq8GdVSzkeRQjQTI3AdnwKOQicbg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc3ah9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so3019046a91.0
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 22:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787204905; x=1787809705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bq7UXOZwZ1uZy9x92HjJlrEnqrzL1xgS3ZN4+KV7xU4=;
        b=deotwhJAELCCI3mD2nO4EC00NtKjFa+lfixldvC//6KzZsDEmzfWw9+6vZ8oZ0DC1D
         qV+sGCbKS0tX55BLAZC27XGkf1PJ/LhHm4FhGHhbosn76+/wlznSTYsgRi9BNHBS8mAx
         b7aSNPUv0Z9Vd2MIRkUtl5CMNSV3LQKuDcdhANQzo6qeOgdzPyhFKWAplvTvSRpd18y/
         UU0WgcvydCHBgUfQELaXoZVrb94XqrVQ6LRqVFxIDKJtCJJiOmbBUBPUYsN+b746deSl
         uV0AYy3UFaH75LkbzvRB30PfnwzflCxchMme+lmWvGxciif2sUGowy15/EdAUQertcal
         +IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204905; x=1787809705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bq7UXOZwZ1uZy9x92HjJlrEnqrzL1xgS3ZN4+KV7xU4=;
        b=VNpR5xyln6ndOTFnFjv5WenYuXi9azSzS4K+8z3rR+zeajoAwc+oBi+OCm4JYG3+oe
         MOijDJ/cTrNecl09q0GAhpJ2s1AQIQsi3s/KGL8iBW0fDVLW9IH8ElKt08jD+EQEinRx
         LYr9vrpXIy5smUjPjYBlsXGDQJ11P6jSyzy6xZEqOPCVc+cgveLl9J12A5zjdeSrMXzo
         3RU5N4YIY/yMFGdGEKSR9B5aHANtfZ25/KjI89D0aT/g9P0yJ0C/tz9vPQwExSNVrTzj
         SW6At5Z+ICsV76qEgxtJB1E68eqZo4teTYPeMF0mbz2bTequyHoVQqTpto0osZUwknX7
         euhA==
X-Gm-Message-State: AFuF++kcDWSEBRJZE4sG4N10oQKS+jGsoX1boREqBCg7NWA1grCM8jrP
	TiK6Je2+H0j2NIzr0sT82P5zUIB/HmOQQMVyFeeYHHDYQ1dtZ652LDsp9/HsGo69WVp3KJhMTw5
	IlcCm6z4y5TzNH83MIHDEK9HZcBL+IJ72AJWUzo8RoZItcir99KRhDaw9m0El765JMmaa3nN1
X-Gm-Gg: AR+sD124Pd1aQk3Y2f9VOdPSCN2ZC+8mnIUvezrOB7YqcDv59XbFxyYbqPo+k6KlB7y
	qm7guhhdR+OO4Y7Nam+C9mHU5ekCtIgCEjoQm/P+O7YjTSPEo3ZMBkOHhdmxxA+jkBwotksO64u
	//w2OQT4R0mQNtQ5sO4K9wPV6kTXaNE0XB31tJ4qxWvOPwypAihm8/WCRBdJAPDqaTdHIpdStKg
	Aits2Xo5L0H6IDvu1MDwlDn7rLZEOU6Cg+uB3KLj8IrbF7p06oyA/aPfmhZSI3nB/E6lhLQUY0Q
	AJKBe4K65d8yMXAiRwxTw6mqfIzLpAA+3tjulWvAbwk5FfBP2jCcHUTfV2wPo6GdtZPWM5iBFx2
	SI2IYnRUmlO9dS0xV7VZQun0YyigErBNZeD17OUkAsLiEAB5mtdVtnvVWHNV+ZUBkvEZTphl4DO
	YJSkGsdB9rqxcETtUrNmSdQWk=
X-Received: by 2002:a17:90b:4a4b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39580a4d03cmr18309273a91.2.1787204904697;
        Wed, 19 Aug 2026 22:48:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39580a4d03cmr18309212a91.2.1787204904267;
        Wed, 19 Aug 2026 22:48:24 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbf3dc2sm5440931a91.17.2026.08.19.22.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:48:23 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 4/7] wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
Date: Thu, 20 Aug 2026 11:18:01 +0530
Message-Id: <20260820054804.3222296-5-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MvEDvheXcxybyVphwig9xjiKPCTVngRU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX/0XPkgMkrMV4
 VqLthDQr1nwxb3UtjHmlM17+LZAdlCyt6vtECTAyIPb4emuxRLKNjxy/oztftUmGV/h6Wf9KaZf
 5XU5oj0chZ3qkyyNUkZVHSYk0+DUz3w=
X-Proofpoint-ORIG-GUID: MvEDvheXcxybyVphwig9xjiKPCTVngRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX/fvR4DfGdWxc
 Q0rVtbQTAFZ6cxbnHzBDPzFUgvyZUVhvfAbQvPb0hwZWG6YT3k6GRKvS9j9mwrGekbSVvFt7j2L
 ELFdeQhFgdrD5XO2RVp+5ts5J426xNjkjmEK62xtEQP/DwMfgiAcVlXcIyYNv2GOIVezdJLqSSs
 P+qk643leezILOQywcvcMUYVXF6TbOycLXOM8OVdoLWFtDlz4g8LQIMWcazIwGwgNyZEDxb0+02
 tgbq0t1nVxtT5C0DzinR4ayTqxq4P0LDN4b5wmBATXJIX1PlZO49uHg5TUnoaP+BQIchk/LhlUw
 5XQalAg9IbasZuBC9JAP43YSkzBVRsio77+5pT3jt8BhSW9sM602V7DVa0WZQ/TFb4sq9xpMjYM
 kCoT+BCTN6+cvyOcFuAY3vgwzwjpMp5hWhnnV8nyUMxS/slWavk5Dw/cOgR5PTIwz9bMi3p6P2d
 JAJFAfE4hntvlA8+7aw==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a869529 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1JRayCiR9ps1Tcsuw3IA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_224826_638544_7114E032 
X-CRM114-Status: GOOD (  15.20  )
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

Replace DP_RXDMA_MONITOR_DST_RING_SIZE macro with
ath12k_dp_rxdma_monitor_dst_ring_size() static inline helper.

Pass the DP profile parameters explicitly to improve type safety and
make the interface explicit.

No functional change intended.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    | 8 ++++++--
 drivers/net/wireless/ath/ath12k/dp_rx.c | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 9081655eae77..a7cd2535866b 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -216,8 +216,6 @@ struct ath12k_pdev_dp {
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
 #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
-#define DP_RXDMA_MONITOR_DST_RING_SIZE(ab) \
-	((ab)->profile_param->dp_params.rxdma_monitor_dst_ring_size)
 #define DP_RXDMA_MONITOR_DESC_RING_SIZE	4096
 #define DP_TX_MONITOR_BUF_RING_SIZE	4096
 #define DP_TX_MONITOR_DEST_RING_SIZE	2048
@@ -696,6 +694,12 @@ ath12k_dp_rxdma_monitor_buf_ring_size(const struct ath12k_dp_profile_params *p)
 	return p->rxdma_monitor_buf_ring_size;
 }
 
+static inline u32
+ath12k_dp_rxdma_monitor_dst_ring_size(const struct ath12k_dp_profile_params *p)
+{
+	return p->rxdma_monitor_dst_ring_size;
+}
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index efc419d41d21..31e7d47f7734 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -330,16 +330,20 @@ static int ath12k_dp_rx_pdev_srng_alloc(struct ath12k *ar)
 {
 	struct ath12k_pdev_dp *dp = &ar->dp;
 	struct ath12k_base *ab = ar->ab;
+	u32 monitor_dst_ring_size;
+	u32 mac_id = dp->mac_id;
 	int i;
 	int ret;
-	u32 mac_id = dp->mac_id;
+
+	monitor_dst_ring_size =
+		ath12k_dp_rxdma_monitor_dst_ring_size(&ab->profile_param->dp_params);
 
 	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++) {
 		ret = ath12k_dp_srng_setup(ar->ab,
 					   &dp->rxdma_mon_dst_ring[i],
 					   HAL_RXDMA_MONITOR_DST,
 					   0, mac_id + i,
-					   DP_RXDMA_MONITOR_DST_RING_SIZE(ab));
+					   monitor_dst_ring_size);
 		if (ret) {
 			ath12k_warn(ar->ab,
 				    "failed to setup HAL_RXDMA_MONITOR_DST\n");
-- 
2.34.1


