Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265EFC44524
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oypFu45XfvZoTRTZc7SyYEzw7BoqUBfDWb3iYCCskVY=; b=noF4OaT4utyVOs0DVIhr/y2SFK
	KRCPxuS9OCpbSxD16hCJtoCAALDu/31sTQYktnJSeZss2ZAlgOJaIK8oiLryNt9KlADUql99JIXxz
	h4hx84eKjpRMtrrfUmGa9qRQNvCdJeOcntCENjLgd/rGaYzPtyOtLJYxOi+n1YXeKRono4eyFmiq0
	ZiPCIaWjzmz2a4XvUI5bmy3qYOb6OjGzfyjhRt5SPYyKkq79iwkzi3NF71nGpDMidFYBwVz+4J9Iv
	Snc2TnQIswBfuxjuDvT4PyMPliX2tTMIQ3imvJNhmaLy2nJh7Yd+vJLOPmqXDRbMWkPvD7FoOys9f
	+YSJKGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhjF-00000005zRN-3T5W;
	Mon, 20 Jul 2026 06:43:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhjC-00000005zO8-31y6
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6Rcxc1800197
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oypFu45XfvZoTRTZc7SyYEzw7BoqUBfDWb3iYCCskVY=; b=XbfQoygV92O2lRDO
	zmtsTxokfPMCpiluhidHMHyDp1K6JAUYzOuVQ7P+G1ZltN99EfkvuzjnAUh3m2do
	W4RYIns4L32dmf7446+gh0KIOY3AuQE7utHTMn1bpI0D0Of4spnJv1ZYZ1ApCJoP
	hvR0ZDIdDTTj4+p6CAL/6jwt+qgLjGXK2j33R7KjAqwkZp4ThRuPe3fpqazKMH4Q
	Pb2uWwGMgP37u9TJVfRNbIWYX3tzCfHQQ9+8asT9Px3ScakJBX+hRtRls1WwyjKv
	ggnreLnhc8O5B6ckdyxaBx3KBZSjsGIulejDMhbt02U1HKqpNFiyDNxuUNgBfEej
	jhl8iA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c6ct37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso6041453a12.3
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 23:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529829; x=1785134629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oypFu45XfvZoTRTZc7SyYEzw7BoqUBfDWb3iYCCskVY=;
        b=YWARaZpPWVGMiP6uUXtql3tFmDTC71xyJjoVbuKFJ2COqc8749uaH1+1nd9HbS8yLN
         xmjSFcexA8CPfuB0hBp8z3dsE4lAPJt6QayZBM4rfuMDlKyM6CujcbJv11bqjOKo4Gb+
         +GVvP4YbM3nbDVYNtscBZdJesJ5RhuSp0zmsFV0nyMUMXDI2XwBdl1q3VZcSMo0LGtsu
         Cpfi3hmfpiWNzV0CbH5YYbmjB2Zo6r5RpcoX30BpVzL7A24MDomthDpI4hoAj5n67i/w
         oU04PmAJh/GMITUePTn1qxr6WQSo3hHqm6FrVEJgSbLUKbIicKvmph5FLKUAcQ66qigg
         kOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529829; x=1785134629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oypFu45XfvZoTRTZc7SyYEzw7BoqUBfDWb3iYCCskVY=;
        b=goqkcZjxhlPES1fDss7NFI/YyVqoNlemsYrP6Qk3gSgOwdT/3o08YjCarIcu5tAWlB
         DW2yECW1nSpHeBUbGl2+juSe4w+rOM0Fv8ZJqWfDTjmAV4QO96DY63PyLA1mAGLxVh9K
         xG4LUs1pZxUsbBVjCjV+0bRBd3FQrnex0/2DsFeIOiOXKqRE7MOLcbBkDl5xbPwRT3CT
         /smQLigdJvOd/sN7U9c1RWUFKjxhKEWj+mA6Udy67h2hEsEMyl1YAx1ZU113gUP1m3Ai
         6FPssLvyICWOGBUmX2Uz7iL/CasC6L4FOUFM5Hc0LZjjPrJZQ1rKjLIWphTH2tKni0+s
         vjWg==
X-Forwarded-Encrypted: i=1; AHgh+RryCoKw2X+DawoThm2SkHfDY1tAjMaD9NgFa5UxIAP3tUni+sqffuFcjKim7qhBpzaNcfJ3M0c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj5mHncv/81T0hn1WS+xW2/BSbfZGzgb//M417K5H9IPyttUn0
	Z21l3wm+M2mn8rdhk1et2F8djm7FfLYbwAw0A4XCFLt9r4UdGjGrJtx8bkSzRQmkbT+356WfDPr
	B/9WqxRLVxYUtYfEQzvq9vWvDpyHXdN4N8DcDfeeSzcm3KmgQnFQKeflOclf6WY0/
