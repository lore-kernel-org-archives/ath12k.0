Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296A3C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/LtOqXkVisaLaf2bfXyi+MXGOqrNQ9qaK/l03Ozjr1s=; b=dFGZa5/LBwYHnu
	Hpq1N+ITq3wm3i47HI/GYgFpwE6/JqjyaKls2miB4wyay6Z5wT+iNzZvViOe7EHkPHED4ug09pW1M
	Yi0i/btkmN1D5vmabozciIf5KLiZw9w17PYCZ/ZgUnZ4r1wL4iA2ZJqikwUBQ0oiGN+qRQUD34qxJ
	vy5TRA3Gj7hGB0yMsnGj9KUGz40PEJJL2XhSV0L1lpBbdj0yQeptOolEyw+OpTVeL2xQyVwuSIJRI
	VkJiXsYs8la4qtCn6nLLi8bPr9DCaEbqYNSFMIN1QJyZu1biK/tulIobvqVdx/zN8WxVfhs1LcwNE
	yJZ2OrhqfvtnZnBH5jQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeoy-00AU8X-K5
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:01:12 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeow-00AU7u-7M
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:01:11 +0000
Received: by mail-ed1-x529.google.com with SMTP id fi26so3121367edb.7
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 06:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dW6cWHvs1WTfCkpwEX5wzxgl9B5bM45O9Lh7Gt6VWpE=;
        b=CLgVpFMohxjulOy4WcrXLVv8JE6Ilwgjd46RHnYMGEbtCMWhqqJaDLaX5r81iaf4Cq
         XYB1ZTiKPJiKtbu9o0bblNbhJGTwbd+vpxfTlvuwBA2A5fCVAXZO0vPsWv9Lo4nbJ9jf
         Sw9aiYUx5IkIgzfW7DnPdAQwc/RkyfIQ/C6GfHaR86DkQml8GaYgi3MpD0TgaM4J14jk
         aplgFtCdaYb8LMsOfGk6lqkWlHuTy31RrkOPvPHXi/hOIG+W1acnMeIvyib1Hx7LI16G
         qlYeo0Dg/ChJ/qHlnS588VxRFYdTXvSgSQko4kGr/8EteJ82+3rz5tOsjB/AO+Aw1p5S
         rYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dW6cWHvs1WTfCkpwEX5wzxgl9B5bM45O9Lh7Gt6VWpE=;
        b=xQreNQYke0Qr5U3Rql3zXm7LjAYCll/BJMnZitKU1B6MgX4mcY5CmYS2gJNNd/XCDl
         JZ5V5dj5zU//qxTuPBqzrYRukJvpPdG1Z3MABx6fLFKLiFsviYxIFXrM+T92fvyRfmBQ
         NpbLHIOLZTPiYQrWP95xodsjMlUbncOsIjjxOgyaBidN5iLX7TA3ylDbUUlbJeoqWEOF
         55X6dD4/47ag6fohyeZ4PVFH3m/GCCJ5Mz74LNgAo3zLu8fmgK/mo43jokYYxl7y5VpP
         84cimhod5CYYRhxsxePH9Qj2MAfFtyNwr9R4vLlxLPLzP00bsBiC2I+xPOrtW6MHza6s
         uciw==
X-Gm-Message-State: AO0yUKVGwH09bxLE4f61qwdEe6EUgwDS9lUAwYrXExzh5ljgC6qOLavf
	VxdnzguJhtftDesXtxA6ESU=
X-Google-Smtp-Source: AK7set+mECOpE8rO9faQOh0I6UBzqANxcpUo/obHTsL5llFVu4Vitp8n9f/Cht6sZW/Hp78cq5PBRw==
X-Received: by 2002:aa7:c983:0:b0:4a2:7b8d:f3c4 with SMTP id c3-20020aa7c983000000b004a27b8df3c4mr5781797edt.7.1676556068994;
        Thu, 16 Feb 2023 06:01:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l21-20020a50d6d5000000b004aab36ad060sm896665edj.92.2023.02.16.06.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:01:08 -0800 (PST)
Date: Thu, 16 Feb 2023 17:01:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: confusing alignment
Message-ID: <Y+43IBa2D6Q0EA41@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060110_287618_CDE005A8 
X-CRM114-Status: UNSURE (   5.62  )
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

drivers/net/wireless/ath/ath12k/dbring.c:94 ath12k_dbring_fill_bufs() warn: assigning negative subtract to bytes: 'size = 8 + ring->buf_sz + align - 1'
drivers/net/wireless/ath/ath12k/dbring.c:288 ath12k_dbring_buffer_release_event() warn: assigning negative subtract to bytes: 'size = 8 + ring->buf_sz + ring->buf_align - 1'

drivers/net/wireless/ath/ath12k/dbring.c
    75 static int ath12k_dbring_fill_bufs(struct ath12k *ar,
    76                                    struct ath12k_dbring *ring,
    77                                    gfp_t gfp)
    78 {
    79         struct ath12k_dbring_element *buff;
    80         struct hal_srng *srng;
    81         struct ath12k_base *ab = ar->ab;
    82         int num_remain, req_entries, num_free;
    83         u32 align;
    84         int size, ret;
    85 
    86         srng = &ab->hal.srng_list[ring->refill_srng.ring_id];
    87 
    88         spin_lock_bh(&srng->lock);
    89 
    90         num_free = ath12k_hal_srng_src_num_free(ab, srng, true);
    91         req_entries = min(num_free, ring->bufs_max);
    92         num_remain = req_entries;
    93         align = ring->buf_align;
--> 94         size = sizeof(*buff) + ring->buf_sz + align - 1;

Where does this - 1 come from?  I feel like this should be:

	size = sizeof(*buff) + ALIGN(ring->buf_sz, ring->buf_align);

    95 
    96         while (num_remain > 0) {
    97                 buff = kzalloc(size, gfp);
    98                 if (!buff)
    99                         break;
    100 
    101                 ret = ath12k_dbring_bufs_replenish(ar, ring, buff, gfp);
    102                 if (ret) {
    103                         ath12k_warn(ab, "failed to replenish db ring num_remain %d req_ent %d\n",
    104                                     num_remain, req_entries);
    105                         kfree(buff);
    106                         break;
    107                 }
    108                 num_remain--;
    109         }
    110 
    111         spin_unlock_bh(&srng->lock);
    112 
    113         return num_remain;
    114 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
