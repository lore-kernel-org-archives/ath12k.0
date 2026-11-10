Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB5606A326
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 00:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3FoCWnL/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o31bQfAZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=; b=3FoCWnL/gGtMCDcPbPRa8Iv23M
	V8k3XNNTScPEZ8RIEoL2MtktaiheYzePGbN7lUAKqk0E/IL3SieNH1/LeoGYgqH8/skdIrO+gwSLl
	sVMjw03Su/TMHkPqVw0rxbDpf2ffj6uE8HpqS6kzqE3hyxRJR8EOdCm+9ww9aJAEymKxPPy9NRdu7
	m+AIO8Z0IUf5+jAWXsMzrrDvNChPXIOIfqVV3rirM2xUT4PwKACV3ZUven/XTFDwDBIbivIKGwBBR
	z6Bi7H+FU/HYII0xiOafu6W2+YB9Km8IB0Mjgr1o3Z0kaAQzJWF+V8vh2aEupG9LoawBCoyraRfr5
	8GsB6PtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZcI-000000020Sj-33AC;
	Tue, 10 Nov 2026 00:21:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZcD-000000020RG-1jbQ
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 00:21:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so15492555e9.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 16:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270091; x=1794874891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=;
        b=o31bQfAZ9XqmOU11WgaREaipRd2K1IhdjyM+6zkwaFj8tXVAFeOVictU8jTSHMmOEx
         qtzC8loGMSGgwuuZy0od5gth8hXdq7yVZkb21HvOVgxT2U4mXNL3PdHDJjlw0kglDPxz
         5FPxiKgXfq8OSleP29Bv8AI4UsOsvlPR4Zep/54GtbsUeQiBt7tkrd0ZZC6ouQ6uL5D/
         EOL8wF0If/OGCEpbk0TTTcP1X1TrEPxymlgnnFD4V0MhXEYFyl0MCJxhMVbfsYQwFT9+
         pUhcSTZjLLu/g3pY5oUlZZdYjvGrVYkprbYlX0UAFxypLfA2POx52ZxqbtahUSYEtfIo
         N2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270091; x=1794874891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=;
        b=DU3UvUnLacbHgLfqRsEWBkD5Ot6bdLeibkNI3hM6xI+Lz+NQiXjRXgcq4YInJdk6Dv
         yHfRGoSJGB32LWxVBB26AL/uf7VdNzFEmwTA77q2dCuNG5SbloGwj0a6ypbRqazw6W+8
         UlxhuQcRNj5Y1qfEtmcFBYgF6ijsPGQXANcGD7rO1jOAUKqiRsTxXd7ip3rz23fp16HA
         CXakIrGx+cL8NTlOFbup4uLTcJk8WsH+f8iq/YlWA5zX9sjO8aW+acUn71GZ/Z5RRKQg
         UZd2dmLuND8xiVXonrlM0jXm581pTx0cVud4AsoPUd3TveEgQOLcjaREV7MF9z+m7hd/
         DG8A==
X-Forwarded-Encrypted: i=1; AL+hErHUwA6FMTqbzZmkQwxcknMdbfX5wxFjQEgAj2a5SBz6RScGcSGjCts28f4FWmgZEJmpY3dVwok=@lists.infradead.org
X-Gm-Message-State: APuU4Z8YOFXzCsBoPOCg8Jgt8VCzG87x8hLy1Ec3CI/FkTqfaGyUvj6L
	RwfBFRONZS7aXEtpMC8TospCrrGwRBV+rFUNTzYhcJLAvmw1QyhWMfRN
X-Gm-Gg: AYBFou2wlgxxO4sa199XhoNn7pAKOMdmWUXYqPCrN5aw99DR0qDSn0HiZ+u7R1lhsxb
	z6XdAA9IEYEnkzzmEXvQHiSq248vq2DlTzJ3gd7JcgP9ktHMTEVv78BjsgATT8Um5S84dboCf6Z
	NgW9eFEuuCjt89saIdvx7qSeUI0b8hT97gYdm7ZQDX2YTXYhL0Y3xCk3HO9njiYaqPkk/jZMLCF
	5m/yOKsPhstj4vDMX7pYSysCNTwtE5rxHQ3lgxLpsdMfhXF+Aj8MKHJWPRlpepJbOBlvNxCvMtR
	7fYWDrui1hJay1zzo5DV738/rOo3wIfIBKgI9VtN++bWkMJWIwrvT4x8b45zVnak6jeCJln3cao
	QethQaaj+cxc/OJnoXqHavAfSTurY1Ei1c90aRp3V2li0fnjxDiMpo6RS7ClVQ6yhWll3JiYYnP
	/vgLg6ThQqRMo3G3Gs8hcCSDaXE5FOUbLBZWden7iJQjTSVsQklo9ECexolpiRPmSwRJU4FhR5x
	ua4ctHIfrxW8qFNdXKuTZUQE+8ybecScaL5Rdjq6yGSjSRMUgZ5tFuLa/XnGskS3vDBiu/oRGPM
	SEhezHVvZTrr46Uy5X8dHMTbzv2ROAw4Qq73aRVzntAyKyzIa++TEqArEgtg7F5fId9I3oZQq1P
	YPV73KTdqWcYLyPLT3xcF0nhRErEWK9HWLeVor8A30dgxT/wbKl9I/QTm6nt5kOsbnbBeGRSVQt
	dYQVt0uKKpaUVqC5+yXH5jT8g=
X-Received: by 2002:a05:600c:4f86:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ba02340fefmr12950385e9.13.1794270091356;
        Mon, 09 Nov 2026 16:21:31 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:30 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 0/2] wifi: ath12k: accept what newer QCN9274 firmware requests at boot
Date: Tue, 10 Nov 2026 01:21:19 +0100
Message-ID: <20261110002121.90167-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_162133_472953_CD970287 
X-CRM114-Status: UNSURE (   7.83  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN9274 firmware WLAN.WBE.1.6-01243 requests two things at boot that
ath12k does not implement: a target memory segment of type 0xa (AFC)
and direct buffer rings for module IDs 2 and 3. Neither is needed for
operation. Today the first gets a wrong answer and the second aborts
the parse of the service ready ext event.

Patch 1 answers every unsupported memory type with size 0. Patch 2
skips unknown ring module IDs instead of failing the parse. Both keep
a warning, so the gap between firmware and driver stays visible.

v3:
- 1/2: clear the size in the default case, no AFC case; keep the
  warning; describe only the response change (Rameshkumar Sundaram).
- 2/2: warn for a skipped entry instead of a debug message.
- Rebased on ath-next.

v2:
- 1/2: do not allocate the region, answer with size 0 (Rameshkumar
  Sundaram); former 3/3 dropped.
- 2/2: commit message and comment reworded.

v2: https://lore.kernel.org/r/20261102200235.48973-1-gsustek@gmail.com
v1: https://lore.kernel.org/r/20261030220836.14164-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: report size 0 for unsupported target memory types
  wifi: ath12k: skip unknown direct buffer ring module IDs

 drivers/net/wireless/ath/ath12k/qmi.c |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 2 files changed, 29 insertions(+), 15 deletions(-)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.56.0


