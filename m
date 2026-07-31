Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F818C55167
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PaAQTmlOMd06PkqEAPuFL99vI9+HiZN6O3AduG47ias=; b=hZWhvBA++T2r6V89Pf9mVKmFYy
	5KYvPamkzAoFBiZxfLnLwXbZZKeYXEW7shmFb1NaUfD+cJc5Q1WdYOX5JXMN7lGWtBgW2x3U2Adfw
	MSGTL/aCL0ExOnOfI4d+b9XdMy1khUgie6gdANa0Ax3trpPxXQ7qEt+NuzsxMF6hfqYyjIL5IlmZc
	PlycwvdGc0wYJyKMvRYgLtJUHeB07z0YAydKoYaIiNJ5rdg+MbFZWFY1ettdFZUvhpOfLwdE4fS4r
	y2RE9f2YvVTDI139kAVIoJlLvSpjun8rsaWqKSxFFTrNNcj6vkwRPY0VsF/47WPAiiakC1f07uw6v
	BB9OL1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjhV-0000000CCSF-3eEu;
	Fri, 31 Jul 2026 09:38:45 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjhS-0000000CCNz-3jVQ
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 09:38:45 +0000
X-UUID: 92a7a8fc8cc311f1aa26b74ffac11d73-20260731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d094bfa7-92a3-4945-9b07-ba45c770eee9,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:3c8b99839c04532afa33c58d0b1856f6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 92a7a8fc8cc311f1aa26b74ffac11d73-20260731
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1381001783; Fri, 31 Jul 2026 17:38:23 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkai Gong <gonglinkai@kylinos.cn>
Subject: [PATCH] wifi: ath12k: fix channel list double-free on error paths
Date: Fri, 31 Jul 2026 17:38:16 +0800
Message-Id: <20260731093816.1771338-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_023843_250131_E412E6C6 
X-CRM114-Status: UNSURE (   8.55  )
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

ath12k_mac_setup_channels_rates() frees band channel arrays on failure
but either leaves the pointers non-NULL or clears the wrong band. Later
ath12k_mac_cleanup_unregister() frees the same pointers again.

Clear the correct sbands[].channels pointers after kfree(), including
a copy-paste bug that nulled 2 GHz after freeing 6 GHz channels.

Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a0928890671a..5468a8d2d5d5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14275,6 +14275,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 					   sizeof(ath12k_6ghz_channels), GFP_KERNEL);
 			if (!channels) {
 				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
+				ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
 				return -ENOMEM;
 			}
 
@@ -14325,7 +14326,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 					   GFP_KERNEL);
 			if (!channels) {
 				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
+				ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
 				kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
+				ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
 				return -ENOMEM;
 			}
 
@@ -14365,7 +14368,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 					kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
 					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
 					kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
-					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
+					ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
 					kfree(channels);
 					band->channels = NULL;
 					return ret;
-- 
2.25.1


