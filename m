Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08A606A32C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YDfPPv54;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvfVVvrp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUK8rEfA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iSNsGTw2VbinYkMuS1qbD5z1i6juqRaxaPCw96pD6kY=; b=YDfPPv544JGuUG
	Aqh8cB1KsHtqN8Q2uf3vkILdD9Ro23PUj7MHI5+BhuYEmwH7faYcBF+8SjVIlCaxZuEo0BnPLUHpU
	CB0UIg9cyGNwHvRX6EafgrUtTXUN/QW5iWQd9zDP4LExImSgNJprpwQ9yZ7aVD83amf8JIaR38jYs
	QT5zukB8est2Ie45C+5iojSQDO0rzcB06a7WcYV9BnRdIR1RVLOi4QMv3+uZhOmSNQNhwCuXoBQdZ
	alp0HOLiCN/NMgUEM212T4BBOPft0DKw42wXG4VfvaeezlHBPT7GIK4/nAMGMB3umMOYvpnMr5WRF
	K/uysskT/GeKIkhwY2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqR-00000007ZUH-2jHe;
	Wed, 18 Nov 2026 02:56:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqK-00000007ZLu-41dB
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:56:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Umii3371238
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iSNsGTw2Vbi
	nYkMuS1qbD5z1i6juqRaxaPCw96pD6kY=; b=JvfVVvrpm/RlC09tqzSnM9oAY8j
	3HFHna638Db1q/bb437dc6Sf/al2YX0oeOQucqJfnkQIoMSHKfMH6iVPvD8Fxss7
	gaScpoDIrNvJbhpo3CvS1LZKGUe2st7iQHQXKzEbDaUGNeth+FwVivxDUn5x6051
	K4RlzskRZm6vQYB722+NuwtQFYA6XymUKSCvdMx825Wg3Jkb/OtCdg6+BHBwU0we
	nFXpmILZj84MWOjUhqlEGtY44UnZ/Co8EOXISjMbhZ7PAloikwvTFQCS7mGv+eA8
	i8T/CVFRQ9NNnhapHy+84YGF8NJtYzGw6vCpEbLAlFED2PgyxUT7XM6l6Aw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8ru21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so5765245ad.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970576; x=1795575376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSNsGTw2VbinYkMuS1qbD5z1i6juqRaxaPCw96pD6kY=;
        b=IUK8rEfANn8osx0dObpgr2Cd9KTgwVvXRniUyq5xf0zkd0kQ3KA7wlnylg4IOTQsOm
         L2zWNK2kYTJniv75PDz7cFakBk+4oHJ+oEAjbFEeogfCBDa83ryE8xLHAv+TpFpYIzti
         DvsrRztCl3zoafRxVEG956gte6esqQGhLQXGYWEDIU30FMMUL2+soxXq2rnNBkthB8cF
         jMht6y5tNvBZkDcbh9lebVuyLyPYcXpbt97+0XxiMhE6qvlHaYTKuo3xrixsZ4E+SkeU
         fgR+ACBXED5GviIv4o2feSpobnNA3CbezKZ/50GILTsleg/asKMpS9SS7W+W9p5v1EIH
         RnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970576; x=1795575376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSNsGTw2VbinYkMuS1qbD5z1i6juqRaxaPCw96pD6kY=;
        b=QefUpXV7vWA2crgZqNVfA/doM7f9U+2zs0cVX4OgZMssI4jiuFKV0izH3c6gPFTBW5
         VFq96G5vh/aBbSel/iUEE4aovgUqjdLrLZbHTSSt+AMXQ4VKrVn21HQK21y9wXKCQKX4
         92ylLYmtQG7XJs6wv1hiG++90qnXCyWxHvciIlj1RjI+6gEr3PzGiLzZjXBzqevbb09z
         /opYFOCszOeO+0vE4QPB07RtN1mFlTj2+vbBPTQy9XapzAo1U2meR2UyqfPrOBKfYYAn
         hHkqrMLQacIDm3t+MPmx9hKoBAhML7rM221kT7S7Vw48sFaC9pPdg+hY4sKocmI4L3gQ
         KqNg==
