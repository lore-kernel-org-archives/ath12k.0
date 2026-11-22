Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B372606A683
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SBx/qiDh;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TiwVDmuM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=; b=SBx/qiDhODpBcHpGP5o1/VtgY4
	VAdj07FCnTdpNzsTwaRYE2wRtPToxKeSfocjhdjOoFSwqB1f90H9xGXUGR4mX7HKttfrguaeL8yri
	Bp9bpsw9RnhzZ3DX33/HM4iSOm0gOTkzGHI4jk7GHRmoQXNpb2/OHd/FJ9wRWhEXrqZw/bwYThmuc
	l9MITPSW48hUJkGQQ+zJ75nkM/FyGvbl3KTDKfxTkaVBVdOq9s94+IVdEHp2ivYgOMdBGBlG5XlCt
	dMorbksnyug79mHgxYSKdT+3ZPKeC+ZfaygfgSYcBFBA6TgLCqWfKeJzb1ocEZgbZeJVjQavFjtbS
	Vbspw/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7py-000000019Yl-1NDx;
	Sun, 22 Nov 2026 13:42:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7pt-000000019Ug-1C12
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 13:42:32 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c5127c7abd5so398292766b.3
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 05:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354947; x=1795959747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
        b=TiwVDmuMNhQ0yZYz0KAFj2qRvewkN6gHsSQZk0vBERfNbZo08MxA1uNrjJ/48v6g3n
         V+Tb3vRT/z05IZTDWeHE/L73HNBruzK8pNNApGicioFgf9PPwbAg8udbHK4rUGSJZUZK
         Dt7zHR824YYPiodaKk/cfCEVimkgiZ3iRlnAnNdIpFfkteUBEGP6C1DXBb0xS2VraCMr
         Z2A7mVzgHpLvCY4s6dttyLQ/++1u0w7QwQkKuzmUZeOfVpho0KHkZbEZFxM8tK0IFzIt
         Q6y5cty4FFpy5yhZY5Rg0geDmcpg4HZIfqIdh4LFkknRGEQVCPlPjoi+U8wiyuona3X9
         uR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354947; x=1795959747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
        b=Cyukh/JPWgsN4l70lggv1pN9kGrJsZgGx5HBIdyKo1D1aw63IT++r4FNQp856x1GKM
         9gFRAOPb5ndS1tCUE8YvOHtuweugZifxuET9jC+xmZJKgYYTtbk5wDc07k+1GIVgZua6
         zZhwWRqj2XQXDxRqRhv4x7QdzlDGYJqfrcKgqio229d6jvM7nNaKYJXvGHrDwu9T0qk9
         5j+P/3Vv2FsOEZkocUxer5m5vw+uziXHrNiDhv+cUbxtfrFM10u1bCZU/2jS5PK/gDYR
         9Lx0/wU5V153xOrAkXArNTYyEBFnmDb+C+ABPqFtIGJ94XoQVgRenbJnO5UHEL1FgDH4
         YydA==
X-Forwarded-Encrypted: i=1; AL+hErHptYfTr+N+iLz/uob5LJGXC8xphCgKK3d1z1wkAUpl9aQXgOJZXVibF/Hl2BWOLwi8gmukR7E=@lists.infradead.org
X-Gm-Message-State: APuU4Z95UOiUvMv85Qbjr/wcpTG3Y5dJZc/e2GAJrAtaYTjMQ6lSplLM
	3JZ/R1GFLF1XgVgaZPglph6+UDy0ukk02J3XGIqnOIaCsLOqt/RjiYs2H9GmbNe1eQ==
