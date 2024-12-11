Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A961E77180
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYolpAcsBCXNHREH9EdS3bKFK4g+TEEUQVRF8wo3UMU=; b=DYKiTB2M+e15dGzXYXmCCCR4ib
	p3pZ1UQvi6M12X5ieNF8z26nAEgspQKmsvwy60pq2+KdreTFwdO7jLAyyzrD8hP/Rg9KR9r4oUrt2
	I0Lg+5TsyPgEbzT8+yEhRwAeCvla6ijPBFYeMtmlaVtgQIV43oFubnYt1sXTTPG3PwmIcN3n2rtYw
	a2m/q3/dS4b6sCL3f5hiwtgVDTvxny5ILwEPxFLNAwyoZ1U/JTNEsRKk0cukHwWcA5tRNtYpAd6lX
	gQ65/isp3bNBDx1FHKLLzSshRY8hVQKtzLMOexOxKMkDrBGQcLyRdz+3Nu3gOE0KfB8LlOenfFWu5
	K6u/J1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsm-0000000FJ4a-0UpF
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:44:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsj-0000000FJ0i-0LHw
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A3115C5846
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD36C4CED2;
	Wed, 11 Dec 2024 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931848;
	bh=DqTLVZV8zhZm7A0j4ZOugixaSJ2bB+fdZrrezCoitM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FZ80JkXIANerCjMjx2RphwRXmPF3UmXgh4OF0iXi1G81SZ8RqOhD+TJtlKcXqQ1J9
	 3Z+mfDJXfEx+hPZHI2JBsM9729ox5LkSrqzo+4RnvPcQOIMBeV6GHChTPOscnUjepI
	 ZSZ2qn5zOWeLEuhxqnD6WHDgRzxUo1qHuC01fHrE0qxz9wjs835NN68mRBQxzaJjYz
	 PJjwXieUgXX8iu0IAmbar57/xlJVa++E68TWTFrIahs6Kdqwe8yvtQH9B6d4zJNsRW
	 gdNeI64ixHbuSyuXXF5aJNaj6vaA3H5AMfO1rVu9x46qZG4YrJO9VL9+bxtHyTA0Yc
	 nfxxPiDdmJ2Cw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 7/7] wifi: ath12k: advertise MLO support and capabilities
Date: Wed, 11 Dec 2024 17:43:58 +0200
Message-Id: <20241211154358.776279-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211154358.776279-1-kvalo@kernel.org>
References: <20241211154358.776279-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074409_210416_4FAB3C15 
X-CRM114-Status: GOOD (  13.92  )
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

From: Rameshkumar Sundaram <quic_ramess@quicinc.com>

Now everything in ath12k is in place and we can enable Multi-Link Operation
(MLO) in the driver. For now it's only enabled for QCN9274 with firmware having
ATH12K_FW_FEATURE_MLO feature bit set.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 13 ++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.c  |  3 +++
 drivers/net/wireless/ath/ath12k/wmi.h  |  2 ++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d07b54f441c3..ec61ad3d82c3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -773,6 +773,8 @@ struct ath12k_pdev_cap {
 	u32 tx_chain_mask_shift;
 	u32 rx_chain_mask_shift;
 	struct ath12k_band_cap band[NUM_NL80211_BANDS];
+	u32 eml_cap;
+	u32 mld_cap;
 };
 
 struct mlo_timestamp {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7962bfa955ba..6c20c71ada62 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10693,7 +10693,7 @@ static const u8 ath12k_if_types_ext_capa_ap[] = {
 	[10] = WLAN_EXT_CAPA11_EMA_SUPPORT,
 };
 
-static const struct wiphy_iftype_ext_capab ath12k_iftypes_ext_capa[] = {
+static struct wiphy_iftype_ext_capab ath12k_iftypes_ext_capa[] = {
 	{
 		.extended_capabilities = ath12k_if_types_ext_capa,
 		.extended_capabilities_mask = ath12k_if_types_ext_capa,
@@ -10710,6 +10710,8 @@ static const struct wiphy_iftype_ext_capab ath12k_iftypes_ext_capa[] = {
 		.extended_capabilities_mask = ath12k_if_types_ext_capa_ap,
 		.extended_capabilities_len =
 				sizeof(ath12k_if_types_ext_capa_ap),
+		.eml_capabilities = 0,
+		.mld_capa_and_ops = 0,
 	},
 };
 
@@ -10919,6 +10921,15 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	 */
 	wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
 
+	/* Copy over MLO related capabilities received from
+	 * WMI_SERVICE_READY_EXT2_EVENT if single_chip_mlo_supp is set.
+	 */
+	if (ab->ag->mlo_capable) {
+		ath12k_iftypes_ext_capa[2].eml_capabilities = cap->eml_cap;
+		ath12k_iftypes_ext_capa[2].mld_capa_and_ops = cap->mld_cap;
+		wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
+	}
+
 	hw->queues = ATH12K_HW_MAX_QUEUES;
 	wiphy->tx_queue_len = ATH12K_QUEUE_LEN;
 	hw->offchannel_tx_hw_queue = ATH12K_HW_MAX_QUEUES - 1;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index cf5c3efec4b7..7b3597061b34 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4662,6 +4662,9 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 					  caps->eht_cap_info_internal);
 	}
 
+	pdev->cap.eml_cap = le32_to_cpu(caps->eml_capability);
+	pdev->cap.mld_cap = le32_to_cpu(caps->mld_capability);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index cd3de0a65543..b6a197389277 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2716,6 +2716,8 @@ struct ath12k_wmi_caps_ext_params {
 	__le32 eht_cap_info_internal;
 	__le32 eht_supp_mcs_ext_2ghz[WMI_MAX_EHT_SUPP_MCS_2G_SIZE];
 	__le32 eht_supp_mcs_ext_5ghz[WMI_MAX_EHT_SUPP_MCS_5G_SIZE];
+	__le32 eml_capability;
+	__le32 mld_capability;
 } __packed;
 
 /* 2 word representation of MAC addr */
-- 
2.39.5


