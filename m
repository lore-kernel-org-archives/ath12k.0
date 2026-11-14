Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BDA606A332
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 22:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=if1nh9yb;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hwKXieMr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=; b=if1nh9ybCbCz8Vdra+hunDKTQp
	IaVlO0nCNCqAoMe917K/EdSmifGTHkU2GGexdyvG1ekkdb//LmG+I6VCKsBfIPRVRBursBWoYl/rE
	QlE1/ldGWq6BTz8YvY/zmAy3qeSwFobsy7Aw/ae2s96R1Ih9VJZzp+ONXgcMXMqw4+18aOg6YKU4j
	qNaQbbemLSbGrYut3nAw0tCuIWRFtmb5RngSNKDnyOyqbUxba54S05RaLvrp3cLzV0K7mDMY3Ktde
	y/OPlDHRBSXle6ylhOIBeMeTqNbroQsy7qxP/3fBWi8knsTRQC8zWC9uT9j/225sc9guJNYucSwZR
	HI1lGzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7N-0000000GpSI-30rO;
	Sat, 14 Nov 2026 22:21:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7K-0000000GpR1-3hru
	for ath12k@lists.infradead.org;
	Sat, 14 Nov 2026 22:21:04 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3986298a12.1
        for <ath12k@lists.infradead.org>; Sat, 14 Nov 2026 14:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694861; x=1795299661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
        b=hwKXieMrojwK/iXAOyU/bsBziJ7OHAf/sMGAmdxgX1b9yOA5Kcccdk8h2DryjoRF+B
         g0GopCXfXeEVYjxCHBMK+adKyb9FJx9UR9JZUASd+j8rpTgjJwUHYe3N0UNtWqm86+cR
         H+JeYZs02ccLOJv2Bnb4bvoj6WM5ufCgKr3mNPVdTw/O74stQ9UXD/r2wRg6nr4vulhj
         IfwiFdE/txvWhP5R4t8fDiEf3Tz0yCEkq2XtiiB/nKQSYc4iLtgMTLEz1Pry0XMlRXOY
         RnyidCdj+BsGLLmhqhNoHnCRCGNDm87oznKH7tQPJjkGfl40NwapRqKlwLDFK5HlZW2S
         iBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694861; x=1795299661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
        b=QT882zEatcJ8OVQW4wop6BS+o6p60FLJsEPma0WKchJrxUpek4hPeuf4yCLPylzjRP
         YCY/cbd/e0KuqX3NYd3wPOQRkocp8W+xIxZQO3Pc5Bw1z62/eQAFD738umeTg2G2w5GZ
         MMlqMkDehau0G2bdnVDkjLUV0hCpw4RtqYX87N9hnqpVN/RFPEz9hbvYrLNMteTOBI64
         DaIhVjZGCMu0rxRQP2Sntg5xVR5bv+3AsxYPuFqAYpV8fLqtJ1hpJ6fepLMRl+tOBMbx
         QSJ/YiyoqammdiRbEFVl0DsoP2fSVlydM3YiILo0znxwohWqQqiEPyO5q8FjFpCcwFHS
         /oXw==
X-Forwarded-Encrypted: i=1; AL+hErGeiDqsodbPcglY/tZ+/34KwDZIvzF1NU3noNYjn/MKz8QePeEgylAnq/rfPQg4x/x8nOdkLAo=@lists.infradead.org
X-Gm-Message-State: APuU4Z/SROrX+M7+XVYUgG87dF30p77RYzU8hinK7+FFI+cRKANpGNCk
	Y+Opv/qqfw4mNgNXDUbzY5KpG5nzQbsB43JHmUA2yZLL08Dr3K8zppH1MT5wxvy8rw==
X-Gm-Gg: AYBFou3jDx69Vm/BbG6AyVSAz72CK9HO5SN1RJUeuD9a8rHI7zfl6O0pc2ysyxqn6RW
	6KWECHxPtKYSuWEXMCOyDTgJZ5/exgCQQXSZQYaSVaL6dvgiisUXVLrTWudT53CB7bpThSW7uNg
	cukfdsyPaUOsaQCNtDlhGUVTzDyrQSubpSgh1DeJJXnCinb48zPwTAGuCZY0kgd0PmJfdziqUnv
	Ss3zHwQUzeRiZDlhdQuDsXSl1NZZG2PzHKz6FRYftmKGp9jkE5LS/WSuSMdAnUcCvI7ziBTh+p3
	7zlMtLf99CAfVd8znNFPKtSpRycE+nU08cvUmbIoXbvEJFvSj+/GC2N+7fykYuIXBnFbJKu43UZ
	dyPbeumg3w+wVKfKTJYZu17gGepOPZP1ebseJvihR3zVQl1HGTXYs5Qm7IXi7y4Gp15PojP6t/i
	nAA7KDwFEizNVan1WN7R0xhrrWp7fpibQP1mMWcA8VPe4uvVadltZe0/TICq2g72y3sgzUtevSS
	VfQnF/pD+y8h2Crwm+PLBwDMCfNMtndUh8UOk/+hVzLriFJL+H1StMu9repsCQW23wEKhVIsik7
	XEpnNOlloc5K+8gqxEiWoOrCHEJ8vIKUsRiQMr8JHZGUB9lANaTBgN1+GzM9r/CtTQ8rad1fVuM
	zhsRxrqeRA5bl7poDYIkmP0tX5tBqlNHXIGilYmqVLOBf2ZENKYqNusvRyN8P97QKVHsX7Y4wYB
	GVLjaay6M/e9VnHIIfaUv/z+izNKyZaG8uVvb7RAJToI6gEprtLkJPqmDCqan2rp+3wrebT9fsl
	O0ubY1h1wI4vDg5HmDoAAMvnyJSW1k1CpczkmskmovYr8tVV5wSoh057Ip+A1taIK/GzEasrKjA
	W2nHfDaPGY/wzEnpkKv5MTRys0rMjBFqJwzOQrrSqLJVdxyQnBHrG89cVqvLiY1t
X-Received: by 2002:a17:906:5146:10b0:c46:645f:cedf with SMTP id a640c23a62f3a-c5096398ad5mr419322766b.15.1794694860698;
        Sat, 14 Nov 2026 14:21:00 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:00 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 0/2] wifi: ath11k, ath12k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:56 +0100
Message-ID: <20261114222058.184034-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_142102_948920_C3DFD468 
X-CRM114-Status: UNSURE (   8.80  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k and ath12k request the optional firmware-2.bin with
firmware_request_nowarn(), which silences the kernel's warning but still
lets a missing file fall back to sysfs when
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y. User space then gets a firmware
uevent and OpenWrt's procd hotplug handler logs "Could not find firmware
.../firmware-2.bin" each time ath11k loads on an IPQ8074 device that
ships no such file.

1/2 requests firmware-2.bin with request_firmware_direct() in ath11k,
2/2 does the same in ath12k.

Tested with W=1 builds of ath11k and ath12k. On an IPQ8074 AX3600 with
no firmware-2.bin, 3 reloads of the unpatched ath11k module logged 3
"Could not find firmware" lines. One reload with 1/2 applied logged
none, both radios came up on API 1 with WLAN.HK.2.12-01460 and dmesg
showed no warnings.

v2:
- add 2/2 for ath12k
- drop the Assisted-by trailer, target ath-next in the subject
- see the patches for the rest

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath11k: request firmware-2.bin directly
  wifi: ath12k: request firmware-2.bin directly

 drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
 drivers/net/wireless/ath/ath12k/fw.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0