X-Gm-Message-State: APuU4Z8WmGtgKZ2zT0kduKJA4bh0qudHVW8Enb1q3accBgJ8uSarV7GB
	S7ogNA+tNmSFClnmlAqok7LYlEnPBsTUaPR6bTLf63q5Gfj7ouuDJRqq6J1ZRaUPFZv9+N8tHNC
	bwmQpp4CEnQH5gYkdpOYjc+gEqb2hkQY+ws5l1AfZ5bp/bTUZduEKfeX2SbvSi2PH
X-Gm-Gg: AZFdTZcTZrC/6ikUrahvCi2tdjASs/qWZHkVZiSNWjFWYg+zs8fX8Brq3F9toRFuHIU
	H/2OylLXhzCoLYXsWkgByGcHYl3mec4F1bo+QZHMGDav5WpL0kQdVvCBU/tN/eja0ojFbcQJdjO
	ZAF2WgxJaUWZ59i42/3zr4OMKv8wjGgkOMp0tpdbu781yLGlFasc8jnq4MOQ6F9X6FN3Rzx50bA
	EjEhoKlHsg9qDsHvTFs7O9DxJZklz0mgshaS/jRLSZalAL7KbxN3lNIHc5ytfynyblxjB6CXm1Q
	hZGaLrv6JdBnaniFNviE229BUL/6MiXlwPNXaLsLdAnELa736PgVAqGjRUcxXF3x/zPIYtVkb/d
	w+IEOu3LM8ZAfZugkS8XlPyct5kBsxMMrhu28OPMq6yEjNElU93FIgzo5oY7FAIV5twwcfM7L7W
	LJ1KRebGnxq0Z5FhfKJ6VwLsO2HdNtT9Y=
X-Received: by 2002:a17:903:3d0f:b0:2ef:dcfd:afe3 with SMTP id d9443c01a7336-2eff74013a9mr12885415ad.34.1794970575377;
        Tue, 17 Nov 2026 18:56:15 -0800 (PST)
X-Received: by 2002:a17:903:3d0f:b0:2ef:dcfd:afe3 with SMTP id d9443c01a7336-2eff74013a9mr12885205ad.34.1794970574818;
        Tue, 17 Nov 2026 18:56:14 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:14 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 7/7] wifi: ath12k: handle MLO active link updates
Date: Wed, 18 Nov 2026 10:55:20 +0800
Message-Id: <20261118025520.39269-8-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd13d0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cAhsaRmiovNJmrqcDNoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9fM4r4sgdLBQLs3t6fTLsUJqZP4DPZCN
X-Proofpoint-ORIG-GUID: 9fM4r4sgdLBQLs3t6fTLsUJqZP4DPZCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX61t7gRVQK7HD
 dRNepmpfDW6AjthBDMZH/KbqtcGYkteacmlMiBxIcqckDqiZQVuuuUViiIbaB/0zs5slgdEo/gU
 QGO4j6mohuNmABmknr1BaI3B7/kCQPx6p2aroWZAv/FWaokH6RWSDHaSbwOctYBebtPHfl/hnhf
 vb4YxGtRMG8zXDtQF36b3/bez1NwjFQTy2c5PaYHG0LPRQhG3l+e07mXzzvxCXTbj6+/T5dgJXy
 +5wyra/om0xlqh3NsmDbqDVnQq4bEmwB/mK7XmNR3aoe07dOwrPIgyOSDnVsRmVst2KYqV1FkUY
 yiKSUWCiri67hQV1LaNtrTy436EIteNDGZymv55iy0vJhQP/jBf+AtSO9WXid6YtvIgjRl7Ubu0
 MDf9zK20YhospKWFAQi2siw/QLoqNEmUyPycPtSf9qVSE9jlubQWhyf7Hc1ttl3xR0LbvL0hHk3
 xK6lItqMSxf908AkrbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX+fE0eT1GjapJ
 aBodU4pHrag+TnvTw9c0/G+9+ypUu3qboDWK+YQ0PuC1TtAojoPpEFEtSMrtmxz1/htv5o05Oek
 piWOhQ1QoWoXUpVh2wIMPAZS70w9XIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_185617_045957_D8F3972D 
