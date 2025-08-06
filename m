Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1859C87FCB
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ir92q7l0gK6rtjU+Ab2cFXyx0jStoBczysjE/OFO7w8=; b=1i+8sFMPByUeM8mtyNr0LSYH3T
	ei98idYbI5k/60j5uelvfE+4nNNWeY9h3ppM06lt1fNhhRjIzoD4BtSJbKTD74dS9unj8gDdacukY
	DyA0Tz1H17LYPjJe2cCvmaeMPs167rXxBuUGGW7jsnu3II7X9LmU9VOwLuoHCRKt8cZJGWEa4o/Bx
	WUFbehZ4LtwMUf52eccUdOObB67zngCt4wXtkfa6T4ZhMcDNXc+lOw1+q4jYU1/t8nucMBeNOL4Ok
	/clFxOIFVI9FWhwko6XUwWXc+zUmx/eBM3rO07a7Qe+0qrjUGvGZNHfGD0NSwRF47EuJNAz38bfW5
	aKNIikKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9p-0000000EzjV-2ZGo;
	Wed, 06 Aug 2025 11:18:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9n-0000000EzhQ-02DR
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 11:18:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765FdhA019916
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 11:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=Ir92q7l0gK6rtjU+Ab2cFXyx0jStoBczysjE/OFO7w8=; b=kS
	ye6P+VyWfQw8H6ATHdRNrj+s4kJJLWDkH/zd5Fxyjl/EPETrZI+A15a2vWRqBSW6
	SW7uiY46O8M17XETfV+UldoEksvCv0vsBzEZW9RrjlpBTuYls/WvHINozlUIHLgo
	MuwXTVv6Zp14TOD7S6jHZ5ssb5PmNs6yWKp8yrbvQXbcK700g7HRSTLSkXILBnOy
	SrsJnwqVEc819pkbByXemvjkFf7TgT4MDa7BiFgCJHhRNfm9TFfs4cT/Z4SJ1xmF
	usJaoAncJzZ9s5Lx92c12i2zKLSJ7l4v5hz+Or2piVf/sXKB4LO+BG73g6I/vXQk
	tJC11MuN6dBOyG6yVVgg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1aht4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 11:18:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-75ab147e0a3so10328770b3a.3
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 04:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754479085; x=1755083885;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir92q7l0gK6rtjU+Ab2cFXyx0jStoBczysjE/OFO7w8=;
        b=UuGbTR1G/oOUprRZu13b52rq805a8NaNfYaE/ntf97RkLUx8v4uh7XclUse1HzC5Qx
         8NRBm2nMEqA9pDZhgjpcsB83j6GUQrEdgjvcKEtm+qMFxs42ApEuM9jKdVw+xo2SJSCS
         M+iA9z3ZeDHvpDTMSPNTSeyAj/XOUfdGDftrWObBEYDLCxI6cxqQY36Xr8sYe2l4c9rt
         YuWoD6/UtZdz4kZdyHzECSnhNf9RiuWnW+tsyx0gfUGW5SoLJt7Pg7CGSBwi4k1GRNY4
         KWDUe9OcALbibDcoboY1md0Z36dM8uVsp6gvVjUkopIPxjwJm5qS3fKv13Eb6YEeuNsg
         mmlA==
X-Gm-Message-State: AOJu0YyvcZrm0MBtVU+1baigJy/iUiCGM3PftdbcFi7560yYSzy4dJDC
	PjKRQVmjZeXe7DelK/NwMGHi0m2LvshFSjOBPM4ukLT4Pnp3HPj6ZUiiRvaLk92xkFjZTURf1k5
	QMPyzm6UZznTc6NVBSH39DNaAxezApX7bllrAtiWvO/gtAbbDr5AoV2PqsdbRUPNrmzA/UO3S
