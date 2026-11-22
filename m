Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948C606A31A
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xVBOSJKk;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TjKAnYRI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=; b=xVBOSJKk5oeC7RGyF+godhfTan
	Bosi5P+E/o3Ej3zafnuc6Mo1yPb4ZcLAU0Hl+me6RYcivQpEhi5Y7iFzEW+VDHeYvO6feI14hEKLw
	+Po46GE/7td5tL4ui6INVkSf6w4NfCEdonfEQOcIECruzWbjtocuTJ/1S77+WyH25xljsbJ+i1Ymm
	nSQuVB3+u78XthyVoiiTlhnrdaRMNlvxtxNf6kgx6ijQ5wO6kG2nZJ/2i5nPgzt1JUU+vHuE6Zc2N
	EKl5ExZNIZc+PxjyC2o3C5PC7nq6iQQEbCWZtPsDR0uuR6ST4xS/N1+ASzAM0y6i6IYPPmAfOnT1D
	ddznkI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEnF-00000001lzA-3PIH;
	Sun, 22 Nov 2026 21:08:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEnD-00000001lyl-00cV
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 21:08:12 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c516a194350so81879466b.3
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 13:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381688; x=1795986488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=;
        b=TjKAnYRIa7Czi5ErEQPtBXiDaGioqVNonADXSwPmzXSCORC8C2o5Z0o7gEkMunBQu4
         V9oHSY1RkAfeLv9JMEcp6v64K0DiJboaBgOk7UySuLRmp+ZJaEj5z+Xmlpicv4gzXg26
         93YV+ET/0sguEVm1a2JMWDUVbl5UjcKRk+hNaMn1TPypwHlpfLOFwJfVlHov6nXwSZMk
         oqw+YgwdvItUDlGVT25aZzDrSb9+Mm1S1MKJIsMNzcbhRMAtD4kH++kzbIjEIQZUuPcJ
         cXjZTO9MvI+1ZkNYAyb19Z2lWNSKJV44+xLwLLLSXMaBZZpd+0UDT/h47n7SJcJA0jpB
         LKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381688; x=1795986488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aflJJ38bjdZjg38SRGXSXCVpGppEVOtqLz1Kzz0bSiw=;
        b=zDpdyKa2A69L6NS/doX04G6Fqbx2OHqJZYDsx1lf+VHg4qNbomoLXZQgkG41vldxlK
         K1IWagqQaCgu9VRVRRkKeyBVhcYZq1neLYp9KrqJarGT5X84i7i2JWQVKQVpvJ2NyArj
         lkwE4HAuygnHJaoFXLF5NVSdKniZIhFe/LEP/aLT97XOOHsYPkie8wf9W7Z9qw+cZ4s7
         WvsNLUcQjubVj2YL/kAmIqT/QMMtkW1bZs0pVOCDW+hOgtfFBtrqac6tE3ubHPnFLtil
         7bJEe+c2T7wehn5sWeMUhOXn3ajxpWWmME6w0jZ3NNj0JXpp4/ROilyOeGnOnsygZ5PP
         0ovw==
X-Forwarded-Encrypted: i=1; AL+hErExa+7fgdfwuC3fgr2dX1Gfq1YKO7EimC4dSh931zz/holCcmx91YX8iC7xfRH9d/ENPTemkVY=@lists.infradead.org
X-Gm-Message-State: APuU4Z82p66Td8zYG40GuY8+K1saD79wVwi3N9wLrxSrlPwH2fq4woeI
	JRSGjg2z1QNCo40rynSm3Q1dgJ29hvnlL5G9MY7jskQd0GL9eiPa0vesQ978bdZmhw==
X-Gm-Gg: AZFdTZe5MUr2FN2lsm3NfcsI5+n2hiuRhQvA37U6WPymyunb3YqBi4rjDgw7UXd0N6e
	hC6HTlIhW1byq1rEh87j0h70jeHNkTlGOW4nkVwXw9i4sAaVt8zrBpV5nlxGC+V/mclDS3SF+Lq
	PKjumUS6SkWoivQi0/GtNqbzloXj20V78+6htqWl6442NvmUSDKdyhFeUXRFj8RRskx2t5JLUqj
	kjoPz0pkAnazXWrLAPj8c0v3LyGFuI/VHYafhp0XMZYX4hgct8NTh3X5xnZjxRlWCRSfY6GYjcp
	TnIY1RMtv4qm+YMGHBMAwdnpS1Eu60LwxHLtIHFnrSGzbB++p8kyUVQ2HyKudxlgh+DrLZ82gd6
	NG0AQykvPucG6YEmKPBtBUbfUujHYy/gGTP3ZOcdeWmvcuAbJoBeBJ+2HgfbG67fbtYQ5xvMn1M
	X+ewmnlnPumS1Gfg1mDY/9FRJdGWk7LTp7egwIXbWDHmtsXaq0XLoyLPqAxuhIlaNDx56W7SVeC
	J8uQTgi/+ZXndckgueoRU1TPbG6rvrjPucRLB9QTpH7E7RHrIrS7+Q9EK8F1TtLudGtU/bApKrY
	NmDOvnzUzQ+IBg1jm7yai336+SbWYskeya3cq9vE2MIpb4b+eDcVkhz12wF3orhxaRrqDrQpAev
	rHHMnRI+NBYUawSS9/OJNsNaXbGU+juzzYfUhh/6zoSYjMylqIPn+9InnGmj0/LJISNClfwz3bg
	ASABSK9P/TF+3UUwjqTPvhoWRqlDNtMnta2q4Pm/NOZGX8MHmQDFlyDtx78W5lRktZXoN7hbf2J
	gqmh1hw/T8qf+NZJ1+zvwWHjnuM0syk2QUdxU4RTb6ISCFV7RPa/AKOwc5d79HKVud9e1swL4T2
	0Y1CVsftTP/KbpFMTbc0+welLz3PU0Rd9IKqoCCl0nYOyMvc4Zo/8XjfIhvFqDjrYzMF4EQbQGL
	bfEVWraFN1GMd/Xtz5PA=