X-CRM114-Status: GOOD (  29.76  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_mac_op_change_sta_links() handles both valid-link and active-link
changes from mac80211. For an active-link change, old_links and new_links
are the active sets. The callback returned early whenever new_links was
smaller than old_links, and outside connect nothing sends an active-link
command to firmware. So when an associated MLO STA deactivates a link,
e.g. active links 0x5 -> 0x1, firmware keeps link 2 active while
mac80211 has already released its channel context.

Sync the active links to firmware from the callback once the STA is
AUTHORIZED:

- Create link STAs for sta->valid_links instead of new_links. Firmware
  cannot remove a single link sta, so removals are only logged and are
  left to STA removal.
- Take the active set from channel contexts: a link with a link STA and
  a link vif is active if it holds a chanctx, inactive otherwise.
  mac80211 releases the chanctx of a deactivated link and assigns one to
  a newly activated link before it calls the callback.
- Send WMI_MLO_LINK_SET_ACTIVE only when this set differs from the one
  last programmed, cached per vif. Send it to each device that holds
  vdevs of the STA, with that device's links, and wait up to 5 seconds
  for each response. Two active links on the same MAC use
  INACTIVE_LINK_NUM, as at connect, and that command is not waited for.
  Update the cache only if all devices succeed, so a failed sync is
  retried on the next callback.
- Reset the cache on ASSOC -> AUTHORIZED, so the first sync after each
  (re)connect is always sent. This also covers hw restart, where
  mac80211 replays the station state transitions.

If the device crashes while a request is pending, the waiter still holds
the wiphy lock. ath12k_core_pre_reconfigure_recovery() therefore releases
the waiter before it takes the lock, otherwise recovery stalls until the
timeout expires.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  15 ++
 drivers/net/wireless/ath/ath12k/core.h |  20 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 241 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.c  |   9 +-
 drivers/net/wireless/ath/ath12k/wmi.h  |   1 +
 5 files changed, 271 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 42a9cd28c652..183da4cb5e64 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1524,6 +1524,19 @@ void ath12k_core_halt(struct ath12k *ar)
 	idr_init(&ar->txmgmt_idr);
 }
 
+static void ath12k_core_abort_mlo_link_set_active(struct ath12k_base *ab)
+{
+	struct ath12k_mlo_link_set_active_req *req;
+
+	rcu_read_lock();
+	req = rcu_dereference(ab->mlo_link_set_active_req);
+	if (req) {
+		req->status = -ESHUTDOWN;
+		complete(&req->done);
+	}
+	rcu_read_unlock();
+}
+
 static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
