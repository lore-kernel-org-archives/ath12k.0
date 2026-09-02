Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E56C61DFD
	for <ath12k@archiver.kernel.org>; Wed,  2 Sep 2026 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ST0JywuIijs9AyXrfzYTAQmxlPvMrq1DLcWk/E2Kd+c=; b=4EuUtWM/x3SdtLtJA0aTmuFFPx
	E4mQ2DRbAdXQZEtea6dFKTCV0GtODQjtKde4p/joAhIwhPhDMWwz0mUeHkFdYBlwX49Kvm8JYEQ6I
	G14z947TA3CCRA0/btBDd07a5rGQ8svNcHvwlN/sPECKFlb57xZtqMNz46HYGIHSfGNiCZHuqhZQJ
	Fk9akDTHcIavOsjIiWmmat3uIyCzDLQ6l2V6y/veFVOztfCqcwz09LjYnQnEGL8EBB3SNh5luI4kB
	pBmQm0PBDsEUYLwRwBc/eEkrOM2caK4pU6zSskUWcyOnrN1uAPdJG+OfA2bWywwNmp3G8sYJuJAqU
	6oMJm3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gEp-0000000E4jJ-1vbq;
	Wed, 02 Sep 2026 08:22:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gEm-0000000E4iV-31hd
	for ath12k@lists.infradead.org;
	Wed, 02 Sep 2026 08:22:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso5204925e9.3
        for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788337347; x=1788942147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ST0JywuIijs9AyXrfzYTAQmxlPvMrq1DLcWk/E2Kd+c=;
        b=BE9cV07rGnl6Y94MfuGhIk7WmB3udfUZFayL1vlbMOsYWNAh2tBx80NyCGMGAA7Vcx
         Mz3Ysei3SV1qknEE9B8zs9qZ4RaHPwcJrNGuUFz+sq73hAUwsE8vQ4LBdECVzVbCPYus
         pDQbUL/NKddBeWwVim7VP+vX+E4bQU12+861nCPoxxWSc8JfHNj5lvkEIPUR/tr4SgEn
         FWXMLPi3PVP6UrgTedojRpoDKfSN9qfndqe2Pw32kbHJxSQZD33KdStaGkzrU+1fS0ir
         ZRT0c34NqNEclbQG3VsCYx77CMbrK43MAqiCAqbzL8ioy4gCdNUQ3yhq+RgMJ87e2J27
         qzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337347; x=1788942147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ST0JywuIijs9AyXrfzYTAQmxlPvMrq1DLcWk/E2Kd+c=;
        b=ZFfCHYjWiEvhHVwu1uzPGCBKL6Wx90Skz2+JM2J0Fid2Tu+vXfhIYGFEMHOWNIGh7X
         dkRWD7ceGzcIjZpvCs9qYC/ON5MhBYpjZqENpurSNGVCqmyn2Gltp8OZX9nHJM1gYP9t
         a4wokCJM1zh2vLvxFEeUHQNGzTusuR75IoYY0ghyelb3xMcOvWqBLFZFT361UDUDb+qi
         1gFTLnxWtW+UVypP23+iy/7N3FFLLiai0uSKU8VQrRafslbZSqA+PjKK5gc5nqb6NSqL
         KVFvb4id7GwMQyxX5eCLz/6nimPK+dRKjzXFfAmsT3AQ7tHm9eMy9NVGkrz0s/RGEaXK
         eIWg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7NWQD0obkM8rPzXugQ812Gh21NGmGYfrdCB5EoZB0OS6JYvJzqa3p2kaxYxhnRSg1N7/8k2c=@lists.infradead.org
X-Gm-Message-State: AFuF++moHFUYzIhdGnpQj686AgmD0WQoXG71fGxVTD7wW2V03UlrBt6T
	WcPzQe/wqZj69M1IaD98WB0DzK6CjeB5NT7FjvoMzfZ/iALt3lgOK6Q3
X-Gm-Gg: AR+sD13MRvEXIqESc+g7R17ZkvcKWROguy4xL8LrqhOWtj+6NpdxBiozJXoXYrhPK6Z
	iGyZgmkvRiKvzZosNiAuu/tVFAfFLgrzX2NTZejL6lng2erCbljpbtzcQDSvX4UmazeworP8uL8
	4Aqh/ebNmkO9Mx514i/80u3Z2xF8Tb3kCWuG1qaGK0xRfcgeB/SliY/wgZ6+d9beLWFs9wdc2E+
	3C8gSv9cZzWXfjEoIwDDnB1RmAaosoqPtGyHMqoXThqnVrT1VArI7KiINWNY3p3M14K1Kckiupx
	qaIjf9Sm6hBEXOn6YLCAK626FMmg9VWvMiQOzOl24NdQZyzHGgDWEGmuzJY1nrOgECWbs+v5VPk
	xnbU26rIx8cdeEI89hBJjEzp/UwYpIFiVetKDhdkBPmy0EkZlpg2C4NqGuO52rUwRhYgO8NIQYt
	wjG+5zSZ4KXbKHU+P7OtPBoBkiFJvs9ZDIrI3cd5ubNc7Qzdm7u1Y=
