Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00298606A31A
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=09bGDK3F;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T18J+on1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USEUeHmZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bsoM33BumXlLFCYishlw3tIJRcAwHH7QLQK9BwYg4sc=; b=09bGDK3F/XB/aAWZ7Cv6ApmTO+
	Vlz6noPpAuW7kv2aWKiisZaHJ86vDQF+j7RGiHr0r2rY0AvFvqr2mpDvQvH28gDF919wMji7s8o62
	GXqby4fCwWQ8KPmLovcyVrH9oW88O7u8iYPXoXKt5cUFztnYHpNAhVcjIDOg5PK4KKpd/w30LFwDa
	4YYr+GuJmNuNRibs4+CZqjbavWhE1qGJ77DNhWx7mKRIfzt0janVeBzee+mDCM2TEdmY6X2wuJ+Ri
	M+9bbjOCNF8SzSYGr4BJeEvNUaljdclW9660tRehvMuFCVAhoGs9ll5n9eTqzIdDM+ZLCRD1n6+lo
	E71Ik/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaBy-0000000CZAk-2mgr;
	Wed, 21 Oct 2026 17:33:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaBv-0000000CZA7-42X6
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 17:33:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTpnZ141145
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 17:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bsoM33BumXlLFCYishlw3tIJRcAwHH7QLQK
	9BwYg4sc=; b=T18J+on1sJFwwvrgkW1eQVjG9TmB9vk/PiyOV0BbgAxAAfCu+o8
	kRRCXYpaoqIVWcngP4oADnVP7t78N1LuFy4muJz5NLn3kZR53HZlYCYnYmN3audR
	R3GqckiVJC8d3bNFZGtzLeWh0WL8TE1HVWVercyCjUDwly6d7cL80AneAFCs8NSH
	XpZw+CBmIu0BdIc20ozYRatnSoBkOXVeGmH3v/+GKhZX0PRdHCUuLrtMC+C4QuBn
	5yB/za0ihR8HrIENxOesYUvlYCk31NQx4ZzmkjDOM349CaE/cfpLJIvUOgr6zkLp
	jA4MKxTN4oUdtAAgeYO2uQKA/VmxFVJnIbg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5896ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 17:33:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so1756904eec.1
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604010; x=1793208810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsoM33BumXlLFCYishlw3tIJRcAwHH7QLQK9BwYg4sc=;
        b=USEUeHmZYt5OfmUrs39WRm3cZF9bPRUxAJWhIcMp9cqMv26jSdrU/uf1pE7s5KLoiC
         ooqsiG3g4g3qaoykJ6ZMd+Zw4DiHS2JOQOGPAWgR/yk7PnXR4v/c8+0PHQpb0f/0UlhN
         PLu4zJ1twBtc4QuahSUFX+ygE0SUQdSD2HRdBgWSf0TLRNK2eBAB2E2ntoHN5vve/OjE
         NRKVQCH9XqB504F19XoYlVpsL/QD0eXrnZBAmE1wAN9rV33tjHqazXu1XTBNa02aICkl
         IySYvthDXenHa30XZeYY5v/eqWBxrLcBG8o3jN15pZScCHQ7EQA9FrSisT4Rn/XXga4R
         r0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604010; x=1793208810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsoM33BumXlLFCYishlw3tIJRcAwHH7QLQK9BwYg4sc=;
        b=ReyyyvLQek9dMh7WGALDri+BYmTMVaWJSdI/1h/Qo1R8O/C5tTpSbYKNAwMQTMA/aD
         ATbDDB7cNwKYPjMtNnA2KnLUYu6IvP28IDbbMo+TQc+it2o4N7NmkreA+DZx/UQxuhoy
         GXVWb73vmivtWVI8V4ZhprL+hR/v45l8vCcnJ5n8NvmZYfZCqiWNL3jdHmYVK9Kr61th
         XX6PAJpadDmkJHTGeb4soFOtWJ320AvsZIxfVVU+6AsuoL0eMUhvWStuMDfbQh3/ItTM
         HVsaHV6hwieo8iYvVCj39geqlX//Da+/lCPsVW8NITiwwkBrjO+7FKFX5C4a3PNQ4ykU
         Z/rQ==
X-Gm-Message-State: AFq9FYJrFEBjb0BgL4kZp3DlsdhJzIh7VBztqS1y58CQXEQ+kapNoVjE
	S6lsrxivhD4cs41nvt8auYs29T32AIzZsYGzcHAoiMaLP2aK5dMuY4mj7nwB/XJ+vG/bVaGu7kM
	bxw53/Rh8AwYoqs/qP1nZvBAcIqHTIZNAnN3WcpnGX533+6+Q14WgyJmv8vWQUyXgH2CHXjXM
