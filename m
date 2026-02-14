Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29BAEF5855
	for <ath12k@archiver.kernel.org>; Sat, 14 Feb 2026 21:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDtJhoT8Ipj77smMzjLSD/+jyMhaMBfN7xjhOBl+7GA=; b=wq6DUQqk+C2Xix3ltVmPOvD6Bz
	Tm5SyikKNg19iTVz5LDNWXAWsbMte96VVRb3b0wxtYAKaUOWQTWkxC+4WbCDgSbAv8fSbs7FwUk4e
	GTlli2+H4ReTiqfoTjyCRBPhWcDMu3vsrk+k6srMT12fFgzEhfoqn/EDofdS3db7+rawyzo2QCRpS
	pgifLjeYxpQyHMIxp/HwRSwZVFSbNJaJNv7WDds8K4zCOH2wv2NEeQZ7aFVbhgC/SAF9qmVEFzv2Q
	2j8uI+LHmS7FM96V5CbynNqLNQzW68UnSImKd/zXSrBpKuI4tpsHMLS9KAc3ZPjjjnB3e2m9PAmWK
	e+0ebZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN9S-00000004wyn-1YUv;
	Sat, 14 Feb 2026 21:26:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN9Q-00000004wwu-1qqe
	for ath12k@lists.infradead.org;
	Sat, 14 Feb 2026 21:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71D5A6012A;
	Sat, 14 Feb 2026 21:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB70C16AAE;
	Sat, 14 Feb 2026 21:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104363;
	bh=jdjBYuLyWUoR/3Tzz15H/qXhA4J4QfVQrEs28NTG/MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQdqq8sqmSqE3bxOp4wV5RrdXMMe+CuNFMmroEj6z5lRekIAn0dybIHlpWJDln8R3
	 Zw96eIy8VEtYTMaEUvPuQwMtKRoVTVJ68vtVvN65ztV1aDNDIAV52/pmuBZ+KkdZog
	 MTktta6Sq3Wau7dQYQDUd3mQdYmjwb9Kx+ZekHXV0zVNRVtxzpXv/uGSJ5KAmOJtKB
	 NU8vf18qYGBZIrle/8J3UkZlTIDW0hdW0W2jxNLl2vPbGACU3AtlDuoFMYfpARgVDB
	 uhB2kROHLfs44NYwXZuzhYvtuy3Z3AYTM8G9qinMXHqjN2M5rk8UYE0OqH9IKmbYAG
	 nuVSYD4lIrV4A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.18] wifi: ath12k: fix mac phy capability parsing
Date: Sat, 14 Feb 2026 16:23:07 -0500
Message-ID: <20260214212452.782265-42-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214212452.782265-1-sashal@kernel.org>
References: <20260214212452.782265-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

[ Upstream commit b5151c9b6e3a347416a4b4b55fc00195526d8771 ]

Currently ath12k_pull_mac_phy_cap_svc_ready_ext() assumes only one band
supported in each phy, hence it skips 5 GHz band if 2 GHz band support
is detected. This does not work for device which gets only one phy but
has both bands supported, such as QCC2072.

Change to check each band individually to fix this issue.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20260112-ath12k-support-qcc2072-v2-6-fc8ce1e43969@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

### Dependency Concerns

The investigation reveals an important dependency issue:

- The constants were **renamed** from
  `WMI_HOST_WLAN_2G_CAP`/`WMI_HOST_WLAN_5G_CAP` to
  `WMI_HOST_WLAN_2GHZ_CAP`/`WMI_HOST_WLAN_5GHZ_CAP` in March 2025
  (commit `6a88093f79ea0`). If backporting to a stable tree that
  predates this rename, the constant names would need adjustment.
- The `nss_ratio` fields were added in June 2025 - older stable trees
  may not have these.
- The ath12k driver itself was introduced in November 2022, so stable
  trees from 6.1.y onward should have the driver.

The core logic change (if/else if → independent if checks) is self-
contained and the fix concept applies regardless of these naming
differences, though minor backport adjustments to constant names may be
needed for older stable trees.

### Risk vs. Benefit

- **Benefit:** Fixes a real functional bug where dual-band single-PHY
  WiFi devices (like QCC2072) cannot use 5 GHz band at all. This is a
  significant hardware functionality issue.
- **Risk:** Very low. The logic change is straightforward and doesn't
  affect single-band devices. The only behavioral change for dual-band
  devices is that both bands are now properly initialized instead of
  only one.

### Conclusion

This is a clear bug fix in a wireless driver that prevents hardware from
working correctly. The fix is:
- Small and contained (single function, single file)
- Obviously correct (the if/else if logic was clearly wrong for dual-
  band PHYs)