X-Gm-Gg: AfdE7cnrcb9Zw5ypoCH2WjemRVmPEjJmz0AKOuAh6X3GzNcYF+PMwO4JtRLtXOlGvOS
	yJLZDnZ9jsG7iT+k9HSf7AZtOSbXsXxYjRO6yebpU1n0LpP2mlhdpzcoIsS3cvGjCJ/7PrOLUGA
	d0OJQ/dHLgYxB3dr/q+PlbnSeetnf4sodVQX3XEL/czABlCJuM7RG1aLXFqW5o37CNLfVtLo6V/
	bZNHT+VxaTyBcC0x4WbXE+PvlyRyX3IICQNJsy3qMPj0/qsu6ClhnPvGqFIAfLgBJf1/+5odZPi
	wPRiAcZJb+vctZjL81jVQw5S5ZUYQh+tvNElAsAmOpHmUQGIBmgug4v6r2Y2Gzry6Qc8GFny0ZD
	6rVU+GWSJmFUkLxkZvbM8grk+XcmDhmw7gWk0aUShYSEHvYeeTgqGxQ==
X-Received: by 2002:a05:6a00:3e26:b0:848:2f74:d8d9 with SMTP id d2e1a72fcca58-84c294c875fmr11304456b3a.74.1784529828589;
        Sun, 19 Jul 2026 23:43:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e26:b0:848:2f74:d8d9 with SMTP id d2e1a72fcca58-84c294c875fmr11304439b3a.74.1784529828085;
        Sun, 19 Jul 2026 23:43:48 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm3812097b3a.42.2026.07.19.23.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:43:46 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:43:28 +0800
Subject: [PATCH ath-current v2 7/8] wifi: ath12k: defer dp_peer
 registration when firmware allocates MLD peer ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ath12k-fw-allocated-ml-peer-id-v2-7-630632758a80@oss.qualcomm.com>
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Ahfk35IB3lJE-c3JlGdF1VWF0qP56yXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfXz5lalcqYROO7
 EJw90NilBF3Upn8COKm+5hOZjadseHY/RNtClx+jUM3cKe2VINuUYYc24ZOL8/jI0Z01FzB6ukl
 AXo7cIdAAr6xin76Gl+ImcwRE/jrXGDRhsFwHLG3qAy43RRwh+KmZ6lQo6llRHYocN39Tcua3dV
 ENayt6fY6lIieYdpFlbOJYl8AuESwL0nKVgxzrCFmZ0bdO8ihJimcAj9zJjmvbcztflOehc7FRD
 +q8p/WzqI3g4lIsF0eFIVzTzRowbdtPUYuyXt1RIXobBo0JhgAoNvl4yijml+LXFfASFU2m5j80
 T1+AjTkTSR+CFtgqC8POPw+z0M/TGHgYr2nJOK2rpcHIsunYvPydCkCT3CYowxi3rvza4hp1h0F
 T9J+aEdbGPdQT1s9HLyBAp2Uj07RuS4VEMjhm0GJLoOdIJdzLM52NpV9ciNp4qjxiW5fXDRUnqY
 Rx5waLix9SOGs67sAig==
X-Proofpoint-ORIG-GUID: Ahfk35IB3lJE-c3JlGdF1VWF0qP56yXc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfXzNOc7FhAmN4L
 LB0CsiS9McTDiLP8nEhU0kv0pFwZ4uC5Ok1Iu45W01m6SjnjQgUiNNQiRaiu9bSCmqUU9gJ3uqr
 3K5FT6rDooVhyJCdKCqlOPZpo9UDlHk=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5dc3a5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DmUR2gHJotVURrrF6hgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234350_886178_3929839F 
X-CRM114-Status: GOOD (  24.66  )
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

For chips with host_alloc_ml_id=true (QCN9274 etc.), the host allocates
the MLD peer ID up front; ath12k_dp_peer_create() publishes the dp_peer
into dp_hw->dp_peers[] using that ID immediately. WCN7850/QCC2072 does
not work that way: the firmware picks the ID and only tells the host
afterwards via HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP, so the publication has
to be delayed until the event arrives.

Introduce ATH12K_MLO_PEER_ID_PENDING (0xFFFE) as a sentinel for "is_mlo,
but ID not yet known". On the firmware-allocates path:

  - ath12k_mac_op_sta_state(NOTEXIST->NONE) skips ath12k_peer_ml_alloc()
    and stores PENDING in ahsta->ml_peer_id and dp_params.peer_id;
  - ath12k_dp_peer_create() skips dp_peer registration until a real ID is
    known;
  - ath12k_peer_create() leaves peer->ml_id at INVALID so consumer sites
    do not treat PENDING as a real ID;
  - ath12k_peer_ml_free() and ath12k_mac_dp_peer_cleanup() skip the
    dp_peers[] write and the free_ml_peer_id_map clear when
    host_alloc_ml_id is false or the ID is still PENDING.

The HTT handler change that resolves the PENDING ID is added in a
follow-up patch.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_peer.c | 23 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.c     | 22 ++++++++++++++++------
 drivers/net/wireless/ath/ath12k/peer.c    | 20 +++++++++++++++++---
 4 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 1f56474efbea..8769b41f5db5 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -72,6 +72,7 @@
 
 #define ATH12K_MAX_MLO_PEERS            256
 #define ATH12K_MLO_PEER_ID_INVALID      0xFFFF
