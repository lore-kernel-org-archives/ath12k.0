Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD9BCD98E1
	for <ath12k@archiver.kernel.org>; Tue, 16 Jun 2026 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8zcTiOu7ghls9F6LpfIEHJGeEBe/JahYJ1vnyFQxMpc=; b=knHh7oICFINOivIAyAU7MUpzx2
	K5TlHR9Z+RpHiv1n+qBzrG0k5pCQhjS3PfD/iXcsn30KdXTRrbXTEKWhnWYinUqiSRHYOSkRYylMA
	4R0yiDqsQFchhB0Ydc4/O2IQCxumHVYjYovdtO2wQmnL4x88zZJrJ1rvQ94G6ApEGJExWNSs0aaYB
	Ghg7kZLraF5Kr3JBy1pQaIErji0veDzsKbM947vJT/Ql6zOhos9hXLLlSpEUSYhT92rcxpRkuhtuR
	dJQjBakxv/QJZqvQ9a0yTzBN4QdDYRDdeOxf0OPyHTbGCs0P5pwGk0wKyR0y2Vr0o7Sj0ffwwllJi
	3xmvNKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZpQ-0000000GGKz-1XW8;
	Tue, 16 Jun 2026 19:52:08 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZpN-0000000GGKF-2Y4l
	for ath12k@lists.infradead.org;
	Tue, 16 Jun 2026 19:52:06 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bed2b9bfa02so642377266b.1
        for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 12:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781639523; cv=none;
        d=google.com; s=arc-20240605;
        b=WuxPhyWh91q2vt2G4eCXB1xgPzyddtav/ehgK+9vqzCdf1zPkdRwTGSe5p3Cu6eZ8u
         GXapVrTQVRHofOQVoOaWvB82yGxKGf+CP8huHKD7ptLycNElXznXFg00GbCJmEF3Lr6V
         nkJbFeR778dsqrOHDxkl+1/nKPqxZIsyBEYJzgP7mD7sUC4i+J7tRHLPe9uZNCR4wNIF
         tlPGOZAf0OISiPfm8RxUNIrDefWzAX9UD8ruMUy+t6YCwLdFihwyKPXUMnNebeLrxEt/
         AT0moTSOAR3i+51uYjKL3f/5v46oWXC4KT9o0Wv1UicMok+PDQfLkvrAJm4LZcj4NN3u
         W3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8zcTiOu7ghls9F6LpfIEHJGeEBe/JahYJ1vnyFQxMpc=;
        fh=1SVnUWCOlqesgPz0exmlrbRHUNpcaNpUxuycVPutrXI=;
        b=Rjw7PDF5I91DjNfopT/7vj7rWmaQp+pgMwy3GeC+tfF/07+fuN2C1YN590LmhKloQv
         eNUJ+rwq6GIwZ47+Oly72Bd5YS5bn0WyazaiqDuE0wTS3Fpw7RRRMu7dNTNo1tAqto5G
         Q+il/3bWoXxGxUjtPc/06bGWeox2Ik6qEZrXN7h8jtfJr14AMqVrZjdqlflWLONYGNBY
         4WJPb2lpryiY0kBshMDAXPxqmSsB7fXcR+QkzT+vgY1lQyWiraO5sOoHBhH9sWHiS4TX
         BY+GBlgSXzogvy7MDnFn8eZgLIV6/uf5wCTwO7xFSIkc4Eibf2DqywmgjeHHbVRkaJ4D
         ooow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781639523; x=1782244323; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8zcTiOu7ghls9F6LpfIEHJGeEBe/JahYJ1vnyFQxMpc=;
        b=inFdcVrg+WGAI4F/Ktu3J49bZ1/JIYAx28TYmvEzXeOkDzVHG4oj/hL3c58evjmzCj
         HYRBwYZOSvXSCOPIDCUA8P1xedCoXdNewDk4lEYmiAs0Xyqjd+8tODVHomwJA2UgL+Ln
         gHlR3opNK0PdoGQ3pXK8fbdxic8Adg/t+MYiEjQKZdUwWIajTIfp9OoTx9Qu3OsdPukk
         TJZl87qMg90LYdjWljjaqldgat4TMhVUQi9fbwj4vD4ZUxuG2g2BsaGEGH4HAebS2jpp
         DFNoLFLEXjI20YGNn3gny3c7r96X/MrdBJhls643yqI9faWLyV6pbjxnGUyMNQrerD+s
         v+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639523; x=1782244323;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zcTiOu7ghls9F6LpfIEHJGeEBe/JahYJ1vnyFQxMpc=;
        b=Oq7oEqvTK5jYSzr0TEo23PHpad6aVxsI+tE8I7VUSWFTX4FKDCa1ITBs2A4MeR9EJG
         hl2ke9FekLw5R0GmgW1rlmmPhjsCbA3qBl8KM6dLM4PkN7r8RtpgsE2Z1cRUPnwLSqYT
         ssrTK3qoUgOas81BMLKnWuqadK6umK/nyKWmhcTTyxBzqmPoCYC5zr9otC/+z9R14Lrf
         hOb7SkNMNwZ+ooGzmVam45pTL3jwIZ2kWPtbOkcZMG7P85YWisX96N0ai+M4IvMnfaeH
         YLeibDSWOLx2UzE8Cj0EHaua8h0FddzZ7YRq/hJGud6nCr+vhBNKtU7tnHUI2rS7XJIL
         4ESA==
X-Gm-Message-State: AOJu0YwM26cjNjEyolVDut6OyEoeP4+pcyeVDRZ6hatEGvMxlkSB+rBk
	+qtx/YJzD+1nwvD4MV4UZGpa97ninQbwiM4jvfqa609LMND/5EDHNm/AczjuX6FJDIwkZUugF0/
	Kt5ME2Bt3wlzTXjeMIpNm8v8CFAlw3bRc1qiW
X-Gm-Gg: Acq92OFNnDYagBVnMBZVSiooszS4X9N30fNEsVOxaHYkLWVSfwCcdFLDxfaLgtcP2lr
	eSOC36hQg5diyDpdf1OMIlI8804oh7fK9mdVA74HOPk1ASSBdc425U/E56QlzxCiGmD7ZgTXgtL
	xLxbEBwxEiQ6Yn/SA9DFx4fwWKtY8XL7ybqs/6eTZa3fFPkaPKQD9K80qerV111oNe/7z1+U91Q
	qq7z1npAt4wE9yB3V6byyUjoxslBVSqtBgBjx8v6dcBG4tsVrYvyp3DMLzBofr+dVH6HxHn9GQG
	XKjfTQ==
X-Received: by 2002:a17:906:ef01:b0:bec:fa92:d36c with SMTP id
 a640c23a62f3a-c05a4c05694mr72400766b.38.1781639523036; Tue, 16 Jun 2026
 12:52:03 -0700 (PDT)
MIME-Version: 1.0
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Tue, 16 Jun 2026 21:51:51 +0200
X-Gm-Features: AVVi8Cf28j_ib61_As5dbRmS62G_xpFVrbdSa3QrHboo62lXNxuG8oqiRgzI9Bg
Message-ID: <CAFED-jnmRVndktiwaO3JEQArQhyT1eby1cQQzuqEQfkeRPqUtw@mail.gmail.com>
Subject: setup/handling FIF_OTHER_BSS
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_125205_654103_E745DBF4 
X-CRM114-Status: UNSURE (   3.66  )
X-CRM114-Notice: Please train this message.
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

Hello,

Is there some patch that will handle FIF_OTHER_BSS and configure it in firmware?
Or is smth fast I can use to receive other bss frames (some firmware command)?

BR
Janusz

