Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E97C5B572
	for <ath12k@archiver.kernel.org>; Sat, 15 Aug 2026 01:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJICPyMYD71slts6QyaSLY21UYKJuFWLkG8AaM+C45g=; b=wiDTPh/wpHEjj+ZcKzd7kvl+fq
	qJgdk4iMOBVJBKZppJsxQakZwsA3X4oMIlQDscpbfySDkxy9bQzGgxQ4BSZ9zMXlBieVOk6tW3+Ix
	7/Moh1Wy9ke/3FCTFWEoBsmYmtT6As95tqzh/rzbCwLUruj6Xam9eDbRDyJrB96xYwiksIRsY/C7T
	udRnCq9NJsnJaVSGAjb2XmzC7bLMqAf8GxYMGuDc0Ogl1GcTrh4EYH7dCFZ7JsiR5dXzcz579BwTE
	USayE3d5lbATMDSM0w9397M65Wn9i74U90Uxd15poefKkcZ3rKtLwNjMqfaN3F7Z4ffGxmKiTP9v+
	GQ6w6FBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3Qz-00000003NLG-2Par;
	Sat, 15 Aug 2026 01:43:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3Qw-00000003NKv-3i9P
	for ath12k@lists.infradead.org;
	Sat, 15 Aug 2026 01:43:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67F0JZ183170645
	for <ath12k@lists.infradead.org>; Sat, 15 Aug 2026 01:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HJICPyMYD71slts6QyaSLY21UYKJuFWLkG8
	AaM+C45g=; b=ZbngagliMlc2ECMrHwp8wE39CJ2cv8CVHJ0SC9loOJkoQOtpkR2
	bx6TPxeoSk6li+fwBgnM6xu7+LtUIGeoLQjiqhxItJqdcxJqZJI5UwtRgL2cdXbG
	YWcXXGHaX13hXl1MyaOtiJZv1HdJbD48QDatxoIDxptka2XNN+3HtkYKl9szNxkn
	bem1rAmSwso8+kTBEotLm5kAA+UJhNjmMSaVSMofoz2XtP2x8Yj9W6ycZiwH4F//
	3bgt15me8eD5bNn8oRNwRU0vhDrxsA0zu3ochmA/xnvAYp9YVSEjgaXqTSMIpH+g
	H8OpaAjtopO5lu0R96cpULXELXnCTxNqjUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2dfn05tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 15 Aug 2026 01:43:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d52734fc41so24961905ad.1
        for <ath12k@lists.infradead.org>; Fri, 14 Aug 2026 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786758216; x=1787363016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJICPyMYD71slts6QyaSLY21UYKJuFWLkG8AaM+C45g=;
        b=Q9JsfiDW/f3Exv4qMTTvL7g3T8fhYaSINrJtLqEHuj8TLExBXU9TeveF1Ym7qQVZ0n
         fvc/VAma8up02oWIIWI1y14o0946f3ygEN0tZQ602Wmx/a4hX9FWP/LtmZA8xzDMCZHN
         CwvHStQ0v7aP0DBMjnF7w5eiQ0EwBo4CH+eiRquGz4gdOUQ9bKUQLk+KOd8OhdVlW0Z5
         Eag35JdboYdOvHE1JNUag8aALBJJay47tGHR9FKA89lsQEMFdgsWKSObhOxYFCaS8+hO
         PO/Grs4xqIiobJqOuOFQxCRoqyqS5jP/Xnagdra65EBKhgvLd23oRTWMu2308KSF4WRe
         B9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786758216; x=1787363016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJICPyMYD71slts6QyaSLY21UYKJuFWLkG8AaM+C45g=;
        b=i2NO1ZzCpeIi+SRqdkPS9sSiJ7Oj0VyJsF5ZIuxgstJf+dLQd9H+yg1YALbnjEbt5t
         6jO935SRye41Won8ovomm+pOLV529F1N9Snp+u5WYVuDYizKmOBl2kKzqRuFrZR0Xu+f
         YvfDbVDmjwIwQd5FrvBcw7/N4MDp+BJOg42N6cOTEB8hWG1u5X8IW31rvLi71S41l6dA
         MLKlYLp1+4aBO60bJrZjMbhyDGsQuzoeOe01emqbKV/hPeiGG67ezFdz++GzBPd1IbjH
         rlySHHO5zRecOfxN9gOA+dyUBLfAbk3pJ8KZWmUR4KbiodnjMMs9AfyMUf3V8zmMSqI/
         b5mg==
