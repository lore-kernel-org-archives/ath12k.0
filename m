Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F42B606A337
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZDUfyiaK;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rfFisFfM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=; b=ZDUfyiaKQIQ72zd7YmkGEztCzO
	LMjwqwSXK1otqHlR6/ZNgW2S1wE58FgTQP903AaHowfPh8ws+8wX1yu25kN/dKcnu8uYQtRhMWhTF
	EmYbrj+VRJtCdlrvGhGzlVCkkrhngV64jgmcqJjhMBdYo5S92UGvI3DLoKczqQpG7oRxvWOiankfZ
	EmWtr88uCnyUFNYQMxZpNxyZbhh4/wxM8NCQzizrTan3mBoYgHdgKXTu6uqEtphxw4Rb5/wupYRwO
	oNnrpgaYX7G+rs7B+Q3avcsP4Xgrf5fg4vqgZOO8fQHnH7JgQvAEa0XA4RoO0Mh5EF5A0fH2ZElFI
	D572qx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lg-00000005zEj-0T1b;
	Wed, 11 Nov 2026 08:06:28 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Le-00000005zDM-1Rlw
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:27 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso293587a12.2
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384384; x=1794989184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
        b=rfFisFfMS/iPssiVjfqRScGsSH1Ti2fqilfQrBXkc3sShlgV9p6txoP5B0eLpiiZhQ
         gXARqIrOBLaB5h46RTVplI8r1/IT1zNFunPuZRtVcm800Q0fyMvg/u7Axk8xMB6AgtVN
         novDN+X8aFsNTDBQSsc2P+81tSXRIkMJWwxUNRcg9FywKwnAhoW0JaIkhTfwiBMwIxNk
         Yk6aUz1CRdAgrFWBfq4c5BcG80sQdo4qU6H0GedAhFnea+WOWDpGmM/wmvcmbhOOxZA0
         /CJujDwIMYg3E7MArWLEHEPqEItIVg3CgKn1x2r5G9UVPN2a7cMMQG2Qgi7vPeW/BKqg
         7F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384384; x=1794989184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
        b=2y1nnznv7Ozk/IM5rYVAlRLa0ddu2zZMGEfPUZFACOFFGp90ntzFU6SvXgmNbjT6Je
         RJkJJSxv1yOBeyuwUiagJhSYQ551HJxp6Z0qmp7K2j7jL4uL7pPqngle1+4xZXRMPA70
         MzhlBfJIrnw55bnnO17g3Tqn/Wc1SuZv7eMb7uRdConPCOcbtbzhcyF8E/l6mlJ8W3ae
         DmO2P+HMU6I/STfA5sTYX/bkFpRH6Kd9PTUOgzcorALQges2vj/3c7r3N2bPr4ikSU9u
         lMsLICF97CqQZc3Lv6Q6+U9WaEJOsaBrnN5uWsSL2r7FbIjTBTqvHTUPdLV1fuemUvNf
         ZFJA==
X-Forwarded-Encrypted: i=1; AL+hErEVZLtn3PLlpb1lqVTCSN9YDLFvkA/InTyP9XfeAjz8liGGTp9o6bmH80VVNIhNTTrYgQDBxYU=@lists.infradead.org
X-Gm-Message-State: APuU4Z/KEmufBeDuqWvkDAi9VatZXoC5RtcUR981IaNm11QMMOJ99pRh
	8nTR9+SlCFv/TOW8DzNmsPBuISau2pnEy1ekTA59M6zTMvomVVeZ66k+nKSNaIfs1Q==
X-Gm-Gg: AYBFou3mcXlMCN1CJsXqCZBZKanuHjxgYvn9EM6GLILl5YyLPKXiQu8dgnyz4imPglr
	1rs35HlvJ39MgoAOw0Mjh8iKXbNgYt//Zmcv0sqvj30uTrPUu+BeZGvJjW724KDudCvl+uW6zfS
	o8aVnfkUb49XUlSiWOpntzP5j2KDKLmzbWy+ee4wF1EShbok7mp2gyWhtCV1CrfbdKOcCH9XM4L
	TtuqnEXA0SUk0/hlB0DH62HJ1XDUZa8jj7QikYcBgdrWCFtgxo59DRH0dv+QPhVpOpnquxLkPjL
	IebKJRqtK7KGAOZGm/LMre3hi1UWO8QPTPUd33/afD0+tJgucilGzlgorV4joiAWLCeoPl/VKsx
	nMKZoUDv4OqCugZVeLGu0/j2AdhJUMh+wuXQmclMN76i6Js9ZMIeg/ppGJp0Vd8ROq5K//CtQ/r
	wune1WrUg+IOZMVKbs7QfMzZvolZlrWqsImvNGiazW92dxFP6vjc2E8IHhp0Aa2wYfJDbdOBgTx
	yD34EgKcLhad34xjyVwCdkSWvdkXr9zZPRfsE8h2RVc53MFA/ulIqWtlTFCKXqMAanKgxNcT8Lq
	lc8mH/5aAAjIXYs0r5j/SgCSo/P3BEzkzLfEdG6b9YXjXDshRciPsnPW2SUL+GL546ROMjgfu1E
	t3ATAECPd02DZX3GoZDy+dRNdxs0CtCiWzNcXmZggztbRZ4Vqk0MW2l3OnfAiC8Q5XwXSazC0MF
	GpjAcv8hG1XOWY/suZ1ljrOpC99FyEpY9qX1oXLzsAmTsMbBaEtICIWD2SKE5FKehBEzaEvUvdK
	/0iKKasOgcshJ3JEqNmq28hSURM1Lzj9UqAMZil5/4vkfCzaO1IhEn+sJH/9tGEbquBOdi5Ptse
	XsSR7nPJNwoASUc5R4w=
X-Received: by 2002:a05:6402:2346:b0:6b7:8b36:93f3 with SMTP id 4fb4d7f45d1cf-6b78b3697e0mr354778a12.23.1794384384000;
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:22 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:18 +0100
Message-ID: <20261111080620.244164-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000626_423662_0D7F1141 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k and ath12k check the Michael MIC of a reassembled TKIP frame in
the driver. Both compute the length of the MIC-protected data in a
size_t without checking that the frame is long enough, so a peer that
holds the TKIP key and sends two fragments with fewer than 16 payload
bytes between them wraps the length, and michael_mic() reads on from the
skb data until it faults. Each patch drops such a frame before the
subtraction, as mac80211 does in its own MIC check.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath12k: drop TKIP frames too short for the Michael MIC
  wifi: ath11k: drop TKIP frames too short for the Michael MIC

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 5 +++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 2 files changed, 10 insertions(+)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.53.0


