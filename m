Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B31C27C6E
	for <ath12k@archiver.kernel.org>; Fri, 14 Jun 2024 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jY/QbSZMgnMs/xjpVGCgeJX/KzlA4fpVpqJPjRmLi4k=; b=iFU7iff0I5Vbi747MjRse9KlZ6
	s/vL+fUB5MIagaMfQaI3Z60/NdBjWmnPzDNKuY5bpcwgKQS+kk3Ha/w/160R51IkPJbY31u20fjB3
	/kvHWwNlpXQNUgbdKufQ13qHeb9IklxW1EXkTRZW1Tx5OOOvLC+BYLwirj+UKiykyxYCHpIwaNMxZ
	s6dFz4yWiNLl1F9cdevjSgPG7JWR3WWo0c+yPlhpMmHljP9g1x4ZDRSKHzBAObBQue9GJ7MtQifgN
	s/2R8S+GF1NrK5cu514g25eMJXtzXiQbopi2qVx25xvP70JgMmFKnuSAjFIFSJNxwoVX3p6EkLQTJ
	U4oqJAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIAnm-00000003egf-207m
	for ath12k@archiver.kernel.org;
	Fri, 14 Jun 2024 17:33:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIAnh-00000003eaW-38sm
	for ath12k@lists.infradead.org;
	Fri, 14 Jun 2024 17:33:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4217136a74dso21851515e9.2
        for <ath12k@lists.infradead.org>; Fri, 14 Jun 2024 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718386400; x=1718991200; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jY/QbSZMgnMs/xjpVGCgeJX/KzlA4fpVpqJPjRmLi4k=;
        b=t69fpIKLXw0aHL0DZg8H7trV0pogduCN49JkNZJj5GOnTJxIMVWrmCU9av5MGX9bhV
         nEB74G/+XJ5CNmGtqADtWm+xzf19UCZZKbBasBFjw+n7UD21d4l+VLuDBDz2FuPdUcJo
         QJEI6aqb4Al/K7+VcuNaBVOED351ektYPo25CE5QjmRcgLqiEO6jUbCbA6Xgc9VzeVEg
         LaPdhPqDnwOpqP3g87JH3P0BbJuiBQzMQEnz28yFnH624CbYjbQ/owzQQ3nHTiMnZ1bR
         jq6Bp1RTkC6gt+Cw3AlGAoPXB8ut/rojrPCmoPT/MmHURONfAUazzoR2qNRsICpdfZ5t
         w5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718386400; x=1718991200;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jY/QbSZMgnMs/xjpVGCgeJX/KzlA4fpVpqJPjRmLi4k=;
        b=a6Drde1jddCZLYET8Z4PkyU2lLv/2WK8zNaAsCOGoFivt9ugzTl4H89OHz1lcTmLQR
         7xCPg58mf1gRftnlWHnwZW95Ylg1X7rVtDTaLPe0O5MnSTcGFb5W5vb0RCCXGJUpG/pV
         +O7i0OprJNbipaTv4YHF5cXOjs5WyePP0A5BnHYmLyvEF8Nk5ORy027P+VQaKhnWitVR
         29ib+ZG5DdcxCUZmv2E7dI6uBmyvuEHql6ZzzzBLRp4vtsvtaSrnZncYAPsVBaLTTmyw
         f082Zka3yblYzieUR6BYpRc1X1DHbvq3MaksyS0zo5gKOlNUOpr1Io+sEY379UthLcNp
         ecXg==
X-Gm-Message-State: AOJu0Yx7DO7yL/OBIZWF7Idiz4dLgnS53mMklGqfxDGNDmbjt8TP2aad
	tu4zSN+Dv+wXbCHqxAN4sHUFzMnsrDgFA3P9glGePFQZHTyP5GUC0Vs2hVkQ0vg=
X-Google-Smtp-Source: AGHT+IG99PpqC9FXjB1ffB8b+2PDXBZ7EXpcEU/5YMwlaoVeWmB6aEMWdCTkMkJWU2I8rppL3ZR9og==
X-Received: by 2002:a7b:c3da:0:b0:420:139e:9eda with SMTP id 5b1f17b1804b1-42304827da4mr30202045e9.12.1718386399594;
        Fri, 14 Jun 2024 10:33:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320bfdsm69043695e9.37.2024.06.14.10.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 10:33:18 -0700 (PDT)
Date: Fri, 14 Jun 2024 20:33:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
Message-ID: <882baf56-c922-465b-86a7-7cc787afd12e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_103322_000804_A8310E00 
X-CRM114-Status: UNSURE (   5.12  )
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

Hello Kalle Valo,

Commit d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7
devices") from Nov 28, 2022 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/ce.c:303 ath12k_ce_rx_post_pipe()
	error: we previously assumed 'pipe->dest_ring' could be null (see line 278)

drivers/net/wireless/ath/ath12k/ce.c
    271 static int ath12k_ce_rx_post_pipe(struct ath12k_ce_pipe *pipe)
    272 {
    273         struct ath12k_base *ab = pipe->ab;
    274         struct sk_buff *skb;
    275         dma_addr_t paddr;
    276         int ret = 0;
    277 
    278         if (!(pipe->dest_ring || pipe->status_ring))

This is the same as:

	if (!pipe->dest_ring && !pipe->status_ring)

Imagine that ->dest_ring is NULL but ->status_ring isn't.

    279                 return 0;
    280 
    281         spin_lock_bh(&ab->ce.ce_lock);
    282         while (pipe->rx_buf_needed) {
    283                 skb = dev_alloc_skb(pipe->buf_sz);
    284                 if (!skb) {
    285                         ret = -ENOMEM;
    286                         goto exit;
    287                 }
    288 
    289                 WARN_ON_ONCE(!IS_ALIGNED((unsigned long)skb->data, 4));
    290 
    291                 paddr = dma_map_single(ab->dev, skb->data,
    292                                        skb->len + skb_tailroom(skb),
    293                                        DMA_FROM_DEVICE);
    294                 if (unlikely(dma_mapping_error(ab->dev, paddr))) {
    295                         ath12k_warn(ab, "failed to dma map ce rx buf\n");
    296                         dev_kfree_skb_any(skb);
    297                         ret = -EIO;
    298                         goto exit;
    299                 }
    300 
    301                 ATH12K_SKB_RXCB(skb)->paddr = paddr;
    302 
--> 303                 ret = ath12k_ce_rx_buf_enqueue_pipe(pipe, skb, paddr);
                                                            ^^^^
Unchecked dereference of pipe->dest_ring inside the function.

    304                 if (ret) {
    305                         ath12k_warn(ab, "failed to enqueue rx buf: %d\n", ret);
    306                         dma_unmap_single(ab->dev, paddr,
    307                                          skb->len + skb_tailroom(skb),
    308                                          DMA_FROM_DEVICE);
    309                         dev_kfree_skb_any(skb);
    310                         goto exit;
    311                 }
    312         }
    313 
    314 exit:
    315         spin_unlock_bh(&ab->ce.ce_lock);
    316         return ret;
    317 }

regards,
dan carpenter

