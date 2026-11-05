Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A93606D80B
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 05:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=we2BlzUa;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fEp32rxu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P0kcENTayYsQoMiN5ppn3VXcE/5m457Bhee6JJ3xtCE=; b=we2BlzUa5J8bzvahFEv4iICBfQ
	ZxQCLBFG4l0/ukg7jz1NBQ+NvoD65uE4XHNnVszPWqUSQ8A4BY9t/4v8bMF2cqOGzqzup+K8Gn3UV
	DnqLOCemn2EuE4DoplABF3vYCZWt7etjojI0L6vyAOiU+X8OzZ5QWYDvYAXpK0RuoLNztCpY9nKd2
	UEWGtw6WBTfDxaRERHKAAtoHYF5i43O0FOjoWcFMkZeEplCbXr+ELygwceLMTZTv8o4nogDAcIjXe
	3iYsunRbQmfZuxiVCa5QvoAHVaCQIWwopJEj2VLwVcBsTMqViUh0XU24gSSOkozJoGk9eo3pzeQfg
	o/WzBUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpqt-00000007qvB-3NYI;
	Thu, 05 Nov 2026 05:17:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpqp-00000007qs1-34se;
	Thu, 05 Nov 2026 05:17:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7571B401C0;
	Thu,  5 Nov 2026 05:17:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793855847;
	b=ezpKnpcDcGFs2FTkQlAMcGrXNtsg/wjW4RBWicD/gwnz3LeiJG1SORnZfH08QUDWflSa
	 vO2nF754w+fw6RFeSk0J40IsJgo2/eAbBkR/662hCaFAJ25yl9Hfp99Dk6fpt14KeyStz
	 ad4JiTEWw/Ef7hgbfraqNmcBkpKW4z7MsMJsINP5k6+nyXV5eBRA0gcZQJu6Fq/o7jLxo
	 Weh8ETMjV2Xf7yGA6G0BGnT41v9uXHA7mv4QAiw/+HPJ4Au/vPIbaKbLpJYCcvfjhAi35
	 S5klYxiCCZcZdDzNjx7qK/0U7o1MXHIa4iBAtNuG8xT+UYFhySVAQXJsn3+tT8mCKhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793855847;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=P0kcENTayYsQoMiN5ppn3VXcE/5m457Bhee6JJ3xtCE=;
	b=27W5oAWpJWJZcA3MgCEFRwwOrRnBRSeDJQrS7ZuRSaLVLM20tzqa3flDMyoaAPQJ/8HI
	 sLQfVAoXMgZesPuiIwQEidxIB9DfGqKREvTLcGLWJBYD/ob/EIA05cowt12rzhkmE9/5w
	 eh4kQlTFlTPcLuuLi0sTEk3Z/job4fT1CZQAPDAvQc76Mi4d1bcT6i/S4HcUN6MRZ56A6
	 ESZYK7QC876kgdjd1Ae/fFTLMlymeADkugwuQpElVA64xXqf3hjw+6ScHXYAbsR4Hzwrw
	 D31aBAJkDLvelAjogCACkeLyrtWSZRWx3pFJ53UooV8DW7EP541VqktKEJO8mxQp+sQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E05C1F0093A;
	Thu,  5 Nov 2026 05:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855847;
	bh=P0kcENTayYsQoMiN5ppn3VXcE/5m457Bhee6JJ3xtCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fEp32rxuZt+2JDPrk1jAq8lpTjp9wZqhmK3pYEtdyVwla7z4hNfvwqpUJhhFb/FT7
	 p0LPPyc2u2/d5kjYsrippYpwzeyPFUPYwX3B4mr57K/JwRqZzTzyVNgm4FC/inRxeu
	 v9k7hoNMVHCPol5XrSboUH9rBOjwFjYiNenSKGhe+mMnpGq9E/RBDzzKUDxeQaux3S
	 eHdSo5Bh4iopykUyoB2BDyygE+LGM6sAEQmDY0RWAEYkHdUPBHtTSzagySUDEQsoFX
	 XJH3k1N4e0frwpV+tY1Byy7qkxWgvvfZ5IrwAIiaogWzULPFIZhXja1qCoYX47pAFK
	 PttP70hYbKKBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 26343470CE;
	Thu,  5 Nov 2026 05:17:26 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 23:17:27 -0600
Subject: [PATCH ath-next 2/2] wifi: ath12k: don't bit-reverse the
 firmware's PPE thresholds
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-ath-ppe-thresholds-bit-order-v1-2-0f569106cbc4@gmail.com>
References: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
In-Reply-To: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, John Crispin <john@phrozen.org>, 
 Kalle Valo <kvalo@kernel.org>, 
 Shashidhar Lakkavalli <slakkavalli@datto.com>, 
 P Praneesh <quic_ppranees@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
 Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Carl Huang <quic_cjhuang@quicinc.com>, 
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>, 
 Balamurugan Selvarajan <quic_bselvara@quicinc.com>, 
 ath12k@lists.infradead.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793855845; l=1920;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=SMblyxjOwtNSOyKKPUpr21wi2JYn4nPN/eEapCpTvQM=;
 b=O2mE/jfSWzTKdAb79q7OZtw8Y3o9lqo5OB5LbHvFB/hM8f/2FLXAD3F6nkRLgPIcNmnGlE+1n
 HC7onnizJ7rC3fyX6vRhcLNy1Eev2SizV/agDLCvi7mY5o46dVBIfwE
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

The firmware reports its PPE thresholds as WMI defines them: in
ppet16_ppet8_ru3_ru0[nss], each RU has six bits, PPET16 in bits 2:0 and
PPET8 in bits 5:3, each a 3-bit constellation index. The PPE Thresholds
field of the HE Capabilities element carries the same two subfields in
the same order, bit 0 first, and ath12k_peer_assoc_h_he() already
converts a peer's field to the WMI layout that way.

ath12k_gen_ppe_thresh(), which builds our own field from the firmware's,
swaps the two halves and then writes the six bits from the top down.
That puts PPET16 first again, but with its three bits reversed, and the
same for PPET8: a threshold of 1 (QPSK) is advertised as 4 (256-QAM),
4 as 1, 3 (64-QAM) as 6 (reserved) and 6 as 3. Only 0, 2, 5 and 7 (none)
come out right, so the bug does not show with firmware that asks for
16 us padding at every constellation (PPET16 0, PPET8 7).

Copy the six bits in order.

Compile-tested; ath11k has the same function and gets the same fix.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9fd3841f71b71..ebf28a8089ca8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8647,8 +8647,7 @@ static void ath12k_gen_ppe_thresh(struct ath12k_wmi_ppe_threshold_arg *fw_ppet,
 				continue;
 			val = (fw_ppet->ppet16_ppet8_ru3_ru0[nss] >> (ru * 6)) &
 			       0x3f;
-			val = ((val >> 3) & 0x7) | ((val & 0x7) << 3);
-			for (i = 5; i >= 0; i--) {
+			for (i = 0; i < 6; i++) {
 				he_ppet[bit / 8] |=
 					((val >> i) & 0x1) << ((bit % 8));
 				bit++;

-- 
2.43.0



