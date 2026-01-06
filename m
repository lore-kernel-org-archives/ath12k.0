Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D4AC47BC5
	for <ath12k@archiver.kernel.org>; Tue,  6 Jan 2026 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hV/GMcvRyLCr7DUYxLRLYti8UWuf7naTwJHZtiyzU+M=; b=BJBGlI+Z1CHsymuQoIMqOIhM/5
	kKvCpWWnKjcydBo/LRVWyqJ2RuKmYNZ4LZyvOjzYiBP77TW1BkS9HfI8k6i7cz4Uxjfg+Yq3oDD0B
	N8LFQpzZJ/UEVe5Km7L9Y3ZVdwNd3PelRX9BSNMkwFe/YfaXpQoPXfkYumtKvtTRJm2KC9e2P4bPS
	pHHLipAeJcVP08rWaRc8PuLrUM/P3ou1Yxej0ztpkNixkBHIyM65EzcEEnDHgSdA1w8BNe6G3lAzD
	rCREhINmFJVJo9pR/07zSM1yDfoLUbgFxvJOiuipz5/VC/NLjEjaHEgGWNwAb36ts375mQwiogxOR
	H4gwwWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2lW-0000000Cddv-3hzr;
	Tue, 06 Jan 2026 08:50:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2lU-0000000CddL-28x5
	for ath12k@lists.infradead.org;
	Tue, 06 Jan 2026 08:50:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779b49d724so1105495e9.0
        for <ath12k@lists.infradead.org>; Tue, 06 Jan 2026 00:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767689406; x=1768294206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hV/GMcvRyLCr7DUYxLRLYti8UWuf7naTwJHZtiyzU+M=;
        b=IejOyuv/V7SckfMHcEANTRahlxrrjxFnkM381xkZ2L8jtU5eUjwb75OoLEuWZkVjQH
         D7svVXKzARkIGoJtudx6YQP6V8fh8nvAb7+9/1auto1U92IykwRDvA2S8wiHfdeDY+yv
         rIPOr3jMdNZZi9IoQs6gSoAZHmO9/jKHVjppxD2xvqEfh1OQTq33GRojiO3J6DcoYKbR
         9aPTBjlDDox/gbw+avtm2PegDgHilyXs+Rl5dgAQWm6fKUj0SSmrj6ZMJKih8UZdfbMe
         JX1ipo8Gcq5BAUScVi5XJaOV30tprqh/xum/9dGYrdgqSzr6rwk+SwQ9B7DymAgDSO0F
         GcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689406; x=1768294206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV/GMcvRyLCr7DUYxLRLYti8UWuf7naTwJHZtiyzU+M=;
        b=I8+KAdfpeNIuXidL7x5GmSsX17ZqcO0gYrTU0gtRTu6sz9hPtGeJEbsRGUbbGY4/Vk
         ggMAEuzmWE54FONb2KDzk1eTZe90RAPCTutv1Y5o/fQnyCmNJh21EahMxYnXNT4IowLr
         4+Xk8ZQLaEDp3mZfaTR8Xtmq3AyLTTO0CaapgLZgj6o8vqVm9blgxfKR9S4qN3vKXKzr
         p6gxFnBEn1GbeitBbc0c5DaVWXe79soSe94UXaCaJZKLE2DvKEJIwEBbJMPFzYbkw2Gm
         kKCtPH7uVoeSUsfmLAT0C4UD6VVfK1lFzNAK7xgnz1J12V7adgefPuOd6nlDz5NWMH9K
         bceQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJWJvXUMFtgxqUEfdMWBAMWWpl1HebJgEsAxGoFoPZMOHJoQQaVzXWAYa3h/Vf4hKVuFqun4M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVdpJsUECP6gzzOfCn5UiC7/q7ff+b0qBaWneLHjlJZLzNHtXV
	OVJ7IXlcBJYgQ8lQXJt3EC4nwCzdyNdex7Mx3NUKC6pODVrfa4bs8jRq
