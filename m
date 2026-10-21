Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A13606A319
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 16:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CaGgnQ10;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IwbZjB1q;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=CoVwSnVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGiZR7+p414GrEXSM/2Y69GcPywVjK77Fx5SS5X50mI=; b=CaGgnQ10YewucVk4hCQWMk5/G7
	mJ6orVT8Ib87iLMuaTDi0h4Iaz9pAhreatwk0LeOvkjs5tU+qeXg4X/v6HHK4Een60w1P4bzmMlZi
	9WZq23j+jlqDeYiAO/YnkgL09tHv2C41v124+5cwIOklnAHpfR8dxUmWn2QOVrHvX2ic8fEYJLa9w
	dRUca1dUZrvDliRTj3GrZw/CM7DGmvG4ThS6WkvOEGvgJl4Rk8kcWRDYYGHsWa0e33j5M8/iqzscr
	h+bLAySp21DnieNu5TP3cv2/q56ULJeJ3IAeYcQoYGa2Xely936ZbYyI7gJe1oxKG8SNAxUXeArDa
	UsUnBWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXX-0000000CTKS-17KN;
	Wed, 21 Oct 2026 16:51:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXW-0000000CTIc-2fbV
	for ath12k@bombadil.infradead.org;
	Wed, 21 Oct 2026 16:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iGiZR7+p414GrEXSM/2Y69GcPywVjK77Fx5SS5X50mI=; b=IwbZjB1qc5ldCMgoNwI8NpiNAq
	xPVT8YkIjV0bM/idXPQnqj4HD9rmCqdANX27XIQBnrI7G/FhH/HWQnD+xGGHxi2y4UZjeEaabaHGm
	NyzKuVnPilQ9OojGKCpVUZ4MbR/x1/qJLr/xik5JS6AHwWGVkQ6lIbCvWTX6ZKgHNj1C4nes82tga
	rEeAdyo4oySGzyttLlEF+akvclKIdrjnuFZsdmWJgg60k07pRP2PZgl6fazfAYZASDgSC6nyC2ABa
	/RbcDcyfVm2oSGLYDBa20bJ0YLig9LnTFvXcI3rP73NjttBjbwdkLbGs8438e8PED+2EaJHKk6Fwh
	AbnpJX1Q==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJZXS-000000062SI-0xtE
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 16:51:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c4086e892a4so123255266b.2
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792601500; x=1793206300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGiZR7+p414GrEXSM/2Y69GcPywVjK77Fx5SS5X50mI=;
        b=CoVwSnVuaAtGwvYE1AFPXtShzCFHngi9SrvTfGeNtFGEK5mE5BK0mtHj6U9vTtBag6
         QOMNFpVo89BPGlWQMCSERkE875DPvsW8peadHQKId7Zz6agB8BkcubTQMTxC+cbqm7fL
         d8Dnnkl8IoyuU+LOPgPRmXdPiALwOwZQmN9fAdFGP2IgIXDnUqhIRgYE6EoWqwHUEnLt
         uNPpxNMQf9I9jsR62bHoUFw9i7rTnFt+Nnq1Wc1YQ2EoFjuveCdwHTaocbz+5XNcedCm
         xTN0gAtDKQCMhBVPQfapNjFkf3RlzKUl9bWkL4Y1gRG4N+6TqeG+4FjkmrY6shMqEOXA
         8BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601500; x=1793206300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGiZR7+p414GrEXSM/2Y69GcPywVjK77Fx5SS5X50mI=;
        b=Hiq8rNVdUj1d/nzO1Ig1Lb6Q0O1jMz0eAeM+gJWnYyr/omGa0jD0W/iBa4FUarAXnN
         zA6N6j73TGuj08SaNP37T8d+5dfiKK3gbF3fMZNTSxqWGABvvmCsdNlrgLE6ilCTIojX
         J9A8xxNWZ4Uhl2St+h5oRshm9CRaaVyQEqDfZ8OzYYUAv8Pa8TIecjh6f+UTmmdGaHLG
         7zDAjP4Wsja30qQtjkwcpDXUWNicGnR4pTZ+7DpToTEshvgT55sI/bD2IgeA8gV3gAUO
         Va7mCphEJ69CWO9NL8jtW2vHB453ziKQumtDCAqJZnhDDl3Bp23d2ZtMenRNRULje88b
         rJ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/cWrhrtwRICrPMpwy3/MJHPju12GfMOdmDzFYNohNsN9z5FKsJqhLtwm71BNg/89Xh9Am9PM=@lists.infradead.org
