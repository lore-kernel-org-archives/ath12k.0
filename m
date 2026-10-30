Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153C5606A325
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 22:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kdIyjB45;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWqe0RDS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3PupxROefZP66Lbc6uSw6pabAOiXrtuAPfPVHNPe6jA=; b=kdIyjB45ctEYMteBrCOLT2dmO5
	LT87IDtEkfZKaVdFyk3e7hwySfKHvf6tjqo1Q08iMYmU/4z9VZsgBHG8pQWHDSLijd2waEbC0RqX6
	3I+AOVNh5zQJ3kubUVfIR9iaY/MGNFlbcrHUJXu3gjZUcFkRIrucUs6iIcu1Ol5xtmk85uo7ZjWEs
	p+/yfil+R913frB+HbHnCUg5IN8/q8urue/hwHwc0AJvYmSxMWHx1KCCR0e2dijo/2Aj/QIzlOTmF
	LhXcm9z4AHBV6gE3HGfNf7SDRIDB6Y76wpWK91FoxKdbzC20DqPIQepyLY3OTyYEeVTraUsOQUpYD
	y696YGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMum7-0000000Cf31-2JJ0;
	Fri, 30 Oct 2026 22:08:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMum2-0000000Cf2h-3rCh
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 22:08:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so7841665e9.2
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398112; x=1794002912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PupxROefZP66Lbc6uSw6pabAOiXrtuAPfPVHNPe6jA=;
        b=YWqe0RDS46cnJrzJbscKpto5nic8TPl87bfV9IopM+NpHyzdqpwhEkVTAAQGmoLDHM
         te2zbrdk1XLa9N6zUT0RPZXb1h+Q/2HfCo/vyzdaX80LVT6wY6PNK93M/37qnBBb83lB
         EdtDFUmFVjUEAsGgGuTyud4Ac8d7AzIit0tvUZb6uxGIxU2TuZRZJDklmohlKGWCb22V
         BXqBVA48/3S5+c3W4/CdW393ydBHik7TxM9DWdPLGOamFV9G26a8xrJwXk2EZ2brOJDB
         LfjBIrK8NJgxu33pkDCkUgact0TPz7bIImxup6/PAf8RpTwJfVzxCT0ObUi7/gnFrMB1
         E+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398112; x=1794002912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PupxROefZP66Lbc6uSw6pabAOiXrtuAPfPVHNPe6jA=;
        b=S3ZUcWgp3VTk3/Bi1QcTWAMNfEHRHvIsU3W5hKIekoWj63kLHZvgsJYHkpYEhGwubP
         3x/eNbLOIN1/N9z+4HxEYucDegoeMGVZsiVxmtY1C4eX5SUtMxXgKfs0jXvfiWnZBaB3
         K2k0752CAUA4rYWy4s/FXTEZ1Xr0OLn3p+qnDu9CzCtRFMa4LPXOYuqRIAdjKOPUiQw3
         XOTYj3hUnD21mS/1oBURkdSRfwmCG1/Kzt0WWOxECcfrnehC6hUgYDpNXdXEDSM6l8WR
         vmeS2r9YTXEdRzkjSrcfmO7UQEHhtR6WwpXZnYypRvs2D8IAaIroAvYbpYyF8PQE5KtK
         3k9w==
X-Forwarded-Encrypted: i=1; AKwUvBwdQsYHN8I0n1iZMKSsBHs3ZpX5tdUV4aMKetRaTPXcfEk+UwGPszlCUHxnAZLwFUNS0k6/92Q=@lists.infradead.org
X-Gm-Message-State: AFq9FYKgzW9SSCq2VVFklMLBtkHLpaT8FxdSMUoTTGDX2jaTpZt1hghx
	VHeM+C6NStncTYilS/xq0snIcDvgm/SXXtG/zWqrp+2z37KgmRKqOlZO