X-Gm-Message-State: AOJu0YzI1Tc1HbzXsUGpjcqqU4vie+PT3SWjRagXIO9f8tB2PxiAdh7b
	54HnOCOVy27SZ8YLH5+gHqXPgBfwPQYyL9aze69E0HZARr6NpuvdwRvWhWAKcCqjBigGoEInd2I
	yb6/UmzFIKY2lPzrij7qv1ERIvWcO9hMM+JikS4hr5Z9ADk4MCkJMYtqqsO/v+CKIAN7XQTP2WL
	c=
X-Gm-Gg: AR+sD12xvn/WtOHShpA309TXWidnodVjZhJ0A37uFD9yAyJcgMkozRksBQYb7Lx2IcE
	J9BS7BAvzBYA98tFAF+OjrrGvOSVeoC7kLEBO9tBleQSlmOu1QdtDY7MtTAHg40ujzcYNF1MqKo
	TlK+zaaEyuHwvDJ3+x4vU7P8SBlwBaWO9VmoV7I5WkZk7JHgKAy9eN+eIPesbQilFCHqWRWx2YJ
	ArUw38+PD2N9L1y52UOf+IhAxgxMs+V6DTAiLq+YDe5oEq+wBNUivnZvnLcl1kVHgpv5/EueJ57
	iXcuDcVoLyfucTt2cadk0hH3FLrqDDuXsjArhqQNJ0GpfarO1YZH9fRqQbCKd/2qBquAtm3i/An
	fi6GIZMq3YEMylV9DBm5ZhvjDoEgURadC5y6ixAV9yGD01t6AYhhycrwpSHc=
X-Received: by 2002:a17:902:e948:b0:2d0:cc92:f7a7 with SMTP id d9443c01a7336-2d3b0e440a4mr122923855ad.13.1786758216106;
        Fri, 14 Aug 2026 18:43:36 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2d0:cc92:f7a7 with SMTP id d9443c01a7336-2d3b0e440a4mr122923445ad.13.1786758215670;
        Fri, 14 Aug 2026 18:43:35 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb8937bsm16418705ad.65.2026.08.14.18.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 18:43:35 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on QCC2072
Date: Sat, 15 Aug 2026 09:43:29 +0800
Message-Id: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LV42HByWxw-IEm1AM4zs-fVuDOtgu60m
X-Authority-Analysis: v=2.4 cv=dM+WXuZb c=1 sm=1 tr=0 ts=6a7fc449 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wvyN2lhKwasRc6zrnsMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: LV42HByWxw-IEm1AM4zs-fVuDOtgu60m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDAxMCBTYWx0ZWRfX4kf2MYvcNl0E
 yEM/Ro7tf/E6y5f4mz4ZMUGYGpdxFX4ygUnRTI6nYtO33O8qLvZfdig833Nq2gNZn3hMujH6Wk/
 auw3O6SI6vDbWGgvCQwfP5nbLTqgSda/eGkcSCiCosLWNwcqiub8fl5H/6qYGN2PplfC3rGuGfw
 VYcrBHf0DZgi/R2cgJzCmc7+EDBm13XWOx+dN9/8Myyln4hsyPKt0zuunmHc8pAwPM4jAn8Jau/
 Gkd4qy+QjG/FN0OQm96HjwaR2vYENcoHT1q10/hQg/4YiowFShovG9vGcJrjC/TuBlhaNF/EkfR
 JHRZK30EWCaHnvPhl8A5fENlUwu+YuuleTdGS/YrlB4JL4hp/GBo2D82yUZvidD8B8nOLj/8kiG
 SMOI85m0mPnUzGKP//yVfzKXZDG0J2/5POPTAyMqnCjyVMxgQpmBytU/DIMkLqmZVLhcyUB5Qur
 WtC369dSQnfuUZBonnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDAxMCBTYWx0ZWRfXxw6H4B93KRw4
 IDynbb7sj8L68Om17vnjZB4tOf4qd3gA90DvsOzGNNZSHo2nUPjkIuNsNF7dLFQtuQsX30B+6qz
 YvzXN4hOWb945dFLYQQtaUwsVKS1JnE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_08,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_184339_146789_96AA8B1E 
