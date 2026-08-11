Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B205DC5AD55
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 02:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=afQQiqA4DfHH5DYUORHuNJC+RE5xuDKNN7p8accPFzo=; b=FN38y89vAlFr4g6oWwg6QetuGt
	2CE/3EWIkHc8ODDypuULlvbw9dPSghEVlra9zVQHar1yUu+JcV4kiPWAxTn4g8cPB5Bhr5I3mfXNk
	ZyESbQqUteSE08alWd5pd25PR3Dcj/NoW/I3ZMx6Jg1/Zw60dDLnUvH1puMiRzr6piC6F7UkiR5uQ
	JJcKogp1Ac2XNpWAL0U2hKB/Mh+KuE7RiQ0qyOg5oXzZj26NTmIvoJ7NcBqTBMahCruyXNIccqgb2
	BoAWID9Wnq5ODlIjAMiJ8cL5hU/Gpoj0QX4x+pkZo4vpmuXS9Fu20uTpvsYHJT6iy776E964DiSB2
	jjvRecJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbs5-0000000D8hr-1L9E;
	Tue, 11 Aug 2026 02:05:41 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbs2-0000000D8hK-0Zw5
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 02:05:39 +0000
X-UUID: 1f68cba0952911f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7995a7f5-d21c-4e51-b97a-4df6af6f24c2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:ada4e8981b36a3b7121364e59c9c4544,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1f68cba0952911f1aa26b74ffac11d73-20260811
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1834017646; Tue, 11 Aug 2026 10:05:27 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: jjohnson@kernel.org
Cc: vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	baochen.qiang@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkai Gong <gonglinkai@kylinos.cn>
Subject: [PATCH v2] wifi: ath12k: clear dangling channel pointers on error paths
Date: Tue, 11 Aug 2026 10:05:23 +0800
Message-Id: <20260811020523.387433-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_190538_490736_18E1B339 
X-CRM114-Status: UNSURE (   8.57  )
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

On failure, ath12k_mac_setup_channels_rates() frees band channel
arrays but leaves the pointers set, or clears the wrong band after a
copy-paste typo (6 GHz free paired with a 2 GHz NULL). Clear the
matching sbands[].channels pointer after each kfree().

Compile tested only.

Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
v2:
- reword commit message (dangling pointers + typo, not double-free)
- drop Fixes tag
- note compile tested only

v1: https://lore.kernel.org/all/20260731093816.1771338-1-gonglinkai@kylinos.cn/

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