@@ -1538,6 +1551,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 	if (ab->is_reset)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
+	ath12k_core_abort_mlo_link_set_active(ab);
+
 	for (i = 0; i < ag->num_hw; i++) {
 		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF ||
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7c7057468916..74f184d283b7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -401,6 +401,12 @@ struct ath12k_vif {
 	struct ath12k_link_vif deflink;
 	struct ath12k_link_vif __rcu *link[ATH12K_NUM_MAX_LINKS];
 	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
+	/*
+	 * Last active/inactive link state programmed to firmware via
+	 * WMI_MLO_LINK_SET_ACTIVE. Zero means unknown: forces a resend.
+	 */
+	u16 fw_active_links;
+	u16 fw_inactive_links;
 	/* indicates bitmap of link vif created in FW */
 	u32 links_map;
 	/* Must be last - ends in a flexible-array member.
@@ -797,6 +803,12 @@ struct ath12k {
 	} incumbent_signal_interference;
 };
 
+struct ath12k_mlo_link_set_active_req {
+	struct completion done;
+	int status;
+	struct rcu_head rcu_head;
+};
+
 struct ath12k_hw {
 	struct ieee80211_hw *hw;
 	struct device *dev;
@@ -1153,6 +1165,14 @@ struct ath12k_base {
 #endif /* CONFIG_ACPI */
 
 	struct ath12k_hw_group *ag;
+
+	/*
+	 * Set-active request in flight to this device, NULL when idle. Freed
+	 * via kfree_rcu(). The links of an MLO STA can be on several devices,
+	 * and each device is programmed separately, so at most one request is
+	 * outstanding per device.
+	 */
+	struct ath12k_mlo_link_set_active_req __rcu *mlo_link_set_active_req;
 	struct ath12k_wsi_info wsi_info;
 	enum ath12k_qmi_firmware_mode fw_mode;
 	struct ath12k_ftm_event_obj ftm_event_obj;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dfb0f6e678ac..885eedbbdd67 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7667,6 +7667,8 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
 	u8 num_mlo_vdev = 0;
 	u8 link_id;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
 		/* make sure vdev is created on this device */
@@ -7982,6 +7984,14 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 
 	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION &&
 	    old_state == IEEE80211_STA_ASSOC && new_state == IEEE80211_STA_AUTHORIZED) {
+		/*
+		 * The cached active link state is only updated while AUTHORIZED,
+		 * so reset it on each ASSOC -> AUTHORIZED. The next active-link
+		 * sync then sends the state to firmware.
+		 */
+		ahvif->fw_active_links = 0;
+		ahvif->fw_inactive_links = 0;
+
 		for_each_ar(ah, ar, i) {
 			ab = ar->ab;
 			if (prev_ab == ab)
@@ -8243,6 +8253,194 @@ static struct ath12k_link_sta *ath12k_mac_alloc_assign_link_sta(struct ath12k_hw
 	return arsta;
 }
 
+static struct ieee80211_chanctx_conf *
+ath12k_mac_link_chanctx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			u8 link_id)
+{
+	struct ieee80211_bss_conf *link_conf;
+
+	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
+	if (!link_conf)
+		return NULL;
+
+	return wiphy_dereference(hw->wiphy, link_conf->chanctx_conf);
+}
+
+struct ath12k_mlo_dev_links {
+	u8 active_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
+	u8 inactive_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
+	u32 active_freq[IEEE80211_MLD_MAX_NUM_LINKS];
+	unsigned int num_active;
+	unsigned int num_inactive;
+};
+
+static u16 ath12k_mac_mlo_vif_active_links(struct ieee80211_hw *hw,
+					   struct ieee80211_vif *vif,
+					   unsigned long links)
+{
+	u16 active = 0;
+	u8 link_id;
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		if (ath12k_mac_link_chanctx(hw, vif, link_id))
+			active |= BIT(link_id);
+	}
+
+	return active;
+}
+
+static void ath12k_mac_mlo_sta_collect_dev_links(struct ieee80211_hw *hw,
+						 struct ath12k_vif *ahvif,
+						 struct ath12k_base *ab,
+						 unsigned long links,
+						 struct ath12k_mlo_dev_links *dl)
+{
+	struct ieee80211_chanctx_conf *conf;
+	struct ath12k_link_vif *arvif;
+	u8 link_id;
+
+	dl->num_active = 0;
+	dl->num_inactive = 0;
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		if (!arvif || !arvif->is_created || arvif->ar->ab != ab)
+			continue;
+
+		conf = ath12k_mac_link_chanctx(hw, ahvif->vif, link_id);
+		if (!conf) {
+			dl->inactive_vdev[dl->num_inactive++] = arvif->vdev_id;
+			continue;
+		}
+
+		dl->active_freq[dl->num_active] = conf->def.chan->center_freq;
+		dl->active_vdev[dl->num_active++] = arvif->vdev_id;
+	}
+}
+
+static bool ath12k_mac_mlo_dev_same_mac(struct ath12k_base *ab,
+					const struct ath12k_mlo_dev_links *dl)
+{
+	return dl->num_active == 2 &&
+	       ath12k_mac_freqs_on_same_mac(ab, dl->active_freq[0],
+					    dl->active_freq[1]);
+}
+
+static int ath12k_mac_mlo_sta_send_inactive_link_num(struct ath12k_base *ab,
+						     struct ath12k_mlo_dev_links *dl)
+{
+	return ath12k_mac_mlo_sta_set_link_active(ab,
+						  WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
+						  WMI_MLO_LINK_FORCE_MODE_INACTIVE_LINK_NUM,
+						  NULL, dl->active_vdev, dl->num_active,
+						  NULL, 0);
+}
+
+static int ath12k_mac_mlo_sta_send_set_active(struct ath12k_base *ab,
+					      struct ieee80211_vif *vif,
+					      struct ath12k_mlo_dev_links *dl)
+{
+	struct ath12k_mlo_link_set_active_req *req;
+	enum wmi_mlo_link_force_mode mode;
+	int ret;
+
+	req = kzalloc_obj(*req);
+	if (!req)
+		return -ENOMEM;
+
+	init_completion(&req->done);
+	rcu_assign_pointer(ab->mlo_link_set_active_req, req);
+
+	mode = dl->num_inactive ? WMI_MLO_LINK_FORCE_MODE_ACTIVE_INACTIVE :
+				  WMI_MLO_LINK_FORCE_MODE_ACTIVE;
+
+	ret = ath12k_mac_mlo_sta_set_link_active(ab,
+						 WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
+						 mode, vif->cfg.ap_addr,
+						 dl->active_vdev, dl->num_active,
+						 dl->inactive_vdev, dl->num_inactive);
+
+	if (!ret && !wait_for_completion_timeout(&req->done,
+						 ATH12K_MLO_LINK_SET_ACTIVE_TIMEOUT_HZ)) {
+		ath12k_warn(ab, "timeout waiting for mlo set active links resp\n");
+		ret = -ETIMEDOUT;
+	}
+
+	if (!ret && req->status)
+		ret = -EIO;
+
+	rcu_assign_pointer(ab->mlo_link_set_active_req, NULL);
+	kfree_rcu(req, rcu_head);
+
+	return ret;
+}
+
+static int ath12k_mac_mlo_sta_sync_active_links(struct ath12k_hw *ah,
+						struct ath12k_vif *ahvif,
+						struct ath12k_sta *ahsta,
+						struct ieee80211_sta *sta)
+{
+	struct ath12k_base *ab, *prev_ab = NULL;
+	struct ieee80211_hw *hw = ah->hw;
+	struct ath12k_mlo_dev_links dl;
+	unsigned long links;
+	u16 active, inactive;
+	struct ath12k *ar;
+	int ret;
+	int i;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	links = ahsta->links_map & ahvif->links_map;
+
+	/*
+	 * A link holding a channel context is active. The links of an MLO STA
+	 * can be on different devices, so the active set is derived over all
+	 * links and each device is then programmed with the links it holds.
+	 */
+	active = ath12k_mac_mlo_vif_active_links(hw, ahvif->vif, links);
+	inactive = links & ~active;
+
+	if (!active) {
+		ath12k_hw_warn(ah, "no active link for sta %pM\n", sta->addr);
+		return -EINVAL;
+	}
+
+	if (active == ahvif->fw_active_links &&
+	    inactive == ahvif->fw_inactive_links)
+		return 0;
+
+	for_each_ar(ah, ar, i) {
+		ab = ar->ab;
+		if (ab == prev_ab)
+			continue;
+		prev_ab = ab;
+
+		ath12k_mac_mlo_sta_collect_dev_links(hw, ahvif, ab, links, &dl);
+
+		if (!dl.num_active && !dl.num_inactive)
+			continue;
+
+		if (!dl.num_active) {
+			ath12k_hw_warn(ah,
+				       "cannot deactivate all STA links on a device\n");
+			return -EOPNOTSUPP;
+		}
+
+		if (ath12k_mac_mlo_dev_same_mac(ab, &dl))
+			ret = ath12k_mac_mlo_sta_send_inactive_link_num(ab, &dl);
+		else
+			ret = ath12k_mac_mlo_sta_send_set_active(ab, ahvif->vif, &dl);
+		if (ret)
+			return ret;
+	}
+
+	ahvif->fw_active_links = active;
+	ahvif->fw_inactive_links = inactive;
+
+	return 0;
+}
+
 int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
