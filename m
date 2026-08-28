Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDB8C61DB9
	for <ath12k@archiver.kernel.org>; Fri, 28 Aug 2026 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o2fQ68e9gCnXrHQgHUSdcidWOyupvsi9PXkryOUrOFA=; b=yr+QLkTnThvh6pbKJ1RnP56W1v
	Rh4/gnbVwLF53Y/YKXoX6bKGH3p8rc1rdSxrsWKrqHZxuXYr607jhefGH+PucMOpNXBU6EBlX/zu+
	kGfS3KcqYfGbTQhIIZWcpQZeeM6YZSCCM9PhV96lWOaFpEn3dN9KzecjRcZRB0t6qUOEmfWfhxv0J
	7fOWmIeelbJmPBEor7aD5Htv4hyQkTmZHsfMVzhcRU/+SM18YmAXmwfbQzaZcIniShcqn4iX+9JUo
	vwMs+bsCM0qBLEsTotSlzrmZijcho5ahVoqPYsU2HWQNL9dO4l8cBkikDX9GLvl6GNsdBzNh6mkMI
	+bJb5y7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqV8-00000005ElW-2ghd;
	Fri, 28 Aug 2026 06:55:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqV5-00000005Ekj-37ia
	for ath12k@lists.infradead.org;
	Fri, 28 Aug 2026 06:55:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66Z771520544
	for <ath12k@lists.infradead.org>; Fri, 28 Aug 2026 06:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o2fQ68e9gCnXrHQgHUSdcidWOyupvsi9PXk
	ryOUrOFA=; b=Iie2yS+jxX3GpCmehl1uLyCBDqMk6QmuhSlNC8Ck1zaZLwtfp10
	GDMb3h9xrzVGovTY0bzA8tjlAf+T/0wrLjXxvyy5zL+QivFtUVeu/t5B17R8M2j+
	OZnJXlZmk15Da1s5WB3vVsnNk/68M6YK9d4/akzWDhDQP4ISDm7Cz/s/EwQCGTIl
	RKOHyzx44S0TmWlHHbO3Hea8yfSq2TqLTUOuUrWYBX3RqWGh+hNOAFIDnnjJTHan
	ooRkiREQ385QI8dVQPvkQaLSN635z+yCZfDbM7w9X8cYvFKiI7ud1q+wtX5qk2pV
	auAK4HhmjGcrPh2Q/RcvRRGOZKyntUVNMFQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu8e9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 28 Aug 2026 06:55:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1175957a91.0
        for <ath12k@lists.infradead.org>; Thu, 27 Aug 2026 23:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787900142; x=1788504942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2fQ68e9gCnXrHQgHUSdcidWOyupvsi9PXkryOUrOFA=;
        b=N92u3F9G0LhmJ2oPWxua4KgaViULbpr2qICJMs/ldQ0mi2VZSzBSrRnlA77Uju5has
         XLWn/FpSAB9DJC2qNvN/h8j3HSNxgwm5y1knbMjBuqmyvX6PUVFqABhUll2ou4T8U9rl
         rq5ijegjI+KJbT7L/mt5OSzPd97gzkGfDT1aIvKPCCk46JWPFCYwp1rU88YcLrSBn/i3
         M8mrdTcVIhidYUVj8vyxuBHfysNYOwdValFAIjnh6G2MKq19lrij52z8zdOMm0Rshkn7
         5uSoMh0J5PBpKQrOP5I6+xv3QoB5BHq0OJ/SytMFZ6k7/WZ06CPW7TWEMqdSV68LHx23
         V3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900142; x=1788504942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2fQ68e9gCnXrHQgHUSdcidWOyupvsi9PXkryOUrOFA=;
        b=rTM3fo66YQzm0h07+wjW9PGz5AOeSu6uFNYz/6GoYMEopbKorwFBm5LwgCNtEWbXjF
         auqDUqGJsPloAprMUI1+BYhtk0y9WtoqcmtYlLxe6fIhi+UsASw0Iz+oevWaQs7owwgT
         ZItOrJjw6RdCgZuEBlTN/ncVtDbBjY8NwG9fhWzJPNAJs+nHTmDXvqTuJdiRdtjtoseL
         gpRmFnaOoddTKWhwug/38v/QCGA8PSXf7FkRtTdsF9aIGvHtzIfZAEZThkwPJjhUwcqf
         g2PtvzYl3icrdM1/rEp2CBRjUshrewPGIKfby1vpqvpC3NLytwEUwhcBzBSbN6aO30td
         Na5Q==
