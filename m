Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD75606A31A
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VwNNrWUw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eCLwWbS2;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=MjwD6rc5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXmyT257j9HWX6yMLjeKjbshvliT1svS1XMIFan8Qm4=; b=VwNNrWUwlhLCAvEKHQja1Fvr9n
	vqOP3OcBgC1kdXOivBXqvJQkRvrbG/cllkoBaKW6ew0dOuPoO1ocCCwtEr7RPsu8Jv1TXyzHLNyNN
	fvLb9p8EhN8aiXhe3x+3xc7vOaTEBd6pqG/QFt26FwOTSs0ObuG8go01EllHDbMszWlAJnHLeigIk
	qxVQnjRaegDhetUL6nmcqA1/DfWrUM/SetNdBFOOyoKZXE8yc6dr5H8xh+ccGounXWdRtfUWTPs6j
	+qUp2QqWDLhvdfNRHS69NliVh5PqVlVvrYq39rcHFsNFOB8T3vPQHITaxVNbesQ3sg0SmU7pRmvte
	U1iBop/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXW-0000000CTIo-0C2O;
	Wed, 21 Oct 2026 16:51:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXU-0000000CTHM-3BQK
	for ath12k@bombadil.infradead.org;
	Wed, 21 Oct 2026 16:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JXmyT257j9HWX6yMLjeKjbshvliT1svS1XMIFan8Qm4=; b=eCLwWbS2c6ut7xOpPDjpJ7YT1/
	U7O+nf9PIbigMlg5aPBDUZ4SLMawv793jy+GMrLnlfkSjeV9ikmRkic52n1KjIlL6mfrAKYp/+HRL
	M5JDe1BYDkdafL7PI2ght25zi5foiFLWzBje82/3UNcigPUh0o/WwF8eZoKtRlWEV8FJ61p3ZHidI
	5wqSEqNnt4gTvZSbAZWqzrhMtGh7x1ygds8nq/WFA3lldKh+DEARqVyFswjwM7GZjQilmED4h2u76
	4cUWn8e9i8iwFuiP6LZOBqhoudMeWcVxAIwZ8GgJdWBKtaG6yOHSbGc2ggUGoDhQ8ozRtpYNv3tDm
	DlvPgH2w==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJZXR-000000062SE-3Qwo
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 16:51:43 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c468bd799ecso10682966b.1
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792601499; x=1793206299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXmyT257j9HWX6yMLjeKjbshvliT1svS1XMIFan8Qm4=;
        b=MjwD6rc576RWWQn+qU/etbZqaTpYE7fDnxP+hhEg5ubqBpdDOAvi4a3NB7y57vY9Pu
         Z8FRaUJoibhoWybucjG7GlLcPor7xtHDTpABZLbs9eUMj+rUHw1ddzz6jNDWqvae4VxW
         aX6Q7jiin/PvtZHuZDsNi5bo+x7Yl+JcfsTuVryjc1JXIFJtlYUZ3dFBYLUjq9Y3ieaT
         3E48RcHxkzoVDX/aV+C9SngMyDn9ujrR7bLNKSMszuGixFrIAqzjNIqg4HDpNxK8Z0+H
         BMVkPkgbj1QAy44DFZYGBE733cbzSdFI7ow1DYTrENRIh6EL1spze+pCqRjA6NZDODrt
         MlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601499; x=1793206299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXmyT257j9HWX6yMLjeKjbshvliT1svS1XMIFan8Qm4=;
        b=D5YwNzonJ/lusNmJf5ryDVBUqArko7vaMsDfIwftFmi/Q2bf3q2JI2b+K/tDzznkk7
         sfAyr9/MUGFKABOOv3UndtdAvIkt+5hSxulugLxyKuaKugwhSNU0cDKA2z5wksg2+pnS
         dDC7pyRvSa0RzzPq9ypgRNA3IBfCAdFOOP5MkbGjtZLRF/QvG4vjS0JJCGPN9W6oY2nQ
         LQwL+SGsfSlMPXLijNiVop8VFl7bAdF5618zJfGjHgv53+sqmvGMY9u8J/tZQLmauNq5
         WUISfcfGtDMyUojxMAZJF6gUXfwPjEdniiEs2gd3ED3fvhv9Gi+2CD751QQoXWggcVIC
         yowQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSwS303TWTdMSCjUjgqRmaeFIa8ulTuwbk9Iihs9Bb777ywSfvMdY8ES06jsCOk3DufNXMPfs=@lists.infradead.org
