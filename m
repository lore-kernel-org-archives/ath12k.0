Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6CBC4345F
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xvo2I6DtHZ1GTbxmGmeQO6WKsUjF9mBEQ5MZ4NT/fNA=; b=n8s6HHO2slPJCxw16SbgmJikmX
	rJVoS+8x4w6JhgPKkctHpCRvKLUWXFeaSk2aNwfyvk6xEDQAEIRgvBt6pz+dbGI82Tp8BugV0EkKU
	qRKVuN5qwt4iecaDdCM8bTAbUazQe/jtfTkb5/FIhJdnQmnMVogihAy/Qxd6R0//B83hSfH2bLOqE
	SJxvSgKWmx+Qzt8kHF5KcoLCSkTahKfIJKDFyloTY2/hoVIfePcLYw5H9rGtWkZVsBnFeMWd5AHCz
	KhO6Yp2powyEtC4+scpghGmvU0IgUa6VTAyRArVrut4WojiewRh7tovpasucHGQZiPajwTZwpn3cs
	7IBrzT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxjJ-0000000DDHZ-0zk6
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 16:56:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxjG-0000000DDFx-2AmX
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 16:56:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79683CE1233
	for <ath12k@lists.infradead.org>; Thu, 11 Apr 2024 16:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2652FC072AA;
	Thu, 11 Apr 2024 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712854607;
	bh=G3zPg14bSk43X5LOlcPxEHGSWhzhgoUV/wAnydN/2hc=;
	h=From:To:Cc:Subject:Date:From;
	b=fzrAUti7gREBqTUX+oPajqdRUKdSdH+x01P8ndHlm7ecDBysWDYcrvy1crkOUAXqm
	 MSagXJS0VYw3NuWs4fcug2ikuLCABcH4ihI/3R55o0BSCyplx9LgXPEB1F0AzGaGbD
	 EY2DvsHY4S68nl18+NtvNqz434XioU1iYOKKW0zx+vP446u0AVXLm1f2uP2tmpI2dG
	 PQbtLUWKTCWFnH71mLmymoetXfu4q7drvbU5q0LfoSZzAlqSKhXC1AawgW2eYVkqvK
	 llDqZNdEq1GQJFaowCdAHP/pcF0PeEXz6KWD857IGsjdmFTTTWlVpTBQq4TV1dblul
	 mzo7YOyeCHxeA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: enable WIPHY_FLAG_DISABLE_WEXT
Date: Thu, 11 Apr 2024 19:56:45 +0300
Message-Id: <20240411165645.4071238-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_095651_000531_933DE463 
X-CRM114-Status: UNSURE (   8.07  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

ath12k will support Multi-Link Operation (MLO) in the future but not yet. A
major change with MLO is that cfg80211 will disable Wireless Extension (WEXT)
user space interface. To avoid having inconsistent user experience, first
supporting WEXT and later not, disable WEXT already now.

Now ath12k claims that WEXT is not supported:

$ iwconfig wlan0
wlan0     no wireless extensions.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f15dcd75157d..e989628d7d72 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8556,6 +8556,12 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
 				   NL80211_FEATURE_AP_SCAN;
 
+	/* MLO is not yet supported so disable Wireless Extensions for now
+	 * to make sure ath12k users don't use it. This flag can be removed
+	 * once WIPHY_FLAG_SUPPORTS_MLO is enabled.
+	 */
+	wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
+
 	hw->queues = ATH12K_HW_MAX_QUEUES;
 	wiphy->tx_queue_len = ATH12K_QUEUE_LEN;
 	hw->offchannel_tx_hw_queue = ATH12K_HW_MAX_QUEUES - 1;

base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
-- 
2.39.2