X-Gm-Message-State: AFuF++liLX/oa2b+rIuosgKS1PCs0lfG/3GKMwbYV2RA76JFTy6hnRzl
	/wLVdyUScVp+f9zvDdN0HxRyLxGKOcayqWqeuZPfU1reDbH7HQo4gRiO6y4T2LpgtoXnTr0eWq+
	Q9+mxbES5GkxAc50/hCx2UidqEn+3JhcQ/1xLjOs1E2R4efZ1yHNjnZGq7RUXPU66YJcw5P6G
X-Gm-Gg: AR+sD12Fj+AkN/zGi/nmYfkSC8/LwVwTCYrU8jJN+Zqu7lEAiHpkhcQ1/nmS63gqsan
	o7y5NrFuyWouGIb75pNmbzmoLCf8AlJEJSYTT74vnDe6HDAz3RJCXexFyarW9XqyyFgY65Re1Vb
	iOPhSNz6oedWjJe5AZKEqUTyHex5iTBPmdV9p4p/cFcBoHxzHkQ2uUzSu8tXHMHUZQ2DTgT7mUk
	cWVFt9cX0RXih4pTDZWLDMOlW35PrMSwpJQJ7m+gXt+pYB1biF8OJvPuoT/7FMQonw46/9u48PD
	oO8GEvZLlzgzZcXoLUcHjqzjkG/NUpzro85TLmN9jIwhodanVnKHJA0nGNIZW3a+ahBiworTl1v
	oU6hqmtN3uBK0aXGCKcZ+mvALxgFzRM9cd7GjLfWZb6s0h9gZr8TIemklIn/QWbZDMAC3WUMsAq
	q+ksUs3YTqCga44w==
X-Received: by 2002:a17:90a:15d6:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-396d28e1164mr6132971a91.3.1787900141585;
        Thu, 27 Aug 2026 23:55:41 -0700 (PDT)
X-Received: by 2002:a17:90a:15d6:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-396d28e1164mr6132910a91.3.1787900141131;
        Thu, 27 Aug 2026 23:55:41 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d29b342dsm804873a91.1.2026.08.27.23.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:55:40 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: preserve PPDU state across monitor status buffers
Date: Fri, 28 Aug 2026 14:55:34 +0800
Message-ID: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a9130ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Pa4Wmf_9FgtUqcf0cncA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: gbjLrh9d65VjwYH10AE4W9yt_P04BCu2
X-Proofpoint-GUID: gbjLrh9d65VjwYH10AE4W9yt_P04BCu2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA1OCBTYWx0ZWRfX8du6rNL3NcZm
 HOI8xgCTT5oRWEryX9yH7dGW0aqt/ZOzs4ShPWS1Lvtzf3YXCe3sKggVpOnXKT8XZgbhrC7IOoY
 ZQJXynvsw0o1gRo8Jypf1vK7t7JFtlY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA1OCBTYWx0ZWRfX6R5HbuvAisuP
 0IgCY0YePQijhTXHn8dwhEcu+/Yylg5blLoDblyAO3NC872HZpbwHsgM7gUO72cSpR7Xwp2Y7JL
 sv2FSRaQoNUf/LsHVIqR+KMm63m+w9eBgZaZ0GZJWkhg6KHgRuootpbB5jSHE/a4tt4AioUM4n9
 N1B5sZHvH1qhipbHCH/gZ+eH64hr5uHeYk8OIdCsRHWxSoD74mSJp0XLswf4PJgCqwRT4BQjOg8
 pR9pyj55J6fiS0PC3pdYA+HRtYNPf7ywFeNGvEUAaiielUCEDremCJphzxyZ3ycT246lh0FHC9E
 bFu9iSiFqsiJ637TDIJrZY4XsjotX+LyDf4iTP735AAhdq6tuKqu8pRoTCqztVvq3Uf3y6yLdnw
 37xWkHpO0rZp9UysqeLYeE7QoYUMn8HhW3I5HVRssuc896EEexXVqTq/YNdalhHrkPEqgEP7u5c
 xMTTtql27RlJ5EPchrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_235543_790937_BC8333FF 