X-Gm-Message-State: AFq9FYIJRxmb//xhkl7onGukVe+kDbns3KtwFE5WInj5TLpE/ymKhM4B
	KEuUrAk5Zld5WcgfQavzw5AB1GVYJG5Q/fyfXNtRy2KqEVEZ1G4AWfVKOdx1qcyVgV6l4X2YZBK
	T1+16flfd
X-Gm-Gg: AYBFou0+KAxIeWGpSIIqvqFzowHiOOpR0G0WbdNisTMwau+nMG4J6q2nHEpJsKNpvu1
	4cepOQns2QKUD2jgpggxahdszFukpadsdxmI0T6QNbAvK53aI7cxfok2j61yQCVU9F3M9BMxT7/
	3IUGAMq8DYiJyvOgP48D4lNDcqzN3cS1hpeMuoueMjSWn7p3CZWGnhOkzg5ITBvcIAyBdmej0aa
	OSjxbMj/ff1FUyKzdVo+KTMvAAjfGsTzj8M9p2bD4s7hW3HAVkDYNPyp3qSb8INnTOTgDNAwJKt
	aajkBGVD6nVUdXOwOJOInKHzx+BvWJ69Wtj1EbDCim/1MZi56t2pnCFZSSIIeeehDD9A45sv0zz
	F/Rta5q8dTNUa1bZFmnjEbiHGTJ08EgZYeaz3dnEZn2IM6EdwcVkK6yziefftpkWrPsJSqPyG7F
	O9Z1rtLjSECjiG1LerCJlyGAJxV8GXcRjV9G7q5De1OnYc0h3LS4s+7H3qnHhKwpB65l2jyMglF
	ojtkkifR+tsvWkPdg/LPksYYiMIFEQ2gaiq1jAenh4gbEaQQ4hJrlneRqukQf2Fdf1N3BYWzyjd
	7OoOzzddNYI9f8ya3nwgefcDh534bij/cVG0jvr1H0sQDTUe7TcoCm4c5rdnuH+9XnX9Thd1Pk5
	MWCy+bJDmeZzyVELDWcuSnosFYUmqxW7utC34o38hgS1i8i4OdtSVCnDmcAxByUW4b4sJU0ADSC
	muPrTGCUVLai0S7pXFHUzXEu7eO+LDqkTmfyJGbhbUjE5aHqhmeniggaejoN2Uz6yB
X-Received: by 2002:a17:907:9604:b0:c29:555e:bf2 with SMTP id a640c23a62f3a-c46799c8dc9mr242364766b.41.1792601499598;
        Wed, 21 Oct 2026 09:51:39 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.223.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5de48esm20782466b.66.2026.10.21.09.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:51:39 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: ath11k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:51:37 +0200