X-Gm-Gg: ASbGncvZPmHHvKjHIX/1YCRrNQnq/rR6ki4KcxMOiM6GT30ugwBiId+fb9oq+QRb49t
	eMZwOAALXiJlwSbDrqdytECZbyWV/+kGPKZTZXL3L0oT2CNOs6oBVPTcb+KnvlPJOT+AtCXCoX7
	lvciVyWCQxiWDREQCsPhSWN6y/yheuJnE1wBHh+Z0O3Pr8pGkp3quh0itQpvDX3aLqH0qIjB1zD
	eaOp8RptVvo+iBgfJcbipjs6+m+0XIsU0UFcFTEUxo2TCOaLc2i3C+E56DQZOAej6ONO+ZRPnku
	Euyb3EqzWuvPZN2qPh8wnAg6YUyrK9ExhmrJFDP3M53txcVwAzsCxEnikRpC/iseYidD/qQ5N7D
	91ee+XOO/fhSqiuI3TR+1/X6V3fGz66+IT/BA7u0/yNCugoYHEtoWysFdc0abPfp+XvqniYuvYg
	==
X-Received: by 2002:a05:6a21:328c:b0:234:8b24:108d with SMTP id adf61e73a8af0-240313b0ec0mr4238966637.22.1754479084419;
        Wed, 06 Aug 2025 04:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0fyWvbKc1rj97afBcSLW8nlfByDTR896iZ3YLok3hoDmjxdqOEnVq6x29QzM9f8fc70+g0w==
X-Received: by 2002:a05:6a21:328c:b0:234:8b24:108d with SMTP id adf61e73a8af0-240313b0ec0mr4238919637.22.1754479083887;
        Wed, 06 Aug 2025 04:18:03 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12984111a12.23.2025.08.06.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:18:03 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-current 4/7] wifi: ath12k: Refactor REO command to use ath12k_dp_rx_tid_rxq
Date: Wed,  6 Aug 2025 16:47:47 +0530
Message-Id: <20250806111750.3214584-5-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzTNR6b4wN5dU
 4N/bFQJtqAxv+dqrujOsUKXV+WsBVC8nWXcwq5Ry7QUyPJL0I0OB/El5Ns13H99dO7VOUEROAfg
 mFg7kDrGqAA7+L27l5E5AASyeCuRsYRg935NUvgtpKXgsL9KpHyLSrDnayM6tE7mJoEKzaiSMs2
 85AUFQN6YV4sGpfPGP1SKVGMKoJEEMz9CO+Zg//1nBUyFQHKYaTuaOKhLmD8gVC+EyfcVMoPC5T
 rXioHm402aRQe2zmSgVjDAzH1SDMOKjiEhhxgSzKweHC+A2H9ON9K/+QEqAhmo1Gi71DMzzceF/
 5r/tBYGI1spdQyUlviKJomjbtiTgPfEPv+8jyJhhxYykcG5eTbTi3tMYTAVP63PVWTI6WZGMCgk
 sXS80IS+
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=689339ee cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KD_jr8PvZQrAthsRHXcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: JMqWwSzMX0nT6YlN_pV2UMMxP_BOxBMm
X-Proofpoint-GUID: JMqWwSzMX0nT6YlN_pV2UMMxP_BOxBMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_041807_177056_6D84F984 
X-CRM114-Status: GOOD (  15.29  )
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

Introduce ath12k_dp_rx_tid_rxq as a lightweight structure to represent
only the necessary fields for REO command construction. Replace direct
usage of ath12k_dp_rx_tid in REO command paths with this new structure.

This decouples REO command logic from internal TID state representation,
improves modularity, and reduces unnecessary data dependencies.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 46 +++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.h | 10 ++++--
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 0337355262f2..fbebc79024cf 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -22,7 +22,7 @@
 #define ATH12K_DP_RX_FRAGMENT_TIMEOUT_MS (2 * HZ)
 
 static int ath12k_dp_rx_tid_delete_handler(struct ath12k_base *ab,
-					     struct ath12k_dp_rx_tid *rx_tid);
+					   struct ath12k_dp_rx_tid_rxq *rx_tid);
 
 static enum hal_encrypt_type ath12k_dp_rx_h_enctype(struct ath12k_base *ab,
 						    struct hal_rx_desc *desc)