X-Gm-Gg: AYBFou1Sq6DXPZE5QVKO9TtwR2RqlqO2pRCCxmNZwkZWy7jmoOAT8zG4ea46piaWEGK
	pGIMfYsFLS7eevscAQ3EgcwTW/Sz046Ya5SyXGD2E/hHlQJ5764TPOwWPUHqCW5eGh3I91g18G8
	DiEBH2P14QA/C7n6oXEZKTDN1yRsius8xA1Nz5MkiZuZtTuoqO3IRkL/o0Nqye6ZfVDrmgoDhdy
	o3rR+UP7ReNowWh/HFaKJ+dzwzL8uG4vvWbneIZ9rqIabYPXVmWaRmLgPl6hqZqV/WefBPFmQzV
	bfb7Z7Ae4h0+SYFr8LXYVI+8IYeJy+ZaQuisfDejIHCIn6gT8o8MpZoyVxNwUZ5LVCWm2SB3X2J
	PLGu2PFfwWjpLtD9YvR7ehxAPdzsjw7uNcvjE79Ar6ZgoFsHD3cC3Cjoxxr45PzE3xtnRLfQWVU
	zd054C+jbvjyehTvvyec3m3KbgNaEU+VpJtqFSHDsv6mVZdp5svHkJirB881UNdclxP2Meyi9Y9
	sjFcIhN8o+DOLBOIsVrLhAT+6zTfu/TPuGqHHZAlp+nVn0zdv3JXBxLbyazo8xHI5in6C1nAj5K
	dKUZpfDoKp4ei9f/xtUnn6J1s8tMbYvjWyLmNTAhdBOELO6oBNBLdBZIKWtPLL+/JYuAUXWTQ63
	0m9hYogtD1nroGPPwk+CQ87aiAzcXuJei9UaAEbui9ZzqCZn8E7C0Tw35pQ==
X-Received: by 2002:a05:600c:6387:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ac1904a81amr85938675e9.24.1793398111701;
        Fri, 30 Oct 2026 15:08:31 -0700 (PDT)
Received: from u1804.home.lan (152-43.dsl.iskon.hr. [89.164.152.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm56230305e9.0.2026.10.30.15.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:08:31 -0700 (PDT)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 0/3] wifi: ath12k: accept what newer QCN9274 firmware requests at boot
Date: Fri, 30 Oct 2026 23:08:21 +0100
Message-ID: <20261030220824.915760-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150835_969942_B4AE8401 
X-CRM114-Status: UNSURE (   9.62  )
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

With QCN9274 firmware WLAN.WBE.1.6-01243 (the newest in
ath12k-firmware) the driver logs three warnings at every boot:

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported
  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

The firmware is not at fault: it requests the AFC memory region
(QMI memory type 10) and advertises a direct buffer ring for CV
upload (module 2), both defined in Qualcomm's interface headers but
not yet known to the driver.

Patch 1 allocates the AFC region instead of answering with a NULL
address. Patch 2 makes the DMA ring capability parser skip unknown
module IDs instead of aborting the event, and fixes the zero-filled
entry a plain skip would leave. Patch 3 names modules 2 and 3.

The idea of patch 2 was posted earlier by Nazar Mokrynskyi:
https://lore.kernel.org/linux-wireless/20260505172415.566328-3-nazar@mokrynskyi.com/

Tested on a QCN9274 hw2.0 PCI board (single device, AP MLD on 5 GHz
and 2.4 GHz) with the series on top of v7.3.1: all three warnings are
gone, the device comes up with both links, and there is no firmware
crash, call trace or IOMMU fault.

Goran Sustek (3):
  wifi: ath12k: allocate the AFC memory region requested by firmware
  wifi: ath12k: skip unknown direct buffer ring module IDs
  wifi: ath12k: name direct buffer ring modules 2 and 3

 drivers/net/wireless/ath/ath12k/qmi.c |   17 +++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |    3 ++
 drivers/net/wireless/ath/ath12k/wmi.c |   43 +++++++++++++++++++++------------
 drivers/net/wireless/ath/ath12k/wmi.h |    2 ++
 4 files changed, 50 insertions(+), 15 deletions(-)


base-commit: 7b14c8f4a9615579b09cbcdc4515b65ae6124753
--
2.47.0

