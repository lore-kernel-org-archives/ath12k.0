Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC01C61DA4
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d3EOPPpJqK4kn6+WVHj4tmfsRTgeV0QCl1PqhdfTllA=; b=zTyYOPivowEc96
	GviH494QgngxLcGTqTOWGbRxDyWd7TwdJ7KmBjVTf6tV/nUibMhgnFMCn4pPy2JaITHS/fj3/a/hs
	bWH5uKMdHz0qXXISzcBhUivCkxGR/g+XLbNta1+exYKriW/uKB97/ulKgrHASgPyNoRTbCzD4otty
	dm0/kEjwDbfdZBMua5BFVon7FK8A1rb2B7Z3i/lrPAXmI1uSECv+m/E+YkawPeHrtgGql2PO/9OE8
	Sk7cMChk0IM5dVOWF7JbP/jrtHnqJVq5n5yXB7J9PppEKW9BacETxk3Fw6OxEKu+YuPz14+Rvrkeh
	BZc1BCEvxvDlNjFkwceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSep8-00AUAm-1O
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:01:22 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSep6-00AU9x-3B
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:01:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id n20so3308628edy.0
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 06:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xG7X+G/r2S8LiNylDzxotczDV3BUOZKt/dBfMAf1NG8=;
        b=QGoacLOkYB2t9lPJOeEoWevGywhIm80iE74NqVrbHdwFh5X/8AmT0UvcW/7LGwHeD1
         yUuLT/jSQMXX3UCgLeqrgZF+tuwdIKRUMQDO0bGTJbIyVutCcZ0QIo2INlK1RpoM/QTP
         Eawh0zP7lL/OeGqUTjhcx2ZrO9eGV56R8VkInqJy0uUa2ePfPWB3CN8DCjp5htCHcBJS
         PtFS1DKgASnRdbUnz2zy2/YEzIqJZtOqQj2vmvmxycO3Zaa4BuLN3WksYOwQCELPli5T
         gSsTcRjvs8IBsJNAYp7wBu+T1mwzi+5dYfC9AmbJ59se+1GtLg/vlJxXjIK8MkT4DZVr
         1elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xG7X+G/r2S8LiNylDzxotczDV3BUOZKt/dBfMAf1NG8=;
        b=e2F0ZsxFHKDgKMcmgd4P148R6q/h96jAJqwddPRBRgGaAREj8gPXDDXSie7LqQ09x5
         rZyyv+7V/uuMw5axwOyqNs3QYfbem8R73DCTqnKua6osOIxP0E1gq9XDVcYFNkLt+tN1
         0z9G/gkqZB9p9ftG4wQv1FU9r7Oj53jhrNxtnMI+T69oWU9kTh3YJT58GX1PYV9CPxua
         r82BicVNSz3jvJctEK5dssoCE5mR66JYn5PXU210tKNRUIKVHyhTN+rID4Ib3p3s996Y
         Glr4Tg8eaH9NZ/B1zgjV68HxRmKOHozxi/o86zEx5v7bzzaV0ORdEdpKantipVQmbhVN
         lOKw==
X-Gm-Message-State: AO0yUKUtudSB6MLUlcmVylzfsE0+o4sx8/vsZDWnjgHRWRzhgkxw0j9Y
	HMlbSiaZISX9fh3DL4ACH5A=
X-Google-Smtp-Source: AK7set/Vvyb61by5WJJI7ciSHOGFI6VghSAebmTAWaKZhXLZZfgKU3UwMoiFs00D070Y52aLhpJWpQ==
X-Received: by 2002:a17:906:4dc4:b0:896:427b:148 with SMTP id f4-20020a1709064dc400b00896427b0148mr6061780ejw.1.1676556078695;
        Thu, 16 Feb 2023 06:01:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bx8-20020a170906a1c800b007c14ae38a80sm836104ejb.122.2023.02.16.06.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:01:18 -0800 (PST)
Date: Thu, 16 Feb 2023 17:01:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: uninitialized variables
Message-ID: <Y+43J8N4GUT3qY25@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060120_157546_389B4BD9 
X-CRM114-Status: UNSURE (   5.14  )
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

drivers/net/wireless/ath/ath12k/dp_mon.c:2029 ath12k_dp_mon_tx_parse_mon_status() error: uninitialized symbol 'num_user'.
drivers/net/wireless/ath/ath12k/dp.c:210 ath12k_dp_srng_msi_setup() error: uninitialized symbol 'addr_lo'.
drivers/net/wireless/ath/ath12k/dp.c:211 ath12k_dp_srng_msi_setup() error: uninitialized symbol 'addr_hi'.
drivers/net/wireless/ath/ath12k/mac.c:1630 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:1630 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
drivers/net/wireless/ath/ath12k/mac.c:1632 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/ce.c:485 ath12k_ce_srng_msi_ring_params_setup() error: uninitialized symbol 'addr_lo'.
drivers/net/wireless/ath/ath12k/ce.c:486 ath12k_ce_srng_msi_ring_params_setup() error: uninitialized symbol 'addr_hi'.

drivers/net/wireless/ath/ath12k/dp_mon.c
    2002 enum hal_rx_mon_status
    2003 ath12k_dp_mon_tx_parse_mon_status(struct ath12k *ar,
    2004                                   struct ath12k_mon_data *pmon,
    2005                                   int mac_id,
    2006                                   struct sk_buff *skb,
    2007                                   struct napi_struct *napi,
    2008                                   u32 ppdu_id)
    2009 {
    2010         struct ath12k_base *ab = ar->ab;
    2011         struct dp_mon_tx_ppdu_info *tx_prot_ppdu_info, *tx_data_ppdu_info;
    2012         struct hal_tlv_hdr *tlv;
    2013         u8 *ptr = skb->data;
    2014         u16 tlv_tag;
    2015         u16 tlv_len;
    2016         u32 tlv_userid = 0;
    2017         u8 num_user;
    2018         u32 tlv_status = DP_MON_TX_STATUS_PPDU_NOT_DONE;
    2019 
    2020         tx_prot_ppdu_info = ath12k_dp_mon_tx_get_ppdu_info(pmon, ppdu_id,
    2021                                                            DP_MON_TX_PROT_PPDU_INFO);
    2022         if (!tx_prot_ppdu_info)
    2023                 return -ENOMEM;
    2024 
    2025         tlv = (struct hal_tlv_hdr *)ptr;
    2026         tlv_tag = le32_get_bits(tlv->tl, HAL_TLV_HDR_TAG);
    2027 
    2028         tlv_status = ath12k_dp_mon_tx_status_get_num_user(tlv_tag, tlv, &num_user);
--> 2029         if (tlv_status == DP_MON_TX_STATUS_PPDU_NOT_DONE || !num_user)

num_user is not intialized if tlv_status == DP_MON_RX_RESPONSE_REQUIRED_INFO.

    2030                 return -EINVAL;
    2031 
    2032         tx_data_ppdu_info = ath12k_dp_mon_tx_get_ppdu_info(pmon, ppdu_id,
    2033                                                            DP_MON_TX_DATA_PPDU_INFO);
    2034         if (!tx_data_ppdu_info)
    2035                 return -ENOMEM;
    2036 

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
