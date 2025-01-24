Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4304FC02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cZHTFOr6mzASyJiqjEsg5h+YdNb9ENSDizFr9pr9b9Y=; b=UpPT8KfUUQO4FE8rY5n5Hn3ed9
	yP///gEcKk+5veFv+wqN4r9XX2xeD1mI8ZHfnXfo4AGBdQteAsZU2xo1RAjd+NL1JDPJPTDwXy2HE
	ExpvzrH8d36zeCBRa98G9Kl7LrD56ORNMtSLXuTTgaWL5hc8ABvdlV7ngZQZNh64EuuHEPsamSzFn
	R9hOVhR+cPOpzVm2Hb98ZzBaQileeAs6E8NBHWEfeCFYDp/NyTsEM2ut1g3bMEcdrabEaDO/zRou/
	RR/cNrvnjVB85fmejGjYoCcbczvyY02uaMUANWrkixcJX/xEMFGS9hghmkthkzpXWoJCA8IN9/Ipg
	Tr+iq+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHwk-0000000Ea3L-3qdn
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 11:33:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHwi-0000000Ea2q-33lw
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 11:33:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385de59c1a0so1204268f8f.2
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 03:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737718435; x=1738323235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cZHTFOr6mzASyJiqjEsg5h+YdNb9ENSDizFr9pr9b9Y=;
        b=ZPksXeJs4jEVgKZSt5eJ/veXi1CRrbOgfbaztiXd6rrE9txDyqNE8qd/xuF9h/cPtn
         To0dXdwhfidhuZy3wp/G3hpEGZ6J8dsy8hnd8y/BmHRtZLJ5QHfwgnVOxbGGmtmczyWv
         1TtIAfoN/qYV4xoG/6a7cT8XJI8c1+UzEVA5TrHIsnu17N0TlR48/rbVhW1FYBj8gc2D
         uQlkaj/jMD7skt88H5hKkrvJFYnoeucfjH8kBxF6ZeY1ib01AGxfpQP2CVZF2xGpMOUm
         r8FtMc5rcw/TIY6CecniF15755CB0qEPbGAe45J5cbYexx0a7TYoyMY6sgZrb86OsNYh
         GkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737718435; x=1738323235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZHTFOr6mzASyJiqjEsg5h+YdNb9ENSDizFr9pr9b9Y=;
        b=QUMV4eJL48ezenWD4bUbIkhVOOxLZwy1FLrpbm7ao2OumHHjLUArvDoxbtba+UbEdF
         9+o3lAIga1HydNSCwPTkLMPx/m69BpsbB/vlcIdt63eC9Ha2zI+scqnOKjTE7R2Rbk5S
         3jfy9WTo2in64pz4DB3BzTK/7Eo/hrV4Na1ugDMswMS47Hk/7ZQ9hxMVo3H2gVnmNICZ
         TCvPBSXjqjHzrR4pZtTztltycs5wdBP+hEVqKJVC+1qJAIps8L8/GlzMFu6qR+zFYiBc
         g4JtoGvtHXPUnYirzc5TR5/biX4xsVRoJsPYOzJV+WiJars94mqx7RGf9Pqh4Y/CgPVm
         TLXA==
X-Gm-Message-State: AOJu0YwJEnnq94atJs5/DIlRXpLWEKutxbUApnL15SQPv2V3fRzxwGc0
	s2eSFNLKeg10gjIVEji7Cvhw7Jo0mOKuBZNm20GFmsSY22LwBOs/4m+Vdw==
X-Gm-Gg: ASbGncvqjoe8bGvKw3eZUvj+Fc2DIvAjf8aagKGGCbcc9L4uJfDDiX0XhbRcxx9j2/I
	cpZkVt9HxUauqvEq64lo+U5CpXU34H2HFYgbCbk757QYxXf3uK0yuLuu8pRggMuJTGrtVFKD6NV
	s6IXAdWlu8wjEvGbbqjWr9cogHGAy/ayjXewsYUsdNCqh+3yDlQ2YrHOmJQrupBMIwK1xPTqscy
	8R8L6Z1OnROgVkUcIYckomUQaeqlxlBhBejtFS1lqam3KM3AfB7sO3rwkeHwDFWVA2OESmD9ND+
	uQDb4rsp+iEreiyIsqreYQid8PJGPx8Il9EfZA==
X-Google-Smtp-Source: AGHT+IFIon0QxIEYkRWq8atTmgYtYSFe9y3nYelSDKpU30OJeKufnVQiJMnr7y5AXij/rREgQ3sWOQ==
X-Received: by 2002:a5d:6d86:0:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-38bf5655264mr27438023f8f.2.1737718434891;
        Fri, 24 Jan 2025 03:33:54 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb101sm2478153f8f.66.2025.01.24.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:33:53 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fbx: fix ath12k_hal_tx_cmd_ext_desc_setup() info1 override
Date: Fri, 24 Jan 2025 12:33:52 +0100
Message-ID: <20250124113352.93638-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_033356_769087_BFF17CDF 
X-CRM114-Status: UNSURE (   9.51  )
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

Since inception there is an obvious typo laying around in
ath12k_hal_tx_cmd_ext_desc_setup(). Instead of intitializing + adding
flags to tcl_ext_cmd->info1, we initialize + override. This is needed to
make broadcast frames work with ethernet encapsulation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
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