X-Received: by 2002:a05:600c:c170:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49ce57f072fmr62819355e9.8.1788337346382;
        Wed, 02 Sep 2026 01:22:26 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e66:da8a:ae8a:96d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ee9cf7sm4992947f8f.25.2026.09.02.01.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:22:25 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: provide MAC address list for single-radio wiphys
Date: Wed,  2 Sep 2026 09:22:18 +0100
Message-ID: <20260902082219.3010793-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_012228_787656_9478F431 
X-CRM114-Status: GOOD (  15.47  )
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

From: Vitor Soares <vitor.soares@toradex.com>

ath12k supports creating vdevs with addresses provided by mac80211.
Userspace can already make concurrent interfaces work by explicitly
assigning different locally administered addresses.

However, ath12k does not advertise an address list, so when a second
interface is created without an explicit address, mac80211 has nothing
to pick from and falls back to the permanent address. If the first
interface is already running with that address, bringing up the second
one fails with -ENOTUNIQ.

As in ath11k, provide a list of usable addresses so
ieee80211_assign_perm_addr() can hand each new interface an unused one.
Keep the first entry as the radio's own MAC address. Generate the
remaining entries as locally administered variants by changing only the
upper nibble of the first octet, which naturally limits the pool to 16
unique addresses.

Handle only single-radio wiphys. Wiphys with more than one radio behave
exactly as before.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Note that a device which is not MLO capable registers one wiphy per
radio, so each radio of a multi-radio device also gets a pool, seeded
from that radio's own MAC. I only have single-radio WCN7850 hardware,
so that case is untested.
---
 drivers/net/wireless/ath/ath12k/mac.c | 48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9a775602775d..bee6701f1029 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14685,6 +14685,50 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
 	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
 }
 
+static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
+{
+	kfree(ah->hw->wiphy->addresses);
+}
+
+static void ath12k_mac_setup_mac_address_list(struct ath12k_hw *ah,
+					      const u8 *mac_addr)
+{
+	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
+	struct mac_address *addresses;
+	u16 n_addresses;
+	int i;
+
+	/* The pool is derived from one base address, so it can describe only a
+	 * single-radio wiphy: with more radios each radio has its own base
+	 * address, possibly from a different ath12k_base.
+	 */
+	if (ah->num_radio != 1)
+		return;
+
+	/* Only the upper nibble of the first octet is varied, so at most 16
+	 * addresses can be derived from one base.
+	 */
+	n_addresses = min_t(u16, TARGET_NUM_VDEVS(ar->ab), 16);
+	if (n_addresses <= 1)
+		return;
+
+	addresses = kzalloc_objs(*addresses, n_addresses);
+	if (!addresses)
+		return;
+
+	ether_addr_copy(addresses[0].addr, mac_addr);
+	for (i = 1; i < n_addresses; i++) {
+		ether_addr_copy(addresses[i].addr, mac_addr);
+		/* set Local Administered Address bit */
+		addresses[i].addr[0] |= 0x2;
+
+		addresses[i].addr[0] += i << 4;
+	}
+
+	ah->hw->wiphy->addresses = addresses;
+	ah->hw->wiphy->n_addresses = n_addresses;
+}
+
 static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 {
 	struct ieee80211_hw *hw = ah->hw;
@@ -14704,6 +14748,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 
 	ath12k_mac_cleanup_iface_combinations(ah);
+	ath12k_mac_cleanup_mac_address_list(ah);
 
 	SET_IEEE80211_DEV(hw, NULL);
 }
@@ -14820,6 +14865,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->available_antennas_tx = antennas_tx;
 
 	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
+	ath12k_mac_setup_mac_address_list(ah, mac_addr);
 	SET_IEEE80211_DEV(hw, ab->dev);
 
 	ret = ath12k_mac_setup_iface_combinations(ah);
@@ -15041,6 +15087,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 	}
 
+	ath12k_mac_cleanup_mac_address_list(ah);
+
 	SET_IEEE80211_DEV(hw, NULL);
 
 	return ret;
-- 
2.55.0


