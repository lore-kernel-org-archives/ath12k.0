Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726D0C98302
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 20:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KsPUs6EBonqM96r2eMKS/17pMpIetLZ9bP0EB0PlUy8=; b=hR8tocOeDiS2lA4R7l0rodx2sS
	ldWM4EbZ3gAykrWfoFj/YmPqMIJAvm6IxDF4wqZC7eOkxt+H9OysKwiP4Ow/gxOATAAlRwZ6jU4Aw
	j3r3GwMSVEWMX9zntAJf5VNsSE+GB65lKJyAlgvY+Q4oJ18V8aGqnufg5DHVQZi87tr8A+cpU16P3
	so1f2qiQYXwM8Cf4TOqCBCDrbABE/wj4aC03jLFaudDq6ntte9VgQPJ/Hns8Gi35DPwf1vYJrtzNC
	fH8C8WdMJqpym8duvCJAfq8HLA312Tvp6X1EnY0Xf3vxpgYnDMqDxdPEuvGTHlHiIryoajOpm2V7u
	HlJobOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96lW-00000006VRc-0msl;
	Tue, 22 Sep 2026 20:06:58 +0000
Received: from mail-wr2-x21.google.com ([2a00:1450:4864:30::21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96lU-00000006VRE-0WHx
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 20:06:57 +0000
Received: by mail-wr2-x21.google.com with SMTP id ffacd0b85a97d-482f633cd80so171925f8f.2
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107613; x=1790712413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsPUs6EBonqM96r2eMKS/17pMpIetLZ9bP0EB0PlUy8=;
        b=sxxbvtVLVlcdtJ7LDzZTBFTLOXmIt1Yk/46SzOr6afUU1DDILiKXMyUFUCHzQS3Tbv
         OuYrc2pLz1eiDNw/Cz2HBTX9TARfI1cFrYWQAGhmSPvirYOdKm8cFgWKK7Xr1R+YIz28
         9K5U0Hj6TVfQJNmHV6Qsqvr3BB0xIImCy78Ll85aJZZgcK5/P7tBma6XtFUxY/BHcUXr
         SMLnrXCf91Zclhi8nRRJi61XyggrbLEgA9OrkmzTkoDZ2JLw2rXT45bsrX9hyA+gaK9t
         oC90kT+QxRoGkiuhc7MhsTCy8diVJrD2u1i2yNXGIY4mFU1YMSM5p+4yEodkFdX3QIJJ
         pgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107613; x=1790712413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsPUs6EBonqM96r2eMKS/17pMpIetLZ9bP0EB0PlUy8=;
        b=Gx108dlRR6hRf7sKUPFaaaX9er3Iw9mUWNL/vEt6PhtxK6K1lgevoZgYSrZPpWM4aM
         H+HZ7IW5vSlZdAXn9Fjwib3oWIWTM6OjeY0x4PQgeR8b66f/YXdFIfxUDrKVfvv3PGHd
         Fa0RZA8fuHHHIdIkfCg0whlC/AX6evubkpLopmrMeE0whky4U7EXuDljTIo+PwScrhhj
         ap3E3wkwQViG84tM/CWJ7l1j92YNMxhuuxXeN/TjKCkg4seFW610riTxMaUyN8hWv2Ur
         5+And+13EJxgflNIRajnL5v459CcF/yXtkGZct5spytClRdJUPSP4hK7FC9wihroCD6z
         UH7A==
X-Forwarded-Encrypted: i=1; AKwUvBywvZjNve1eduOk5uIutVRYdfFYijSZXjcjMpCh60GVK/M6x8f/Dw4HCpw258JOaeMq6jmIYX0=@lists.infradead.org
X-Gm-Message-State: AFuF++lr/EpN52BJHOE8mIUN6Fmcvecpl79heV2d6QgxYIoKPagvQqST
	qgScbmFYkORqF3ydcZjcMq6LpEFTMDcr7nkuJEgJV2AbGKw1wQlE6WXwbTXmnQ==
X-Gm-Gg: AYBFou1E0sNN9d9WqcDPzkhW0zq1xAlcOC8akHDWFwYoU08lU11Isbx1A6PZfcQPg7S
	LX2aU8v/5JIytTPzd5Nv90SQYpc2/DWmvlieiZvEpprxan4JdjrsHdDucOTs0/Ex4Yd7n1Dlzql
	Y0YZgweQdGgKn7qh99k+zvvErKYekSlmMsqe6y3egl7UIA6nQrffZ7jqxZsdzfSht5eMMNfvqDA
	yHg6oiMnxsEeioGtdrpuHS+g2RQHr/+Ya+yxH8mF0mGVcsVcDvALEUoIvIek6sE/g95ENXvm9qD
	UA8d8gWfvLVkWYlNzYRxqEfT+Mlv6+8AlWXL649Yj5+Da6rXuAFtaSODaaP9mQkI5GwXSI6LBUe
	C1t+9wdZXR1EmPKY70bE8PVIIDIcb7B1JCcTkKIB8z1n4c0iomiizTZT/Lrr1jxneiWwUqfb4DI
	RRYefezFWx7m9Omcz2lY9nFZJ/KIZxEksqpIDKSKgjuD8nx0s6gYDl6iLJE10NEoP0HkFfRVBmR
	A==
X-Received: by 2002:a5d:5889:0:b0:488:6526:d60f with SMTP id ffacd0b85a97d-48867011b2cmr1079258f8f.0.1790107613400;
        Tue, 22 Sep 2026 13:06:53 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:7647:61a8:deea:142f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm919062f8f.26.2026.09.22.13.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:06:52 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	kang.yang@oss.qualcomm.com
Subject: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC address pool
Date: Tue, 22 Sep 2026 21:06:42 +0100
Message-ID: <20260922200643.1133491-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130656_203402_77CCE9B8 
X-CRM114-Status: GOOD (  19.71  )
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
Keep the first entry as the wiphy's permanent MAC address. Generate the
remaining entries as locally administered variants by changing only the
upper nibble of the first octet, which naturally limits the pool to 16
unique addresses.

The cfg80211 definition of wiphy->addresses does not specify where the
addresses must come from. Some ath12k platforms use it as an interface
MAC address pool, while others use it for firmware-provided per-radio
addresses. Gate the generated address pool behind
advertise_iface_mac_pool and enable it for WCN7850 and QCC2072. The flag
is read from the first radio, as all radios behind a wiphy are
expected to have the same setting.

Other platforms keep the existing behavior.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
v4:
- Document why the first radio's hw_params is used.
- Add QCC2072 Tested-on and Kang Yang's Tested-by.
- Link for v3: https://lore.kernel.org/ath12k/20260921173033.846332-2-ivitro@gmail.com/

v3:
- Rename host_alloc_iface_mac to advertise_iface_mac_pool.
- Clear wiphy->addresses and wiphy->n_addresses during cleanup.
- Drop the single-radio check and rely on hw_params gating.
- Enable the generated interface MAC pool for WCN7850 and QCC2072
  (QCC2072 compile-tested only).
- Follow kernel block comment style.
- Link for v2: https://lore.kernel.org/all/20260915152815.254016-2-ivitro@gmail.com/

v2:
- Gate generated interface MAC address list behind hw_params
  host_alloc_iface_mac, as suggested by Kang Yang.
- Enable it only for WCN7850, the only part available for testing here.
- Add Assisted-by: tag.
- Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
---
 drivers/net/wireless/ath/ath12k/hw.h       |  1 +
 drivers/net/wireless/ath/ath12k/mac.c      | 54 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
 3 files changed, 61 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index e790de5737db..c58db8482aa4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -238,6 +238,7 @@ struct ath12k_hw_params {
 	} client;
 
 	bool host_alloc_ml_id;
+	bool advertise_iface_mac_pool;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..c131358efb69 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14743,6 +14743,56 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
 	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
 }
 
+static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
+{
+	kfree(ah->hw->wiphy->addresses);
+	ah->hw->wiphy->addresses = NULL;
+	ah->hw->wiphy->n_addresses = 0;
+}
+
+static void ath12k_mac_setup_mac_address_list(struct ath12k_hw *ah,
+					      const u8 *mac_addr)
+{
+	struct mac_address *addresses;
+	struct ath12k *ar;
+	u16 n_addresses;
+	int i;
+
+	/*
+	 * wiphy->addresses is per wiphy, so the generated interface MAC
+	 * pool is advertised for the whole ath12k_hw. The hw_params flag is
+	 * expected to be consistent across all radios in an ath12k_hw, so
+	 * use the first radio as the source.
+	 */
+	ar = ath12k_ah_to_ar(ah, 0);
+	if (!ar->ab->hw_params->advertise_iface_mac_pool)
+		return;
+
+	/*
+	 * Only the upper nibble of the first octet is varied, so at most 16
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
@@ -14762,6 +14812,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 
 	ath12k_mac_cleanup_iface_combinations(ah);
+	ath12k_mac_cleanup_mac_address_list(ah);
 
 	SET_IEEE80211_DEV(hw, NULL);
 }
@@ -14878,6 +14929,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->available_antennas_tx = antennas_tx;
 
 	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
+	ath12k_mac_setup_mac_address_list(ah, mac_addr);
 	SET_IEEE80211_DEV(hw, ab->dev);
 
 	ret = ath12k_mac_setup_iface_combinations(ah);
@@ -15120,6 +15172,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 	}
 
+	ath12k_mac_cleanup_mac_address_list(ah);
+
 	SET_IEEE80211_DEV(hw, NULL);
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index ae8df80928b0..ad362244ed9b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = true,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = true,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
 	},
 };
 
-- 
2.55.0


