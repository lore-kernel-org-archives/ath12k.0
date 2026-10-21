Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814BE606A31F
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k8uW57Ph;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vnjrwRK+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=; b=k8uW57Ph/SmQ6kTniTBOaAW1o6
	4rhW8mqQYzE4SOkRcIBbaL2AXALISB2SxdSTQr0T4mY0M4wbbKoRYmALVhj9Loq3BFI2wre9MFBKy
	ityXofHpuawMiW37gqqPuofJrkr0Biox6WDvZxqnXj1KCAooKxhiZS8GaqgZ5Ba5oUd51DxPx1UMe
	QliYFbONX2ldja68EpBZ6CamJfsLdwYMuw9GduP0+Ra/jGqa7IMfj1/gQ0xMmAoYdK4L2LTOPholq
	5F8Hrf2WcGwDqrHbNByS+ro7HgmrjOyzaJOFcQCP4Ri7r4fPz57t9nqMMTT4Vs8IFNLKjAL6V0ARI
	R4KSofoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZ3F-0000000COk7-2mJn;
	Wed, 21 Oct 2026 16:20:29 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZ3C-0000000COho-30C1
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 16:20:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c434376dbebso12918766b.1
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792599625; x=1793204425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=;
        b=vnjrwRK+R/cIZl/yrPsFitznHnOGt0zHCHezY8aTNtQRON4TXNmb5y+nLU3ssRUeTP
         aWM9IPMPc34kpCH5c42WL31Aqf8ga2ATPEw5D3TCVlQ3VaVxlBEFi/y9DmSlz1zJgnUf
         SuqMf0anTn99fOMXqyBkcrk2DriFRfwhA0hOeN9HKZlrn8dZqAdAhj4yGBWyih/Xcg0q
         nspm8enjtgH9QwJ/8wsGZPCnsUhLpmW2GDsmJk5AhzdV7u+2bNAG3utoROWEDj14P3UE
         AMfkX02wKpocM7wHv/QoNRjdNuF9U78WF7eXfiiSjX9fNjxLAQAomsWoapzlz39+Fs1K
         egTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599625; x=1793204425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=;
        b=B9Tzkw7s9Wn27BIUbQhbDhDT6nbOJ5L7JA2TUJZpLrx1xtWczKGKFG2qvT2YXgk9yF
         cyVce2DEOUUBO0dtdbHDvGif+aNvnj3xTm4YXiamGTEQNW+r3aU0UjZEoWPDHkH7l8wt
         rdXJ5na2bW0xbPDCLfS7xjbeIwuzd04miJxkQEgYvpW/eeHmXfSyATOWXHjsR7A2M0uH
         7Qgz02ey9Viz5Pakj4rFLuuVkOC4FmHq2NGiGw3/EE+XKI9irW8GHEN+F5Bob1M02mbK
         NXpURvG5Vt7ZrjgpkWBpLX+7AFh+2GH0w/3VG1fSVLVF8IaYh3Yk2Ti4j39ymD1GtESA
         DWGw==
X-Forwarded-Encrypted: i=1; AKwUvBwtkFe4t7TaT6z0F97GtuDo0JjEJCt2VUKdgyem5EddmHgreGLBe/5E4R34hhXwqj2Aq7LEynY=@lists.infradead.org
X-Gm-Message-State: AFq9FYIUCDJKEzWVfk0TVvYwjbM1Y/PiMNNwUVnhJiZkeAYnJejjC2Bc
	sqyShenxrOGUlb7shSsxVrIXqfRkGK5twlsmh6xPaRuvhWixXmY9w5iiW0cayQArkw9i6luiV/g
	r8auNrynk
X-Gm-Gg: AYBFou3gaT6CQEmoGU3s7dNsKfMxdMt4eJIgUtaSwasRN0GX8iOs+CNemi3Y6Lp3rnI
	YpYx1T8lVCn1PIzQnVwKVXl+5EtfP/Gvt8T4w6F2A6W9inkQR76fAtxFLkO51iLAfDqaOIzWZhy
	N/w8DN61okasZ15xX6vp9ROfeY7mDOjzpNSoyseGELC7H6hCca5WGutmi+NJabWsQLlFSyiKceX
	pVfWxp7fF1JFymR2w+0W/YCx2eBhX8XEHqc1Eq4ke7IXe5aU2aGHgMpsDMpCUfcIEy70osvHtFv
	2bgzFsy6mBD5wj6YtemgZiNs/siC8IdQJDp32YzUSKQdzaVBhQXI+nnMTYn3T+Gd2wgt15SlIYy
	dEW/l7Aao2SqzSOU8uIi+TbrOdmHPUfPPSyZ+XnOURILWVAFZKlrLLvqmt2E+1BpawPt8SDyni0
	1Cz6FXIu8pVQq1fvgMzwZ9s31+bKXFcQXRuSxi7rds7ze54piJvqwesERhITrkhvNXTDP4WtNix
	zE1qI9aK6Gtl6WVnecQ9bndQ6Cjk6ujT+j4gMNKoL61HW1r4vMl49SNmwMDTrDEVOcxiPCGn6rk
	f9oBpkgdRtXYvnwqVn/T+dUgmVe9JI3c0GMyB/zLdB9WbLBKx/ri7dzxCFMSnCR6EI90w0oPbq8
	6u491idoompH3FsyhDiTIHFonuWNpybBbnOkIJz/0T180rx+H9N689KCH8tGZgWqOIYejscIMf8
	YNo+FGELZyh0oGDEs6bMkZh4JpI5ZJTkRdTtA+DFmJaHsLMUDU7u2o/SLI0gI8+LGTgFWVpbZSJ
	SI3kZU=
X-Received: by 2002:a17:906:9f86:b0:c36:777f:824c with SMTP id a640c23a62f3a-c4600c81c46mr477496066b.4.1792599624671;
        Wed, 21 Oct 2026 09:20:24 -0700 (PDT)
Received: from Desktop (pd9513e2d.dip0.t-ipconnect.de. [217.81.62.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5625cesm17445766b.39.2026.10.21.09.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:20:23 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:20:21 +0200
Message-ID: <20261021162023.280823-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_092026_758693_13876BC8 
X-CRM114-Status: UNSURE (   9.52  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The firmware reports the 160 MHz NSS as a ratio of the radio's 80 MHz
NSS, but ath11k applies it to the peer's NSS and advertises every chain
in the HE 160 and 80+80 MCS maps. ath12k fixed this for HE and still
has the peer-based calculation in its VHT path.

On a Xiaomi AX3600 (IPQ8071A, 4-chain 5 GHz radio, firmware reports
WMI_NSS_RATIO_1BY2_NSS), `iw phy` lists 4 streams in the HE 160 MHz
MCS sets without patch 1 and 2 with it. Patch 2 is compile tested only;
I have no ath12k hardware.

Changes in v2:
- Add Fixes tags.
- Use the plain Assisted-by form from coding-assistants.rst.
- Add patch 2 for the same bug in the ath12k VHT path (Rameshkumar).

v1: https://patch.msgid.link/20261011123631.1664734-1-julius@bairaktaris.de

Julius Bairaktaris (2):
  wifi: ath11k: apply the 160 MHz NSS ratio to the radio
  wifi: ath12k: apply the 160 MHz NSS ratio to the radio for VHT

 drivers/net/wireless/ath/ath11k/mac.c | 24 +++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/mac.c |  2 +-
 2 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.53.0


