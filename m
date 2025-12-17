Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D9DD64087
	for <ath12k@archiver.kernel.org>; Wed, 17 Dec 2025 07:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ePQaSrUNe0VSj65MqKfLoZ6FNLKF2itnxk9+iMK7wGA=; b=BCFu2aWmSRdu/OBzHkLeMwYa00
	hf4eLPMWI4IEY4t6ypBFI/fe+cLSgvpIDsH0jVZPCh8TWIKJj5JiG8EcPykWq4IDpNl7FfgMD0oAr
	4SEwMl63NETmW/bJNfYllz2jWco0CA4wAm+MCakIXGsIdqIN5FwEn+U14nV2flr5mkv3WN21ivlGb
	WDkGqQBs9BBMtt1zd/33bMxQ99eei8ABJxkFVXDGa0NUxWLlOm0/SzjXZF9tO7G2x02vaWcMvfqMK
	NpF4af+BdYbFhWX8kAuL1n410I2I5RDNB8Sw4LhMknLsfjNgCwAm3UL1DBIiFOou8ut5u0c+4EpVC
	+l6bQF7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmBc-00000006IVK-2pnE;
	Wed, 17 Dec 2025 07:43:04 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmBa-00000006IUp-21qk
	for ath12k@lists.infradead.org;
	Wed, 17 Dec 2025 07:43:03 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-477632b0621so37121915e9.2
        for <ath12k@lists.infradead.org>; Tue, 16 Dec 2025 23:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765957380; x=1766562180; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePQaSrUNe0VSj65MqKfLoZ6FNLKF2itnxk9+iMK7wGA=;
        b=Hwb4ZRe36/ghIzAzWEq4Vhr4/WeUtF57TXhAL0Lfv47lavaLvMAtN1YxNVe4+ocYTU
         zA1PRjFwmxF1uuF2rEkVGusxd/I2YFLQCickOGQBAty+V+YL37eH49ViqZOxGKd1Op6x
         +VXCPVHo9xhoa38zJFLWkz1DIkByO/5lKFG55XhC5mUHo70egHT9PI3ZsO1g7Y+CLgKs
         mMEFHcWFanN30AprV1EKbWvVTeLFPg1Ivdc/jnrvt5CN6HdqetbZuGrWTXLqAUjY8Urj
         vU7yS/R5CevZC4VUdDU04JLCUaitswdGWv6hDMi/TJxOq4STh9PEqfEmLEv5N7TWH/nF
         MXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765957380; x=1766562180;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePQaSrUNe0VSj65MqKfLoZ6FNLKF2itnxk9+iMK7wGA=;
        b=MhxIOZ3U8JUPyXGmGta1+N5hAjZcpMEJoEzAUYQr3a+9evNlAbtyISnHx60/AvlYjB
         gjXXZZSTs3IeihPyqH09vEH3CnuCrhecCFXtp/E08I25iZTyH1fiYDuQUAcGKBdRDXWB
         v2niyzRy1HMpOQxsFWuDd0Gct5QbxL9ASEvSljZ4D1l44dA3FhtheToGqTJLnQunm3nF
         mY00a07nyO49V8JJDzFProXl7blWbth694wVvJOPdj6j7LLHkQ4+q/T0sVyPvMJ0vUOO
         R7iTM2pxKRCyEcF/SoN4yfTFxAK08DE4c1c3QIbgtAw8XP+UGr2DgNptTtRMu00mUuX5
         DpKw==
X-Gm-Message-State: AOJu0Yx0cwhlxj9oSlVRPzwsWeZKsn97A2ACIbh7FrGW3K6Vxg/DZiO/
	lCqB5pPeuLaJFlae+HdgVdT3a7IuDVjDdNE8Tjy+7PsuICMOpEw/3Ago3yQfUqtUdLU=
X-Gm-Gg: AY/fxX5Qwp27Dr0GdviJFoVpmeRpU9kgZUjaSM7ujzFMblRJkVEknPyWl69zeOFHwUe
	Lkf7DTdWVC4eUIM48c8oIbzxKkCw5nLSWHPBsI5S25q2+X6O7iPQo8URdWN+LI3VGMO6xGkJm92
	lMZNYXQsxHoVIqJqqnEfl8PvO/1fL9FoQCliRrIUvZhw8tMBxdF+FGCnvu3Eqfwkk52NVne6wrq
	JuLzGcW2Tg6tbBbTlLTlYbpJ85OEk5bSNynC96P6Rcq7HbZnuv7CViiPVT62MsauJ4dOQiYQGSN
	48nHQ3XblRZuUPwS3aeg5a6zXJDY7E0xlVyZ0mfNqRZeyIfuJmN/6rpSAycL1FCTJfHWgWvdH7/
	DbxOGg8kYm1g5FJkncdNRq3JrGmeo3qoNxeyUBtmmCa8KVqUg1Gt59JNwF5fZtJmm6S8qLUMdOi
	TChGyi6q591bxb5Jmj
