Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215B3606A322
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 16:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SsDW7aJX;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xz27CBwf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=; b=SsDW7aJXcX+CMC9VSxJuqMJCnz
	0IuGMvDXg6XrL/6KNFhwOFun7AMr/BcE3+/bN/8zj1hw3lRfrQDD7KfiGJ0r9kAkfQSmk+3CgxDlf
	g0/hfISKNUeC8vvX0hQlj1waJL3//X9wODfMojlw3HFbABV9mqUsprFR+9hPRFqEEKDEahrqbp91A
	qguBer7EMvNLNJdpXlOwAyBmakFxPyT+67sJudr7/3xool83PeL6cu/UZf5QFhXIM/0HiICOmLLpv
	zILq2csrRozpXiZgCKhJXBz5Y5RsfBjr1SD0aqtRAI4LOrbA6Gqp/MrqLAZ5eu6S5puvv1m8Ian16
	aT1NeJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXT-0000000CTH9-3Zbx;
	Wed, 21 Oct 2026 16:51:43 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXR-0000000CTFc-0qDU
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 16:51:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c423b145922so121824966b.3
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792601499; x=1793206299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=;
        b=xz27CBwf06UifPcRX2OKJSlZVPkUeNxJhS7tZusJvmVw3LKTlRy0I19HcWJEUVYKpJ
         diej+qvDjsp/NiYsFXyOHmJANBD768Pa23wGMOYiJCWC39u2QF3CHkudCNR46VjtHlfT
         jMpiYT5ZaUWOGR7zGA5cf8UvMIAev6T1Aa111q5o5Il/FxOqZ45rsKD5Yk/tjhEEFFBk
         szffHPHgqryYRKxGwbqEFPNAyenCpmpkB4uU0sWvQns+tO4Bf4mUoPGZSvA+2ksCbKLY
         j2wCtCI2Yuergl7qFz11K5Rv7jNECEr19MZZcOYP2UrqkAXBtKAJbjYlXii6USS3Lo6U
         r1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601499; x=1793206299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dacLjl7RN0IeeDiK9b8hPkWa1OXHnnZ0y7fVu/qkLNs=;
        b=NsB3fs0qkupHZVn0sjN5WSZtvP+WA1v8LCp9UzFKaPWUO8H60OZ7Psaaqo2oYxJqTt
         qAV5NmbU3QD0/VEFj1xuKuS211J0t+nnW5/NDDpb3Vufz/VOO+lFkbnlbfr9yT65Bv4m
         R8UjOGfL/advw/1dBzV9a1dE8Ikpwwc4B/QfM+X7F4ebjHiO1pnzD9x0bCOd7I4XYfQF
         0+Bj9ch/7wSJJs9nUosTfHhzFkYm154SQNqKCNcJRdbTlZI6QQMQJamyM+mGLJA+9Cov
         BWFc+02iZEhGv8STo/A00F3o+PhgfO6M5m0H1n8fYIvnnKsQd3jeET9eFPa5hES8cofj
         LELA==
X-Forwarded-Encrypted: i=1; AKwUvBx5PkS15FZRp3/7BO3Z8TetZ8xOqUwXFch8ACisXS/EK/uMgPsUjB2lxo3xY4Y4b/aG6exeXg4=@lists.infradead.org
X-Gm-Message-State: AFq9FYLz4cESu03WuNMMcn2yg65V7SFyWDO/yZyifUsz46YM9ZBGOwu0
	YIofS6gMnp+j5Q1+8C2pfhSapRP8O2yfN/q/TgQhUlvmoHkqEOesCpK66RK2idjqBDYvY19KhWw
	lD5Eqx0VK
X-Gm-Gg: AYBFou3fZReGkwC33MVFng9AvlyDUlHIMpuf5mDsZG8v+nQM20NhCii1w0NQmchgBot
	gOIcQJ0UapgaZP9OvQxoOoII2wNp6NA9VBFTeKIIyWfUldswLgx755anz8k8rSHMaijpv9hMXOq
	cwSLSaEgKhUprfDqr+LZdQesS/qIM4K4bfGWX9r/Ghii+tX09Gqa/ByavAoNxuZLmifkg6OO/Uq
	3u/BuOuSXg/sxtW6KRMrWbF017fBZ0r/yR9pddyJLbl8ETttNJFhi6vG0u2+4GUkNji/q0tWYhq
	4ZdMDTLXIyESeMe/6W9/Q2zb4lyi3mSWETXVmZ0SopfoohERWIywfvAbiaoQsOrg8TwwrySADDv
	vekG86e7qg/pKkNB7TaDzsWT38Ci14sqjF4+Sm3jWwizGMgsKw+pqT+tGtUHeSaRY2FkSMBR4Td
	RdERlRTtVCt2sEbvT336ufBoiLYVF72hgduQfhR0ujG7kntVLUlMHl+L1CJVZPMz5Oq/gyDAx44
	tiF2S52tPuIb9aotqZ2ycKLnYkarDzcMRYW/aETRW4ou3VDfwgmlhaPlsj6gmhvGYMErlYrG5Dk
	3L7+eUhSCR4L8bT3LiludLshhesEDVeSDHrt1M9Ck9UAcHir4sKrNV4Y+qIY7FG33zaQo3LFwo1
	DJXxghx9dGfgrsB/5UZm86hMB06DCnguY1sQ6LmDw9nLwJf1IBer/waGC1t2WO199i5XHE2wMxM
	w4UWIG7+iIFIvv5UvmK48Rs7aCsydyK5VyNHW2CFT3sSlQwkSEkxecvp50ENYXfM0x
X-Received: by 2002:a17:907:e0c9:20b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c468b87de82mr18142066b.20.1792601498828;
        Wed, 21 Oct 2026 09:51:38 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.223.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5de48esm20782466b.66.2026.10.21.09.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:51:38 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:51:36 +0200
Message-ID: <20261021165138.388593-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_095141_246394_115C9598 
X-CRM114-Status: UNSURE (   9.58  )
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


