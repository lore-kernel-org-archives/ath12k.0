Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7425E77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VUVAK9sW01x7/UJNB//zngqTlDnV1jFf5ZhFyhScFnc=; b=4jUdujSl7v7s22X4cGZRj+Dn1z
	S/ADZHU9CgGEBfRUgXBDpo+jb5GzzBC4TAoMS6Olc9+u9qUqtBPjX9Ty8+Nu0Kv5kXAuXjDTD+DF1
	8cv07/GdXIHSzx1QBL/V2wUcfSdOOtXHiZKGo3M5sP84vRqVf5n19rcV8ZV3YikyYvZjQALsyc4s0
	GK8Nzs5NotSpbhIF2jf+yH5zOkLXwtKU9KY4DtgMKgVEBWRbxnBiZQIwK7/cifgU56wgZgLhACInZ
	yOKbry2a0kx0IgvviHHRlDsG7xjGVWzlO0ODyHznbc4o1U8isG2BxiZs2B91NuAe4b+8uXOWYtnqK
	BSndKI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJSsT-00000000ocd-2drm
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 07:35:53 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJSsQ-00000000oc3-0pPR
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 07:35:51 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so1507817a12.3
        for <ath12k@lists.infradead.org>; Thu, 05 Dec 2024 23:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733470549; x=1734075349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUVAK9sW01x7/UJNB//zngqTlDnV1jFf5ZhFyhScFnc=;
        b=TqfTAnq+vlXPNp/BKy4mFAFRGMNqvRPdfUq6ccD/H8YPyoy22veRQjlpVokldFSwXo
         BhRDwUoTKGzQjK6iRr5HSbT0CmdWFiqLNldIwrkZHgObRq0pzwPIX1pDvF+GmGED5ifP
         MQ0IzShUhRybi1IVAgBe4U6MwnFaoGvdCuDtYAZcfBGyYurBfv68V/G598sZ0lO+wG5Q
         ivKJkCUxbnsCKhuwGD/MvaKHVjyJnAnuV+DLfX8XiFrq4nWf1jLNaWotaz3brEBe4Rr5
         j2BHWQFXq0T5Vjddz4i3WzzL/S06z3LtcaBh9zEqGxWNnempe7z84xlo5daR1ujp1tCx
         iEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733470549; x=1734075349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUVAK9sW01x7/UJNB//zngqTlDnV1jFf5ZhFyhScFnc=;
        b=WjTa2upPJhAy1yOtDbOkQub6MoNjhWO3Z9tkCB8jYE74n4UR9ny0uCWVvgfgrNtqNr
         OyWOzZCGVgxTC9lvE+SZu5NQgP0v3XMgQlL/SplGLwDq8dj89NmBa78jzJwblHSoQE/p
         NvYBBT/QamPj70Ih24OZTLOTuEQC7lX4uVXtcpxUXFUwGIXveKq5CgyCRGYB3GSMC3Rg
         whuxsaINK7Ya8bce4AEUVoyXd8w15A3OA3oEolYOgYjMbCUxZHIcujbqBTQAmDowhFK4
         jfVrYbfFFnUbWQUhrFJPHiuOruhLydTMHTpYwaxvoVAiR8sHkidOawO1/HPmmDnCK0y9
         yXwg==
X-Forwarded-Encrypted: i=1; AJvYcCVBDC++ku+gfX35soWUxIEj216DjXtAUAMGcFDek7zWU+tNpWaUlZ7ljX3FS8EIqVbHHnYREnI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMDGqtuEkhJQtmuOluvOjUrsrTg5psS6y76zF3OT58F6uZlnMi
	3589yIIjczs24apdCopIS7J1xfyHUbxTtnOQcwFw8gQimQ1nNfSe
X-Gm-Gg: ASbGnctNF8HIdaylrx75j03iUig3pXc5k3t023rDtbTLFeCfo4M8GxgjtzpdHj0UmCJ
	5+2zOjNdSIyzjyKHSbmsCRQf1QfsfaCMYAl6RlZ2HvEhH3VQMKCOCdpzvhPk1fGUySSzpdYDkG4
	snn7j7+f6BS1jFy96qtKIoezUe5vfDyvuiJRvMn/qWpFoRaoeKK0tJuwA/sf19lEAe0NQDtDSAv
	JDMfjgi5M9wus7g6XvTw+3JZU+uQy7AWyML68ySM81cUiNoMg2hP7I=
X-Google-Smtp-Source: AGHT+IHHKMowzfRZqo/yrxckrktsXFddOpWRgdDwk2tLcCRDBXvPAQ1jymmDN6Mz8n0W8ujCfq1Rgg==
X-Received: by 2002:a05:6a20:7f99:b0:1e0:bedf:5902 with SMTP id adf61e73a8af0-1e1870ad3acmr3032805637.6.1733470548723;
        Thu, 05 Dec 2024 23:35:48 -0800 (PST)
Received: from HOME-PC ([223.185.130.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2ca671asm2363763b3a.153.2024.12.05.23.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 23:35:48 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: kvalo@kernel.org,
	ath12k@lists.infradead.org
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH wireless-next] wifi: ath12k: Fix out-of-bounds read
Date: Fri,  6 Dec 2024 13:05:42 +0530
Message-Id: <20241206073542.315095-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_233550_251519_3274DF4E 
X-CRM114-Status: GOOD (  10.20  )
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

This patch addresses the Out-of-bounds read issue detected by
Coverity (CID 1602214). The function ath12k_mac_vdev_create() accesses
the vif->link_conf array using link_id, which is derived from
arvif->link_id. In cases where arvif->link_id equals 15, the index
exceeds the bounds of the array, which contains only 15 elements.This
results in an out-of-bounds read.

This issue occurs in the following branch of the code:

    if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
        link_id = ffs(vif->valid_links) - 1;
    else
        link_id = arvif->link_id;

When arvif->link_id equals 15 and the else branch is taken, link_id is
set to 15.

This patch adds a bounds check to ensure that link_id does not exceed
the valid range of the vif->link_conf array. If the check fails, a
warning is logged, and the function returns an error code (-EINVAL).

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 129607ac6c1a..c19b10e66f4a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7725,6 +7725,12 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	else
 		link_id = arvif->link_id;
 
+	if (link_id >= ARRAY_SIZE(vif->link_conf)) {
+		ath12k_warn(ar->ab, "link_id %u exceeds max valid links for vif %pM\n",
+			    link_id, vif->addr);
+		return -EINVAL;
+	}
+
 	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
 	if (!link_conf) {
 		ath12k_warn(ar->ab, "unable to access bss link conf in vdev create for vif %pM link %u\n",
-- 
2.34.1


