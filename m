Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE3CCDB46F
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AT1h44Zm9oh1x5aEKYj5yka+DdDxBM20kc8wgw2F+yA=; b=HZoaVpQoEeZ6EbLQeOtnu42N16
	0hsX9rcgg6HQK8vCMLs/oVnsDWwp2ZEQXEtlklOAmyWMpRFeIkkkAY3QL7ZZnKNkRwOtDKvcVUiUJ
	87uAYNjb4yFDjVCNjzBLfFOvO8xoau5J51sLpAP32Xq40/mCXowI5P8RC9ZRrAAbotREhWpwQNH/f
	uUl4r5uRGT/ugYvR18Gs9VN9mv32xSXMBi8ePDvK+O9mG6MTOpAy9xMAgVKRQZPOR8Dc9N7NVnlWV
	ptnR8bOiAVPUGcjXwnTQrheSIgGgOGVLcOgEuYeOpI2mJhI5nTN/D4rB1gewSxUZdea4E6OJxQhZd
	ij4HxXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2rM-00000006WKi-1pNg;
	Tue, 23 Jun 2026 15:16:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2rJ-00000006WJz-2PXX
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 15:16:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b613a17bso48418255e9.3
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782227775; x=1782832575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AT1h44Zm9oh1x5aEKYj5yka+DdDxBM20kc8wgw2F+yA=;
        b=mMYr2gMQ1Kt2lYqedacp7In7xxfBMJCyjWv01e0fpq0GclkxhH2DNvpZX5H34NH+Je
         BUmjJULD3QMeGDOy+lIy8WG18F4cIlHzgbNg5DlWvY760ap6a4MnzQ8vTT9yMC6MhzIZ
         QoCNkdKi1ww+mXuQxLdDa3WX3QFeMSR994LIguFJubOJCb448s0vglrIHSUOPgPw5ewb
         8OLGSOeWfjb3XTZyj2C7t5XmxRH1VudKXf+lBPgl9byzSnDUfdVIk1hvJjUSGOCHuASd
         Yzr4Mf86tbJj0LtlSgbCuvKtONHx18uhhY1TEbFo5C386vSsveIk44dn10v74P68e40W
         tsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782227775; x=1782832575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT1h44Zm9oh1x5aEKYj5yka+DdDxBM20kc8wgw2F+yA=;
        b=UPO6j4tbLkHaMJcgLGfrVcSBLpcBNo5zyOIlf9Du6guWh12Os0fpgeUoPMsbrwp4yv
         cu/2itveF036B3olBphHTImdCIEf7un6JJsb/lN1gD/CY8G+Do95jg8jK6U+LZ7DlipV
         fBtjfK80QkFFH153NzJ8aAndsWHdaH76toKB+hyukxCvWcb4vG6f4A84O0i336+0x7EY
         U6lOVgZqbnOtkgaBO/KDqgPf3ubG+NvJg0r3DolkWDgCTuI3rspNv+85IBRNSlfqqWFz
         UMvgbTWBvYxPwOmIVsaqxQ0yOposTOi3HbpRjOF1BrfI5v62ei+z4XB/A/hWpfKPMbE7
         ZZOw==
X-Gm-Message-State: AOJu0YyAWR60z4Y9hH61lSQuTzd4kbeItzoNa8CZg11WQOCiv8a1Oczg
	qXit0H7G5lh03LpZrVQvm+1xB8O4hZtpZWrwJIZoFv0khRQQQNYrlwKCvxH7MA==