@@ -8250,26 +8448,22 @@ int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
+	unsigned long to_create, to_remove;
 	struct ath12k_hw *ah = hw->priv;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_link_sta *arsta;
-	unsigned long valid_links;
 	struct ath12k *ar;
+	int ret = 0;
 	u8 link_id;
-	int ret;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
+	to_create = sta->valid_links & ~ahsta->links_map;
+	to_remove = ahsta->links_map & ~sta->valid_links;
+
 	if (!sta->valid_links)
 		return -EINVAL;
 
-	/* Firmware does not support removal of one of link stas. All sta
-	 * would be removed during ML STA delete in sta_state(), hence link
-	 * sta removal is not handled here.
-	 */
-	if (new_links < old_links)
-		return 0;
-
 	if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
 		ath12k_hw_warn(ah, "unable to add link for ml sta %pM", sta->addr);
 		return -EINVAL;
@@ -8279,11 +8473,17 @@ int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 	if (WARN_ON(ahsta->links_map == 0))
 		return -EINVAL;
 
-	valid_links = new_links;
-	for_each_set_bit(link_id, &valid_links, IEEE80211_MLD_MAX_NUM_LINKS) {
-		if (ahsta->links_map & BIT(link_id))
-			continue;
+	/*
+	 * Firmware does not support removal of one of link stas. All sta
+	 * would be removed during ML STA delete in sta_state(), hence link
+	 * sta removal is not handled here.
+	 */
+	if (to_remove)
+		ath12k_generic_dbg(ATH12K_DBG_MAC,
+				   "ignoring link sta removal 0x%lx for %pM\n",
+				   to_remove, sta->addr);
 
+	for_each_set_bit(link_id, &to_create, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
 		if (!arvif || !arvif->is_created)
 			continue;
@@ -8305,7 +8505,20 @@ int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 		}
 	}
 
