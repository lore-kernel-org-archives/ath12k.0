Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934DDC02182
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 16:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Vj4z5hIcthgqzFNg6aAKs2pjX2BuDD07i62xt4di/0=; b=OlaoRzxMBBHkY+mTy6vNu9NQYz
	VJMq7+e1MQ6cs6ERd3t/tb6J87eMfF5ow3AOd9HkfFM2z9WvGj/wgPnqhLFH5bldfNUNI2eGeRw0P
	4DSm3Ubju6FoOmoql+308rx1xYL+UBbfhWnC88j6eqSvhSBnJj8WIBigOCOsd2LkYhBO8JWOUwnsi
	VRFwCru1Ca9DlQcOFhmIPCi/YXkPwYCOFRHlzciP4BCyMAc2tcrx28xde/CAyKJYwojvsVYikRUTX
	bRdhSRa+l+Q+Oi9DtizhcFsSyJZN8h9y8oLPV+ueg/twW34NqY7P0C8AH7RfxPcrZQiIfvhYLCyWp
	yPpjaNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tadAP-0000000Ae19-1Wg2
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 16:01:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadAN-0000000Ae0h-01Ha
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 16:01:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361f796586so78341625e9.3
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 08:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737561676; x=1738166476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vj4z5hIcthgqzFNg6aAKs2pjX2BuDD07i62xt4di/0=;
        b=C8kDVbcC7YL3wsO1KYojl8NxJFi7AWA87L60EkfWH57oli4a78ADWLlwKV3X5ttwbC
         lK1yw0hwdOuuiubDZ1/khxDZj1NzDBgDNhJA0dbiYf9s1KV2SLoKI70MvqiuNNqQT9Lf
         0DB4zAQp3vGjbU5BZ7MDdUOp80vhRNgmBBXgau4QwoglfGuOcU8UC0b8L3lcoVg+HWJg
         4wvWbu34eQEsEer4WarNbA4A2DOSIVES/ZbYbZseYHToOI/7GO8INst9V5TY31ZBWJv3
         7v54e6IUEgcA7lbEM70iq/yUIx3sk95S2BlbFsLYiPCNfCz6xfEQUKU68q3g0Vw/PzoJ
         jVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737561676; x=1738166476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Vj4z5hIcthgqzFNg6aAKs2pjX2BuDD07i62xt4di/0=;
        b=i+I70yWFupYI57tvp8ys7I4EAHGJgRyma83zYLl1ZWjOAW6Bsk7KDG6wDcivOGMBJ7
         MF+G/yuRFDmow6E8B7/1EJtIjgN2bCeUiRTdC+r0V126NJ8w5wppy/DntGvEyJ+Nz4+2
         3a4LqhGseSLiXnORtT+lxBZDCdYIAjCjgeB/qsPr6fvD3e7jKOz6y4q2HjY/F5Jr69Qf
         fNyx9PyNTWTbjCTbtxxlJt+hsK5tLVFFxvJvpE/OJhpcpSFe/ZYBeBhKX46PlV+v86/f
         TIicN6NKdigWSSKaBfrzoK6VdPY9PhqrY3DCiia1RxBcGFgZybAiP9Oi4erwIDWOHCAd
         ZrRg==
X-Gm-Message-State: AOJu0YyNhfM8zajK9g1iES1Ge9ksaZxe8HS1hZMOZRklpFpWWiJb5IU9
	zimjgQGo2dssAgBUBptPu83HvwwrIO/vlpu/j/uKFiuM84bwp7GsZT/jKQ==
X-Gm-Gg: ASbGnctdFIS1iVmeZxYQPuFviwdn65Nkbvs1tNaF5R2ZdbWr2y4bQJ165qMg+xIE201
	0tUdjpIiCUxIEl0cS0cbxXhlec1C6gaWlQyEq98fgvt/eaUacfsVw03UJaka8B+OawkNwW1Zr0v
	kFgu6QUjZw97NOlp6Lfnl7cjaXgBNVHTN4bvPnWjR73Df/e/uj/LpX6uWG0gz74I6nzuqycIWeD
	55JWYai1ZTixRysEXkC0hF1Lnzs7+u+eo5i/OS+G91bZo7CDRKb7bIMTsVxIjxd8CAyS9i8R2o4
	iUlBVGQal4XBBRXHxRy6JC3exL4=
X-Google-Smtp-Source: AGHT+IHR1F/vjBNVVnX/Dc2R8NACoeWRJsUoen52U1QiPRFc8U4V4j+S4DvmWRgU0x/floRQn8kMiw==
X-Received: by 2002:a05:600c:1987:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-438913f2f4emr224515775e9.17.1737561674232;
        Wed, 22 Jan 2025 08:01:14 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31afb70sm30010095e9.19.2025.01.22.08.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:01:13 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx error path
Date: Wed, 22 Jan 2025 17:01:12 +0100
Message-ID: <20250122160112.3234558-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_080119_042800_E7F74CF0 
X-CRM114-Status: UNSURE (   8.62  )
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

When vlan support was added, we missed that when
ath12k_dp_prepare_htt_metadata returns an error we also need to free the
skb holding the metadata before going on with the cleanup process.
Compile tested only.

Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index a8d341a6df01e..e0b85f959cd4a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -398,6 +398,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 			if (ret < 0) {
 				ath12k_dbg(ab, ATH12K_DBG_DP_TX,
 					   "Failed to add HTT meta data, dropping packet\n");
+				kfree_skb(skb_ext_desc);
 				goto fail_unmap_dma;
 			}
 		}
-- 
2.48.1


