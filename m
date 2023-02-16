Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29952C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+b5TXlVsal9cbdfLDtpWUY4qKBB6qpWzW0TaK0sKqdI=; b=o9/P8Rxf7PzosR
	PSB6cQ+YhFPuNslnEvjKqK73fzy055z4MVKI/o8QpBdZf+87uDSOHukTU3iqyjfsPKQL7mvdd/s4y
	8on8BvyWA1maGv45nk6EeuJWQ6GKDFpoI3GtPsPlViS4im/uiJe6fVeCx634SLDS1Uk54FTCN/VC+
	WbKstI7vzdKnpRUnmg6kAvXrqL0ZwyMxvvGBqY29oI3cjH6S6q3zydmH9wwITSJ3hoJf88K0CNumN
	qzmtjzIZv+H3/WvftbQm/0d2vmUdSSzas+y2IixBky/Vi1ZMzBRIRJI273EKMeCASXqZqyfDwiv08
	A7nNP3dSPsnpOiQdHIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSenC-00ATgU-JZ
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 13:59:22 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSen9-00ATf4-FC
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 13:59:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id u21so3129641edv.3
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 05:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFpKfYulu0F1GgK90CzpwEFATbWVW+JGogP8wnnrX0Y=;
        b=YodJpH71txgopSo2TS0jsKxwjkOfgXHqpMmrrK0+P5TGmoT4pcoHatoO2LUQjzK8wE
         2Ew+3nTzsIcL98OfPXQw6GDNhCKAmjQGhAhRsRZ/k01vAPYSgxeYScNrmoyAmYxFWZ7V
         unNfqNhno+ZH7VdX7PdqO1Objscmx2RcLJgpr3fOoB3kuhW8KVXHmnNEoHWKQazLvhmy
         RINvlc3n64oijWBmWxbrZDc6Y7Im0oUl4MUoio9CbilWX3WRLTMYPfuzoU1SswjusWQi
         FqgjGUyLlrgj5o5BG5xLOL38on9ScIyjygZGNY3XuRYE1lM1mWqiUjNBaoPXuKcC7mO3
         KBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFpKfYulu0F1GgK90CzpwEFATbWVW+JGogP8wnnrX0Y=;
        b=kPfv0cfISlmFN47imvmjt6qhfR8rbd28z4lCqwcIcykl2zAnB4JdlenCVLdOAnqLnT
         mLDCrt6zuMK8NsusfpW/sQ5n15YZ1Kcu1euMAcrY1VMCGH5e8osN3Cezy9q+T61j1nTb
         QEPmowzU8emY1bZNSTplS/TQpeEvZmhvULIUcLZLzovzVx7c+dEDLnU2SRkziyCp3kqZ
         s9kOOklnx5nQhx/pyDlB7deVNLXrfbLnml/lCL6bJNjdr0Y6mDV9xcbFRFCGCuSBSNe7
         Sz7eA5IBqp64ISQzzExcRktNHpVu0Sl3YCTgbVpqFEYvzAcgcbyeceKu0IgW6l/4kf56
         ZMnQ==
X-Gm-Message-State: AO0yUKWXts3e8mqYzlrMOsZvTmgosOwE8DuCFhXJJ/fuSrMP0fwKIFt2
	UF+ifd24hBL/uuzJ2rT6e5H9ZFfuOciLyA==
X-Google-Smtp-Source: AK7set/nI3Vohe4URSnybLUZ4my7r2yhOpnINCRHPeiaYp0WlXF+zv9fzTLgW6d1h8PFdK4d0C9f8g==
X-Received: by 2002:aa7:c656:0:b0:4ac:beba:dc87 with SMTP id z22-20020aa7c656000000b004acbebadc87mr5261721edr.0.1676555956191;
        Thu, 16 Feb 2023 05:59:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g5-20020a50d0c5000000b004acb7f05589sm900557edf.94.2023.02.16.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:59:15 -0800 (PST)
Date: Thu, 16 Feb 2023 16:59:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: ath12k_dbring_buffer_release_event() is
 broken
Message-ID: <Y+42ri2Ai6Df9k9R@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_055919_529753_3ED779A1 
X-CRM114-Status: UNSURE (   7.51  )
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

	drivers/net/wireless/ath/ath12k/dbring.c:281 ath12k_dbring_buffer_release_event()
	error: bogus initialized NULL 'ring'.