Message-ID: <20261021165138.388593-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021165138.388593-1-julius@bairaktaris.de>
References: <20261021165138.388593-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_175141_970274_70D6519A 
X-CRM114-Status: GOOD (  12.63  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The firmware reports the NSS a radio supports at 160 MHz as a ratio of
its 80 MHz NSS. Peer assoc applies that ratio to the peer's NSS instead,
so on a radio with a 1:2 ratio a two-stream peer is sent one stream at
160 MHz. The HE 160 and 80+80 MCS maps copy the 80 MHz map, so a
4-chain radio with that ratio offers 4 streams at 160 MHz where it
supports 2.

Take the 160 MHz NSS from the radio's TX chains, as ath12k does since
commit a82ce08775bc ("wifi: ath12k: add extended NSS bandwidth support
for 160 MHz"), and limit the 160 and 80+80 MCS maps to the ratio when
the firmware reports one.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: f552d6fd2f27 ("ath11k: add support for 80P80 and 160 MHz bandwidth")
Assisted-by: LLM
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..a842306d65d9c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2278,7 +2278,7 @@ static void ath11k_peer_assoc_h_vht(struct ath11k *ar,
 
 	if (arg->peer_phymode == MODE_11AC_VHT160 ||
 	    arg->peer_phymode == MODE_11AC_VHT80_80) {
-		tx_nss = ath11k_get_nss_160mhz(ar, max_nss);
+		tx_nss = ath11k_get_nss_160mhz(ar, ar->num_tx_chains);
 		rx_nss = min(arg->peer_nss, tx_nss);
 		arg->peer_bw_rxnss_override = ATH11K_BW_NSS_MAP_ENABLE;
 
@@ -2588,7 +2588,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 
 	if (arg->peer_phymode == MODE_11AX_HE160 ||
 	    arg->peer_phymode == MODE_11AX_HE80_80) {
-		tx_nss = ath11k_get_nss_160mhz(ar, max_nss);
+		tx_nss = ath11k_get_nss_160mhz(ar, ar->num_tx_chains);
 		rx_nss = min(arg->peer_nss, tx_nss);
 		arg->peer_bw_rxnss_override = ATH11K_BW_NSS_MAP_ENABLE;
 
@@ -5940,7 +5940,7 @@ static void ath11k_mac_set_hemcsmap(struct ath11k *ar,
 				    struct ieee80211_sta_he_cap *he_cap,
 				    int band)
 {
-	u16 txmcs_map, rxmcs_map;
+	u16 txmcs_map, rxmcs_map, txmcs_map_160, rxmcs_map_160;
 	u32 i;
 
 	rxmcs_map = 0;
@@ -5958,18 +5958,28 @@ static void ath11k_mac_set_hemcsmap(struct ath11k *ar,
 		else
 			rxmcs_map |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
 	}
+
+	txmcs_map_160 = txmcs_map;
+	rxmcs_map_160 = rxmcs_map;
+	if (cap->nss_ratio_enabled) {
+		for (i = ath11k_get_nss_160mhz(ar, ar->num_tx_chains); i < 8; i++)
+			txmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+		for (i = ath11k_get_nss_160mhz(ar, ar->num_rx_chains); i < 8; i++)
+			rxmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+	}
+
 	he_cap->he_mcs_nss_supp.rx_mcs_80 =
 		cpu_to_le16(rxmcs_map & 0xffff);
 	he_cap->he_mcs_nss_supp.tx_mcs_80 =
 		cpu_to_le16(txmcs_map & 0xffff);
 	he_cap->he_mcs_nss_supp.rx_mcs_160 =
-		cpu_to_le16(rxmcs_map & 0xffff);
+		cpu_to_le16(rxmcs_map_160);
 	he_cap->he_mcs_nss_supp.tx_mcs_160 =
-		cpu_to_le16(txmcs_map & 0xffff);
+		cpu_to_le16(txmcs_map_160);
 	he_cap->he_mcs_nss_supp.rx_mcs_80p80 =
-		cpu_to_le16(rxmcs_map & 0xffff);
+		cpu_to_le16(rxmcs_map_160);
 	he_cap->he_mcs_nss_supp.tx_mcs_80p80 =
-		cpu_to_le16(txmcs_map & 0xffff);
+		cpu_to_le16(txmcs_map_160);
 }
 
 static int ath11k_mac_copy_he_cap(struct ath11k *ar,
-- 
2.53.0


