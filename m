Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17D8C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 05:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COFBXMHPskIsoIit0YmVND2fstaviJl+t/pdbf0Dt6Q=; b=CwYB8rgH9H9AgIZissSLNqb07r
	OZ1bsCcVdE8urjKd+UVTZcIoumuQ3R0uNA2uX48lC6Np9ZVNZlutiJHHUtoTEJ36B1bDYpVzAmYSL
	oagcgGzRRfRDVOPaslGH18/r5GTlG9s8wTcN0xsuWGynhHzRZUxoiqs+DUFfvhSYwfpnn3jLEaB6k
	nqM2xUZhvNogsc9QSX8YJxC7nWzohdzuLfB+sEQIAQgTL8r33a8JXH0wqDK2fGw9n238lz3aXlOmu
	LxN77E4Nar10HAdeCOumjMxWaU4EJR57JGfpt+z2b7N+QyTt6LVYV4zAxjlCSh/f61BWDr1iMitZ6
	13Mf34hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnar-0000000G0qE-2aKT
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 05:34:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnap-0000000G0pT-1zJc
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 05:34:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-220d28c215eso79736145ad.1
        for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 21:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740461694; x=1741066494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=COFBXMHPskIsoIit0YmVND2fstaviJl+t/pdbf0Dt6Q=;
        b=RnY8AwaVesbgnMcwjMrxC4WsZpRG3iCP4c8eItnbCNikm8sd+/Sf5uRUkeVkA5T+KT
         6fjQaTd9MlLGPZkf+Keq+Y86zTrDkncMyNs3O9NnGzzgbaRFHcWTMjki/8lS0j7gXEMh
         pbbu39PhPWjtkxVa7SHOZ7PrYI6dJUoScawj+NGBetvAlFITpki0RehO/h+bfnZ4pp5g
         0Gg2IDwjT/K78KptAMaU93Q5fHe9C+YYbjDhdlXo6Kh+FzduWF1TE+dX3Om8mZuWA2WQ
         V7ZRNr8jHyZkhXDtUMRS6qrBFxpUgR9ERpdgC3SRFNpTxDRT3y9A7NdaqLNjzz1DPb91
         aAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740461695; x=1741066495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COFBXMHPskIsoIit0YmVND2fstaviJl+t/pdbf0Dt6Q=;
        b=X9vdNuxNPCGZbm3juLrb8nFoJ0g3I+kvUxoiEyADOV646nazbZ1A55oxDTmMtK3wvZ
         4MByGbL7Odj+Z5bVdgR39+z1GIhzUCAQ5KeDEgT9lB5m0SDYrGvIF2mM3YWWdciYPgS0
         7D+WGdH4JPHfCyv26lZDJBVNxp8hAwmquGeasBVJq9qNOuZhR/KmVj+Cdtse/pPMgJnQ
         s+OwAwzksV7X5zMFpN5YpCRPQ7Z3aQfKysaXgiQ8dejRQYyOomOZ3shrfyLa/KysQR+3
         x4dvC8fwDgN7EpQkgqODGjru1sDxJDjv+LJKnbYiTCnpDqhk0gn1H6wP3DsAHXD0Wl1u
         KUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVog+/9eJ7QAkMtk/iu/F96TZyjnx3rsnoj2owep7Jz/Q3OiRwZ84/AndN1X82emXv4MVJ1Go=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmJSyZJKcwI9/R2x/KnrOYQzmVtI0PmsOwH16rQMhHgDpHZAo/
	qQubV+backebY3DRpEpzKEqysldcOLmLZSrfA2TwA+ZDW/iO8xNfRYs7AT3Rsw==
X-Gm-Gg: ASbGncuLIDWK3C2XCd4TB+oH94H9uxijuPpIejFtZ4YGbn/t3F8Ovs4U2/wfU9eVERI
	ghxNX6jub2yNODovMxzEqJId7M2q8AnBTSdj82LbNPTfpuDSfHnwv/z8eJ61JkwofdLkl1eu1zq
	Xsi3tOK+3CCtk5t80cD2qq1pY1svcIkhnQjl8JdN1bDra3f4A7A0gHlmHLGoYA3Ps9xv3JFwR+a
	JYYVSAKJ22xlCXrTV9qhsuErcyCBY/XSzH36AEQhbwOYoCFP+lPyT2f5qxAjhjMnRk6x1kHWbf9
	L/Q34XcsVeXaKk7Dbybyip7MqT7A4ZB3m8HLH0bdR0pZSs8NeFFB/Q==
X-Google-Smtp-Source: AGHT+IEcKJ/dXx95j55XEtJ2Yr2v+/ULOkI6H8gKJVMhyZk/j4JRz3SW0id9uRnQMpLfQLa1g1/udg==
X-Received: by 2002:a05:6a00:228c:b0:730:8ad5:90c1 with SMTP id d2e1a72fcca58-73479101286mr3756467b3a.14.1740461694618;
        Mon, 24 Feb 2025 21:34:54 -0800 (PST)
Received: from localhost.localdomain ([36.255.17.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9af3sm582101b3a.110.2025.02.24.21.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 21:34:54 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/3] wifi: ath11k/ath12k: IRQ affinity fixes
Date: Tue, 25 Feb 2025 11:04:44 +0530
Message-Id: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_213455_524558_EF045D48 
X-CRM114-Status: GOOD (  10.12  )
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

Hi,

This series fixes a warning from kernel IRQ core that gets triggered in the
error path of QCA6390 probe. While fixing that I also noticed the same issue in
the ath12k driver, so added an untested patch for the same.

Finally, updated the irq_set_affinity_hint() API in both drivers as it was
deprecated.

- Mani

Changes in v2:

- Instead of moving the affinity setting, cleared the affinity hint in the error
  path before freeing the IRQs
- Rebased on top of v6.14-rc1

Manivannan Sadhasivam (3):
  wifi: ath11k: Clear affinity hint before calling
    ath11k_pcic_free_irq() in error path
  wifi: ath12k: Clear affinity hint before calling ath12k_pci_free_irq()
    in error path
  wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with
    irq_set_affinity_and_hint()

 drivers/net/wireless/ath/ath11k/pci.c | 4 +++-
 drivers/net/wireless/ath/ath12k/pci.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1


