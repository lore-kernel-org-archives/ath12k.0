Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D518606A32C
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 06:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qc5pQV/J;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b3eQU2JU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oPZ5v8UURnygDGPq56oBxX6OW/e3IZH+1dLPLTtNgg=; b=Qc5pQV/JL2aQ2JJD0Af3Y67H7P
	sp45dJ3v5kj3tqrFodcw0Phv20zFcl/W7zdAFKHQyUHphWSgJoKwJ3oCFl+JwpLxCMVl34ZadOHNT
	sS33QP2qJtlMKnCJ2p/Kl9lC+/R43wx57I19bxgAOhXOCutE2mVVJGAfoWmf/xoVKf4LdkATHFBMU
	/GzhViKPOv/GdLdhJmHo+w+lGqziXnJUKu3KcHLs1VxsdxSuedtEPiEzlfUdHJiMxptL4jb3Xw1fq
	CgptDzef6irusRGXRcRKzxorww+2sd2m6W8oBtmngwXPDFc4ISCNI/fDKucJx0gSBHbytw7+0kFC9
	zKSAunAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPWH-0000000B980-3aAm;
	Wed, 21 Oct 2026 06:09:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPWF-0000000B962-1ERU
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 06:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/oPZ5v8UURnygDGPq56oBxX6OW/e3IZH+1dLPLTtNgg=;
	b=b3eQU2JUcxr8kbao2XON9DGN9WWbDbmt7tj+JsGhIHQm7eoBlBGrJrV9nVrS5UpYvg0Fpd
	YUIJx7Cg+DJvJviGOK/jhtneQ8ZGbi9AD2pDKmlq2rAzECIg2xApZ06CSXkq7il/536hi+
	onbFy1njY7XDMyeoO0Box/JgSWvZBOo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-Or28QkqkNAyBY-zPtmy13w-1; Wed,
 21 Oct 2026 06:09:44 +0000
X-MC-Unique: Or28QkqkNAyBY-zPtmy13w-1
X-Mimecast-MFC-AGG-ID: Or28QkqkNAyBY-zPtmy13w_1792562983
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 280A4180066F;
	Wed, 21 Oct 2026 06:09:43 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6A1521800480;
	Wed, 21 Oct 2026 06:09:41 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v8 1/2] wifi: ath12k: remove skb parameter from get_ring_selector
Date: Wed, 21 Oct 2026 08:09:30 +0200
Message-ID: <20261021060931.249629-2-jtornosm@redhat.com>
In-Reply-To: <20261021060931.249629-1-jtornosm@redhat.com>
References: <20261021060931.249629-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 18Wk_7ab41NRhksmKxAWhXIo_ws4eTRPEv7NDItGle8_1792562983
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_230947_406015_9F68BC0D 
X-CRM114-Status: GOOD (  14.72  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Change the get_ring_selector hw_ops callback signature from
get_ring_selector(struct sk_buff *skb) to get_ring_selector(u8 ac),
removing the dependency on the skb.

All ath12k get_ring_selector implementations fall into two categories:
 - smp_processor_id(): ignores the skb entirely
 - skb_get_queue_mapping(): only reads the AC value from the skb

Since the AC is the only information extracted from the skb, pass it
directly as a u8 parameter instead. Callers in the dp_tx path now
pass skb_get_queue_mapping(skb), which preserves the exact same
behavior.

This change enables a subsequent patch to call get_ring_selector()
from wake_tx_queue using txq->ac, without needing access to the skb.
mac80211 guarantees that skb_get_queue_mapping(skb) == txq->ac
for any skb dequeued from a given txq, since both values are
derived from the same skb->priority through the same AC mapping.

No functional change.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v8: Split ath11k and ath12k into separate series to avoid conflict
    with Julius's airtime queue limits series (ath11k only) and help to
    unblock both
    No code changes from v7
v7: https://lore.kernel.org/all/20260917064825.12747-3-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath12k/hw.h          | 2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 86fb8b719613..65caa7a2349f 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -243,7 +243,7 @@ struct ath12k_hw_ops {
 	int (*mac_id_to_pdev_id)(const struct ath12k_hw_params *hw, int mac_id);
 	int (*mac_id_to_srng_id)(const struct ath12k_hw_params *hw, int mac_id);
 	int (*rxdma_ring_sel_config)(struct ath12k_base *ab);
-	u8 (*get_ring_selector)(struct sk_buff *skb);
+	u8 (*get_ring_selector)(u8 ac);
 	bool (*dp_srng_is_tx_comp_ring)(int ring_num);
 	bool (*is_frame_link_agnostic)(struct ath12k_link_vif *arvif,
 				       struct ieee80211_mgmt *mgmt);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index d2749de44553..74359e8eea47 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -111,7 +111,7 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 	 * If all rings are full, we drop the packet.
 	 * TODO: Add throttling logic when all rings are full
 	 */
-	ring_selector = dp->hw_params->hw_ops->get_ring_selector(skb);
+	ring_selector = dp->hw_params->hw_ops->get_ring_selector(skb_get_queue_mapping(skb));

 tcl_ring_sel:
 	tcl_ring_retry = false;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index d9fdd2fc8298..7436cf70925a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -49,7 +49,7 @@ ath12k_wifi7_hw_mac_id_to_srng_id_qcn9274(const struct ath12k_hw_params *hw,
 	return 0;
 }

-static u8 ath12k_wifi7_hw_get_ring_selector_qcn9274(struct sk_buff *skb)
+static u8 ath12k_wifi7_hw_get_ring_selector_qcn9274(u8 ac)
 {
 	return smp_processor_id();
 }
@@ -83,9 +83,9 @@ ath12k_wifi7_hw_mac_id_to_srng_id_wcn7850(const struct ath12k_hw_params *hw,
 	return mac_id;
 }

-static u8 ath12k_wifi7_hw_get_ring_selector_wcn7850(struct sk_buff *skb)
+static u8 ath12k_wifi7_hw_get_ring_selector_wcn7850(u8 ac)
 {
-	return skb_get_queue_mapping(skb);
+	return ac;
 }

 static bool ath12k_wifi7_dp_srng_is_comp_ring_wcn7850(int ring_num)
--
2.54.0