X-CRM114-Status: GOOD (  14.36  )
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

A monitor PPDU may span multiple status buffers. However,
__ath12k_wifi7_dp_mon_process_ring() clears mon_ppdu_info before
processing every buffer.

As a result, continuation buffers lose PPDU state collected from
earlier buffers, including ppdu_id and PHY metadata.

This can cause monitor RX processing to fail when
ath12k_wifi7_dp_rx_mon_dest_process() observes a PPDU ID mismatch
between status and destination rings, preventing MSDUs from being
delivered. It can also produce incomplete EHT metadata that triggers
warnings from mac80211:
	Rate marked as an EHT rate but data is invalid: MCS:0, NSS:0

ath12k_wifi7_dp_mon_srng_process() already tracks status TLV
continuations via ppdu_continuation. Apply the same logic here and
only reinitialize mon_ppdu_info when starting a new PPDU.

mon_ppdu_info persists across ar->monitor_started transitions. If
monitor mode stops while a PPDU is mid-continuation, ppdu_continuation
stays set and could leak into the next monitor session. Reset it
when monitor mode starts.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 78d3d907d0f1 ("wifi: ath12k: add support to reap and process monitor status ring")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c         |  7 ++++++
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 23 +++++++++++--------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9a775602775d..bda055a86f06 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1502,6 +1502,13 @@ static int ath12k_mac_monitor_start(struct ath12k *ar)
 		return ret;
 	}
 
+	/*
+	 * A previous monitor session may have stopped mid-PPDU, leaving
+	 * ppdu_continuation set. Clear it so the first status buffer of
+	 * this session is not merged with stale state from before.
+	 */
+	ar->dp.mon_data.mon_ppdu_info.ppdu_continuation = false;
+
 	ar->monitor_started = true;
 	ar->num_started_vdevs++;
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 016b0c38e51e..ded7d56cd79b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -3211,18 +3211,23 @@ __ath12k_wifi7_dp_mon_process_ring(struct ath12k *ar, int mac_id,
 		goto exit;
 
 	while ((skb = __skb_dequeue(&skb_list))) {
-		memset(ppdu_info, 0, sizeof(*ppdu_info));
-		ppdu_info->peer_id = HAL_INVALID_PEERID;
+		if (!ppdu_info->ppdu_continuation)
+			ath12k_wifi7_dp_mon_rx_memset_ppdu_info(ppdu_info);
 
 		hal_status = ath12k_wifi7_dp_mon_parse_rx_dest(&ar->dp, pmon, skb);
 
-		if (ar->monitor_started &&
-		    pmon->mon_ppdu_status == DP_PPDU_STATUS_START &&
-		    hal_status == HAL_TLV_STATUS_PPDU_DONE) {
-			rx_mon_stats->status_ppdu_done++;
-			pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
-			ath12k_wifi7_dp_rx_mon_dest_process(ar, mac_id, *budget, napi);
-			pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+		if (hal_status == HAL_TLV_STATUS_PPDU_DONE) {
+			ppdu_info->ppdu_continuation = false;
+			if (ar->monitor_started &&
+			    pmon->mon_ppdu_status == DP_PPDU_STATUS_START) {
+				rx_mon_stats->status_ppdu_done++;
+				pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
+				ath12k_wifi7_dp_rx_mon_dest_process(ar, mac_id,
+								    *budget, napi);
+				pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+			}
+		} else {
+			ppdu_info->ppdu_continuation = true;
 		}
 
 		dev_kfree_skb_any(skb);

base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.34.1


