Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760A6C61DA4
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rSV4Rs02w2Nro2N6aGW+8Em88tn6iiA2C0HDzgyF6Pc=; b=uPRLrUOME4lWsZ
	zufAC50zJd+GnLetDHlktoY2S/mo5N2wpgmTSGePw2Xi5DfBsZMLI9ekNh3yAfNbN2n97kiZemlWj
	pGGkuOWUlFR8MPurecZRm9hiJgO0SeV20YL0JWdQuHjfxEpaUwBS7qwNms58cdZtws3ABREe++uOK
	3lTjP8NVKuxLkkd4cruRV3kopGYi/8QCsBhclJ4bFnax2f5IWjIpezpPfOMaPHj1K25n8ixv3lM1P
	5StfHfx4QsThpAS2Skt9Ohit1e+JGWJnb0rcsAOdzB6bOZe+kW6lQ04WKhR0xLGzogWHZf6ABIjOx
	XyeFBmoPT/3pw2r9SouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSenJ-00ATiC-SB
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 13:59:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSenH-00ATh9-1Z
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 13:59:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id d40so3087703eda.8
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 05:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWnxOXJWrLRO0rOLU2hnvBrK74mGy0kyTT4E3Ui+XSw=;
        b=AUAIFXE8CyvXtjYr2a/OHGsF2cxasmd6xVMpU4VdFh2Iyn4qfLb4K2cX9m9tuwL2YG
         qPeM3iwxGegRrMLrhd3HC7n6Kh1FImk8mFbwzVmkjGxKESkwWbtcoD/0nR4dQGI5Mhyx
         WXPcXbUhDii7Dkb8CZnPKav1QJszxpxksL0G6Nw0tYK/kYE3Vg6GNjFSvx6uFOF+nXq+
         R+GNRrmMhmlvsDl+VwUTE2d2TEHM3FkaYnC8Bj1Ygec4xSCSPFDJoLXUCEaAk4AVyKqe
         Se0hbd29JBNx3/oHDH3RO85P2AWw++vMoBLBe1HgMqakn+ax64eafKogEwLzsPD57Yo7
         H1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWnxOXJWrLRO0rOLU2hnvBrK74mGy0kyTT4E3Ui+XSw=;
        b=AlpBgRNh7a+LdXBKxS4hhyCijGQPhQIhGuSZ9Ohd9/A0KGdbTgP7rRtlulqC89esGf
         FVIccktEVMaYZ7obUK27O7F50ZzMY02L/m1L8nHgEmwtVzzUBy7QbD7lyZRqIDVBWikA
         mCFhZyFayjPvKiLdKefTrSy1y1+2fzn71QuBrFYwuRM9bY1LYoq0CDBCRolAkCfAVSVz
         w6oLBadLJkup2roR/eXmiJaPdjtCRKD8VAhfKbhcOw8epHFB0MMDV0Y/W4yqqtvxQ/HA
         d71BAFr+8kl3ZV+RlBI8iz4EQH0kxaeR+nsbkddh9gPl3AqiHModmuno1IBalKd5q7yR
         464g==
X-Gm-Message-State: AO0yUKUiAY+GnGGZGCtGx9qlu1BMDwfNQc58KUIpTVTJfhvQrixGMLk2
	LVLgt/AIpzJb56UdVr8b2u8=
X-Google-Smtp-Source: AK7set9Qs5lQ//9v4JtF0LDglnZH21a/NxaaNAODcQZbpu+IHCSL8coyiBISaxAJvCNL8TwzesEe4w==
X-Received: by 2002:aa7:d04c:0:b0:4ad:4c4e:2b66 with SMTP id n12-20020aa7d04c000000b004ad4c4e2b66mr1581702edo.11.1676555964549;
        Thu, 16 Feb 2023 05:59:24 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a50f61e000000b004ac089bb600sm932430edn.0.2023.02.16.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:59:24 -0800 (PST)
Date: Thu, 16 Feb 2023 16:59:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: resource leak in ath12k_dp_srng_setup()
Message-ID: <Y+42uErUlW1RuHSf@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_055927_106145_083E2C01 
X-CRM114-Status: UNSURE (   6.70  )
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

drivers/net/wireless/ath/ath12k/dp.c:310 ath12k_dp_srng_setup() warn: 'ring->vaddr_unaligned' from dma_alloc_coherent() not released on lines: 298,305.