X-Google-Smtp-Source: AGHT+IGRNvfiHM61rCipsGgJrUd+KI0gepqdhMDg+d5DU5rBrYL7BSePgxqbKR1iSu44rSgB/1xZbw==
X-Received: by 2002:a05:600c:821a:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-47a8f89bc9amr187156175e9.8.1765957380183;
        Tue, 16 Dec 2025 23:43:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd995cc3fsm24133785e9.16.2025.12.16.23.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 23:42:59 -0800 (PST)
Date: Wed, 17 Dec 2025 10:42:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alok Singh <quic_aloksing@quicinc.com>
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: Move TX monitor functionality to Wi-Fi 7
 module
Message-ID: <aUJfAFmpAX3ZIv8N@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_234302_555047_A0075590 
X-CRM114-Status: UNSURE (   6.10  )
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

Hello Alok Singh,

Commit 52758ff7b50a ("wifi: ath12k: Move TX monitor functionality to
Wi-Fi 7 module") from Nov 10, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c:2537 ath12k_wifi7_dp_mon_tx_parse_mon_status()
	error: uninitialized symbol 'num_user'.

drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
    2508 enum hal_rx_mon_status
    2509 ath12k_wifi7_dp_mon_tx_parse_mon_status(struct ath12k_pdev_dp *dp_pdev,
    2510                                         struct ath12k_mon_data *pmon,
    2511                                         struct sk_buff *skb,
    2512                                         struct napi_struct *napi,
    2513                                         u32 ppdu_id)
    2514 {
    2515         struct ath12k_dp *dp = dp_pdev->dp;
    2516         struct ath12k_base *ab = dp->ab;
    2517         struct dp_mon_tx_ppdu_info *tx_prot_ppdu_info, *tx_data_ppdu_info;
    2518         struct hal_tlv_hdr *tlv;
    2519         u8 *ptr = skb->data;
    2520         u16 tlv_tag;
    2521         u16 tlv_len;
    2522         u32 tlv_userid = 0;
    2523         u8 num_user;
    2524         u32 tlv_status = DP_MON_TX_STATUS_PPDU_NOT_DONE;
    2525 
    2526         tx_prot_ppdu_info =
    2527                 ath12k_wifi7_dp_mon_tx_get_ppdu_info(pmon, ppdu_id,
    2528                                                      DP_MON_TX_PROT_PPDU_INFO);
    2529         if (!tx_prot_ppdu_info)
    2530                 return -ENOMEM;
    2531 
    2532         tlv = (struct hal_tlv_hdr *)ptr;
    2533         tlv_tag = le32_get_bits(tlv->tl, HAL_TLV_HDR_TAG);
    2534 
    2535         tlv_status = ath12k_wifi7_dp_mon_tx_status_get_num_user(tlv_tag, tlv,
    2536                                                                 &num_user);
--> 2537         if (tlv_status == DP_MON_TX_STATUS_PPDU_NOT_DONE || !num_user)
    2538                 return -EINVAL;

You didn't really introduce this bug, the patch just moves code around
so the scripts mark it as a new bug again.  If the
ath12k_wifi7_dp_mon_tx_status_get_num_user() function returns
DP_MON_RX_RESPONSE_REQUIRED_INFO then "num_user" is uninitialized.
There is a comment which says this needs to be fixed:
	/* TODO: need to update *num_users */

    2539 
    2540         tx_data_ppdu_info =
    2541                 ath12k_wifi7_dp_mon_tx_get_ppdu_info(pmon, ppdu_id,
    2542                                                      DP_MON_TX_DATA_PPDU_INFO);
    2543         if (!tx_data_ppdu_info)
    2544                 return -ENOMEM;
    2545 
    2546         do {
    2547                 tlv = (struct hal_tlv_hdr *)ptr;
    2548                 tlv_tag = le32_get_bits(tlv->tl, HAL_TLV_HDR_TAG);
    2549                 tlv_len = le32_get_bits(tlv->tl, HAL_TLV_HDR_LEN);
    2550                 tlv_userid = le32_get_bits(tlv->tl, HAL_TLV_USR_ID);
    2551 
    2552                 tlv_status = ath12k_wifi7_dp_mon_tx_parse_status_tlv(ab, pmon,
    2553                                                                      tlv_tag, ptr,
    2554                                                                      tlv_userid);
    2555                 ptr += tlv_len;
    2556                 ptr = PTR_ALIGN(ptr, HAL_TLV_ALIGN);
    2557                 if ((ptr - skb->data) >= DP_TX_MONITOR_BUF_SIZE)
    2558                         break;
    2559         } while (tlv_status != DP_MON_TX_FES_STATUS_END);
    2560 
    2561         ath12k_wifi7_dp_mon_tx_process_ppdu_info(dp_pdev, napi, tx_data_ppdu_info);
    2562         ath12k_wifi7_dp_mon_tx_process_ppdu_info(dp_pdev, napi, tx_prot_ppdu_info);
    2563 
    2564         return tlv_status;
    2565 }

regards,
dan carpenter