X-Gm-Gg: AYBFou1OjZwodg3JtVUVetdiBSxdnAek+tNEXOsZkM23jifJn0gpDNEvVa8IoIsz4L4
	/Z5cmp3RL9l/+/P+u01V9whuM/GKoYta1EmMLFPjT1tCL7TWK2UwWFBHFemXGDhBYsYCpP3/txV
	vLebfY4XHZvezjY3DOzkYc0q0HM0RUW6PwF7vslYwQUV1ae1zVs4XPjLuYinIX++gIZaAu8cGt0
	G/dTSKjwEL8paRqXhW5TtBjuM3GNXot8anbbocWxMXPF23i08DngEqy80CuRmUICFrSAJJwydiA
	bUb1MwXgjzlWRCIuYXEzDartHGlnkMS4oP/WzVZQoIRhFw9KUPv4L0Y4WAdNK6H+oUdziMFTfdo
	6Qkq0gZPjR0OjUawnD5QJKwc4Lje+KcMEx8RekRmp+ualsMdn7kv6kC16HPLV/68/gm75VJ2jgr
	R+NTo8oa3A6GAS1KVj1+mysjpDz386
X-Received: by 2002:a05:7023:d0d:b0:149:1feb:6dae with SMTP id a92af1059eb24-190a6adcb4cmr4086690c88.39.1792604009787;
        Wed, 21 Oct 2026 10:33:29 -0700 (PDT)
X-Received: by 2002:a05:7023:d0d:b0:149:1feb:6dae with SMTP id a92af1059eb24-190a6adcb4cmr4086643c88.39.1792604009054;
        Wed, 21 Oct 2026 10:33:29 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm7026366c88.6.2026.10.21.10.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:33:28 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: move arsta grouping from rhashtable to per-radio hashtable
Date: Wed, 21 Oct 2026 23:03:18 +0530
Message-Id: <20261021173318.1935569-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfX3tt1UNMluVb/
 AYtWErWJ58TIQhag/CLJYwApLxD3cm5PneCSrhq80Lx2h1Ufv1fZ3IzrDL5G+p3YsgqLXGAhFNo
 iOOVMdRupCzBs0t6I/JWeNRP1H7CfyE=
X-Proofpoint-GUID: PJo01P7q1Y1mWJlkbjT_M7jP5Js0Ek-L
X-Proofpoint-ORIG-GUID: PJo01P7q1Y1mWJlkbjT_M7jP5Js0Ek-L
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8f76b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3ugrZYfhNPPjgIFQr8AA:9 a=CyxTcHXcsLpUdS6k:21 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfXyBBQyORolVVj
 BqpG5ebul46LPwH60i6UE5lxvLIY0n0gSeWlp5EzO8i/N5C6tezyhQcX8AjvwP6a4CAt29F0xN5
 w+QKhg1o5g4PBGLuveJzCjbMCA2Y+syajoVUF2Vi00W/06ixAL/AnGRdbJgPdnKRTHLX0hNmvrn
 0FFbuBXhix3KpVj2Vvv6iV3hSQqt6qsub3N4DvJytPdBwf8ATSB1gHpabZzi8qsXGfr/1zO7ttp
 2LtuuXoT+weSFl/vPgnbLEXlAtGGwXkI8wVBEM6XxtQUbql2aOGUHqGDlGbH18kOgwhPGSskgqS
 q7MrfhakYyiMeiYMVUg12yPIrYLXmHEr4RTYpIX6bj2H52cPRHSaH5lymjxh9GHrwvfny5h+ydE
 OMEKAKsaYUHzL/dvW9j2sQnv5DVcPBqIoE90nZtA68DprXKd+Bfl+TPHALnhwl59Ys2bZ27IGne
 Q7krA/5I/1CctwVGYIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_103332_016061_A04578F9 