- Tested and reviewed
- Low risk of regression
- Fixes a real user-visible issue (5 GHz band not working)

The only minor concern is that backporting may require adjusting
constant names for older stable trees, but this is a trivial mechanical
adjustment.

**YES**

 drivers/net/wireless/ath/ath12k/wmi.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 12f4d378f50d4..1613492b38350 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -496,6 +496,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	struct ath12k_band_cap *cap_band;
 	struct ath12k_pdev_cap *pdev_cap = &pdev->cap;
 	struct ath12k_fw_pdev *fw_pdev;
+	u32 supported_bands;
 	u32 phy_map;
 	u32 hw_idx, phy_idx = 0;
 	int i;
@@ -519,14 +520,19 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 		return -EINVAL;
 
 	mac_caps = wmi_mac_phy_caps + phy_idx;
+	supported_bands = le32_to_cpu(mac_caps->supported_bands);
+
+	if (!(supported_bands & WMI_HOST_WLAN_2GHZ_CAP) &&
+	    !(supported_bands & WMI_HOST_WLAN_5GHZ_CAP))
+		return -EINVAL;
 
 	pdev->pdev_id = ath12k_wmi_mac_phy_get_pdev_id(mac_caps);
 	pdev->hw_link_id = ath12k_wmi_mac_phy_get_hw_link_id(mac_caps);
-	pdev_cap->supported_bands |= le32_to_cpu(mac_caps->supported_bands);
+	pdev_cap->supported_bands |= supported_bands;
 	pdev_cap->ampdu_density = le32_to_cpu(mac_caps->ampdu_density);
 
 	fw_pdev = &ab->fw_pdev[ab->fw_pdev_count];
-	fw_pdev->supported_bands = le32_to_cpu(mac_caps->supported_bands);
+	fw_pdev->supported_bands = supported_bands;
 	fw_pdev->pdev_id = ath12k_wmi_mac_phy_get_pdev_id(mac_caps);
 	fw_pdev->phy_id = le32_to_cpu(mac_caps->phy_id);
 	ab->fw_pdev_count++;
@@ -535,10 +541,12 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	 * band to band for a single radio, need to see how this should be
 	 * handled.
 	 */
-	if (le32_to_cpu(mac_caps->supported_bands) & WMI_HOST_WLAN_2GHZ_CAP) {
+	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
 		pdev_cap->tx_chain_mask = le32_to_cpu(mac_caps->tx_chain_mask_2g);
 		pdev_cap->rx_chain_mask = le32_to_cpu(mac_caps->rx_chain_mask_2g);
-	} else if (le32_to_cpu(mac_caps->supported_bands) & WMI_HOST_WLAN_5GHZ_CAP) {
+	}
+
+	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP) {
 		pdev_cap->vht_cap = le32_to_cpu(mac_caps->vht_cap_info_5g);
 		pdev_cap->vht_mcs = le32_to_cpu(mac_caps->vht_supp_mcs_5g);
 		pdev_cap->he_mcs = le32_to_cpu(mac_caps->he_supp_mcs_5g);
@@ -548,8 +556,6 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 			WMI_NSS_RATIO_EN_DIS_GET(mac_caps->nss_ratio);
 		pdev_cap->nss_ratio_info =
 			WMI_NSS_RATIO_INFO_GET(mac_caps->nss_ratio);
-	} else {
-		return -EINVAL;
 	}
 
 	/* tx/rx chainmask reported from fw depends on the actual hw chains used,
@@ -565,7 +571,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	pdev_cap->rx_chain_mask_shift =
 			find_first_bit((unsigned long *)&pdev_cap->rx_chain_mask, 32);
 
-	if (le32_to_cpu(mac_caps->supported_bands) & WMI_HOST_WLAN_2GHZ_CAP) {
+	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
 		cap_band = &pdev_cap->band[NL80211_BAND_2GHZ];
 		cap_band->phy_id = le32_to_cpu(mac_caps->phy_id);
 		cap_band->max_bw_supported = le32_to_cpu(mac_caps->max_bw_supported_2g);
@@ -585,7 +591,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 				le32_to_cpu(mac_caps->he_ppet2g.ppet16_ppet8_ru3_ru0[i]);
 	}
 
-	if (le32_to_cpu(mac_caps->supported_bands) & WMI_HOST_WLAN_5GHZ_CAP) {
+	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP) {
 		cap_band = &pdev_cap->band[NL80211_BAND_5GHZ];
 		cap_band->phy_id = le32_to_cpu(mac_caps->phy_id);
 		cap_band->max_bw_supported =
-- 
2.51.0


