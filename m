Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282160A383F
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 06:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XHg8TVN2;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZgnxTjQF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDzscdlNdBwJxDTI+JBtY86EAYkaK9/E9rq6UIfl1PE=; b=XHg8TVN2gQgjV4vjreM8cejCB2
	GVfVQGmqwt0/haqlhF8Kfwc0UUmAje6WGXQQTNFtKWrdISM/iQFNJo7y6YF5NhdkyU9NA9x1tGffu
	7csQggKwKF7oUEnGzA0Ma6WkR1nPxpNBuryvx+YFYjmOF9n7VjVIycVyxKBRpxtOxyFc99dvZJfUr
	/5iABisT6uMSU23VNdeF/0maaWdsjZnXgAdPtSrxWLxnHAmEDKwWRMmJoHhjCGWS97HQpHIYoE+Xu
	NuX33txSunyJmv3aZavQUe2ujgSOupwNoBMiCfhmvqeY2jQf9ImTiGlj41VXo868hZrYZ3kcpUFvH
	Fn9GkL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPUN-0000000B8Mm-3PDR;
	Wed, 21 Oct 2026 06:07:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPUL-0000000B8K1-03wE
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 06:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDzscdlNdBwJxDTI+JBtY86EAYkaK9/E9rq6UIfl1PE=;
	b=ZgnxTjQFimX07Je5Tf0MG1OTjg+JvKchtkJfnf/bF+uC9oOSjvwsNNVde4gTlqo77fXx3z
	VCqXaBHYsCdd4WRUN3Oapxt9TDTGzeAzt8k9Xtzb3nLnrPB8WnDJOKjGtiSYY2YVJkVxJZ
	oytB4DiLkYV/Gl5gy6Aowgju32IjPkU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-274-c0UagYrcOxSlhAXQ7XSlGQ-1; Wed,
 21 Oct 2026 02:07:44 -0400
X-MC-Unique: c0UagYrcOxSlhAXQ7XSlGQ-1
X-Mimecast-MFC-AGG-ID: c0UagYrcOxSlhAXQ7XSlGQ_1792562863
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B4221956095;
	Wed, 21 Oct 2026 06:07:43 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C09830000E3;
	Wed, 21 Oct 2026 06:07:40 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: tamizh.raja@oss.qualcomm.com,
	julius@bairaktaris.de,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v8 2/3] wifi: ath11k: remove skb parameter from get_ring_selector
Date: Wed, 21 Oct 2026 08:07:24 +0200
Message-ID: <20261021060725.242681-3-jtornosm@redhat.com>
In-Reply-To: <20261021060725.242681-1-jtornosm@redhat.com>
References: <20261021060725.242681-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: L_nwUbvRbPklKWpeZqmFVQz2G57CPb_sCfqoUooS6S0_1792562863
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_230749_163781_52A038D3 
X-CRM114-Status: GOOD (  16.33  )
X-Spam-Score: 1.2 (+)
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

After the previous patch switched WCN6750 from skb_get_hash() to
skb_get_queue_mapping(), all get_ring_selector implementations fall
into two categories:
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

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # IPQ8074 WLAN.HK.2.9.0.1-02146
---
v8: Split ath11k and ath12k into separate series to avoid conflict
    with Julius's airtime queue limits series (ath11k only) and help to
    unblock both
    No code changes from v7
v7: https://lore.kernel.org/all/20260917064825.12747-3-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath11k/dp_tx.c |  2 +-
 drivers/net/wireless/ath/ath11k/hw.c    | 16 ++++------------
 drivers/net/wireless/ath/ath11k/hw.h    |  2 +-
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806..083aca8ff355 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -108,7 +108,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,

 	pool_id = skb_get_queue_mapping(skb) & (ATH11K_HW_MAX_QUEUES - 1);

-	ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb);
+	ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb_get_queue_mapping(skb));

 tcl_ring_sel:
 	tcl_ring_retry = false;
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index d679e39dce03..8a28c1d4c17b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -876,22 +876,14 @@ static bool ath11k_hw_wcn6855_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
 }

-static u32 ath11k_hw_ipq8074_get_tcl_ring_selector(struct sk_buff *skb)
-{
-	/* Let the default ring selection be based on current processor
-	 * number, where one of the 3 tcl rings are selected based on
-	 * the smp_processor_id(). In case that ring
-	 * is full/busy, we resort to other available rings.
-	 * If all rings are full, we drop the packet.
-	 *
-	 * TODO: Add throttling logic when all rings are full
-	 */
+static u32 ath11k_hw_ipq8074_get_tcl_ring_selector(u8 ac)
+{
 	return smp_processor_id();
 }

-static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
+static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(u8 ac)
 {
-	return skb_get_queue_mapping(skb);
+	return ac;
 }

 const struct ath11k_hw_ops ipq8074_ops = {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..b6bc8b72d812 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -273,7 +273,7 @@ struct ath11k_hw_ops {
 	u16 (*mpdu_info_get_peerid)(struct hal_rx_mpdu_info *mpdu_info);
 	bool (*rx_desc_mac_addr2_valid)(struct hal_rx_desc *desc);
 	u8* (*rx_desc_mpdu_start_addr2)(struct hal_rx_desc *desc);
-	u32 (*get_ring_selector)(struct sk_buff *skb);
+	u32 (*get_ring_selector)(u8 ac);
 };

 extern const struct ath11k_hw_ops ipq8074_ops;
--
2.54.0


