Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB99D74EDC
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jWPSO8yrPKFAwMl+wUmEuXeK3SQbOWFRTBlMKq9vDWM=; b=D8PH2QMSWWWTA999VoraV+kztN
	A7fBZriCB3xHDE0wDC9HYf4wdwWhNwNrTE/Uf7c5qkbw75v/2U/PQ885LdguRflbXlo9Ko9yHLQP5
	NmsYCS+bFx8vJq4eppA53JoNOMFvk0feYnpMAs09MioPFplfIUB9g/iCSey25JHyzWfz3m0a2VWXV
	0BjUGY+kWJ0MSpPOB6ZDvfvt3CiQPyJYltPjP1LhR2Us/xPx2gLsXSRIgmp4vXOf/uqyJcLzsJQPQ
	qOFKco0t67quqaficA+c9YFRw3B84Gt3iI7wEBjEjQNesY1BztzfqwtES9vzBVFFhxD+XAtCSqPzd
	cmIMtQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIMr-000000093UR-1zo6;
	Fri, 23 Jan 2026 14:42:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIMo-000000093Tz-45C1
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 14:42:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so2152210f8f.1
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 06:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769179348; x=1769784148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jWPSO8yrPKFAwMl+wUmEuXeK3SQbOWFRTBlMKq9vDWM=;
        b=GtZzVO9XycQRE/uRc/u5bbFDwA/pmuItkAGlW+Bznzl9J1LMFSFodG0atj27G2+RLu
         +ASvuorZMfoU2D1q1QXUtaGMRD16YYPuIMtYkGwesuZ/yw44e7PkuG8RFVG4Wl7y79wr
         W84fRCkQPO+a16h6dcYeqE+odZXgghk/bokqTcKJOV8Om9kgbAi6J/yN1yhEwE5IYac7
         wKIF51WR7DDKU6aTrvFuot8/KX+Gmj6rB+WHvruk4p7vim2gdMDyjJHOTz1vBxzjSVS/
         kfHOFMV+15HOR/U7Hf1FiQya9g6rixwl3c7baqVtchxQ0jnvcbndQNKPgYo1UVD1KbuA
         r2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769179348; x=1769784148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWPSO8yrPKFAwMl+wUmEuXeK3SQbOWFRTBlMKq9vDWM=;
        b=SMu7LAUAVhEdOy+mpYwJInBqR3BrNX3lz7jIVANHoNt8Bed6IFpfQGTfPm64lY2I6R
         kcokfHMVJFKeQ4HEE8DF+9wmrLfQY6wWBkEgEbt2wbstYd//nQIO2nhze6q6I2YIJlgQ
         0FqHzWjkAV3mfJhpkf8EOl1iLiXampBxNYpVqCdzC0iQPks/PCQjnE40drPHUAFS5Zst
         diQW+wAeX9Rqa0xsLQKhRpZBLmQf6Y7Z/ltxvu+SAOlEyv+c7m3HglxWwDrge2xTVVsm
         4g8VUlIAiWW323Q/vWtuMzaJtrcbXEeSweXm+S2ijWOK2IBIt+baXKTQpI/0aj7ZfCGh
         4/6Q==
X-Gm-Message-State: AOJu0YwgrX3SC4POvU1qp5HOWngAUMBh0jDwTM8kLZ23zp3mJd+Qwd8M
	cmC+ru+0TV2YdMjw3AbnN7obeCTNIVh45X28jrBOfpuU/3GcQy4ggkf+WhjRiA==
X-Gm-Gg: AZuq6aKCLBwZyx148BghPG9BEzuauUc/MeSU15/9d7nM5jqs1s42PIIijDyKxhe9psp
	H6IEZ7Yvv9JpmCWJwlrBp+EGh7avI8rqAUuyKDkiwYl95DsBLSNDhHJsCyVwBx+DFGaVTZf9KWn
	HbYmz3x0ICG6KlldPFa3X8gsWUnmXRNMZPog5vF9htR7j3IHchQr5Feu1VqFPMCMyY/kR/i93WD
	SICyIbsk/byvwAeQebt/a6zwSoGtK/Fpcm0/UY01wkCO6FCbItjCgWX47gJ/QTTVD3oLgZyhUTN
	RHBsBk2NrMTYfH8ZE7++lWdw5dUiNO9WG+plb1rXlJ4S8CTotfwSQ+6MIjK8foQCp4F34dUtaAY
	xdcIOJU4xdZylxHSAXCukGfI1BAdEscsHjHNhyDu+KTHi+xlcUo2Lu00qfdC7mwgi9Gn3rfV+AD
	M8eucHf1Gk9ZIL9/zpOtP54RfktNPVGmVXCco7JnxDvCt8uTh4qCCPr8g=
X-Received: by 2002:a05:6000:607:b0:42f:b3b9:874d with SMTP id ffacd0b85a97d-435b15fa1e6mr5912288f8f.37.1769179345634;
        Fri, 23 Jan 2026 06:42:25 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f73855sm7125106f8f.29.2026.01.23.06.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 06:42:25 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on non 6GHz band
Date: Fri, 23 Jan 2026 15:42:24 +0100
Message-ID: <20260123144224.2216923-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_064231_025238_3F1C9A80 
X-CRM114-Status: GOOD (  13.11  )
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
realated features on the 5GHz band while it should not:

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
that band. They erroneously advertise 320MHZ support too.

This should not happen as the spec at section 9.4.2.323.3 says we should
not set the 320MHz related fields when not operating on a 6GHz band.
For example it says about Bit 0 "Support For 320 MHz In 6 GHz"

  "Reserved if the EHT Capabilities element is indicating capabilities for
   the 2.4 GHz or 5 GHz bands."

Fix this by clearing the related bits when converting from WMI eht phy
capabilities to mac80211 phy capabilities, for bands other than 6GHz.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 84c29e4896a4..14947fdb9813 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4888,6 +4888,7 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 				       __le32 cap_info_internal)
 {
 	struct ath12k_band_cap *cap_band = &pdev->cap.band[band];
+	u8 *phy_cap = (u8 *)&cap_band->eht_cap_phy_info[0];
 	u32 support_320mhz;
 	u8 i;
 
@@ -4901,8 +4902,14 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
 		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
 
-	if (band == NL80211_BAND_6GHZ)
+	if (band == NL80211_BAND_6GHZ) {
 		cap_band->eht_cap_phy_info[0] |= support_320mhz;
+	} else {
+		phy_cap[0] &= ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+		phy_cap[1] &= ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
+		phy_cap[2] &= ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
+		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
+	}
 
 	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
 	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);
-- 
2.52.0


