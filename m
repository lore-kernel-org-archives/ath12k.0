Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C35606A322
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A4fJ1pnC;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=V/UEYCrJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSE/aiGp07O28xClfqJkfRnHef6QHlRoW33T0GdwSH0=; b=A4fJ1pnCCqaoUfmOJt5sXB1IKX
	ZLRRLnDSXzrnTcLN2g12RYX6cJahNTz2cDzUJv9Iku6S2XsvGkGLnQey4vIXaOuSYfbRy1qerBTp/
	ikR1/Okmne5B7aVBxSLCXaTc0VDmv5o7R1i4DzS/pXb53RP6AKLDeDTvx9rMFsBKdh26s8Dc5VUea
	rZTsWJyR5Atuc3kHTmzWOgQHWjoIVJjKh9TMWE6VeqGl8FFmMA8O2d8EVEx6mlIneDbRB/CF4MLuR
	4xdCKkPccCUXlFWCMbuxXY70bMC8MYeHE4R6TsmYq74MK5y1b2/KZwNWAbJd4q+fIXfHh30W4XtwG
	yZXmeuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZYR-0000000CTvW-3Pah;
	Wed, 21 Oct 2026 16:52:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZYP-0000000CTtS-13jJ
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 16:52:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c4301e334ceso68648466b.1
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792601559; x=1793206359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSE/aiGp07O28xClfqJkfRnHef6QHlRoW33T0GdwSH0=;
        b=V/UEYCrJE7aBZXen7hQGrTIuG0viTEo+G6e85HLM7VzJryw2GRtA6OFU4yRIHGm7zy
         uGOILrSvdQLorGo/56Rr5zl8yxfpHsYTDGkiocjIJWwbYcTCzFSRgbIYcj1YZuH4vhuL
         6i7cSx3mT15M/ZCL41hcR58bAQQlln10p1IV8rFj2G/Q7wyNn3Ky8Wpdnz7IWTjhqXOQ
         yHXA6a/c/L/djNABLF4Q/EwfusgMrevN8CqMHVZeCCTsvpc0IAj0ARCP3wAfj/fZv03z
         2SWfOHkQkYbyzACWtoLzXy2dOJbHTZ6AmS1fpS2xFa1gzg5NUe7bBeDGCe9b4bzdoV80
         nHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601559; x=1793206359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSE/aiGp07O28xClfqJkfRnHef6QHlRoW33T0GdwSH0=;
        b=S0rJnOPn2LYvGQoELiLnDR/zWOG9nQ9Z+ZYkw3GBmr76hmTBqLx0jInP8ZngxPGrWD
         rvH5Lh+WK+/CECCbZKy75BebWP8UQgNbC+eGkcznglZESDWfrypKu0g1VXbCEUpOd8ST
         g1ioSbp4jP91JufJy6TVkbIyhIELwiMpdm8mHg+hIsEQ4mR8CtU1DcqEIYmQGGM6hrjb
         ZdEFN1PpPPBHCv9uECqgcTUCTGwxLxl70k8EGPsMIqKizMJF2XvCSCqEv0BMtdP3N/ez
         U8/YSpJ1z7OFzqSSYrac+oawewKrJpHUjjGBAdgP5Zlmc7YzDQCZBjGiFqdLYAKX9aTS
         FnWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+plje/YZaqAYyrU99H/QdiPXtMgUY/jVomBrEGKVNHEHPPUf4B7SC8vgSXImrQSso5bFRmrQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLSn3cPUY8qgbYCA8DSMahIYRftj/FC+4Z5qSMW+T4CMy9+jPLm
	Sd2pDGzuSPzXPYZUTkPHLR4rx4nY8dontLnvIgieRdFaNxvbge/dpA7mnWhMQv78MQ==
X-Gm-Gg: AYBFou0RlT1WpizAYiowoi+y3P7vYSYMI1ZxmEvjX1xFXSMW4L/wJNGUCeheqpD/Hf9
	Yi3xunuxihByJYgX9oXQ531CGUxeOdrF6vZ1vHXv4ilhTZhxnhvfS4R0DcGAyg4b8aOLTUmrb4m
	TcKojA2cTu1cQGaP6eI64vnXchbMwMS6R9wOQo9pkW/mCyMuOQE8a7m0dC6sLKUzvUUPNoeT4Hr
	mp1+a39ANArAosZR9qBlSwMRg/8/XjTCIVIS+mwosu3L6W2ntW+timWA/EvMWxlyp3ESsDeW93d
	0S9V+zG5jmXR9rC1raAf3ZnlpgwKg2H4O3FfYmD1uNMF7LP77Enx8fJW1ocwrzJk4/PP8rIuKy4
	RtxYX1fW7jvSWvy4rZnWw0LJTa8KzmYfbVBRonxO3pnMHWsLxJBqm2Era9JCu3V1+iKmta2Ria8
	dy2PlNZiZpE7Z/4t8VzKRTeml9wHh2DTxTcDvUBI44EBmNMdjTXyUKcUeaIZduJut4MJ/9VdSky
	slNHFnmJjYEszbecu5QQPoflpzZ+X/Coi0b5qGNIxEr/p1/XAiERKRKkEe/wQIpOG/5NII9I+eM
	vGMUjfQCN7QxsEDS/H5oSqqCKRO2NoSVayzVVdguoCTuI3mGDUiOTJeNmcAuASeqgt57fr7MUZm
	ZyqwCXZiysdjFJjs7+7TXFANMtO5n+2IdocogyRpipYh71DMAyGY+gdnHwTLVLs3RViAvHJ4dis
	89QwZqUdTELpmR2KaoBDKPueSpA9hKnMS8AZt8UUH5TCKbp8YPh406gNCFFhDLUOBmbw==
X-Received: by 2002:a17:907:1c95:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c4679b577d3mr222087166b.43.1792601559256;
        Wed, 21 Oct 2026 09:52:39 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.223.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm1043728a12.13.2026.10.21.09.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:52:38 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:52:39 +0200
Message-ID: <20261021165239.388945-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021162023.280823-1-julius@bairaktaris.de>
References: <20261021162023.280823-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_095241_314329_072F61B3 
X-CRM114-Status: UNSURE (   4.94  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please ignore this one, the send was interrupted after the cover letter.
The full series is at
https://patch.msgid.link/20261021165138.388593-1-julius@bairaktaris.de

