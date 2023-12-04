Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31BEC4167B
	for <ath12k@archiver.kernel.org>; Mon,  4 Dec 2023 09:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4xxujmofWxEQvFwC/3YQS6TR/Uv0cAMVegQiWNYCdZI=; b=G5K/BHtBiX86GnUWLE4oUSQzkl
	+Tpl6M8KfKmVvW0Txj1yu1XRMsY0/9EUi83Iz4YoVZ/gNF1gJ3oenzOgmFg69p2H4wqjd50WlhYTx
	YL6SFWRwj4yCXLDk2Ylj+wu4k5Kp/D08sc9I1+NeZzMgfzIOMgS8ejEO825kH4kKmMQmyAPNQjWNk
	PxU+/QlYC+P7OSb6TJ1fc1oLBemDxwO5I3nbB1r+gpctPBUTCsmm1HCwXTUxkc03ITO7kDytmp3tn
	r+cjbpW52uT04e9Iv9L043M7GEf3Cjlebfoj5MpEREhdoUH6sT2CUiizMqskZ7t4EptZZ7UFSFsPF
	fOTnuFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA52B-003Nm9-0X
	for ath12k@archiver.kernel.org;
	Mon, 04 Dec 2023 09:14:35 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA522-003NlO-2a
	for ath12k@lists.infradead.org;
	Mon, 04 Dec 2023 09:14:32 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9f4bb2e5eso19071371fa.1
        for <ath12k@lists.infradead.org>; Mon, 04 Dec 2023 01:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701681264; x=1702286064; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4xxujmofWxEQvFwC/3YQS6TR/Uv0cAMVegQiWNYCdZI=;
        b=Zzrt1jz3aJ0QwryYIW/CQ2gmvvmqIgOVprYik5gSC59We4grVq58+Oo0l00xASODUr
         M+c9xjz87auWxtMTxnZpt+JLXP5JRNTRar1FX+7k9PF0GxVXSkBbruitBrp67x54bUsQ
         z4HvGiTyIC8ObVoJPOpkgtPCaFqjBb3st8vDFrUqS9VYNhJr3LkaxWwv2hEGoykokjMP
         x3idPf+KRSTSUXeLTyoh+eDsHRD6i1TuQeRegbd+Cv4UNL8JgVDXUewbYsIWX/4bSIM4
         ymoJPzFVtpYLHVT6xx26MJ7h/3YTilQ+pueISys7GlaEm9dmS2n2jAibL/sOJigamxFx
         wHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701681264; x=1702286064;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xxujmofWxEQvFwC/3YQS6TR/Uv0cAMVegQiWNYCdZI=;
        b=I4TDJtf63pBYzKjFQ+tHRR3tIQqDYGGaO1ED6rzZP8byVHQL+AFwCqI0D6zORgL5xO
         MhMsakaRnFUgvsXB5p3VU5xmnjiervyq9ZgKHdXDISNUQeVVOoL4p8uugKDnemzjZ1Fq
         NDUrjLvdmbFPcU5Kn0PCoTX7RA/n+EeXIv5DCONjA44LnEHvvmJ7KqA309zi/rOD+n8c
         mEvLCf8kXc3cSolwA/0fhWgEC3JVaPZJ0JaS+FhCDYlguQCAzAFK7IjF3AQ9P9A/6p8q
         Oao/JxGqXC1KW8qQoWVuEMDxHofzcBFYIm9ZPvpYR8f0/OtsCPVveA5yP1faRKXoIpGt
         9Abg==
X-Gm-Message-State: AOJu0YxnZ2rOtVJFKxX7UJgiQ2pm9cOO9WaUHeL9VRE16K+JWCZZGYE4
	iMQhiOxpQYMyL+xIc8M9OkIlqW1HIrki0RfQ2+PGcWxc9os8xQ==
X-Google-Smtp-Source: AGHT+IGb8wOVG08rSpwuYICimqQES/PbT0iSm0SNPPwVZ9fVoNHKk/nAX/WdzDZUsR3+pOSFstPesf6kqVtvqNDxl7I=
X-Received: by 2002:a2e:3814:0:b0:2c9:f71f:c00f with SMTP id
 f20-20020a2e3814000000b002c9f71fc00fmr1115485lja.30.1701681263898; Mon, 04
 Dec 2023 01:14:23 -0800 (PST)
MIME-Version: 1.0
From: Weng Lin Puah <wlpuah@gmail.com>
Date: Mon, 4 Dec 2023 17:14:12 +0800
Message-ID: <CAD73Kh8_Ks0Fb6EsG6ks0oKKONfwr98uRccV5bbmEb15PLPvow@mail.gmail.com>
Subject: [PATCH] wifi: ath12k: fix wrong definition of ath12k_hw_ring_mask_qcn9274
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_011426_845155_B9EFAEE3 
X-CRM114-Status: GOOD (  10.28  )
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

ath12k_hw_ring_mask_qcn9274.tx[3] does not match with its counterpart
wbm_ring_num. This will cause the corresponding
ath12k_dp_tx_completion_handler is not entered. Thus, some of the dma
memory is not free and eventually runs out of the dma memory.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00148-QCAHKSWPL_SILICONZ-1

Signed-off-by: WL Puah <wl_puah@compex.com.sg>

---
 drivers/net/wireless/ath/ath12k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c
b/drivers/net/wireless/ath/ath12k/hw.c
index ea3eda1f1948..2b35c8aa6273 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -536,7 +536,7 @@ static const struct ath12k_hw_ring_mask
ath12k_hw_ring_mask_qcn9274 = {
         ATH12K_TX_RING_MASK_0,
         ATH12K_TX_RING_MASK_1,
         ATH12K_TX_RING_MASK_2,
-        ATH12K_TX_RING_MASK_3,
+        ATH12K_TX_RING_MASK_4,
     },
     .rx_mon_dest = {
         0, 0, 0,
-- 
2.34.1