X-CRM114-Status: GOOD (  25.30  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>

The link-station lookup table is a single rhashtable at the ath12k_base
level, keyed only by station address. Rhashtable does not allow duplicate
keys, so the same address cannot be represented on two radios at once;
a roam or split-PHY overlap where an address briefly exists on more than
one radio is instead handled by deleting the previous radio's entry
before inserting the new one. Because the table is keyed only by address
and shared device-wide, a lookup also cannot be scoped to a specific
radio: during that overlap window, or due to stale remnants, the single
entry present for an address can belong to a different radio than the
one being looked up, silently attaching the wrong radio's data to the
wrong arsta.

Move the lookup table down to the ath12k (per-radio) level, and switch its
backing structure from rhashtable to hlist, which is simpler to walk in
full for the iteration that some code paths already need. Each radio now
owns its own table, so a lookup is inherently scoped to that radio, and
the same address can occupy an entry on two different radios at once
without any delete-then-insert workaround.

Update ath12k_peer_sta_kickout_event(), ath12k_wmi_tlv_fw_stats_data_parse()
and ath12k_wmi_tlv_rssi_chain_parse() to use the new per-radio arsta lookup
helpers accordingly.

The datapath's link-peer table (struct ath12k_dp_link_peer, in dp_peer.c) has
the same device-level rhashtable design and delete-then-insert workaround; it
is unaffected by this change and remains out of scope here.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
Co-developed-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |   9 --
 drivers/net/wireless/ath/ath12k/core.h |  21 ++--
 drivers/net/wireless/ath/ath12k/mac.c  | 122 ++++++++++-----------
 drivers/net/wireless/ath/ath12k/peer.c | 144 +++++++++++--------------
 drivers/net/wireless/ath/ath12k/peer.h |  11 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 112 ++++++++++++-------
 6 files changed, 213 insertions(+), 206 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 25987bc58556..2309ccae5338 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -716,8 +716,6 @@ void ath12k_core_to_group_ref_put(struct ath12k_base *ab)
 
 static void ath12k_core_stop(struct ath12k_base *ab)
 {
-	ath12k_link_sta_rhash_tbl_destroy(ab);
-
 	ath12k_core_to_group_ref_put(ab);
 
 	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)) {
@@ -1016,12 +1014,6 @@ static int ath12k_core_start(struct ath12k_base *ab)
 	/* Indicate the core start in the appropriate group */
 	ath12k_core_to_group_ref_get(ab);
 
-	ret = ath12k_link_sta_rhash_tbl_init(ab);
-	if (ret) {
-		ath12k_warn(ab, "failed to init peer addr rhash table %d\n", ret);
-		goto err_reo_cleanup;
-	}
-
 	return 0;
 
 err_reo_cleanup:
@@ -1425,7 +1417,6 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
 	int ret, total_vdev;
 
 	mutex_lock(&ab->core_lock);
-	ath12k_link_sta_rhash_tbl_destroy(ab);
 	ath12k_thermal_unregister(ab);
 	ath12k_dp_pdev_free(ab);
 	ath12k_ce_cleanup_pipes(ab);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 99d71dab7c04..bde3b4985023 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -17,7 +17,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/average.h>
 #include <linux/of.h>
-#include <linux/rhashtable.h>
+#include <linux/hashtable.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -510,8 +510,8 @@ struct ath12k_link_sta {
 	 /* for firmware use only */
 	u8 link_idx;
 
-	/* peer addr based rhashtable list pointer */
-	struct rhash_head rhash_addr;
+	/* node for ar->arsta_hlist, the peer addr keyed hash table */
+	struct hlist_node hash_node;
 };
 
 struct ath12k_sta {
@@ -658,11 +658,21 @@ struct ath12k {
 	/* protects the radio specific data like debug stats, ppdu_stats_info stats,
 	 * vdev_stop_status info, scan data, ath12k_sta info, ath12k_link_vif info,
 	 * channel context data, test mode data, regd_channel_update_queue,
-	 * peer_delete_waits.
+	 * peer_delete_waits, arsta hash table (arsta_hlist/arsta_hash_bits).
 	 */
 	spinlock_t data_lock;
 
 	struct list_head arvifs;
+
+	/* per-radio hash buckets for station address lookup */
+	struct hlist_head *arsta_hlist;
+
+	/*
+	 * Number of bits used to size arsta_hlist (arsta_hlist has
+	 * BIT(arsta_hash_bits) buckets).
+	 */
+	u8 arsta_hash_bits;
+
 	/* should never be NULL; needed for regular htt rx */
 	struct ieee80211_channel *rx_channel;
 
@@ -1149,9 +1159,6 @@ struct ath12k_base {
 	 */
 	const struct ieee80211_ops *ath12k_ops;
 
-	struct rhashtable *rhead_sta_addr;
-	struct rhashtable_params rhash_sta_addr_param;
-
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f65..d21b0b50853e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1185,35 +1185,6 @@ static int ath12k_mac_set_kickout(struct ath12k_link_vif *arvif)
 	return 0;
 }
 
-static void ath12k_mac_link_sta_rhash_cleanup(void *data, struct ieee80211_sta *sta)
-{
-	u8 link_id;
-	unsigned long links_map;
-	struct ath12k_sta *ahsta;
-	struct ath12k *ar = data;
-	struct ath12k_link_sta *arsta;
-	struct ath12k_link_vif *arvif;
-	struct ath12k_base *ab = ar->ab;
-
-	ahsta = ath12k_sta_to_ahsta(sta);
-	links_map = ahsta->links_map;
-
-	rcu_read_lock();
-	for_each_set_bit(link_id, &links_map, IEEE80211_MLD_MAX_NUM_LINKS) {
-		arsta = rcu_dereference(ahsta->link[link_id]);
-		if (!arsta)
-			continue;
-		arvif = arsta->arvif;
-		if (!(arvif->ar == ar))
-			continue;
-
-		spin_lock_bh(&ab->base_lock);
-		ath12k_link_sta_rhash_delete(ab, arsta);
-		spin_unlock_bh(&ab->base_lock);
-	}
-	rcu_read_unlock();
-}
-
 void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 {
 	struct ath12k_dp_link_peer *peer, *tmp;
@@ -1262,9 +1233,10 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 	ar->num_peers = 0;
 	ar->num_stations = 0;
 
-	/* Cleanup rhash table maintained for arsta by iterating over sta */
-	ieee80211_iterate_stations_mtx(ar->ah->hw, ath12k_mac_link_sta_rhash_cleanup,
-				       ar);
+	/* Cleanup address hash maintained for arsta on this radio */
+	spin_lock_bh(&ar->data_lock);
+	ath12k_link_sta_hlist_flush(ar);
+	spin_unlock_bh(&ar->data_lock);
 
 	/* Delete all the self dp_peers on asserted radio */
 	list_for_each_entry_safe_reverse(arvif, tmp_vif, &ar->arvifs, list) {
@@ -7101,7 +7073,6 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	int ret = 0;
-	struct ath12k_link_sta *temp_arsta;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -7130,14 +7101,9 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
 
 	ath12k_mac_station_post_remove(ar, arvif, arsta);
 
-	spin_lock_bh(&ar->ab->base_lock);
-
-	/* To handle roaming and split phy scenario */
-	temp_arsta = ath12k_link_sta_find_by_addr(ar->ab, arsta->addr);
-	if (temp_arsta && temp_arsta->arvif->ar == ar)
-		ath12k_link_sta_rhash_delete(ar->ab, arsta);
-
-	spin_unlock_bh(&ar->ab->base_lock);
+	spin_lock_bh(&ar->data_lock);
+	ath12k_link_sta_hlist_delete(ar, arsta);
+	spin_unlock_bh(&ar->data_lock);
 
 	if (sta->valid_links)
 		ath12k_mac_free_unassign_link_sta(ahvif->ah,
@@ -7155,7 +7121,6 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
 	struct ath12k_wmi_peer_create_arg peer_param = {};
 	int ret;
-	struct ath12k_link_sta *temp_arsta;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -7166,22 +7131,11 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 		goto exit;
 	}
 
-	spin_lock_bh(&ab->base_lock);
-
-	/*
-	 * In case of Split PHY and roaming scenario, pdev idx
-	 * might differ but both the pdev will share same rhash
-	 * table. In that case update the rhash table if link_sta is
-	 * already present
-	 */
-	temp_arsta = ath12k_link_sta_find_by_addr(ab, arsta->addr);
-	if (temp_arsta && temp_arsta->arvif->ar != ar)
-		ath12k_link_sta_rhash_delete(ab, temp_arsta);
-
-	ret = ath12k_link_sta_rhash_add(ab, arsta);
-	spin_unlock_bh(&ab->base_lock);
+	spin_lock_bh(&ar->data_lock);
+	ret = ath12k_link_sta_hlist_add(ar, arsta);
+	spin_unlock_bh(&ar->data_lock);
 	if (ret) {
-		ath12k_warn(ab, "Failed to add arsta: %pM to hash table, ret: %d",
+		ath12k_warn(ab, "failed to add %pM to hash table %d\n",
 			    arsta->addr, ret);
 		goto dec_num_station;
 	}
@@ -7233,9 +7187,9 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 
 free_peer:
 	ath12k_peer_delete(ar, arvif->vdev_id, arsta->addr);
-	spin_lock_bh(&ab->base_lock);
-	ath12k_link_sta_rhash_delete(ab, arsta);
-	spin_unlock_bh(&ab->base_lock);
+	spin_lock_bh(&ar->data_lock);
+	ath12k_link_sta_hlist_delete(ar, arsta);
+	spin_unlock_bh(&ar->data_lock);
 dec_num_station:
 	ath12k_mac_dec_num_stations(arvif, arsta);
 exit:
@@ -7263,6 +7217,7 @@ static int ath12k_mac_assign_link_sta(struct ath12k_hw *ah,
 		return -EINVAL;
 
 	memset(arsta, 0, sizeof(*arsta));
+	INIT_HLIST_NODE(&arsta->hash_node);
 
 	link_sta = wiphy_dereference(ah->hw->wiphy, sta->link[link_id]);
 	if (!link_sta)
@@ -7321,9 +7276,9 @@ static void ath12k_mac_ml_station_remove(struct ath12k_vif *ahvif,
 
 		ath12k_mac_station_post_remove(ar, arvif, arsta);
 
-		spin_lock_bh(&ar->ab->base_lock);
-		ath12k_link_sta_rhash_delete(ar->ab, arsta);
-		spin_unlock_bh(&ar->ab->base_lock);
+		spin_lock_bh(&ar->data_lock);
+		ath12k_link_sta_hlist_delete(ar, arsta);
+		spin_unlock_bh(&ar->data_lock);
 
 		ath12k_mac_free_unassign_link_sta(ah, ahsta, link_id);
 	}
@@ -15183,11 +15138,12 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	return ret;
 }
 
-static void ath12k_mac_setup(struct ath12k *ar)
+static int ath12k_mac_setup(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_pdev *pdev = ar->pdev;
 	u8 pdev_idx = ar->pdev_idx;
+	int ret;
 
 	ar->lmac_id = ath12k_hw_get_mac_from_pdev_id(ab->hw_params, pdev_idx);
 
@@ -15205,8 +15161,14 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	ar->vdev_id_11d_scan = ATH12K_11D_INVALID_VDEV_ID;
 
 	spin_lock_init(&ar->data_lock);
-	spin_lock_init(&ar->dp.ppdu_list_lock);
 	INIT_LIST_HEAD(&ar->arvifs);
+	ret = ath12k_link_sta_hlist_allocate(ar);
+	if (ret) {
+		ath12k_err(ab, "failed to allocate arsta hash table: %d\n",
+			   ret);
+		return ret;
+	}
+	spin_lock_init(&ar->dp.ppdu_list_lock);
 	INIT_LIST_HEAD(&ar->dp.ppdu_stats_info);
 	INIT_LIST_HEAD(&ar->peer_delete_waits);
 
@@ -15239,6 +15201,8 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	ar->monitor_vdev_id = -1;
 	ar->monitor_vdev_created = false;
 	ar->monitor_started = false;
+
+	return 0;
 }
 
 static int __ath12k_mac_mlo_setup(struct ath12k *ar)
@@ -15447,7 +15411,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
 	struct ath12k_base *ab;
 	struct ath12k_pdev *pdev;
 	struct ath12k_hw *ah;
-	int i;
+	int i, ret;
 	u8 pdev_idx;
 
 	hw = ieee80211_alloc_hw(struct_size(ah, radio, num_pdev_map),
@@ -15483,11 +15447,28 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
 		ag->hw_links[ar->hw_link_id].device_id = ab->device_id;
 		ag->hw_links[ar->hw_link_id].pdev_idx = pdev_idx;
 
-		ath12k_mac_setup(ar);
+		ret = ath12k_mac_setup(ar);
+		if (ret) {
+			pdev->ar = NULL;
+			goto err_cleanup_arsta;
+		}
 		ath12k_dp_pdev_pre_alloc(ar);
 	}
 
 	return ah;
+
+err_cleanup_arsta:
+	while (i-- > 0) {
+		ar = ath12k_ah_to_ar(ah, i);
+		pdev = ar->pdev;
+
+		ath12k_link_sta_hlist_destroy(ar);
+
+		pdev->ar = NULL;
+	}
+
+	ieee80211_free_hw(hw);
+	return NULL;
 }
 
 void ath12k_mac_destroy(struct ath12k_hw_group *ag)
@@ -15506,6 +15487,13 @@ void ath12k_mac_destroy(struct ath12k_hw_group *ag)
 			pdev = &ab->pdevs[j];
 			if (!pdev->ar)
 				continue;
+
+			spin_lock_bh(&pdev->ar->data_lock);
+			ath12k_link_sta_hlist_flush(pdev->ar);
+			spin_unlock_bh(&pdev->ar->data_lock);
+
+			ath12k_link_sta_hlist_destroy(pdev->ar);
+
 			pdev->ar = NULL;
 		}
 	}
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 80edebf0e364..2be9b8dd4c23 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -454,121 +454,103 @@ int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_st
 	return err_ret;
 }
 
-static int ath12k_link_sta_rhash_insert(struct ath12k_base *ab,
-					struct ath12k_link_sta *arsta)
+static u64 ath12k_link_sta_hash_key(const u8 *addr)
 {
-	struct ath12k_link_sta *tmp;
-
-	lockdep_assert_held(&ab->base_lock);
-
-	tmp = rhashtable_lookup_get_insert_fast(ab->rhead_sta_addr, &arsta->rhash_addr,
-						ab->rhash_sta_addr_param);
-	if (!tmp)
-		return 0;
-	else if (IS_ERR(tmp))
-		return PTR_ERR(tmp);
-	else
-		return -EEXIST;
+	return ether_addr_to_u64(addr);
 }
 
-static int ath12k_link_sta_rhash_remove(struct ath12k_base *ab,
-					struct ath12k_link_sta *arsta)
+static u32 ath12k_link_sta_hash_idx(struct ath12k *ar, const u8 *addr)
 {
-	int ret;
-
-	lockdep_assert_held(&ab->base_lock);
+	u64 key = ath12k_link_sta_hash_key(addr);
 
-	ret = rhashtable_remove_fast(ab->rhead_sta_addr, &arsta->rhash_addr,
-				     ab->rhash_sta_addr_param);
-	if (ret && ret != -ENOENT)
-		return ret;
-
-	return 0;
+	return hash_min(key, ar->arsta_hash_bits);
 }
 
-int ath12k_link_sta_rhash_add(struct ath12k_base *ab,
+int ath12k_link_sta_hlist_add(struct ath12k *ar,
 			      struct ath12k_link_sta *arsta)
 {
-	int ret;
+	struct ath12k_link_sta *tmp;
+	struct hlist_head *bucket;
 
-	lockdep_assert_held(&ab->base_lock);
+	lockdep_assert_held(&ar->data_lock);
 
-	ret = ath12k_link_sta_rhash_insert(ab, arsta);
-	if (ret)
-		ath12k_warn(ab, "failed to add arsta %pM in rhash_addr ret %d\n",
-			    arsta->addr, ret);
+	bucket = &ar->arsta_hlist[ath12k_link_sta_hash_idx(ar, arsta->addr)];
+	hlist_for_each_entry(tmp, bucket, hash_node) {
+		if (ether_addr_equal(tmp->addr, arsta->addr)) {
+			ath12k_warn(ar->ab, "arsta %pM already present in hash table\n",
+				    arsta->addr);
+			return -EEXIST;
+		}
+	}
 
-	return ret;
+	hlist_add_head(&arsta->hash_node, bucket);
+	return 0;
 }
 
-void ath12k_link_sta_rhash_delete(struct ath12k_base *ab,
+void ath12k_link_sta_hlist_delete(struct ath12k *ar,
 				  struct ath12k_link_sta *arsta)
 {
-	/*
-	 * Return type of this function is void since there is nothing to be
-	 * done in failure case
-	 */
-	int ret;
-
-	lockdep_assert_held(&ab->base_lock);
+	lockdep_assert_held(&ar->data_lock);
 
-	ret = ath12k_link_sta_rhash_remove(ab, arsta);
-	if (ret)
-		ath12k_warn(ab,
-			    "failed to remove arsta %pM in rhash_addr ret %d\n",
-			    arsta->addr, ret);
+	hlist_del_init(&arsta->hash_node);
 }
 
-int ath12k_link_sta_rhash_tbl_init(struct ath12k_base *ab)
+int ath12k_link_sta_hlist_allocate(struct ath12k *ar)
 {
-	struct rhashtable_params *param;
-	struct rhashtable *rhash_addr_tbl;
-	int ret;
-
-	rhash_addr_tbl = kzalloc_obj(*ab->rhead_sta_addr);
-	if (!rhash_addr_tbl)
-		return -ENOMEM;
+	struct hlist_head *arsta_hlist;
+	u32 sta_max, buckets;
+	u8 hash_bits;
 
-	param = &ab->rhash_sta_addr_param;
+	sta_max = ath12k_core_get_max_station_per_radio(ar->ab);
+	hash_bits = order_base_2(sta_max);
 
-	param->key_offset = offsetof(struct ath12k_link_sta, addr);
-	param->head_offset = offsetof(struct ath12k_link_sta, rhash_addr);
-	param->key_len = sizeof_field(struct ath12k_link_sta, addr);
-	param->automatic_shrinking = true;
-	param->nelem_hint = ab->num_radios * ath12k_core_get_max_peers_per_radio(ab);
+	buckets = BIT(hash_bits);
+	arsta_hlist = kcalloc(buckets, sizeof(*arsta_hlist), GFP_KERNEL);
+	if (!arsta_hlist)
+		return -ENOMEM;
 
-	ret = rhashtable_init(rhash_addr_tbl, param);
-	if (ret) {
-		ath12k_warn(ab, "failed to init peer addr rhash table %d\n",
-			    ret);
-		goto err_free;
-	}
+	__hash_init(arsta_hlist, buckets);
 
-	ab->rhead_sta_addr = rhash_addr_tbl;
+	ar->arsta_hash_bits = hash_bits;
+	ar->arsta_hlist = arsta_hlist;
 
 	return 0;
+}
 
-err_free:
-	kfree(rhash_addr_tbl);
+void ath12k_link_sta_hlist_flush(struct ath12k *ar)
+{
+	struct ath12k_link_sta *arsta;
+	struct hlist_node *tmp;
+	u32 bkt;
 
-	return ret;
+	lockdep_assert_held(&ar->data_lock);
+
+	for (bkt = 0; bkt < BIT(ar->arsta_hash_bits); bkt++) {
+		hlist_for_each_entry_safe(arsta, tmp, &ar->arsta_hlist[bkt], hash_node)
+			hlist_del_init(&arsta->hash_node);
+	}
 }
 
-void ath12k_link_sta_rhash_tbl_destroy(struct ath12k_base *ab)
+void ath12k_link_sta_hlist_destroy(struct ath12k *ar)
 {
-	if (!ab->rhead_sta_addr)
-		return;
-
-	rhashtable_destroy(ab->rhead_sta_addr);
-	kfree(ab->rhead_sta_addr);
-	ab->rhead_sta_addr = NULL;
+	kfree(ar->arsta_hlist);
+	ar->arsta_hlist = NULL;
+	ar->arsta_hash_bits = 0;
 }
 
-struct ath12k_link_sta *ath12k_link_sta_find_by_addr(struct ath12k_base *ab,
+struct ath12k_link_sta *ath12k_link_sta_find_by_addr(struct ath12k *ar,
 						     const u8 *addr)
 {
-	lockdep_assert_held(&ab->base_lock);
+	struct ath12k_link_sta *arsta;
+	struct hlist_head *bucket;
+
+	lockdep_assert_held(&ar->data_lock);
+
+	bucket = &ar->arsta_hlist[ath12k_link_sta_hash_idx(ar, addr)];
+	hlist_for_each_entry(arsta, bucket, hash_node) {
+		if (ether_addr_equal(arsta->addr, addr))
+			return arsta;
+	}
 
-	return rhashtable_lookup_fast(ab->rhead_sta_addr, addr,
-				      ab->rhash_sta_addr_param);
+	return NULL;
 }
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index 3f4ac17b9aa6..d56ef3cc2b31 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -29,11 +29,12 @@ int ath12k_wait_for_peer_delete_done(struct ath12k *ar,
 int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_sta *ahsta);
 struct ath12k_ml_peer *ath12k_peer_ml_find(struct ath12k_hw *ah,
 					   const u8 *addr);
-int ath12k_link_sta_rhash_tbl_init(struct ath12k_base *ab);
-void ath12k_link_sta_rhash_tbl_destroy(struct ath12k_base *ab);
-void ath12k_link_sta_rhash_delete(struct ath12k_base *ab, struct ath12k_link_sta *arsta);
-int ath12k_link_sta_rhash_add(struct ath12k_base *ab, struct ath12k_link_sta *arsta);
-struct ath12k_link_sta *ath12k_link_sta_find_by_addr(struct ath12k_base *ab,
+int ath12k_link_sta_hlist_allocate(struct ath12k *ar);
+void ath12k_link_sta_hlist_flush(struct ath12k *ar);
+void ath12k_link_sta_hlist_destroy(struct ath12k *ar);
+void ath12k_link_sta_hlist_delete(struct ath12k *ar, struct ath12k_link_sta *arsta);
+int ath12k_link_sta_hlist_add(struct ath12k *ar, struct ath12k_link_sta *arsta);
+struct ath12k_link_sta *ath12k_link_sta_find_by_addr(struct ath12k *ar,
 						     const u8 *addr);
 u16 ath12k_peer_ml_alloc(struct ath12k_hw *ah);
 void ath12k_peer_ml_free(struct ath12k_hw *ah, struct ath12k_sta *ahsta);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c79..c13832643aac 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7582,10 +7582,12 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 {
 	struct wmi_peer_sta_kickout_arg arg = {};
 	struct ath12k_link_vif *arvif;
-	struct ieee80211_sta *sta;
-	struct ath12k_sta *ahsta;
 	struct ath12k_link_sta *arsta;
+	struct ieee80211_sta *sta;
+	struct ath12k_pdev *pdev;
 	struct ath12k *ar;
+	bool found = false;
+	int i;
 
 	if (ath12k_pull_peer_sta_kickout_ev(ab, skb, &arg) != 0) {
 		ath12k_warn(ab, "failed to extract peer sta kickout event");
@@ -7594,44 +7596,80 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 
 	rcu_read_lock();
 
-	spin_lock_bh(&ab->base_lock);
+	/*
+	 * The same address can be present on more than one radio during a
+	 * roam/split-PHY overlap window, and the event carries no radio
+	 * identifier to disambiguate. Since the firmware could mean either
+	 * one, process every radio with a match instead of just the first.
+	 */
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = rcu_dereference(ab->pdevs_active[i]);
+		if (!pdev || !pdev->ar)
+			continue;
 
-	arsta = ath12k_link_sta_find_by_addr(ab, arg.mac_addr);
+		ar = pdev->ar;
 
-	if (!arsta) {
-		ath12k_warn(ab, "arsta not found %pM\n",
-			    arg.mac_addr);
-		goto exit;
-	}
+		spin_lock_bh(&ar->data_lock);
+		arsta = ath12k_link_sta_find_by_addr(ar, arg.mac_addr);
+		if (!arsta) {
+			spin_unlock_bh(&ar->data_lock);
+			ath12k_dbg(ab, ATH12K_DBG_WMI,
+				   "arsta %pM not found on radio %d in peer sta kickout event\n",
+				   arg.mac_addr, i);
+			continue;
+		}
 
-	arvif = arsta->arvif;
-	if (!arvif) {
-		ath12k_warn(ab, "invalid arvif in peer sta kickout ev for STA %pM",
-			    arg.mac_addr);
-		goto exit;
-	}
+		arvif = arsta->arvif;
+		if (!arvif) {
+			spin_unlock_bh(&ar->data_lock);
+			ath12k_warn(ab, "invalid arvif in peer sta kickout ev for STA %pM\n",
+				    arg.mac_addr);
+			continue;
+		}
 
-	ar = arvif->ar;
-	ahsta = arsta->ahsta;
-	sta = ath12k_ahsta_to_sta(ahsta);
+		sta = ath12k_ahsta_to_sta(arsta->ahsta);
+		spin_unlock_bh(&ar->data_lock);
 
-	ath12k_dbg(ab, ATH12K_DBG_WMI,
-		   "peer sta kickout event %pM reason: %d rssi: %d\n",
-		   arg.mac_addr, arg.reason, arg.rssi);
+		/*
+		 * arvif and sta remain valid for the duration of this
+		 * rcu_read_lock() section: every teardown path nulls the
+		 * pointer via rcu_assign_pointer() and calls synchronize_rcu()
+		 * before freeing arvif/arsta, so that grace period cannot
+		 * complete while this section is still active.
+		 */
+		found = true;
 
-	switch (arg.reason) {
-	case WMI_PEER_STA_KICKOUT_REASON_INACTIVITY:
-		if (arvif->ahvif->vif->type == NL80211_IFTYPE_STATION) {
-			ath12k_mac_handle_beacon_miss(ar, arvif);
-			break;
+		/*
+		 * A STA roaming between radios of the same AP can be present
+		 * in more than one radio's arsta table during the handover
+		 * window, and the firmware event carries no radio identifier.
+		 * Only the radio on which the STA is currently authorized
+		 * owns it; skip the stale radio(s) to avoid handling the same
+		 * kickout twice.
+		 */
+		if (arvif->ahvif->vif->type == NL80211_IFTYPE_AP &&
+		    arsta->ahsta->state != IEEE80211_STA_AUTHORIZED)
+			continue;
+
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "peer sta kickout event %pM reason %d rssi %d\n",
+			   arg.mac_addr, arg.reason, arg.rssi);
+
+		switch (arg.reason) {
+		case WMI_PEER_STA_KICKOUT_REASON_INACTIVITY:
+			if (arvif->ahvif->vif->type == NL80211_IFTYPE_STATION) {
+				ath12k_mac_handle_beacon_miss(ar, arvif);
+				break;
+			}
+			fallthrough;
+		default:
+			ieee80211_report_low_ack(sta, 10);
 		}
-		fallthrough;
-	default:
-		ieee80211_report_low_ack(sta, 10);
 	}
 
-exit:
-	spin_unlock_bh(&ab->base_lock);
+	if (!found)
+		ath12k_warn(ab, "failed to find arsta %pM\n", arg.mac_addr);
+
 	rcu_read_unlock();
 }
 
@@ -8443,8 +8481,8 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 
 		arvif = ath12k_mac_get_arvif(ar, le32_to_cpu(src->vdev_id));
 		if (arvif) {
-			spin_lock_bh(&ab->base_lock);
-			arsta = ath12k_link_sta_find_by_addr(ab, arvif->bssid);
+			spin_lock_bh(&ar->data_lock);
+			arsta = ath12k_link_sta_find_by_addr(ar, arvif->bssid);
 			if (arsta) {
 				arsta->rssi_beacon = le32_to_cpu(src->beacon_snr);
 				ath12k_dbg(ab, ATH12K_DBG_WMI,
@@ -8455,7 +8493,7 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 					    "not found link sta with bssid %pM for vdev stat\n",
 					    arvif->bssid);
 			}
-			spin_unlock_bh(&ab->base_lock);
+			spin_unlock_bh(&ar->data_lock);
 		}
 
 		data += sizeof(*src);
@@ -8561,11 +8599,11 @@ static int ath12k_wmi_tlv_rssi_chain_parse(struct ath12k_base *ab,
 		   "stats bssid %pM vif %p\n",
 		   arvif->bssid, arvif->ahvif->vif);
 
-	guard(spinlock_bh)(&ab->base_lock);
-	arsta = ath12k_link_sta_find_by_addr(ab, arvif->bssid);
+	guard(spinlock_bh)(&ar->data_lock);
+	arsta = ath12k_link_sta_find_by_addr(ar, arvif->bssid);
 	if (!arsta) {
 		ath12k_warn(ab,
-			    "not found link sta with bssid %pM for rssi chain\n",
+			    "failed to find link sta with bssid %pM for rssi chain\n",
 			    arvif->bssid);
 		return -EPROTO;
 	}

base-commit: fab2e70afb13485ea4b198b204af33dd15b8132c
-- 
2.34.1


