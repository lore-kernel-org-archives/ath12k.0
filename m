Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA39C636D6
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ar7Nuh8btGr8aG15GI9b9GDxyZXhmq6mqGYwr5r5JU=; b=wRkjaX9HEyVxWo
	2kUR2rjdjr+AISilA22VzvHRyP2yDLl9NXiU8ZhNaA9iDNZdSX5U0/SLHlo7g8s+c2MX39pLF1bxN
	VchYEDy09dDtGtzbOvCVzBl3vhtgsIM7NvHmPdu3pT/XOa78EteRg6nOHU94PA9rU7sEx5ExWn3bC
	Pies8G8jMnSjaEVgcF07B8DiFtIKMeVCH75dhK3TlRybQc5BLZk+T2NDGyUYa3kKmy6HuXKRSU7LJ
	ED/8UzaGs7TrvXGFH4aoSAeVkkb72KrX+7tsARU49FRGVVuwU+W/6qwSt/Y0ZIzM9alYehgYGBVrF
	zQUyN04MYNPCUT7b8/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSemz-00ATdJ-5i
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 13:59:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSemw-00ATcO-DT
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 13:59:07 +0000
Received: by mail-ed1-x52a.google.com with SMTP id fi26so3093993edb.7
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 05:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ik9dqPwWPjRxw2TcHa9m153tysofsVEba3E2OHCDtU=;
        b=O+o+M0sKb0IE/Ic1i+ph72DWKCSCcpJDZ9Am+XxjdgNYeXvc3tp8FFSJ8OlQ+wp8bH
         prhEGee2a6I5uPAsxOzXIWYChUymBL0Ur+z529VGO/o1Cb+h9WP0s7N7vAL6ZG24kHp8
         hFy04/ePwEKXrYuPYVAigWYps7syJEYto6srwrwsUZEc0E0bTBw24XzCfONJBgXUzFdx
         ZC+qG19jAtrwq1HuXeZesw1aJrVQHVX0cIrMp/yahgbXWGla1qqVUaq3pjWmP1KkQlwt
         IkBb4E+qwAy+wseAVHaE6twCuy62ecAgBEHknPc5FZnYiOw6ZKe9Bmm8APbZlVWAkcwl
         BZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ik9dqPwWPjRxw2TcHa9m153tysofsVEba3E2OHCDtU=;
        b=1v03gId644SZF1QXlUV1ITnDDrOMqtg9waoSxUUV8SyIe6ojdO4opS+ydHIRMbxP2h
         9N3EYw1tBzAM3vasYnadmCU8tarjHoOTrOfLsnr87EmCK8/PZ93xkEitRm/E5QNQV/VM
         K8fBSZ/ru8S/iB+eoKUF8hO8RPGLjZFDrITxzVf73X+rMCSH5j+lK7+4enboa8mey+Hy
         8p/LSzMEGciv938No5KCHXxj++mpxJKC6N1/f95e4tcU2gWIKMc1QzYFww8+kPzDlV7p
         xmcPzT7DMrjq2Ud/gtoGo4YzgPNIwTz/bbtfs6kzLA2CLM8ceTYM1U2Se8ZH9Vf3cUE9
         njQg==
X-Gm-Message-State: AO0yUKUDC4YxYmAV7PotI59b4DD0qRzAsk5K0El4Ey3AaVuDh2JRUPKU
	myw7YPblr7SMD54/aq2CPHY=
X-Google-Smtp-Source: AK7set/zri4IZkbAQ5NLYbEfNJ9NKvYhEea4NL+34vPRiXQcb1BdnzDOhZLUqDTZy0bDgwq+52Y2Kw==
X-Received: by 2002:a17:907:9884:b0:889:794d:f412 with SMTP id ja4-20020a170907988400b00889794df412mr5912720ejc.10.1676555944669;
        Thu, 16 Feb 2023 05:59:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906711000b008b17879ec95sm217456ejj.22.2023.02.16.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:59:04 -0800 (PST)
Date: Thu, 16 Feb 2023 16:59:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: sleeping in atomic bugs
Message-ID: <Y+42pE/OAPfgvWCe@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_055906_498613_0FA0AF21 
X-CRM114-Status: UNSURE (   5.93  )
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

Hello Kalle Valo,

The patch d889913205cf: "wifi: ath12k: driver for Qualcomm Wi-Fi 7
devices" from Nov 28, 2022, leads to the following Smatch static
checker warning:

drivers/net/wireless/ath/ath12k/dbring.c:39 ath12k_dbring_bufs_replenish() warn: make sure GFP_ATOMIC set here
drivers/net/wireless/ath/ath12k/dbring.c:97 ath12k_dbring_fill_bufs() warn: sleeping in atomic context

drivers/net/wireless/ath/ath12k/dbring.c
    10 static int ath12k_dbring_bufs_replenish(struct ath12k *ar,
    11                                         struct ath12k_dbring *ring,
    12                                         struct ath12k_dbring_element *buff,
    13                                         gfp_t gfp)
    14 {
    15         struct ath12k_base *ab = ar->ab;
    16         struct hal_srng *srng;
    17         dma_addr_t paddr;
    18         void *ptr_aligned, *ptr_unaligned, *desc;
    19         int ret;
    20         int buf_id;
    21         u32 cookie;
    22 
    23         srng = &ab->hal.srng_list[ring->refill_srng.ring_id];
    24 
    25         lockdep_assert_held(&srng->lock);
    26 
    27         ath12k_hal_srng_access_begin(ab, srng);
    28 
    29         ptr_unaligned = buff->payload;
    30         ptr_aligned = PTR_ALIGN(ptr_unaligned, ring->buf_align);
    31         paddr = dma_map_single(ab->dev, ptr_aligned, ring->buf_sz,
    32                                DMA_FROM_DEVICE);
    33 
    34         ret = dma_mapping_error(ab->dev, paddr);
    35         if (ret)
    36                 goto err;
    37 
    38         spin_lock_bh(&ring->idr_lock);
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Atomic context.

--> 39         buf_id = idr_alloc(&ring->bufs_idr, buff, 0, ring->bufs_max, gfp);
    40         spin_unlock_bh(&ring->idr_lock);

ath12k_dbring_buf_setup() passes GFP_KERNEL to here as the gfp.  I think
this is a sleeping in atomic bug.  The caller definitely has a bug.

    41         if (buf_id < 0) {
    42                 ret = -ENOBUFS;
    43                 goto err_dma_unmap;
    44         }
    45 

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
