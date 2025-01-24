Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5326C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J1hlt8R5MIkYuKBDFZyWOw7qVQ6zUZRXXaHPTjNJ3X4=; b=pYlhFV724ohVpLv9r/VQbh8gT4
	OkCcn5786hV2h0wbCGjMTw5LDlK7pM6Vb6qSnbevHlwXjjkW8qB8YU+0MrkyW0ej57cIdv9LsI3rw
	ISdmdNRI13lofWhg2+8l1BWChsRsMNpAaQl9UwmrH1/48yj38ftB6AWBXc6v9Ng+4R9sxpp40af1F
	x4b30iScL9uj105sMmZGM1U8BJEzNqvE0IUWsT+kzDf//8McYxd8ykqh9FvHpMbJrBpI1rG9bkb0r
	aNj34A3nMNjWh4EtrFezVP2spQ4bGZH0aEaHD3zdolZLSlyWo0MI0tcBWrnR+BznNAyWZGzFs8OUM
	fn1y/jgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHwR-0000000Ea1f-1sb9
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 11:33:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHwP-0000000Ea1G-1Pbf
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 11:33:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43618283d48so14045125e9.1
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 03:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737718415; x=1738323215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1hlt8R5MIkYuKBDFZyWOw7qVQ6zUZRXXaHPTjNJ3X4=;
        b=LN1jOUzZzW9gpeGoNh0V4XWBHLBuINMdq96VIauQIDEScIqYLnpGOf/fSOq24gv/C8
         kTYiNTzST28g83XwqqTo/QlqURTsa149Y13qV7rBmE6jhu3ix3vp/qMa44Xxh62RZrIL
         XOVGWjJPzMklV32NRbhbVKdRvXJuKSlqGiNNyEG0GZVTCMKXuQtSl1zkvYkGBmm/+Ksc
         tTQJx91d7ZygHURp40EWG+KeiQeoL0+MCL5e1bZTbgCEKuYbdXx2Um0tbX+ph2yFzq0A
         H8/pQ+1Ehs4UXjFRh6LuSjMIgXWuxKdLnIAXTeIbnHeQ+HrKV73ws2LdR6svN4OoUru4
         1fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737718415; x=1738323215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1hlt8R5MIkYuKBDFZyWOw7qVQ6zUZRXXaHPTjNJ3X4=;
        b=sGhNl6NMJRek2vsrdWY6sGzAiBpt1HhuV9TmyPovMQP6HOMUxzfkoFipOzZovwMYFP
         JYaub/ULnFy+BaC9P6gUJZRJZAGMeOx8XQudFxGwG7zTMkBsN3yhb94vHgfv0S0Q1kYT
         Lo0PYomJT6odeFi5qF9OnL8pWJZhvyIOe/QSJwSdyE+vwodeM+KWOcYHrSblh2g67VRY
         Ht3XuakjGzQODzC4xBr6UNTugn91KlNHq7ialR0TdVOsgOTKMvCIXKJSlJ3+m53SaXHd
         Nw6uhBMCKKcNNt8aHgHHWILa0qazuFFHaHVouUd07zXDTjYeovXnotN8I2TwcdVHKhW5
         eNBA==
X-Gm-Message-State: AOJu0YzIw/LvItihPjXNchSfZzkzDP4u0VtxNBkSnSnSdXKM0BZ1YY6Z
	oFxQa6xDGjnBxewEiHaXzGmw6YZX6tEv7sX9maNuNLaonJmAFi9iHE45nw==
X-Gm-Gg: ASbGncua7eXY0XES75H536cEgd5mFo6/mwVRyOp1m+wktRmJskID0GXNKRJ/KUZm2/G
	fXFFWiAj5+j3iCyLDwqL91TelQ8NLnG95pipDApq2ql5x9usKO1xXZ61qJNLPDubsdu2RbC+xFo
	KyjamibMoqI5B0G2boci8leaqOfQWvCukd6CIVwyYweLieHiL/3STsGVNoUnWMkUjNasQhm2A9P
	p2cSDv0/B2kT+cARoN7pvYpcMel6horS5vXk16gtk/A53GE6zm/a3AbSGzCl8i7aS1NhJ4J4stw
	/3wNm/KQUtpatXck799cyUV77FfEib4R9zEa+Q==
X-Google-Smtp-Source: AGHT+IEN5SA3mcTu8+dkgNi2gfN0uW281kkON4BfYZ/abceYNTwrjsaBX8FI3uSrWrYBhq1/idSU1Q==
X-Received: by 2002:a05:600c:1e1b:b0:434:f917:2b11 with SMTP id 5b1f17b1804b1-43891429682mr249292255e9.21.1737718414853;
        Fri, 24 Jan 2025 03:33:34 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501f1esm23068835e9.12.2025.01.24.03.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:33:32 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in ath12k_dp_tx()
Date: Fri, 24 Jan 2025 12:33:31 +0100
Message-ID: <20250124113331.93476-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_033337_394437_D9229657 
X-CRM114-Status: UNSURE (   7.91  )
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

When AP-VLAN was added, we did not add HTT_TCL_META_DATA_VALID_HTT flag to
the tx_info's meta_data_flags . Without this flag the firmware seems to
reject all the broadcast (ap-vlan) frames. So lets add it same as ath11k
did it in commit 5e8a373c8699 ("ath11k: Add support for dynamic vlan")

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 00437736e0322..0d7a079f4c6d1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -368,6 +368,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		add_htt_metadata = true;
 		msdu_ext_desc = true;
 		ti.flags0 |= u32_encode_bits(1, HAL_TCL_DATA_CMD_INFO2_TO_FW);
+		ti.meta_data_flags |= HTT_TCL_META_DATA_VALID_HTT;
 		ti.encap_type = HAL_TCL_ENCAP_TYPE_RAW;
 		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
 	}
-- 
2.48.1