drivers/net/wireless/ath/ath12k/dp.c
    217 int ath12k_dp_srng_setup(struct ath12k_base *ab, struct dp_srng *ring,
    218                          enum hal_ring_type type, int ring_num,
    219                          int mac_id, int num_entries)
    220 {
    221         struct hal_srng_params params = { 0 };
    222         int entry_sz = ath12k_hal_srng_get_entrysize(ab, type);
    223         int max_entries = ath12k_hal_srng_get_max_entries(ab, type);
    224         int ret;
    225 
    226         if (max_entries < 0 || entry_sz < 0)
    227                 return -EINVAL;
    228 
    229         if (num_entries > max_entries)
    230                 num_entries = max_entries;
    231 
    232         ring->size = (num_entries * entry_sz) + HAL_RING_BASE_ALIGN - 1;
    233         ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
    234                                                    &ring->paddr_unaligned,
    235                                                    GFP_KERNEL);
    236         if (!ring->vaddr_unaligned)
    237                 return -ENOMEM;
    238 
    239         ring->vaddr = PTR_ALIGN(ring->vaddr_unaligned, HAL_RING_BASE_ALIGN);
    240         ring->paddr = ring->paddr_unaligned + ((unsigned long)ring->vaddr -
    241                       (unsigned long)ring->vaddr_unaligned);
    242 
    243         params.ring_base_vaddr = ring->vaddr;
    244         params.ring_base_paddr = ring->paddr;
    245         params.num_entries = num_entries;
    246         ath12k_dp_srng_msi_setup(ab, &params, type, ring_num + mac_id);
    247 
    248         switch (type) {
    249         case HAL_REO_DST:
    250                 params.intr_batch_cntr_thres_entries =
    251                                         HAL_SRNG_INT_BATCH_THRESHOLD_RX;
    252                 params.intr_timer_thres_us = HAL_SRNG_INT_TIMER_THRESHOLD_RX;
    253                 break;
    254         case HAL_RXDMA_BUF:
    255         case HAL_RXDMA_MONITOR_BUF:
    256         case HAL_RXDMA_MONITOR_STATUS:
    257                 params.low_threshold = num_entries >> 3;
    258                 params.flags |= HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN;
    259                 params.intr_batch_cntr_thres_entries = 0;
    260                 params.intr_timer_thres_us = HAL_SRNG_INT_TIMER_THRESHOLD_RX;
    261                 break;
    262         case HAL_TX_MONITOR_DST:
    263                 params.low_threshold = DP_TX_MONITOR_BUF_SIZE_MAX >> 3;
    264                 params.flags |= HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN;
    265                 params.intr_batch_cntr_thres_entries = 0;
    266                 params.intr_timer_thres_us = HAL_SRNG_INT_TIMER_THRESHOLD_RX;
    267                 break;
    268         case HAL_WBM2SW_RELEASE:
    269                 if (ab->hw_params->hw_ops->dp_srng_is_tx_comp_ring(ring_num)) {
    270                         params.intr_batch_cntr_thres_entries =
    271                                         HAL_SRNG_INT_BATCH_THRESHOLD_TX;
    272                         params.intr_timer_thres_us =
    273                                         HAL_SRNG_INT_TIMER_THRESHOLD_TX;
    274                         break;
    275                 }
    276                 /* follow through when ring_num != HAL_WBM2SW_REL_ERR_RING_NUM */
    277                 fallthrough;
    278         case HAL_REO_EXCEPTION:
    279         case HAL_REO_REINJECT:
    280         case HAL_REO_CMD:
    281         case HAL_REO_STATUS:
    282         case HAL_TCL_DATA:
    283         case HAL_TCL_CMD:
    284         case HAL_TCL_STATUS:
    285         case HAL_WBM_IDLE_LINK:
    286         case HAL_SW2WBM_RELEASE:
    287         case HAL_RXDMA_DST:
    288         case HAL_RXDMA_MONITOR_DST:
    289         case HAL_RXDMA_MONITOR_DESC:
    290                 params.intr_batch_cntr_thres_entries =
    291                                         HAL_SRNG_INT_BATCH_THRESHOLD_OTHER;
    292                 params.intr_timer_thres_us = HAL_SRNG_INT_TIMER_THRESHOLD_OTHER;
    293                 break;
    294         case HAL_RXDMA_DIR_BUF:
    295                 break;
    296         default:
    297                 ath12k_warn(ab, "Not a valid ring type in dp :%d\n", type);
    298                 return -EINVAL;

ring->vaddr_unaligned not released on error path.

    299         }
    300 
    301         ret = ath12k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
    302         if (ret < 0) {
    303                 ath12k_warn(ab, "failed to setup srng: %d ring_id %d\n",
    304                             ret, ring_num);
    305                 return ret;
    306         }
    307 
    308         ring->ring_id = ret;
    309 
--> 310         return 0;
    311 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