@@ -584,6 +584,14 @@ static int ath12k_dp_rx_pdev_srng_alloc(struct ath12k *ar)
 	return 0;
 }
 
+static void ath12k_dp_init_rx_tid_rxq(struct ath12k_dp_rx_tid_rxq *rx_tid_rxq,
+				      struct ath12k_dp_rx_tid *rx_tid)
+{
+	rx_tid_rxq->tid = rx_tid->tid;
+	rx_tid_rxq->active = rx_tid->active;
+	rx_tid_rxq->qbuf = rx_tid->qbuf;
+}
+
 static void ath12k_dp_rx_tid_cleanup(struct ath12k_base *ab,
 				     struct ath12k_reoq_buf *tid_qbuf)
 {
@@ -621,7 +629,7 @@ void ath12k_dp_rx_reo_cmd_list_cleanup(struct ath12k_base *ab)
 static void ath12k_dp_reo_cmd_free(struct ath12k_dp *dp, void *ctx,
 				   enum hal_reo_cmd_status status)
 {
-	struct ath12k_dp_rx_tid *rx_tid = ctx;
+	struct ath12k_dp_rx_tid_rxq *rx_tid = ctx;
 
 	if (status != HAL_REO_CMD_SUCCESS)
 		ath12k_warn(dp->ab, "failed to flush rx tid hw desc, tid %d status %d\n",
@@ -630,7 +638,8 @@ static void ath12k_dp_reo_cmd_free(struct ath12k_dp *dp, void *ctx,
 	ath12k_dp_rx_tid_cleanup(dp->ab, &rx_tid->qbuf);
 }
 
-static int ath12k_dp_reo_cmd_send(struct ath12k_base *ab, struct ath12k_dp_rx_tid *rx_tid,
+static int ath12k_dp_reo_cmd_send(struct ath12k_base *ab,
+				  struct ath12k_dp_rx_tid_rxq *rx_tid,
 				  enum hal_reo_cmd_type type,
 				  struct ath12k_hal_reo_cmd *cmd,
 				  void (*cb)(struct ath12k_dp *dp, void *ctx,
@@ -676,7 +685,7 @@ static int ath12k_dp_reo_cmd_send(struct ath12k_base *ab, struct ath12k_dp_rx_ti
 }
 
 static void ath12k_dp_reo_cache_flush(struct ath12k_base *ab,
-				      struct ath12k_dp_rx_tid *rx_tid)
+				      struct ath12k_dp_rx_tid_rxq *rx_tid)
 {
 	struct ath12k_hal_reo_cmd cmd = {};
 	unsigned long tot_desc_sz, desc_sz;
@@ -719,7 +728,7 @@ static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 				      enum hal_reo_cmd_status status)
 {
 	struct ath12k_base *ab = dp->ab;
-	struct ath12k_dp_rx_tid *rx_tid = ctx;
+	struct ath12k_dp_rx_tid_rxq *rx_tid = ctx;
 	struct ath12k_dp_rx_reo_cache_flush_elem *elem, *tmp;
 
 	if (status == HAL_REO_CMD_DRAIN) {
@@ -774,7 +783,7 @@ static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 }
 
 static int ath12k_dp_rx_tid_delete_handler(struct ath12k_base *ab,
-					     struct ath12k_dp_rx_tid *rx_tid)
+					   struct ath12k_dp_rx_tid_rxq *rx_tid)
 {
 	struct ath12k_hal_reo_cmd cmd = {};
 
@@ -849,11 +858,14 @@ void ath12k_dp_rx_peer_tid_delete(struct ath12k *ar,
 {
 	struct ath12k_dp_rx_tid *rx_tid = &peer->rx_tid[tid];
 	int ret;
+	struct ath12k_dp_rx_tid_rxq rx_tid_rxq;
 
 	if (!rx_tid->active)
 		return;
 
-	ret = ath12k_dp_rx_tid_delete_handler(ar->ab, rx_tid);
+	ath12k_dp_init_rx_tid_rxq(&rx_tid_rxq, rx_tid);
+
+	ret = ath12k_dp_rx_tid_delete_handler(ar->ab, &rx_tid_rxq);
 	if (ret) {
 		ath12k_err(ar->ab, "failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid %d (%d)\n",
 			   tid, ret);
@@ -950,9 +962,12 @@ static int ath12k_peer_rx_tid_reo_update(struct ath12k *ar,
 {
 	struct ath12k_hal_reo_cmd cmd = {};
 	int ret;
+	struct ath12k_dp_rx_tid_rxq rx_tid_rxq;
 
-	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
-	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+	ath12k_dp_init_rx_tid_rxq(&rx_tid_rxq, rx_tid);
+
+	cmd.addr_lo = lower_32_bits(rx_tid_rxq.qbuf.paddr_aligned);
+	cmd.addr_hi = upper_32_bits(rx_tid_rxq.qbuf.paddr_aligned);
 	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
 	cmd.upd0 = HAL_REO_CMD_UPD0_BA_WINDOW_SIZE;
 	cmd.ba_window_size = ba_win_sz;
@@ -962,12 +977,12 @@ static int ath12k_peer_rx_tid_reo_update(struct ath12k *ar,
 		cmd.upd2 = u32_encode_bits(ssn, HAL_REO_CMD_UPD2_SSN);
 	}
 
-	ret = ath12k_dp_reo_cmd_send(ar->ab, rx_tid,
+	ret = ath12k_dp_reo_cmd_send(ar->ab, &rx_tid_rxq,
 				     HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
 				     NULL);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to update rx tid queue, tid %d (%d)\n",
-			    rx_tid->tid, ret);
+			    rx_tid_rxq.tid, ret);
 		return ret;
 	}
 
@@ -1216,6 +1231,7 @@ int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_link_vif *arvif,
 	struct ath12k_hal_reo_cmd cmd = {};
 	struct ath12k_peer *peer;
 	struct ath12k_dp_rx_tid *rx_tid;
+	struct ath12k_dp_rx_tid_rxq rx_tid_rxq;
 	u8 tid;
 	int ret = 0;
 
@@ -1262,9 +1278,11 @@ int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_link_vif *arvif,
 		rx_tid = &peer->rx_tid[tid];
 		if (!rx_tid->active)
 			continue;
-		cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
-		cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
-		ret = ath12k_dp_reo_cmd_send(ab, rx_tid,
+
+		ath12k_dp_init_rx_tid_rxq(&rx_tid_rxq, rx_tid);
+		cmd.addr_lo = lower_32_bits(rx_tid_rxq.qbuf.paddr_aligned);
+		cmd.addr_hi = upper_32_bits(rx_tid_rxq.qbuf.paddr_aligned);
+		ret = ath12k_dp_reo_cmd_send(ab, &rx_tid_rxq,
 					     HAL_REO_CMD_UPDATE_RX_QUEUE,
 					     &cmd, NULL);
 		if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index e971a314bd2d..da2332236b77 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -31,15 +31,21 @@ struct ath12k_dp_rx_tid {
 	struct ath12k_base *ab;
 };
 
+struct ath12k_dp_rx_tid_rxq {
+	u8 tid;
+	bool active;
+	struct ath12k_reoq_buf qbuf;
+};
+
 struct ath12k_dp_rx_reo_cache_flush_elem {
 	struct list_head list;
-	struct ath12k_dp_rx_tid data;
+	struct ath12k_dp_rx_tid_rxq data;
 	unsigned long ts;
 };
 
 struct ath12k_dp_rx_reo_cmd {
 	struct list_head list;
-	struct ath12k_dp_rx_tid data;
+	struct ath12k_dp_rx_tid_rxq data;
 	int cmd_num;
 	void (*handler)(struct ath12k_dp *dp, void *ctx,
 			enum hal_reo_cmd_status status);
-- 
2.17.1