drivers/net/wireless/ath/ath12k/dbring.c
    230 int ath12k_dbring_buffer_release_event(struct ath12k_base *ab,
    231                                        struct ath12k_dbring_buf_release_event *ev)
    232 {
    233         struct ath12k_dbring *ring = NULL;
    234         struct hal_srng *srng;
    235         struct ath12k *ar;
    236         struct ath12k_dbring_element *buff;
    237         struct ath12k_dbring_data handler_data;
    238         struct ath12k_buffer_addr desc;
    239         u8 *vaddr_unalign;
    240         u32 num_entry, num_buff_reaped;
    241         u8 pdev_idx, rbm;
    242         u32 cookie;
    243         int buf_id;
    244         int size;
    245         dma_addr_t paddr;
    246         int ret = 0;
    247 
    248         pdev_idx = le32_to_cpu(ev->fixed.pdev_id);
    249 
    250         if (pdev_idx >= ab->num_radios) {
    251                 ath12k_warn(ab, "Invalid pdev id %d\n", pdev_idx);
    252                 return -EINVAL;
    253         }
    254 
    255         if (ev->fixed.num_buf_release_entry !=
    256             ev->fixed.num_meta_data_entry) {
    257                 ath12k_warn(ab, "Buffer entry %d mismatch meta entry %d\n",
    258                             ev->fixed.num_buf_release_entry,
    259                             ev->fixed.num_meta_data_entry);
    260                 return -EINVAL;
    261         }
    262 
    263         ar = ab->pdevs[pdev_idx].ar;
    264 
    265         rcu_read_lock();
    266         if (!rcu_dereference(ab->pdevs_active[pdev_idx])) {
    267                 ret = -EINVAL;
    268                 goto rcu_unlock;
    269         }
    270 
    271         switch (ev->fixed.module_id) {
    272         case WMI_DIRECT_BUF_SPECTRAL:
    273                 break;
    274         default:
    275                 ring = NULL;
    276                 ath12k_warn(ab, "Recv dma buffer release ev on unsupp module %d\n",
    277                             ev->fixed.module_id);
    278                 break;
    279         }
    280 
--> 281         if (!ring) {

"ring" is always NULL here.

    282                 ret = -EINVAL;
    283                 goto rcu_unlock;
    284         }
    285 
    286         srng = &ab->hal.srng_list[ring->refill_srng.ring_id];
    287         num_entry = le32_to_cpu(ev->fixed.num_buf_release_entry);
    288         size = sizeof(*buff) + ring->buf_sz + ring->buf_align - 1;
    289         num_buff_reaped = 0;
    290 
    291         spin_lock_bh(&srng->lock);
    292 
    293         while (num_buff_reaped < num_entry) {
    294                 desc.info0 = ev->buf_entry[num_buff_reaped].paddr_lo;
    295                 desc.info1 = ev->buf_entry[num_buff_reaped].paddr_hi;
    296                 handler_data.meta = ev->meta_data[num_buff_reaped];
    297 
    298                 num_buff_reaped++;
    299 
    300                 ath12k_hal_rx_buf_addr_info_get(&desc, &paddr, &cookie, &rbm);
    301 
    302                 buf_id = u32_get_bits(cookie, DP_RXDMA_BUF_COOKIE_BUF_ID);
    303 
    304                 spin_lock_bh(&ring->idr_lock);
    305                 buff = idr_find(&ring->bufs_idr, buf_id);
    306                 if (!buff) {
    307                         spin_unlock_bh(&ring->idr_lock);
    308                         continue;
    309                 }
    310                 idr_remove(&ring->bufs_idr, buf_id);
    311                 spin_unlock_bh(&ring->idr_lock);
    312 
    313                 dma_unmap_single(ab->dev, buff->paddr, ring->buf_sz,
    314                                  DMA_FROM_DEVICE);
    315 
    316                 if (ring->handler) {
    317                         vaddr_unalign = buff->payload;
    318                         handler_data.data = PTR_ALIGN(vaddr_unalign,
    319                                                       ring->buf_align);
    320                         handler_data.data_sz = ring->buf_sz;
    321 
    322                         ring->handler(ar, &handler_data);
    323                 }
    324 
    325                 memset(buff, 0, size);
    326                 ath12k_dbring_bufs_replenish(ar, ring, buff, GFP_ATOMIC);
    327         }
    328 
    329         spin_unlock_bh(&srng->lock);
    330 
    331 rcu_unlock:
    332         rcu_read_unlock();
    333 
    334         return ret;
    335 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
