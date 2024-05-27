Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB15C25B7D
	for <ath12k@archiver.kernel.org>; Mon, 27 May 2024 14:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXuwxL+Sd9un+WuLue5a8yZs67NMJIDHM1UEjFrAetA=; b=fGKwXI55hDbM0NPJFCkIDm5Caf
	FxNvf1d9o2ffSUqmkPG6QWaIccLEcBWmmG4Jm2WoHLBDfy9lim0JwOaKKdQA0zq/WEvaplXfHveRF
	x4Fg5Mjl+kC2NkxA2/+fKdNv8x95j0b8xyPy4M0BzsbLvP65JIlOzCsxICEGFUBTYYu1SpknwibOG
	IdYN2Bk5gvff+Ad41VyO1l1ynlsfRLqMyd4LqbYwUBmVK1/x9Rg2TmH7htg0/cKowdsP7n2Le+YX8
	0Fh7QsMeTSF26jsx2z7Nr1/k4PeqtFm9UchlSog8UfMys8QvdVm+5YzcyaWy+oPLKj+eo00zOXCw7
	mqQpGaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBb83-0000000FIm4-1Xwv
	for ath12k@archiver.kernel.org;
	Mon, 27 May 2024 14:15:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBb7y-0000000FIip-0TqS
	for ath12k@lists.infradead.org;
	Mon, 27 May 2024 14:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 097D861244;
	Mon, 27 May 2024 14:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E40C32781;
	Mon, 27 May 2024 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716819304;
	bh=LCTo4W6Sd0YOU46uvur/qnfKTRHtLNeR0VCT8BV92P0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T2Vcm7nKlV4eCccWXvC6m7Uki5xrcOWoA522kj443ohXbFIpbfHP1VuZJXj+MjTn+
	 YZbuh7EmoQd3byLnEkt0l6mk92TBK6GoWQw2w/RfAS9G7M7RS/o54QH7a42YzRjMdW
	 3rzVLiLjwxujbxvjjISF5lXPupXJ7Dt2ItLMwFJl708Bca9kJtJWLYCD1vYg6T7XeW
	 9Hltezbd3yXC8ky7RAWlN9hmoOzDEYJvtlVLHlo8CPhT/xHpdYpUcd4aYXbwyeSV3z
	 xDh5VHVwonRNgz1BxLId0bwLZ+5fzaK2soQgbcYG3QbPyhX/ITvCkl9t8Mhg/CTzMv
	 zoLT2Nn1XbSkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lingbo Kong <quic_lingbok@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.8 22/30] wifi: ath12k: fix the problem that down grade phy mode operation
Date: Mon, 27 May 2024 10:13:31 -0400
Message-ID: <20240527141406.3852821-22-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527141406.3852821-1-sashal@kernel.org>
References: <20240527141406.3852821-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_071506_314949_6A83690D 
X-CRM114-Status: GOOD (  16.64  )
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

From: Lingbo Kong <quic_lingbok@quicinc.com>

[ Upstream commit bf76b144fe53c7f0de9e294947d903fc7724776f ]

Currently, when using WCN7850 or QCN9274 as AP, ath12k always performs down
grade phy mode operation regardless of whether the firmware supports EHT
capability or not and then vdev will start in HE mode. When stations that
support EHT capability try to connect to the AP, the AP will set phy mode
to EHT after receiving the association request packet, and then send
WMI_PEER_ASSOC_CMDID command to firmware, AP’s firmware will crash.

This is because when the ath12k_mac_copy_sband_iftype_data() function
handles EHT capability, it does not copy the EHT capability into the
iftype[band][type] array according to the interface type. So, interface
type should not be used as an index to get eht_cap in
ath12k_mac_check_down_grade_phy_mode() function.

To address this issue, use types_mask to select the eht_cap in
ath12k_mac_check_down_grade_phy_mode() function.

This patch affects QCN9274 and WCN7850 because they have the same issue.

Hostapd log:
wlo1: STA 02:03:7f:37:12:34 IEEE 802.11: Could not set STA to kernel driver

Kernel log:
[270894.816076] ath12k_pci 0000:03:00.0: failed to send WMI_PEER_SET_PARAM cmd
[270894.816111] ath12k_pci 0000:03:00.0: failed to setup peer SMPS for vdev 0: -108
[270894.816122] ath12k_pci 0000:03:00.0: Failed to associate station: 02:03:7f:37:12:34
[270894.843389] ieee80211 phy5: Hardware restart was requested
[270894.843517] ath12k_pci 0000:03:00.0: failed to lookup peer 02:03:7f:37:12:34 on vdev 0
[270894.843616] ath12k_pci 0000:03:00.0: failed to send WMI_PEER_DELETE cmd
[270894.843650] ath12k_pci 0000:03:00.0: failed to delete peer vdev_id 0 addr 02:03:7f:37:12:34 ret -108
[270894.843663] ath12k_pci 0000:03:00.0: Failed to delete peer: 02:03:7f:37:12:34 for VDEV: 0

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240425083837.5340-1-quic_lingbok@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b965fc46ad89a..d67ee0312c1d9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5911,14 +5911,24 @@ ath12k_mac_check_down_grade_phy_mode(struct ath12k *ar,
 				     enum nl80211_band band,
 				     enum nl80211_iftype type)
 {
-	struct ieee80211_sta_eht_cap *eht_cap;
+	struct ieee80211_sta_eht_cap *eht_cap = NULL;
 	enum wmi_phy_mode down_mode;
+	int n = ar->mac.sbands[band].n_iftype_data;
+	int i;
+	struct ieee80211_sband_iftype_data *data;
 
 	if (mode < MODE_11BE_EHT20)
 		return mode;
 
-	eht_cap = &ar->mac.iftype[band][type].eht_cap;
-	if (eht_cap->has_eht)
+	data = ar->mac.iftype[band];
+	for (i = 0; i < n; i++) {
+		if (data[i].types_mask & BIT(type)) {
+			eht_cap = &data[i].eht_cap;
+			break;
+		}
+	}
+
+	if (eht_cap && eht_cap->has_eht)
 		return mode;
 
 	switch (mode) {
-- 
2.43.0