+#define ATH12K_MLO_PEER_ID_PENDING      0xFFFE
 
 #define ATH12K_INVALID_RSSI_FULL -1
 #define ATH12K_INVALID_RSSI_EMPTY -128
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 47d009a0d61f..2a2eae194007 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -472,7 +472,9 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	dp_peer->is_mlo = params->is_mlo;
 
 	/*
-	 * For MLO client, the host assigns the ML peer ID, so set peer_id in dp_peer
+	 * For MLO client, the ML peer ID, either known or PENDING, needs to be
+	 * initialized here since the following logic depends on it.
+	 *
 	 * For non-MLO client, host gets link peer ID from firmware and will be
 	 * assigned at the time of link peer creation
 	 */
@@ -488,13 +490,17 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
 
 	/*
-	 * For MLO client, the peer_id for ath12k_dp_peer is allocated by host
-	 * and that peer_id is known at this point, and hence this ath12k_dp_peer
-	 * can be added to the RCU table using the peer_id.
-	 * For non-MLO client, this addition to RCU table shall be done at the
-	 * time of assignment of ath12k_dp_link_peer to ath12k_dp_peer.
+	 * For an MLO client whose ML peer ID is allocated by the host, the
+	 * peer_id is known here and the dp_peer can be added to the RCU
+	 * table using it. For an MLO client on chips where the firmware
+	 * allocates the ID, peer_id is ATH12K_MLO_PEER_ID_PENDING and the
+	 * RCU table publish is deferred to the
+	 * HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP handler. For a non-MLO client
+	 * the publish happens later, at the time of assignment of
+	 * ath12k_dp_link_peer to ath12k_dp_peer.
 	 */
-	if (dp_peer->is_mlo)
+	if (dp_peer->is_mlo &&
+	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], dp_peer);
 
 	spin_unlock_bh(&dp_hw->peer_lock);
@@ -515,7 +521,8 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 		return;
 	}
 
-	if (dp_peer->is_mlo)
+	if (dp_peer->is_mlo &&
+	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
 
 	list_del(&dp_peer->list);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 485be2998180..533109f9d5bd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1285,7 +1285,9 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 	spin_lock_bh(&dp_hw->peer_lock);
 	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
 		if (dp_peer->is_mlo) {
-			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
+			if (dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
+				rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
+						   NULL);
 			ath12k_peer_ml_free(ah, ath12k_sta_to_ahsta(dp_peer->sta));
 		}
 
@@ -7746,11 +7748,19 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		/* ML sta */
 		if (sta->mlo && !ahsta->links_map &&
 		    (hweight16(sta->valid_links) == 1)) {
-			ahsta->ml_peer_id = ath12k_peer_ml_alloc(ah);
-			if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
-				ath12k_hw_warn(ah, "unable to allocate ML peer id for sta %pM",
-					       sta->addr);
-				goto exit;
+			if (ah->host_alloc_ml_id) {
+				ahsta->ml_peer_id = ath12k_peer_ml_alloc(ah);
+				if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
+					ath12k_hw_warn(ah, "unable to allocate ML peer id for sta %pM",
+						       sta->addr);
+					goto exit;
+				}
+			} else {
+				/*
+				 * firmware allocates the ML peer ID and notifies
+				 * the host via HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
+				 */
+				ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_PENDING;
 			}
 
 			dp_params.is_mlo = true;
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index ae93731b4177..25e4b79f11d6 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -230,7 +230,16 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		/* Fill ML info into created peer */
 		if (sta->mlo) {
 			ml_peer_id = ahsta->ml_peer_id;
-			peer->ml_id = ml_peer_id;
+			/*
+			 * For chips where firmware allocates the ML peer ID,
+			 * ml_peer_id is ATH12K_MLO_PEER_ID_PENDING here. The
+			 * MLO_RX_PEER_MAP HTT event handler fixes up
+			 * peer->ml_id once the ID is known.
+			 */
+			if (ml_peer_id == ATH12K_MLO_PEER_ID_PENDING)
+				peer->ml_id = ATH12K_MLO_PEER_ID_INVALID;
+			else
+				peer->ml_id = ml_peer_id;
 			ether_addr_copy(peer->ml_addr, sta->addr);
 
 			/* the assoc link is considered primary for now */
@@ -285,8 +294,13 @@ void ath12k_peer_ml_free(struct ath12k_hw *ah, struct ath12k_sta *ahsta)
 {
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
-	if (ahsta->ml_peer_id <
-	    (ATH12K_MAX_MLO_PEERS | ATH12K_PEER_ML_ID_VALID))
+	/*
+	 * Only devices that allocate the ID on the host own a slot in
+	 * free_ml_peer_id_map.
+	 */
+	if (ah->host_alloc_ml_id &&
+	    (ahsta->ml_peer_id <
+	     (ATH12K_MAX_MLO_PEERS | ATH12K_PEER_ML_ID_VALID)))
 		clear_bit(ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID,
 			  ah->free_ml_peer_id_map);
 	ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;

-- 
2.25.1