X-Gm-Gg: AfdE7cn/rSHDgk0SKjjvQJc/G+DUK6yGaiIDba93jC1T6mCBKw3cp892KGpeBhgC5oe
	rpZED7pKN97xEzE08IH8Aqmwps1ejRn0n/xD9H1ixUW0aedI8p/woIbj3ZqBt1BZ7loWukocru+
	KYBe5QGLLdamnnKPgMKj1dJNjwMRxxhHXAEkk1N48QwggXS+Ow4z2HztJGIUQCIGHUaTSniSrUe
	tQ/bT/Pw1i5PoZRQhp53yjZyfPdWoqYMefu7b61JbPZFOsi5HeV9QC8Wf1h9eZxACHiAsV3U9u+
	CTkhpcBbZnGgzG76BmilqyuKdrUbBqDj1EIxPA2nTVxPHkBeBwCiVDC8ZcHCdAFLoK8GAdNfZ7M
	3QHzc3byeI4irPWpCynivvX63w1a1/pcke1CDCs8CnClqHVD4ngoh0IO1lcQ7vexqSeYo3A405y
	JPZUito22vc+8fNB0CP6w3FQobLOD2sqoquBwdxGPA5tNvyQ==
X-Received: by 2002:a05:600c:3e8f:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-49249046b94mr230072095e9.0.1782227774587;
        Tue, 23 Jun 2026 08:16:14 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm312950005e9.11.2026.06.23.08.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:16:14 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v3] wifi: ath12k: avoid setting 320MHz support on non 6GHz band
Date: Tue, 23 Jun 2026 17:16:13 +0200
Message-ID: <20260623151613.72113-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_081617_636429_E0EAC958 
X-CRM114-Status: GOOD (  15.34  )
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

On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
related features on the 5GHz band while it should not:

    Wiphy phy1
    [...]
        Band 2:
    [...]
            EHT Iftypes: managed
    [...]
                EHT PHY Capabilities: (0xe2ffdbe018778000):
                    320MHz in 6GHz Supported
    [...]
                    Beamformee SS (320MHz): 7
    [...]
                    Number Of Sounding Dimensions (320MHz): 3
    [...]
                EHT MCS/NSS: (0x22222222222222222200000000):

This is also reflected in the beacons sent by a mesh interface started on
that band. They erroneously advertise 320MHz support too.

This should not happen as IEEE Std 802.11-2024, subclause 9.4.2.323.3 says
we should not set the 320MHz related fields when not operating on a 6GHz
band. For example it says about Bit 0 "Support For 320 MHz In 6 GHz"

  "Reserved if the EHT Capabilities element is indicating capabilities for
   the 2.4 GHz or 5 GHz bands."

Fix this by clearing the related bits when converting from WMI eht phy
capabilities to mac80211 phy capabilities, for bands other than 6GHz.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
Changes from v2:
  - rebased on ath-next
  - fixed all typos
  - changed wording in commit message & code comment
  - also clear all other 6GHz related phy capabs

Changes from v1:
  - rebased on ath-next
  - clear all 6GHz / 320MHz related phy capabilities fields from the firmware
---
 drivers/net/wireless/ath/ath12k/wmi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 84a31b953db8..e7689ee3e701 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5154,6 +5154,7 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 				       __le32 cap_info_internal)
 {
 	struct ath12k_band_cap *cap_band = &pdev->cap.band[band];
+	u8 *phy_cap = (u8 *)&cap_band->eht_cap_phy_info[0];
 	u32 support_320mhz;
 	u8 i;
 
@@ -5167,8 +5168,22 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
 		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
 
-	if (band == NL80211_BAND_6GHZ)
+	if (band == NL80211_BAND_6GHZ) {
 		cap_band->eht_cap_phy_info[0] |= support_320mhz;
+	} else {
+		/*
+		 * Firmware may report 6 GHz/320 MHz specific capabilities for
+		 * non-6 GHz bands, so explicitly clear them.
+		 */
+		phy_cap[0] &= ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+		phy_cap[1] &= ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
+		phy_cap[2] &= ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
+		phy_cap[3] &= ~IEEE80211_EHT_PHY_CAP3_SOUNDING_DIM_320MHZ_MASK;
+		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
+		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_EHT_DUP_6GHZ_SUPP;
+		phy_cap[7] &= ~IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ;
+		phy_cap[7] &= ~IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;
+	}
 
 	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
 	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);
-- 
2.54.0


