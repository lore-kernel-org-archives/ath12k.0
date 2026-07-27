Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6925C531D0
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5c5LHNMDyrfpbCL+oP67Kl7Zt1ZSK6M0DXqAXGnTsGs=; b=q45p8y6j/EsSTpkSGT0J8uGslp
	y1u6Iz9ia4dxD4RR+V6fhovV7p330tHLZwFecdaMEtJlrADfn4gBcvfPUEY44BvYH6tEL7ZxBvbVM
	7i0bTV0RqginbVkc8UCvufgNYPAZL2qIpEvol3oduoif9Do2Mxq4ByGPu+OPpBjuDXDWJlVJgF3xB
	mcsD5qw0eOY9mMxE8iVmEdNHa6GAomXrIk7Uu53Ox7utNLmizE3LJve40LwJnmC1ej9OsuiAMnT2U
	wjJlvShl1QiYlHp9YBpOYeObRBj/m0yHwNchX4TXTW+Xg+3HXBqG2y1O9xNEM34WRPOn9wJ+NzJY9
	LWsgZ1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBf-00000003KDK-1Lwd;
	Mon, 27 Jul 2026 16:28:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBc-00000003K9c-0JfZ
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 16:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5c5LHNMDyrfpbCL+oP67Kl7Zt1ZSK6M0DXqAXGnTsGs=;
	b=Z1mt5Q96yRMLcazktXSyJUUdeExCM48DfbJ0Pps7ZOpvSADhWzC0RS+NHuP2BwZ+t3g21c
	+eSbQsgmdiE7xjwIfiBe71Lt3+OSljvuISz2BZqhq76GEACcnJn0qHbnRFF5taCv+gHAui
	+85YjrXbQpX7qaKIcP+obGMDpiEQnkU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-ZL5RVDsFO5aq4w3Pe7Z7_Q-1; Mon,
 27 Jul 2026 12:28:10 -0400
X-MC-Unique: ZL5RVDsFO5aq4w3Pe7Z7_Q-1
X-Mimecast-MFC-AGG-ID: ZL5RVDsFO5aq4w3Pe7Z7_Q_1785169689
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 939BC195606D;
	Mon, 27 Jul 2026 16:28:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.58])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 26858429;
	Mon, 27 Jul 2026 16:28:06 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 2/5] wifi: ath12k: prevent scan during firmware recovery
Date: Mon, 27 Jul 2026 18:27:45 +0200
Message-ID: <20260727162748.963275-3-jtornosm@redhat.com>
In-Reply-To: <20260727162748.963275-1-jtornosm@redhat.com>
References: <20260727162748.963275-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: t4sMQtMeZj-pbVPedMNpes-cJghG_e6xx8rmmZfym30_1785169689
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092816_275014_76B9C5BC 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

When firmware crashes while wpa_supplicant has an active connection,
wpa_supplicant may immediately attempt a scan via nl80211 while the
firmware is still powering on through MHI. ath12k_mac_op_hw_scan()
proceeds without checking the recovery state, accessing partially
initialized radio structures which leads to a NULL pointer dereference:

  BUG: unable to handle page fault for address: 0000000000001508
  RIP: ath12k_mac_op_hw_scan+0x148/0x2b0 [ath12k]
  Call Trace:
   drv_hw_scan+0x88/0x140 [mac80211]
   __ieee80211_start_scan+0x2bc/0x6b0 [mac80211]
   nl80211_trigger_scan+0x54a/0x9f0 [cfg80211]

Fix by checking ATH12K_FLAG_RECOVERY at the start of
ath12k_mac_op_hw_scan() and returning -EBUSY. mac80211 will retry the
scan after the recovery completes.

Tested on WCN7850 with MLO (Wi-Fi 7).

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f33976fc1233..924c3c21ca78 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5707,6 +5707,9 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
+	if (test_bit(ATH12K_FLAG_RECOVERY, &ah->radio[0].ab->dev_flags))
+		return -EBUSY;
+
 	chan_list = kzalloc_objs(*chan_list, hw_req->req.n_channels);
 	if (!chan_list)
 		return -ENOMEM;
-- 
2.54.0