X-Gm-Gg: AZFdTZdQkHwITgPRu8dv4x0Wuy+GIXaploFkmcpUld2XsgDX7EW4zNv8VPtYKq6cmAH
	gTdvB61b5KAb0It758dUDWwZ2XsWHdxLs3utVP5rzThnAg4f7mqs5LbN4Ib3K4QRhRNlS3RpQHO
	zomxKTsHTMdI6whazq6av2WeK13ewNCWxFrnBm4I/NZLAfJ5bqolnlvQFEbYfhmlv0voO0WmVSZ
	VNywiKGM0o/zmmrBsd8VDS2WgvgrwaWaWs64lYEVV/GJFKrJrk0cXV8JvZ0SgQfXs8RIg2rW+DE
	ANfRGoheA6x2uCX11KZ/O+/93MA41xncwF3hQayb98NUtA+xegq5NI2DlbQNLq1gX2MAAH0x9Fr
	T1/z6q7S58x4GUYO0gjk4ZvT4WjnPAj0uHFvg3a9R7qPn7R01uy9G+NIg9YkvH98H+ujDIxK/d8
	inpJKElRb7oFVZ76WmOwGTcEOdyFwC0fn+V58NpYZDKchWZzo9pPcGZf88UPBNmN4ZXB+SYv2+v
	1C77IbBRK5Y+Ph27nWEETSLtapJG2bI4zSt57pDwntvqtmp1mIfZNX/mg8A4hxUSHvX9sYIl5Hq
	MQ1PpQrMHLk7ng5exNgJ8GEgVpm3GkSnDYIVVEXKP6q+RGRfJ3j2UkzR9HBdwKe8DP3uxGxV/P0
	AALZfyNLu6Uzwa81jFjLT8/gI48VA7dM+KlVBpb0yqRcP655cbSN8ydF4HE2Dq8Zwj6ahQUaycU
	H69Q0iC4C9lp+P1DcCjBxHDdl4cCrSpjsQYqeivCgPOJ/7BH/tjf6wbNhVpOws0XLkJ4gy16WgM
	0RiFWh13jyGQnFOpL96SwREOzq+ix670/It3GbMBUemMlmPzsyHidmeP6la4r4qKS0JgK3PQZDi
	u4iicz2EziqyUr8HY1oVGQoA9DEfb9AFr8OfgG2Pf1dnr9zstfQ7F5M=
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c513aabb216mr555094366b.40.1795354947374;
        Sun, 22 Nov 2026 05:42:27 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:26 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/4] wifi: mac80211: TSO and SG for encap offload, and the TID of 802.3 RX frames
Date: Sun, 22 Nov 2026 14:42:24 +0100
Message-ID: <20261122134228.956044-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_054229_346734_3086AFF6 
X-CRM114-Status: UNSURE (   9.33  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 1 lets a driver offer TSO and scatter-gather on the netdevs that
send with 802.3 encap offload, without offering them on the 802.11
path. ath11k uses it on IPQ8074 in a series for ath-next that lets the
TCL segment TCP batches, which depends on this patch.

Patches 2 to 4 count frames received in 802.3 format on their TID: the
802.3 receive path counted all of them on TID 0. Patch 2 adds the field,
3 and 4 fill it in ath11k and ath12k.

Patches 1 to 3 ran on a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.12-01460) as part of OpenWrt's 6.18 kernel with wireless
backports 7.2, as an AP with Ethernet encap and decap.

I used Claude (Anthropic) to help write these patches.
I have reviewed the commit messages and the cover letter myself and
edited them where needed.

Julius Bairaktaris (4):
  wifi: mac80211: advertise TSO and SG for encap offloaded frames
  wifi: mac80211: take the TID of an 802.3 frame from the driver
  wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
  wifi: ath12k: pass the TID of a received 802.3 frame to mac80211

 drivers/net/wireless/ath/ath11k/dp_rx.c |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  1 +
 include/net/mac80211.h                  | 19 +++++++++
 net/mac80211/iface.c                    | 14 +++++++
 net/mac80211/main.c                     |  3 +-
 net/mac80211/rx.c                       |  3 ++
 net/mac80211/tx.c                       | 53 ++++++++++++++++++++++++-
 7 files changed, 91 insertions(+), 3 deletions(-)


base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0


