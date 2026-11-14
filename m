Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3A2606A8BB
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 22:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9f9wftW;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=FdyoCdLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=; b=t9f9wftW1Pzka9
	gCNzG5PedXPlbVEFDCt/E+b+NA0SRaRjAh+JVMgQYW0zD+hJCJ+IZaJWzYn8zTVDTOVkuajrQNPqv
	ZnDLQJMcmP3WnE9bxKsenuPIEHVIJAnyU4017EULBVnrRj8U4P4GXD9jW62xoaISr1inxlnRuSILF
	vUTFiytIA+2KbCzDmlGzPmkjWtfRpjDpgLR+n9Mztt2gJtmGvXCaVpoLXBrIITwKlpWluOEtLlxsJ
	zifH9HUxgYkl7fAS9N+EGhxf5DZ0LodaXqcpjpg3KhTOBCsjWGyAur3geJsTnxK6RAOtH2wbhgvfr
	hqILli3Li/D08kUceFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7P-0000000GpTo-3d6q;
	Sat, 14 Nov 2026 22:21:07 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7M-0000000GpRV-3rub
	for ath12k@lists.infradead.org;
	Sat, 14 Nov 2026 22:21:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so167503266b.1
        for <ath12k@lists.infradead.org>; Sat, 14 Nov 2026 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694863; x=1795299663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
        b=FdyoCdLOFhDKRm85QtNs2UzyPR9E4hn/1GtXSS2z2SAEWmFtUm0+eAP080972RmOLo
         6kIdt3VDwP+uckmcFWycoDTh48jh79rAO/aVOzUig4CLUUk9YT8uemsrmr4fArEDLOcf
         67c6IksnmJNBEJeE8afK9LuonzmvjNo/boteY8e2vLvIoSDS3d1agofTlHdeisYeeqMH
         exbO3MwUHltWwxUTy3UYdSKoMKlIpC3C5xZhokfqUJNBgIaJ2Qidcoa4NdIe2v9vzFPN
         r017CwasrKO8BIMjOmGsi9lXpe54XhfE1Jyd9cqtqirseo7qJB7o4qDRsGoYtdqKAG8+
         /uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694863; x=1795299663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
        b=lJXWdDfn/4zZEOqmb9fucNhlNui6wGpIQLjcoFP2Iic5/9r7DaISehem/eyB6ZGayk
         DJSnMu1bFqX6bAmN6X0FwfQcUHENQkPjrZ2fw8W4blD82ebVPwnrfgOUImsampfd4hM/
         jaXiMMig3b/0ZhIz0XVjiWYC0PjMC1WqCFTEPFuUGzS1l7jQngdeKFpvD2sq+lnhxkcD
         glLGauh44HdQCMvbIClqe5aFLnu1a8odG771eCMf5zJ1HT1pl0YJzEwDHkYOjPGpJkMb
         QVvZPSogWXT0gHpHBtac5vZghFdCv+KV8VTBnhvD6HhUlqoPS4vf3+7hcX12PxiKKPim
         53SQ==
X-Forwarded-Encrypted: i=1; AL+hErFqE6cTmUNzm7LeyyYD0JyO2OUn2t+iH8NVvbQEKvR9G/Rt6CdYAu0DMiZ9GOnawHxIrTl5XXs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+VFHMpR8vHcJSK8Q4lWUBcvoFNs4E6hLrk/f67xMLP5ORYfsT0
	NV2+JqJToGiQkqo5SV0znKjzS/Mk+PSmn8tAi32pT+vpw858GAcakBKC75lm4zpPug==
