Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74580C0218C
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ua/h6hEez4GZgaU0SVJ73Nz7Hd21dohTKQaVqyocjsg=; b=Nzal2YezeAGEEzwR7WkVHnCAN1
	hfHJn+0aU6uvvZQLKskEbxq6vxPpZNxtrRsrVTQzo2Lwc53iGQg6K/JaUOTe9cl8vVMOCKgX5hNHB
	8xNuAKaF22Zk6qN9SRjcw5zRSlRVGyMxMu0uaG0IIk5H7EvQ+2Fm3zhiA+sBlCAwNjJ005S8J9EYG
	fEFPBaUYqtrMcPzEpH3GFQ0MBZ8Pxyr8PpE+nDwnPi8dihqp0qy3pRCBTWW40Q7um8QMBEiSmOiRs
	VKZDxvkv73YBYMqeP6wZWwf76ymPAbVwm/1+t1k2CBovgXXfRsYaXXzBWx0wJJEyGczhZfUxML0Li
	OAbSgBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcJJ4-00000001mRW-0y5h
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 07:13:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcJJ1-00000001mRA-2eK0
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 07:13:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43624b2d453so43771885e9.2
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 23:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737961990; x=1738566790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ua/h6hEez4GZgaU0SVJ73Nz7Hd21dohTKQaVqyocjsg=;
        b=SC7VgiM1dpXGRoOdf7QxXxBiKp1daYT4hGd1kACOQwSVM5Tg8pyRXYwQYhIRgSSyyK
         XXf98QDAxdDkrIaUSvVzqBIpgnUlOKqz1x0GoPFl8CzJ9JyITXwTUnxMpa2WQV9/2rQ0
         m7WzjfjJ0FlX7gLbjEuonKFDON517jNKguwA0g8pmtLO3LDKwvN/bfk3CV7oBZbA51E4
         et3zVdb3Eyq8T7/DMSj30+9PusSE/eGkxEiid0s5gE19Bi9tKNBw9qxRovJD5AH3MCcP
         2e/BcXozz3RA4Hs0oLeD2fmdC3afcT0wjAdDG6KLrXAQ3x8fUmjYpdC5V3Cu1jtewgOu
         IJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737961990; x=1738566790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ua/h6hEez4GZgaU0SVJ73Nz7Hd21dohTKQaVqyocjsg=;
        b=nuYaDQmfZgkRnB68MmUGba1cwzoI0ogi/nXHnPQbt5PlSQgo0Km6O2MfI7kwkw3TeF
         0S0HOV+ctXE2+0Ey2EdIAymgOkR61BtsGwTpNB8OXg+ON/TRcumxnmBcXwWNLIyrM1Ts
         wIeJWWn6MM0LNgzJAmZDlqbZZYNNVz2lt8ZYtDsdf9On28mN4iIB8w9SeudALJw5GYYz
         arZIiWnLsJAJXTHANwqkUB4aoa6WUlcjYetD3IkKelT3F4gvf/4Z0XPriorqfB+adbmc
         ffMMQSdCUyjNncTGWXGvaaaXssX5xErbB3SGx9nPx6sKoz0enb9slswnDXZuOBluLeHe
         2R4g==
X-Gm-Message-State: AOJu0YzTjpXzlVUucy+tGql3F1emE4U72eiusH8OX0efmb6AirqHmASe
	pazNPEARhDsha4UUOyMzqU+71cpcnEM18FNEZ0GGW9BHNYVuGE9ojnQnPQ==
X-Gm-Gg: ASbGnct5tfJ1x0BYM0YQI77Je4kFEyR1ambJazJyP4jydU4fhf4SOPFnu+ArWXIqc3E
	YhZYDncRFKPB1M0g+REJvvCiiGoF1ylgp6oTDAGOk/ET8n1efto6/jpjcueGOz791sI+yUAsofC
	6mPCgaQvxPQjaX/ta9X5LxStm5CEDB9fb2FZGj7DGmP/ItnXg8xv+eaDDolmFLy63uZwPsCXe2Z
	Tmc9ect+0/dUVCwqthTwdFBD97m4pZmaigPS2E6FTZ7+fiStThnqGpsQorl6A9PZForKTb+Zq8G
	1duSOG+Pn32kmqc1Xoq+hnKLsDhN32o8fHQnoQ==
X-Google-Smtp-Source: AGHT+IGV0eWgepDgho9rEgaECBmeKbpNetD71sbz1RcssXocncPJ2uObmd7Z7vwhAhIYAhqso1y+mA==
X-Received: by 2002:a05:600c:468d:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-4389143b715mr342511305e9.22.1737961989511;
        Sun, 26 Jan 2025 23:13:09 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd5732edsm119225965e9.36.2025.01.26.23.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 23:13:07 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: fix ath12k_hal_tx_cmd_ext_desc_setup() info1 override
Date: Mon, 27 Jan 2025 08:13:06 +0100
Message-ID: <20250127071306.1454699-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_231311_667766_859DF9A2 
X-CRM114-Status: GOOD (  10.97  )
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

Since inception there is an obvious typo laying around in
ath12k_hal_tx_cmd_ext_desc_setup(). Instead of intitializing + adding
flags to tcl_ext_cmd->info1, we initialize + override. This will be needed
in the future to make broadcast frames work with ethernet encapsulation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
v2:
  - removed spurious 'fbx' from title
  - removed fixes tag as the problem it fixes is not yet enabled mainstream
    see https://lore.kernel.org/linux-wireless/23d62bef-2393-4232-93ff-82ca4dbc4524@oss.qualcomm.com/ 
v1: 
  - initial version
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index e0b85f959cd4a..00437736e0322 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -117,7 +117,7 @@ static void ath12k_hal_tx_cmd_ext_desc_setup(struct ath12k_base *ab,
 			       le32_encode_bits(ti->data_len,
 						HAL_TX_MSDU_EXT_INFO1_BUF_LEN);
 
-	tcl_ext_cmd->info1 = le32_encode_bits(1, HAL_TX_MSDU_EXT_INFO1_EXTN_OVERRIDE) |
+	tcl_ext_cmd->info1 |= le32_encode_bits(1, HAL_TX_MSDU_EXT_INFO1_EXTN_OVERRIDE) |
 				le32_encode_bits(ti->encap_type,
 						 HAL_TX_MSDU_EXT_INFO1_ENCAP_TYPE) |
 				le32_encode_bits(ti->encrypt_type,
-- 
2.48.1