X-Received: by 2002:a17:906:b7d2:b0:c2e:52d6:1fb7 with SMTP id a640c23a62f3a-c513a82d478mr572934466b.22.1795381687920;
        Sun, 22 Nov 2026 13:08:07 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d50069697652bafd0866.dip0.t-ipconnect.de. [2003:f2:4713:d500:6969:7652:bafd:866])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9f705sm345077966b.42.2026.11.22.13.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:08:07 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source other than the station
Date: Sun, 22 Nov 2026 22:08:09 +0100
Message-ID: <20261122210809.2087836-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130811_681086_2BF53FE3 
X-CRM114-Status: GOOD (  14.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With Ethernet decap, ath12k hands mac80211 an MSDU with the Ethernet
source the hardware took from the frame, which for an A-MSDU subframe
is whatever its subframe header carries, and mac80211's 802.3 receive
path takes it as the station's address. When mac80211 deaggregates an
A-MSDU itself, ieee80211_amsdu_to_8023s() drops a subframe whose source
is not the station on an access point; the decap path has no such
check.

Drop such an MSDU on an AP for a station that does not use four
addresses, as ath11k does. The address compared with is that of the
ieee80211_sta, which for a multi-link station is its MLD address, the
one mac80211 compares with too. A four-address MPDU from such a station
passes: ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11
frame, from which mac80211 reports the station for dynamic WDS.

Found by reading the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Applies on top of "wifi: ath11k, ath12k: RX correctness fixes",
which changes the same function:
https://lore.kernel.org/all/20261122210525.2076058-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 1d52eab418a1..abc3b6d197f1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -354,6 +354,40 @@ static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
+/*
+ * With Ethernet decap the hardware passes on the source address of the frame,
+ * which the header of an A-MSDU subframe sets, and mac80211's 802.3 path takes
+ * it as the address of the station. An access point takes no other source from
+ * a station that does not use four addresses: mac80211 drops such a subframe
+ * in ieee80211_amsdu_to_8023s() when it deaggregates the A-MSDU itself. The
+ * address it compares with is the station's, its MLD address for a multi-link
+ * station. A four-address frame from such a station is left alone:
+ * ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11 frame, from which
+ * mac80211 reports the station for dynamic WDS.
+ */
+static bool ath12k_wifi7_dp_rx_h_eth_sa_valid(struct ath12k_dp_peer *peer,
+					      struct hal_rx_desc_data *rx_info,
+					      struct sk_buff *msdu)
+{
+	struct ath12k_sta *ahsta;
+	struct ethhdr *eth;
+
+	if (rx_info->decap_type != DP_RX_DECAP_TYPE_ETHERNET2_DIX ||
+	    !peer->sta || peer->use_4addr ||
+	    (rx_info->is_from_ds && rx_info->is_to_ds))
+		return true;
+
+	ahsta = ath12k_sta_to_ahsta(peer->sta);
+	if (ahsta->ahvif->vdev_type != WMI_VDEV_TYPE_AP)
+		return true;
+
+	if (msdu->len < ETH_HLEN)
+		return false;
+
+	eth = (struct ethhdr *)msdu->data;
+	return ether_addr_equal(eth->h_source, peer->sta->addr);
+}
+
 static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 				     struct sk_buff *msdu,
 				     struct hal_rx_desc_data *rx_info)
@@ -390,6 +424,9 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 				return -EINVAL;
 		}
 
+		if (!ath12k_wifi7_dp_rx_h_eth_sa_valid(peer, rx_info, msdu))
+			return -EINVAL;
+
 		/* resetting mcbc bit because mcbc packets are unicast
 		 * packets only for AP as STA sends unicast packets.
 		 */

base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ed566369a9bbda0ac9a48357261e8cfe1cc0f1d1
prerequisite-patch-id: 726d7737c833da0842192eccececad4a0dedb1a6
prerequisite-patch-id: cf0b8ff1ac6cef681433247e4b937a3e23af78a3
prerequisite-patch-id: 03c89df01745ac9a80653431261f9a003dbca7db
prerequisite-patch-id: cb48c0eddbe0c2fe176e8edc94c6bc40be3c48a9
prerequisite-patch-id: 1956ec85ad80b68868538070fc0e89c29603467a
-- 
2.53.0


