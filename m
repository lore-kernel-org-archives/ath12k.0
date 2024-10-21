Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43621D17138
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 20:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6F708dL/ffeOZXEz1qq/ZOCQiXeq5R//1slMVkIXf6w=; b=2Kckotpkj7S2gM7SmmUtv8NQdZ
	CLukcMCZlT8WYUbAg8Mw8gokqb4HN4TuqsHzYUVMkBwgvAJGq0FjDewGN2CAW+ejKuz12uTXmFPIs
	Vu2iiDD1Ju+viyra2+R7hyXYmPgT4aBfiYKbxEc63ACT8amqNdLzHloDu1Ze1x/nqp7e2YqQh5Jxv
	tJr7kBO/kt+aNuxPMpimqEW7HTyLR9X0VVaOtwLL/dK/QDaOM9wDjmPQBsRZ18d2e07V2wvxhlu8s
	W2jxjVbosSQTKMZJkRam54J+wB5qaBC+0X777M6b2An95UGShHOWccJ9trdYiQDDQHam7p49w3lmy
	h96E61Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2zKR-00000008e2F-00xf
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 20:48:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2zKO-00000008e1M-2POz
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 20:48:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a850270e2so412411766b.0
        for <ath12k@lists.infradead.org>; Mon, 21 Oct 2024 13:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729543714; x=1730148514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6F708dL/ffeOZXEz1qq/ZOCQiXeq5R//1slMVkIXf6w=;
        b=ZU8hL2JKpTjEsQwUZ87e8Sx3V/2JT0rGXGwYXXWPZYxzQFE/whTTPzyJkZ1U6POKPT
         Zujs/pGObk7TYrFsLfa59arEXggT/hNwX9H2OqFF3f0tl5tVLnz3N7RZ3GBQsmJqC9yK
         srKpMnoMwTeNAjHx80N3hoOUDC7owZ+XDIQomr/rSLZiJyo8QNi2zGpDLu2bsydohKYC
         LDREFVCdMEOfRaOxjjXRavEjwFprL+PepX2P5Uh1JACdNyQaYZkIwud65OkZ0uQ6lg+U
         u5ghMkgq2/xliEetJTjegUBAnzuz0mHu053yvKmeBuinE1HOYY918GDuGTCxzVeatK5J
         xf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729543714; x=1730148514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6F708dL/ffeOZXEz1qq/ZOCQiXeq5R//1slMVkIXf6w=;
        b=dmgbvQ519Oqy9xVetM2FiwIEqMPzsAUXLjBxYWskzTl7zDgZwhGYkB3LC7VbjXEi69
         l2Ew6BYfi4MBR/WYFTppKvohlsi7c3ep0lOgeZRnNCvTRZOcNfiiRVbTOz52ILQmCJTW
         Xx5Ov8nkXIcsuC8VsIaDUTJGYixFVFO0L5ogYmWrj4R80K25/ms9AHlQGpFg2eZbZ9wG
         Ag9yoxCLjaf29RP/CjQX/QOF3EsBbcr+gSlXWQ00nDk3zS/D2IqP1RxMOvDPY8fBYtHI
         js5YJxSFnE5N+ykKv/0fjc0Xqu7OuojSTxP7lpwc/TTf2ynDc/tACnoKZqoLiAwVM+M5
         EScA==
X-Forwarded-Encrypted: i=1; AJvYcCVsX/lDfAU6+C8pSfwJCxf32oeTctKGEEdLiEhQ8x9nCGEF1gRXnm9hBxMpQu4QpxBXmqId1FM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnoCWxq/OhcmfWkPtJEp9jo6MNtLfbm20VPEyhfM+nikvS2THS
	j9nezs2NvYcrvnwyUPUcOa8w+x59osgLV571gju+Pz6AwtQYspyh
X-Google-Smtp-Source: AGHT+IGJMghbxAACpszuNPwOqK9gcryXeriFm6MLHgFVXQZJsBlGcOh5PjeUpuPY+oJxLdB6UkGpUQ==
X-Received: by 2002:a17:906:c10e:b0:a99:7bc0:bca9 with SMTP id a640c23a62f3a-a9a69a65949mr1153925266b.3.1729543713844;
        Mon, 21 Oct 2024 13:48:33 -0700 (PDT)
Received: from C-KP-LP15v.consult.red ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912ee59dsm252369466b.71.2024.10.21.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:48:33 -0700 (PDT)
From: Karol Przybylski <karprzy7@gmail.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org
Cc: Karol Przybylski <karprzy7@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2] wifi: ath12k: Fix for out-of bound access error
Date: Mon, 21 Oct 2024 22:48:14 +0200
Message-Id: <20241021204814.728090-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_134836_635193_EFFBC3D0 
X-CRM114-Status: UNSURE (   9.88  )
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

Size of array passed to print_array_to_buf_index is decremented by 1

Discovered in coverity scan, CID 1600742
---
Changes in v2:
- Code style: added spaces before and after '-'
- Link to v1: https://lore.kernel.org/all/8734kpq0wo.fsf@kernel.org/
---

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 799b865b89e5..8371df570c42 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -1590,7 +1590,7 @@ ath12k_htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, u16 tag_len,
 			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp));
 	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
 					htt_stats_buf->ax_mu_mimo_brpoll,
-					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
+					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS - 1, "\n");
 	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger = %u\n",
 			 le32_to_cpu(htt_stats_buf->ax_basic_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_total_trigger = %u\n",
-- 
2.34.1