-	return 0;
+	/*
+	 * Active-links are only meaningful once the sta is authorized. Before
+	 * that, the connect path in sta_state() programs firmware.
+	 */
+	if (sta->mlo && vif->type == NL80211_IFTYPE_STATION &&
+	    ahsta->state == IEEE80211_STA_AUTHORIZED) {
+		ret = ath12k_mac_mlo_sta_sync_active_links(ah, ahvif, ahsta, sta);
+		if (ret)
+			ath12k_hw_warn(ah,
+				       "failed to sync mlo active links for sta %pM: %d\n",
+				       sta->addr, ret);
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL(ath12k_mac_op_change_sta_links);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7e06dbb1e884..8d4938ff3163 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -9716,6 +9716,7 @@ static void ath12k_wmi_event_mlo_link_set_active(struct ath12k_base *ab,
 						 struct sk_buff *skb)
 {
 	const struct wmi_mlo_link_set_active_resp_event *ev;
+	struct ath12k_mlo_link_set_active_req *req;
 	u32 status, use_ieee;
 	const void **tb;
 	int ret;
@@ -9740,7 +9741,13 @@ static void ath12k_wmi_event_mlo_link_set_active(struct ath12k_base *ab,
 		   "mlo link set active resp status %u use_ieee 0x%x\n",
 		   status, use_ieee);
 
-	/* Response delivery to waiters will be wired up in a subsequent patch */
+	rcu_read_lock();
+	req = rcu_dereference(ab->mlo_link_set_active_req);
+	if (req) {
+		req->status = status;
+		complete(&req->done);
+	}
+	rcu_read_unlock();
 }
 
 static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 6d590b30ecbe..7b18de37f0bf 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3030,6 +3030,7 @@ struct ath12k_wmi_ssid_params {
 } __packed;
 
 #define ATH12K_VDEV_SETUP_TIMEOUT_HZ (5 * HZ)
+#define ATH12K_MLO_LINK_SET_ACTIVE_TIMEOUT_HZ (5 * HZ)
 
 enum wmi_vdev_mbssid_flags {
 	WMI_VDEV_MBSSID_FLAGS_NON_MBSSID_AP	= BIT(0),
-- 
2.34.1