X-Gm-Gg: AYBFou29hBAG0WN3E/p418vBp5Dq4M0HDTgR6VXK9tZk8Mbs3HRje4w9io5oSrigcNy
	wobp/WMENn40tK48oCbAzUDbYbQtPeHSV+jVvnRljkQCpxtZfrku7Ba2LT/IBoVWeDlJI1TGMbe
	YXO/yQq3rLP4eX3PNfD8wcyYDdJfC6wa1JFACWdrYdffrC/U1F9XbcVWDRkJY7kqTc/6ule4+Ph
	gNjEyumy9zK7ePuLKFxGFcNsXQm/+ugKY7P0sA0eKmBZb9FE+n5xgkTqcG3pRdhZJWaG6eqUg7Q
	mbklb/csruXnvgFR1fifnKV/lY0DC8cPciW6bV40Y8EGtAO9gL7JucUUddwjaN2emJwMQczFlGu
	/qR+71yk88FDjfQ0hNPzLQZ9o0zFRVdNuKqqUBhrWQa2dLRIDaSJ3buXQNerZdEOboykWKEXyl+
	bGsjn4g+05fi/ER4qa4DPpi0ers6KZ2DrTB8SBgy01gEEDGG3Y5qUrYG09g1tYECLDathp7mcIr
	T535DXGreoNOYKwaDwAkJc2PqU0c0weYL52/aQFoqn5dHUTKWxaiBsZwq5z+bHb8TgEGniPoUyC
	l2BVwEdc6MWXIHJ0IoQaEBeQbx5X37AzDNsYdyA4Fk7ceT2YpmyWs2LytKJA33RXL3UIs50Rjgc
	CJoSzQnYib9Z2IcP5ujGF125nuWtMYuGyNpHQ863tO+kil3o69OfdgHdhSL1g9UT7fPlKUkPsyZ
	QynZ519QHB4z3sIl9OtfImAAcXFWmF9odbEKw2g9x14XKdyHNpnQ+CqR5kL5jHf/7rPkt1XaiK5
	6yIT/FYB4BL5xWRlW/AMEpW9/TtKWmc5fH5g/PkGdwF9wqr1KD6MfyWAF5t+4H6CoCEoMEJXa3w
	+EI2X1eHYVvFX/W/pBW55m3LNBSMO8uJMHyMJ3otT2HCrg9yoBE1gK8yEp1EWAxC
X-Received: by 2002:a17:907:a909:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c50963777b8mr508487166b.11.1794694862973;
        Sat, 14 Nov 2026 14:21:02 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:57 +0100
Message-ID: <20261114222058.184034-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114222058.184034-1-julius@bairaktaris.de>
References: <20261114222058.184034-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_142104_976861_96C804FE 
X-CRM114-Status: GOOD (  14.34  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k requests the optional firmware-2.bin with
firmware_request_nowarn() and uses API 1 when the request fails.
firmware_request_nowarn() only silences the kernel's warning. It does
not set FW_OPT_NOFALLBACK_SYSFS, so with
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y, as OpenWrt sets, the lookup of
a missing file falls back to sysfs and sends a firmware uevent. OpenWrt's
procd hotplug handler answers it and logs "Could not find firmware
/lib/firmware/ath11k/IPQ8074/hw2.0/firmware-2.bin: No such file or
directory" each time the driver loads on an IPQ8074 device that ships no
firmware-2.bin.

Request the file with request_firmware_direct(), which sets
FW_OPT_NOFALLBACK_SYSFS, so a missing file is not passed to user space.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Closes: https://github.com/openwrt/openwrt/issues/24743
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- target ath-next in the subject
- name the code path that produces the message and why request_firmware_direct() avoids it
- drop the Assisted-by trailer
- rebased on ath-next 1be6c8d3027d, no code change
- new 2/2: ath12k has the same pattern (Rameshkumar Sundaram's request to fix ath12k alongside ath11k)

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index ef1b4c81843a..88ec2ffd9f00 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -16,10 +16,12 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
 	struct ath11k_fw_ie *hdr;
 	const u8 *data;
 	__le32 *timestamp;
+	char path[100];
 
-	ab->fw.fw = ath11k_core_firmware_request(ab, name);
-	if (IS_ERR(ab->fw.fw)) {
-		ret = PTR_ERR(ab->fw.fw);
+	ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
+
+	ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
+	if (ret) {
 		ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
 		ab->fw.fw = NULL;
 		return ret;
-- 
2.53.0