X-Gm-Message-State: AFq9FYKZSVyyWICowZt1aQDKCwSzQZe/vHfEYJDYXZ6NiER9TZp3Xib2
	4mPryQ+1PYseyR9UJHikUDahooQy4hEN5qm4VOTBkEqGK4nWqCLOb8WuZGHgHfM/LA==
X-Gm-Gg: AYBFou3uTQKp3eE1hKm33X2SlNAMvU3nC8+XCx3FNHzGbVdKWuO3SHqhosBfdo+zIO1
	HiNOiVdMP2O33jXB6XK0/Rmj0czWqgGDp2NR4rXTtrXFSpjoyUbnGG3J8COszrt7CO/C99hWkk3
	jR3w7lJPLbjP7CjGdiJMP5tn+27vSMqIPA3bZT0U6RnfntKQDjbv5piNMmhu8DSsPzPfD0wXeqf
	wGw/0xvfeU1vJ8Kw4lvL/MmE3fvEKBTPDBvNRkXg6pSeKZ5sX+LMUICMn8yI2LcfJ/ye2DofK4X
	E0Gyt5PjHh7/dDuzAxcMlTWutkrQgLHZn3t6LP49ElVDN++8RJPaPapkHSc6p1VLzpWTH3RIq5j
	Ornlr75Ig9UsSFTlKe7tOynmZe0/+01CEHl3tp+hZEoaIMaZ4zwa6h41JocBS/0mQlz8nOGyiHC
	dX0I4j7oLxuj7kXIhrItfHsBwk42Q9u6fSnxphOy9q1box1/bW12imLJKnMVhI/Y3hK6i+W2eX+
	6dogUuNJRBubO7W7hKbzD85VOFcMAZwl16hV9RwUXV53Y83a5hjiTKLHvoBjaYKvCq6tPVc7ceh
	FfnCd8owFvznpBKzLkXJx4klPy5KtsVz6OzcFtr3UJViyoHGjn9+BRHg6vu3/4vTZ1tloRzHANT
	vI5qQk9/6XoGAZV62hi+pWeD9n6cZx5dczL9Wi0GBydiZimMHBIEX22O24iYgpHntA+0ENjb5Qm
	azHiNsiNM5L3iYGcMJWsMLTRW0QNk/X01BtLy0eoW+NQKL2Xkw62cWcTdZZ3H7ezpE
X-Received: by 2002:a17:907:3e89:b0:c31:8c48:e18b with SMTP id a640c23a62f3a-c46795e8833mr224387366b.14.1792601500405;
        Wed, 21 Oct 2026 09:51:40 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.223.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5de48esm20782466b.66.2026.10.21.09.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:51:39 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 2/2] wifi: ath12k: apply the 160 MHz NSS ratio to the radio for VHT
Date: Wed, 21 Oct 2026 18:51:38 +0200
Message-ID: <20261021165138.388593-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021165138.388593-1-julius@bairaktaris.de>
References: <20261021165138.388593-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_175142_330648_DE154D9B 
X-CRM114-Status: GOOD (  11.66  )
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
its 80 MHz NSS. VHT peer assoc applies that ratio to the peer's NSS, so
on a radio with a 1:2 ratio a two-stream VHT peer is sent one stream at
160 MHz. Commit a82ce08775bc ("wifi: ath12k: add extended NSS bandwidth
support for 160 MHz") fixed the HE path; take the VHT 160 MHz NSS from
the radio's TX chains the same way.

Compile tested only.

Fixes: 18ab9d038fad ("wifi: ath12k: add support for 160 MHz bandwidth")
Assisted-by: LLM
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f657..2c2753ce5df0c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2510,7 +2510,7 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 	arg->tx_max_mcs_nss = 0xFF;
 
 	if (arg->peer_phymode == MODE_11AC_VHT160) {
-		tx_nss = ath12k_get_nss_160mhz(ar, max_nss);
+		tx_nss = ath12k_get_nss_160mhz(ar, ar->num_tx_chains);
 		rx_nss = min(arg->peer_nss, tx_nss);
 		arg->peer_bw_rxnss_override = ATH12K_BW_NSS_MAP_ENABLE;
 
-- 
2.53.0


