Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A9C55ABF
	for <ath12k@archiver.kernel.org>; Tue,  4 Aug 2026 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3THMtZXW+3uc+ICg/Df1H+KExhySdFSX7okiNUpifcE=; b=1LHR/2qSUTGa/lrolL/AV3d00j
	dEqzKXbJmoXQb8ii1vjP2wZjlIXaI7wTkVbXNOBCBXu80JkkzA0V38sJ+b45nXo99BQga/8USIXQ8
	1/lLijFDJuv0t18V9o1ygYKN6e3b9wZwR1KFvAfRLtYKeG3t8R//joMfTytkSng06zlkUunPerD83
	GgJs9OxT/H6f/JRDF+vbpDHkxu4tCjhReH60uWxGSIxuM1xwxE15qywqsC03SPsezArLFfbc0j5CE
	qzZEQkHNESWGOTv1ewDfFD6GBCGZ2vKeRonvXHrZQ53dEYnLyq1XFbtO4H51l75uMBd6FgyJPHE8l
	V/KsktJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHV-00000002WmO-28Xl;
	Tue, 04 Aug 2026 17:50:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHT-00000002Wk9-1PQd
	for ath12k@lists.infradead.org;
	Tue, 04 Aug 2026 17:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785865822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3THMtZXW+3uc+ICg/Df1H+KExhySdFSX7okiNUpifcE=;
	b=i53HJ5gz28H3i5YxXlaJYC7mLzLbR4swVmblhdtywelOmfbpnzmJB3m3Yns9Mp/jsYdH7f
	qrb2825VBUKKTukSJ9R1UmK7Amd73tgsX2wBmQcl9Xl8GKbrOG1U/RHP8VzIHAx7DucAM4
	elVvJe4JuI7IaILg7bqY4Zq1Rs/lnzo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-298-3BnXttuiPQ6vBgz91YnuVw-1; Tue,
 04 Aug 2026 13:50:19 -0400
X-MC-Unique: 3BnXttuiPQ6vBgz91YnuVw-1
X-Mimecast-MFC-AGG-ID: 3BnXttuiPQ6vBgz91YnuVw_1785865817
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB9761956095;
	Tue,  4 Aug 2026 17:50:16 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 84015180044F;
	Tue,  4 Aug 2026 17:50:14 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v2 2/3] wifi: ath12k: prevent scan during firmware recovery
Date: Tue,  4 Aug 2026 19:50:00 +0200
Message-ID: <20260804175004.1761075-3-jtornosm@redhat.com>
In-Reply-To: <20260804175004.1761075-1-jtornosm@redhat.com>
References: <20260804175004.1761075-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: w7hCdnInx5ilTHf2r4luoOmgNVr_GatwvThpJPxnAjM_1785865817
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105023_439356_DC65772B 
X-CRM114-Status: GOOD (  10.02  )
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
v2: Fix radio[0] usage
v1: https://lore.kernel.org/all/20260727162748.963275-3-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7b7110ca6428..a57c2e91be84 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5783,6 +5783,11 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
+	for_each_ar(ah, ar, i) {
+		if (test_bit(ATH12K_FLAG_RECOVERY, &ar->ab->dev_flags))
+			return -EBUSY;
+	}
+
 	chan_list = kzalloc_objs(*chan_list, hw_req->req.n_channels);
 	if (!chan_list)
 		return -ENOMEM;
-- 
2.54.0


