Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52012C02183
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 19:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nqLyocNQWSekMDBFwqG+Wyvol9ScQupxsUOjyFpXlYU=; b=zP6ZNli5lGOq4AzyCqq+QC4jC+
	62YTnRCoqZDQ7NCg1+ySVsZun3+VyXQ3o1ciij7swUopfcM140v5o8T4XwT0wIQR5TfYwY+PHITl3
	CLsP9GWVzSZnkWVLSpfB3/VdkJiLshCeLZb8zIeajpGlBNNBxsK9FgCS+1wDmBpkxQYlrJlU/PXk6
	X6PBJFl/Ta2UciQuwFLePVzt7k0NUAT9l5dR71XMna0EBSghbU1XxTSna9/cuZOJY4BBl2gx4bGz5
	O/IXdsl4j78XY34+Rdlxpn2R6jx/LJTmWmoVoRHtHmgQgPW3PTHNIMspejW4FO6JtqKdl2obNwLeG
	jlBfcM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYs8B-00000001Fy3-0QHl
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 19:35:47 +0000
Received: from e3i103.smtp2go.com ([158.120.84.103])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYs70-00000001FhP-2ITK
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 19:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1737142461; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=nqLyocNQWSekMDBFwqG+Wyvol9ScQupxsUOjyFpXlYU=;
 b=zFv3n7C58aKQUUnVzDcBXR3Qbd/luc+qggE6mgGDLdYHxA+RkpTJ78jI/l/RyDtJZ/dwy
 mfVV3iECq9ZlXYkGapgCC1+iR6WWh40XTYzhzI55ZMuQqDOmBQjfhHsp4wEhuxakplhvCrn
 6phZIUyN1PwYbICqlwSXm3jBLRSCIBplDRmSlRkZMDnZjQVNijSCq8O+FTqx7ScWjlUz388
 l+2juToFWrzmfVXOXmQ0ZkYdI99vNTJnD366GwiON7NdfQ39WSlWRYm+zUui/wp48EFiUmd
 U7JBTd03lX1vG4IGeMs39aoOe+44cX/W03wXVWS8T3kjAn0ZWPQHCRhVWIZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1737142461; h=from : subject
 : to : message-id : date;
 bh=nqLyocNQWSekMDBFwqG+Wyvol9ScQupxsUOjyFpXlYU=;
 b=Xe79q+1IqHOlL28GxRu30djG14Q9dUQ3OlaBHmbZkxstRoJ1U+5Lqq9KlGlCjYWz8Vnqq
 nR0nbkKIpTPF1fbYb47aiKo1Q1VHKffWnRqQZef38EF2RHZRRtdz3wmeWW4PRRCNZLoehw2
 Kn6x8MvgZlV1TclHawGTCP5rRa7WfCOv+efWC/JTrzgTh/1FpkxLI+y+js4rqtWGeMjhEaO
 EDp4HPKVYzf3kIVkKJoseaCu+8kIGY6CEnxWNFegXoAzTthcw0pBBqAI6XbSpjGeCHq0/sc
 CqDxk/OuLqTl6boQnysX7zz8Jpf0cnCm+h+DM7mzSWfWBalICVNqHeobifAw==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1tYs6k-FnQW0hPqndm-m5Sk;
	Fri, 17 Jan 2025 19:34:18 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH] wifi: ath12k: remove return for empty tx bitrate in mac_op_sta_statistics
Date: Fri, 17 Jan 2025 20:30:53 +0100
Message-Id: <a4bdebd14f5dbec653b75277097917910344f244.1737142154.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sFbIzu7jfk
X-smtpcorp-track: YP12T0xgWUKL.VhdMIKU_bhuY.sTPIsQ8-ewH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_113435_028585_410CABE1 
X-CRM114-Status: GOOD (  13.65  )
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

Currently in ath12k_mac_op_sta_statistics() there is the following
logic:

    if (!arsta->txrate.legacy && !arsta->txrate.nss)
        return;

Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
if it return for empty legacy and nss of arsta->txrate, then the other
stats after it will not be set.

To address this issue remove the return and instead invert the logic to set
the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).

The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
mac_op_sta_statistics").

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/net/wireless/ath/ath12k/mac.c | 29 +++++++++++++--------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d493ec812055..cbc79ec7ac47 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8912,21 +8912,20 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->tx_duration = arsta->tx_duration;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
 
-	if (!arsta->txrate.legacy && !arsta->txrate.nss)
-		return;
-
-	if (arsta->txrate.legacy) {
-		sinfo->txrate.legacy = arsta->txrate.legacy;
-	} else {
-		sinfo->txrate.mcs = arsta->txrate.mcs;
-		sinfo->txrate.nss = arsta->txrate.nss;
-		sinfo->txrate.bw = arsta->txrate.bw;
-		sinfo->txrate.he_gi = arsta->txrate.he_gi;
-		sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
-		sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
-	}
-	sinfo->txrate.flags = arsta->txrate.flags;
-	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+	if (arsta->txrate.legacy || arsta->txrate.nss) {
+		if (arsta->txrate.legacy) {
+			sinfo->txrate.legacy = arsta->txrate.legacy;
+		} else {
+			sinfo->txrate.mcs = arsta->txrate.mcs;
+			sinfo->txrate.nss = arsta->txrate.nss;
+			sinfo->txrate.bw = arsta->txrate.bw;
+			sinfo->txrate.he_gi = arsta->txrate.he_gi;
+			sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
+			sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
+		}
+		sinfo->txrate.flags = arsta->txrate.flags;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+	}
 
 	/* TODO: Use real NF instead of default one. */
 	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
-- 
2.40.0


