Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5777C0218D
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yI14DNCfIlRuCxZ886YFaQ2/UtcUwqmz1COfGxdJOeo=; b=KRJPMrnSKf7xNZNAXY1bpN9loD
	PrWCdDrS0fG604pGRUPqb2Md5h5MVDsIvufgGhojSRXtkUg0Ww3dvxylSmotWct1rkVQoYi1Plmh5
	PDkyh0Zz5uU5GblN/u2+khBu+Gcy+Vl+8JUtfdveb0PaBGzQZugV/nQKtpIsnXHfJkCMGJ2cJZ88Z
	CzPNYLNA6KUPIUmR4mB2epk4pDCrxcLR1U4C+klLCuFGGgX8bB+H0n2DmD5nQ2Pfl5/CGRWfHLPQB
	a+YuOHuHNmlUd7tu+2N6X/RCwyHwokrV9ioJ17TQC65gVfIeWv9X8NANVibZHJFU6wdvwoZrEz6Cg
	efOT898g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBPT-00000007RdN-1Kup
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 16:59:27 +0000
Received: from e3i103.smtp2go.com ([158.120.84.103])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBPQ-00000007RbZ-1jyc
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 16:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1738169953; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=yI14DNCfIlRuCxZ886YFaQ2/UtcUwqmz1COfGxdJOeo=;
 b=kBuLg8CkxaHJjnIZU8u2ftsZ7ll6McbFne4bfmLGQaVpxzNOew2oCDJSrJZR8JUoLIL+e
 6+IkrsQug5u/nxZ5Wh561piqoKxqkaWepQ7BFD5UOrYuRTWwxXLp9qQubdqG6F7fNxpp4B6
 gBJ9wQmBHhuEO5h6XCiCH+B83Mh614q/ap6/s7sX+XjkqXJbpV/K0mGhWDa8j8fSZhzHKHH
 xzUFA/s9l3hjn+5b1CcGI3VnuqPOjRnx19/Cr277yzmINbl/6TdR2xDg7qlj82QrvcAd/GH
 dYHFZvmRlNb8IHUYLDBbakOB+g4WXU3LgdTKkQEVe9ed8Fy6Qxmni6Qm6shA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1738169953; h=from : subject
 : to : message-id : date;
 bh=yI14DNCfIlRuCxZ886YFaQ2/UtcUwqmz1COfGxdJOeo=;
 b=gWZFAFxYD/fo6M8JWRz0TZL7Scg93zIj5uggzf/+Q2HXk9nBZEzXhdsP/C9QtfaL0d66F
 lnf0BgdMr7zmsitMTPuYABdM566yXwAGYVQX0XXdF2tgs3fe4n+2AomMZ3ldbKC+yqzWriH
 oFFU5hbDWBgmqk/RaNnpQTrOrxwrIIePiOX/JhDMy8U+Mn0SGvnuWf5tmam0YcjUFyH3vUi
 LNeDXYszTAjuNygaJAXP5SWHCi7iv90pnAC1ewrKGX3IKwn532l0NF+R+bHKjDuO0V4g/wj
 JJe3ruwWaGlIkwghPR12JM6WqbumXI0E+h55/ZtuEsI3QB7ajQmw9IzXBn4Q==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1tdBP9-FnQW0hPzWk4-mJHD;
	Wed, 29 Jan 2025 16:59:07 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in mac_op_sta_statistics
Date: Wed, 29 Jan 2025 17:55:17 +0100
Message-Id: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sIr91F9xb_
X-smtpcorp-track: A6r6iXVkFCWS.u1retUt8DZAu.cnX2UAfla6s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_085924_869194_463AC82B 
X-CRM114-Status: GOOD (  14.27  )
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
Changes in v2:
  - Rebase on ath-next

 drivers/net/wireless/ath/ath12k/mac.c | 33 +++++++++++++--------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4fb7e235be66..e9663c6ac72c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10170,23 +10170,22 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
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
-		sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
-		sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;
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
+			sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
+			sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;
+		}
+		sinfo->txrate.flags = arsta->txrate.flags;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+	}
 
 	/* TODO: Use real NF instead of default one. */
 	signal = arsta->rssi_comb;
-- 
2.40.0


