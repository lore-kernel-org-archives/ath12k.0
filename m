Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910A6C636D6
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A67Nq2NjOQ8T49qVPerRXgS5XsDmy6h/yBOfhru3l/o=; b=4tovQxXsHRExUF
	mlP1Xn90XIxYJ3Wyj1MoJimpJPoB6E3L0mEvcHJEguI6R0FhW5HGoBoMo8Ilpi2yyXLP+XKACmlQx
	cj5EkSTQXIpM8uBj9+TR3y0x5w5q9NnXd+jHhf8o1qJQFQmPjq5+Lmxfo/4zU+Is58fdc9aFn5sQV
	jwoDmF+Km9y76LLSZlHeEvD/15J7bC+YX4CIfg9x6au97WQefux5jLz7N3s6EB4vFMxbfBLL44uFL
	UUF7NoLN1lnbnEB8vn6upurrO/gFx7YRpdd3qqb9JjaMkvjomSIHA647BpLRfF8OBFZpfRSgXFQHq
	hzf14yURSetYX6yeuaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdBZ-00A7wW-1N
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 12:16:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdBX-00A7vK-2t
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 12:16:24 +0000
Received: by mail-ej1-x630.google.com with SMTP id f21so4623836ejq.8
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 04:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RqeJJOsnrA8Tc9BGMHN4R0KwaZi2oQ8E4MJIKs4Vwbo=;
        b=gGX9Fyw9ju9wEBdTNG696E1urvTcmbdcGp6aTYePM2xZ6EVc12+g+Rqu14lO8J3+S1
         3CqXrF/iuyfyvIB/WjVoguEKWYrzAE2Sx9X+qFp+Ey/IFQkVuoCWN4pVyHaBH/MQDZ8B
         2OnnRiDO72QKoWZ/8qemwwdf+5vHzprMywKbLZzTLkgv0tuDo5VfeMXZIbTB3RfTpNSD
         pc9eAyP7RLSaKgmyS5IHuCbT0K116VkEVS8By89nYBHCBj84jLAKzUWXxUQUUHro1ezo
         Ot1UjXpobo34rGeXslaJ/RPlUJJ8ruWhFThJbntltvwxT887sH+azLr4+oiq+hbVBrWw
         qFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RqeJJOsnrA8Tc9BGMHN4R0KwaZi2oQ8E4MJIKs4Vwbo=;
        b=tri7ciBiZBgGp+94mSO7Biobj+7vLN7aCVfZ8sBKT2cDxdDyU/6AxZ8B2+r9s7tA+V
         jIxAj39zbGWL3i7lhmJW3YbpA6aLvtuxmtWhI4NLwwf7FBKFvUrIFrStWskDl0Q8Ggpq
         C3+zgUfyvzIqc2gKpLu/IwQIexOgmaOV5Lns47e5HW2SvbwPNt/0u2sbmvrjnax1pRBH
         vYy7qdjT8LI51e35q2nSLhu9gGkpSkEXFu6COrlKAPX6hd9NjliyArPRNBU66ScPm3/P
         fQdkEv7yUB2HQ+zd0cBZVkBTeRNuIgtMf+Y6CFxpzAzDEDgwO001wgoJCVzVw/NQizfb
         jBmg==
X-Gm-Message-State: AO0yUKUQKQvCpR9mA8qMCfRjTN2jNtsyyt6JLVAzmOt8hP4XwadRUEfW
	PXz1UHhP5L3O0hadvlPCN1VS52rGqTLJHQ==
X-Google-Smtp-Source: AK7set9a2dzMneXv10tWH6ZpgIkqcyr87yWBX4+qP0Q4BYfehU2A1yfYYGPygn5IFC9ufQYpC16ebA==
X-Received: by 2002:a17:906:b78c:b0:8b1:3d04:c2da with SMTP id dt12-20020a170906b78c00b008b13d04c2damr7048553ejb.45.1676549779465;
        Thu, 16 Feb 2023 04:16:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g23-20020a170906539700b008b128106fc7sm744064ejo.46.2023.02.16.04.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:16:19 -0800 (PST)
Date: Thu, 16 Feb 2023 15:16:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: ath12k: use kfree_skb() instead of kfree()
Message-ID: <Y+4ejiYakhEvEw7c@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_041623_149810_834C0897 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Sk_buffs are supposed to be freed with kfree_skb().

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 95294f35155c..fd8d850f9818 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -270,7 +270,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 					  skb_ext_desc->len, DMA_TO_DEVICE);
 		ret = dma_mapping_error(ab->dev, ti.paddr);
 		if (ret) {
-			kfree(skb_ext_desc);
+			kfree_skb(skb_ext_desc);
 			goto fail_unmap_dma;
 		}
 
-- 
2.39.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
