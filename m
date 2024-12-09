Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1795DE77181
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5+BctgxKueFv7gVVXNbRquKt48xw6+/m8NG9JZ9brw=; b=z5CngpQAG2LJ1Pq0M1VAnrlwXj
	87YwQI12OSoGtwu+gcShhxHbRpqROvoW2qpEeKtpbcS/aCYzRPtGfS7bphFWN/AG4D7QuONvUNC5j
	5RHfOjOV/rDZ8i8t9zNGYgVKuYCLkU0ChwfJ7Rd3TjyKDXvGX/5eYX41j7tC91OcrK6Q0KROL3104
	loUaFUpmxSvcr/vB4AodpDuHNF/2N4flIWL21UJB4dghk9sOAxzQ9HzW1PinAMw8AMeUQvoay/zaw
	wY3D5qQBC4XkpHioUTDiFVQgcfR819t/T6bfQe1PDSvek4kcK+CmgqOmgSQlHG9T1GpcTlLL6nnaZ
	m41A1Caw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitv-00000008wGv-3av7
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:54:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKits-00000008wAL-1jgX
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 18:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF72A5C5DB3
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 18:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647B0C4CEE0;
	Mon,  9 Dec 2024 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770472;
	bh=4E1QB2EFTtWLeGwo1mXErVSr4iZbacaVng2KYZeRma4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HNJsd//dXY0ytx1sdAfyrfhz/CvC0k2fYzc7INkX+vN3InB0E2E2aEGcJMViglZuu
	 O2f7+mKy9QPjXARha5nPZoesgWoVr2Sx0B3CuGLzTD8FA8/zDAYmU/azMebpOj1/Wf
	 Ku7etrxvXViqgiV391oeJtFXNG4zpcDn97g3riN+RL97783YoFPjwusJKYU33p0bYe
	 kRl5U6+OA3o7oMhWN1NT7auTQVkjknRmNavazHUCgPV8uN4KIAJGZijtZH1kk4gCw1
	 Nb5KzidPMvA6FY6/g0hlNhS2/HVUSBdeZGBPhAw/+Ex9SKjr1+wcbPC6Cm80WXiDPh
	 AI+krDYEd2K1g==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 8/9] wifi: ath12k: fix ar->supports_6ghz usage during hw register
Date: Mon,  9 Dec 2024 20:54:20 +0200
Message-Id: <20241209185421.376381-9-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209185421.376381-1-kvalo@kernel.org>
References: <20241209185421.376381-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105432_501745_F0DFE98B 
X-CRM114-Status: GOOD (  11.15  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

In the ath12k_mac_hw_register() function's context, ar is an iterator
variable, and there is no assurance that the last ar will be the one with
6 GHz enabled. Therefore, checking directly ar->supports_6ghz outside the
loop is not appropriate.

Additionally, 6 GHz lacks HT capabilities. To obtain the super set of
HT capabilities across all grouped radios, 6 GHz should be excluded.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index de2f55f4ea03..6f4a34c91038 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10723,7 +10723,10 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		if (ret)
 			goto err_cleanup_unregister;
 
-		ht_cap &= ht_cap_info;
+		/* 6 GHz does not support HT Cap, hence do not consider it */
+		if (!ar->supports_6ghz)
+			ht_cap &= ht_cap_info;
+
 		wiphy->max_ap_assoc_sta += ar->max_num_stations;
 
 		/* Advertise the max antenna support of all radios, driver can handle
@@ -10787,7 +10790,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
 	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
 
-	if ((ht_cap & WMI_HT_CAP_ENABLED) || ar->supports_6ghz) {
+	if ((ht_cap & WMI_HT_CAP_ENABLED) || is_6ghz) {
 		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
 		ieee80211_hw_set(hw, TX_AMPDU_SETUP_IN_HW);
 		ieee80211_hw_set(hw, SUPPORTS_REORDERING_BUFFER);
@@ -10803,7 +10806,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	 * handle it when the ht capability different for each band.
 	 */
 	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS ||
-	    (ar->supports_6ghz && ab->hw_params->supports_dynamic_smps_6ghz))
+	    (is_6ghz && ab->hw_params->supports_dynamic_smps_6ghz))
 		wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
 
 	wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
-- 
2.39.5