X-Gm-Gg: AY/fxX5Wnb4PZTuAw52cMXndsDzcyyuyPquUnMooWxkdMwEESFsDXnvW0sAz3jQwIr8
	U8BdUm3/+7cbeulWh1AFogxEzCFlwoqDXl6d/je6ujUojiW0yUJn2CSe+/diMLTn8QripBVu/Ox
	cK+n6Ct+HPbtbGaThcmIZqHghi40JWAznhDJ1JYZQHZjNw+udo6GUdCk5yubWZhk6PEgjenUr5x
	M8Q8yAJbu6S8BUlMWvVLiOfGaL6wNwHLTDjIj3Lgus+U5FaJz3SWZ1SQwr5spI2wv6qjqLyXlXG
	uVpWhuozNZKQ7x69tqEE7MpLO6WarKT/92QKwIl1g30a636zyBh0CI8k32WyifT/2WQ7r+uEKCD
	oUy2dY/R8lSL1K1Z6dD4GkVyoFo6n+IWnCcf6cti6vYbveJh4lmXsBDkBtVnMzaV11IeDEyIHYA
	aRM1vtxTJpKGk6mL0O4vrk0nwbFVPbTzGppC1/wOngumY/CqdosE1WmUNb+g9U90muximxq320T
	8L0OEA=
X-Google-Smtp-Source: AGHT+IEbVRYctNc4A+yz5Gyy1tMc8wt0TvOceywuKntqSSYPrKkT3maN7meDceSemXFvcHnWFEclrQ==
X-Received: by 2002:a05:600c:138b:b0:475:d7b8:8505 with SMTP id 5b1f17b1804b1-47d7f0a86f9mr14273175e9.7.1767689406312;
        Tue, 06 Jan 2026 00:50:06 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-215.paris.inria.fr. [128.93.83.215])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47d7fb35701sm12342695e9.11.2026.01.06.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:50:06 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sriram R <quic_srirrama@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] wifi: ath12k: fix dma_free_coherent() pointer
Date: Tue,  6 Jan 2026 09:49:04 +0100
Message-ID: <20260106084905.18622-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005008_563475_B371CB3D 
X-CRM114-Status: UNSURE (   9.80  )
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

dma_alloc_coherent() allocates a DMA mapped buffer and stores the
addresses in XXX_unaligned fields.  Those should be reused when freeing
the buffer rather than the aligned addresses.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/wireless/ath/ath12k/ce.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index 9a63608838ac..4aea58446838 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -984,8 +984,8 @@ void ath12k_ce_free_pipes(struct ath12k_base *ab)
 			dma_free_coherent(ab->dev,
 					  pipe->src_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
-					  pipe->src_ring->base_addr_owner_space,
-					  pipe->src_ring->base_addr_ce_space);
+					  pipe->src_ring->base_addr_owner_space_unaligned,
+					  pipe->src_ring->base_addr_ce_space_unaligned);
 			kfree(pipe->src_ring);
 			pipe->src_ring = NULL;
 		}
@@ -995,8 +995,8 @@ void ath12k_ce_free_pipes(struct ath12k_base *ab)
 			dma_free_coherent(ab->dev,
 					  pipe->dest_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
-					  pipe->dest_ring->base_addr_owner_space,
-					  pipe->dest_ring->base_addr_ce_space);
+					  pipe->dest_ring->base_addr_owner_space_unaligned,
+					  pipe->dest_ring->base_addr_ce_space_unaligned);
 			kfree(pipe->dest_ring);
 			pipe->dest_ring = NULL;
 		}
@@ -1007,8 +1007,8 @@ void ath12k_ce_free_pipes(struct ath12k_base *ab)
 			dma_free_coherent(ab->dev,
 					  pipe->status_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
-					  pipe->status_ring->base_addr_owner_space,
-					  pipe->status_ring->base_addr_ce_space);
+					  pipe->status_ring->base_addr_owner_space_unaligned,
+					  pipe->status_ring->base_addr_ce_space_unaligned);
 			kfree(pipe->status_ring);
 			pipe->status_ring = NULL;
 		}
-- 
2.43.0