X-CRM114-Status: GOOD (  17.22  )
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

In MLO connections, ath12k_wifi7_dp_rx_set_link_id_wcn7850() attempts
to resolve the IEEE 802.11 link ID for received frames by matching
rxcb->peer_id against the link_peer->peer_id entries in
dp_peer->link_peers[].

This fails for EAPOL frames because the firmware delivers them via
the MLD peer path. In this case, rxcb->peer_id contains an MLD peer
ID while link_peer->peer_id contains a link peer ID. The mismatch
prevents status->link_valid from being set.

When mac80211 receives a data frame with link_valid=0 for an MLO
station, it calls link_sta_info_get_bss() with hdr->addr2 to resolve
the link ID. If hdr->addr2 contains the AP MLD address rather than a
link address, the lookup fails because link_sta_info_get_bss()
indexes by link address, and the frame is dropped in
__ieee80211_rx_handle_packet(). This is observed on QCC2072 where
EAPOL M3 uses the MLD address,

  deauthenticated (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)

Fix this by resolving the link peer using the current operating
frequency associated with each link peer.

For 6 GHz links, the received frequency corresponds to the operating
center frequency, while for other bands it corresponds to the primary
channel frequency. Match the received frame against associated links
using the appropriate frequency for each band.

The frequency-based lookup is used only when exactly one associated
link matches the received frequency. If multiple links share the same
frequency, the match becomes ambiguous and no link ID is assigned. In
that case, leave status->link_valid unset and let mac80211 fall back
to its own link resolution logic.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 55 +++++++++++++++++--
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 95d87dd67872..a3d016d0fb5c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -2331,20 +2331,63 @@ ath12k_wifi7_dp_rx_set_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
 				       struct ath12k_skb_rxcb *rxcb,
 				       struct ieee80211_rx_status *status)
 {
-	struct ath12k_dp_link_peer *link_peer;
+	struct ath12k_dp_link_peer *lp, *link_peer = NULL;
+	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_chanctx_conf *ctx;
+	struct ieee80211_vif *vif;
+	struct ath12k_sta *ahsta;
 	unsigned long links_map;
+	int freq;
 	int i;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "ath12k set rx link id called without rcu lock");
 
+	if (!status->freq)
+		return;
+
 	links_map = READ_ONCE(dp_peer->link_peers_map);
 	for_each_set_bit(i, &links_map, ATH12K_NUM_MAX_LINKS) {
-		link_peer = rcu_dereference(dp_peer->link_peers[i]);
-		if (link_peer && link_peer->peer_id == rxcb->peer_id) {
-			status->link_valid = 1;
-			status->link_id = link_peer->link_id;
-			return;
+		lp = rcu_dereference(dp_peer->link_peers[i]);
+		if (!lp || !lp->sta)
+			continue;
+
+		ahsta = ath12k_sta_to_ahsta(lp->sta);
+		if (unlikely(!ahsta->ahvif))
+			continue;
+
+		vif = ahsta->ahvif->vif;
+		link_conf = rcu_dereference(vif->link_conf[lp->link_id]);
+		if (!link_conf)
+			continue;
+
+		ctx = rcu_dereference(link_conf->chanctx_conf);
+		if (!ctx)
+			continue;
+
+		/*
+		 * For 6 GHz, rx_status->freq contains the operating center frequency.
+		 * For other bands, it contains the primary channel frequency.
+		 */
+		freq = status->band == NL80211_BAND_6GHZ ?
+			ctx->def.center_freq1 : ctx->def.chan->center_freq;
+		if (freq != status->freq)
+			continue;
+
+		/*
+		 * Skip freq-based lookup if multiple links share
+		 * the same frequency; the match would be ambiguous.
+		 */
+		if (link_peer) {
+			link_peer = NULL;
+			break;
 		}
+
+		link_peer = lp;
+	}
+
+	if (likely(link_peer)) {
+		status->link_valid = 1;
+		status->link_id = link_peer->link_id;
 	}
 }

base-commit: e07447e654476262558bee570f4cf456e2b32565
-- 
2.34.1


