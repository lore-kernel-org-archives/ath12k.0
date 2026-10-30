Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169C1606A321
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 22:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pJZ8i7FW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0p/xYcQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Y4WIvJDYTWJv68p7KaCr9/OdFM6n4ms38ALF2iW0Oc=; b=pJZ8i7FWRVAdk3
	pHxnlhjoqcg6s26nmtRRyGEZCEfPiAoiygWQbvNg1Rj5QIylAKTG2yvetiRJbRbrSBj5pNQXLW7hO
	DxxVohl5Moex33JmlU5KlBN6Y/d/fT2pDqlSeS12EPlnqxdLk9WguvwUBWDcDrlLYzvOoMOCLXhH0
	t8LdVYtSXOVJwdt1VGCfO450imy/PobCFmbzn5TcsCB7zkSn7wHpjJ3qdkT6kBeO0XRSay4yYbD9Z
	hG0cb/MMWQ37YCkuGrcVeQ9TeQvnborV5o621mTgq/z/YHnjC6pratDSxKGcpOgmCIOEN0K2Lq6RP
	pS2WTVrCAXRFc7XJNfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMumD-0000000Cf5l-3SWq;
	Fri, 30 Oct 2026 22:08:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMumC-0000000Cf4R-0YBm
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 22:08:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8092665e9.3
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 15:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398122; x=1794002922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Y4WIvJDYTWJv68p7KaCr9/OdFM6n4ms38ALF2iW0Oc=;
        b=W0p/xYcQpJbWTVy55BdfLH2N7X5aUzTwocJuSfhWMnH4jva/osf71gGShJHOi8QaaW
         Vp932QvOZJzhaSMwDDlXK4DlOAI44ugFNAz2gXz/waaQW8J6TGd7MiTNjDYcjyaUXbeg
         EoOvKULXWLGZImV4PU0IYC1DX7b0IEXAqBGGkUpO5ApU1rwKmpHPMm64qrlM+PHm9wtA
         PAHU0F/vMDzSPK/Nje24+cZ+GLWJBEiZ5gBVKDZx2QY/30sl9hatr3mgGiITskciqc8L
         I6IeSLwRzuHIIT5wTIZx4SgvoTjT5JTvcpcCncy9qmqSQ0E36BmJwDOOnp/5S0GO2V8a
         vnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398122; x=1794002922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Y4WIvJDYTWJv68p7KaCr9/OdFM6n4ms38ALF2iW0Oc=;
        b=kCaJqg9Trgrf7afGLKiws4lgN5CZde3FSxalyognMyeMz0I3FpHFHAwMXw7k0Yw4dn
         Hjo4hMEc93Q5aN4CJC0xgbfRer/W3jC8+fqu3Hd1kdS/7stjjqUtdGzjVhk9SEpwM5SB
         schf6NqFXW/XtGcIqGmhuUEk7/ZOmO2M/rTPJYJ/DNkA+TrmsjnszdLYTbNJ/cLkfKni
         esfeXcDVUYWnt0HT0ac+m3YAv71RQjqOIFX1XmbgWcKlOX8KVI9Dj0DyN8sUtFBkQ0wP
         GPUimkJBsHcaidfAU6jG7wwjAUYmJZljMJWA9XyvBinS+HjQHYD3H3oJpxxKoJ2h5BYl
         L/Eg==
X-Forwarded-Encrypted: i=1; AKwUvBx5qk1q52rX0DM6HITgSNM0l55FuCxfn+W07ZBV5rnKSId6nGbpqL6u/4BfTLldwVjXkEXv+tQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8fFM6k4BNDRXLpoBC/TvoDL/tcJOc1zNyK/6TfSmT8O5Pv9n6
	FMLRHh/yEr7jWJGMnOzJVFzKt3TcSyYXEsPGRWVX7RYncMa9tJAeyt6Q
X-Gm-Gg: AYBFou3UWrnOBcPdKkuzO7nfWaTPsBIPkrTn+W5yKNq6iTSmic7f5bVMLDtO+dvoBDO
	TenUMqANCFlNyB9n2ISepeATMszpoBVhjQeoN4el/hQc8Ci6fBQLpU3aB9+GwK3kGt0NHDk/79S
	PGHPXZn0W5/kTndcFj3ukaUOz+EUtlYtUVtzN5KZtwoRIFhbmLxCDjBGJ8dhTTLrQzztBihWnII
	g5//A1aEgXnY5qOfEpGycR1oKDmk98NDYG4aA4u5PWsVdITJ8GlJzRc4sOFWILORlrOh204Zrgo
	3bG/WNlp1YGbKuFttZ96CAbMlSzlhiT+XUCnsdULOYf0JpXsZdw6+oGf9aIY624Xb3Gq4pQWUd6
	NVin0mIczDRYC01Y0YxT4FZZW6i4PPOwB+mGzCIqh86IzsvLuBe5Cf0q8nhLezJolIw7+muvgFd
	X4Wxl4aG+C0+JWtw04568T2ACQKbo1mSmzYuDBAb0quAsjS0Dhk2Lf+JjtUuqB+9RAESMt/X0ct
	LTj822qv3yKTx0ZK3bENpOa7ZdLy7oHrg/JEVpnKY8ej5fQU3pD3e97cGaiRRBBDWa59keihVXT
	YDql/8jD5KusdN1m6uTK70wZLZv9XylgtH0RuT+dGcJgvZTQGsyK0gVG65os9GxPUOt3/+4j8B4
	iuUCEI21hlaFGM6nq+1uYZpN3ArzzPoAQCE+UkLD8v6aRLu8UhcxxSSyWvA==
X-Received: by 2002:a05:600c:474f:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ac1793ed87mr83381555e9.24.1793398122427;
        Fri, 30 Oct 2026 15:08:42 -0700 (PDT)
Received: from u1804.home.lan (152-43.dsl.iskon.hr. [89.164.152.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm56230305e9.0.2026.10.30.15.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:08:42 -0700 (PDT)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 3/3] wifi: ath12k: name direct buffer ring modules 2 and 3
Date: Fri, 30 Oct 2026 23:08:24 +0100
Message-ID: <20261030220824.915760-4-gsustek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030220824.915760-1-gsustek@gmail.com>
References: <20261030220824.915760-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150844_175093_0E7296A7 
X-CRM114-Status: UNSURE (   9.32  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qualcomm's WMI interface definition (WMI_DMA_RING_SUPPORTED_MODULE in
fw-api wmi_unified.h) lists direct buffer ring module 2 as CV upload
and module 3 as Wi-Fi radar. QCN9274 firmware WLAN.WBE.1.6-01243
advertises module 2.

Add both to enum wmi_direct_buffer_module so their capabilities are
kept instead of skipped. No ring is set up for them; that needs the
features themselves.

Tested as part of the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759bd8..9444a1f29813 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2378,6 +2378,8 @@ enum wmi_beacon_gen_mode {
 enum wmi_direct_buffer_module {
 	WMI_DIRECT_BUF_SPECTRAL = 0,
 	WMI_DIRECT_BUF_CFR = 1,
+	WMI_DIRECT_BUF_CV_UPLOAD = 2,
+	WMI_DIRECT_BUF_WIFI_RADAR = 3,
 
 	/* keep it last */
 	WMI_DIRECT_BUF_MAX
--
2.47.0

