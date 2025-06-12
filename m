Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5946C71136
	for <ath12k@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2Df3rjHwe0FG/vDkCe6qdIJH8gKqNp37jgiKCjMZZ8=; b=cK4sW29vbA6cMujE0ejue/8krQ
	THMdG8hYCWt4w2067yt78FnYfT3uyMASVNMmfDNVqdJrfk+KMAl3dbetbnj1x9HN0tGbeMrr32HXy
	5RFo1qINTQfIS30ff+tk5guvkf88S8C+o9vXk2mv3AuGjoBspUFKJwAdxh8gt2otAl1IJGoKgauQ/
	JrhQJgFjR1KiQUlExxrqmeQxuBD60HHbhKVoqaJs9IkIFKwkCtuMJSJHUdORfSdZFUTeyleP9pSKs
	dsmP08EYeV3KJagDSILxuPi/oIZlVZ9P355e8bDr5pLtyfb+qNaqdS0kQWnKmer5vYGRlnms75v4n
	ZlY9kUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhqw-0000000DOzb-2hVC;
	Thu, 12 Jun 2025 13:20:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgl8-0000000DDNO-42G4
	for ath12k@lists.infradead.org;
	Thu, 12 Jun 2025 12:10:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a5096158dcso787553f8f.1
        for <ath12k@lists.infradead.org>; Thu, 12 Jun 2025 05:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749730217; x=1750335017; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2Df3rjHwe0FG/vDkCe6qdIJH8gKqNp37jgiKCjMZZ8=;
        b=nRcvUgALOxw1E6pNXZi5aNLX7TMCVE0RN1F6aG14k2qhxSjsB/ahTMMqectGknRoYh
         3tMrNHCqxN8Y+0oVRU1yn+LB2/tci9MCRcdCLTrjd0h5zP2ohXNOkSHyZjVlRGNUqR3A
         scXIK0nv1KHm5wlj96jJx/rfOHBufh2juQcsvdToR40/UTjbOvCkDBIDv1DW6Pr+Y0Q/
         YkiWdAU5kF1yGliNKA0no2yJqFDoEPtM+qqdER6qkZKdJw95t9rpzvqWzYleW55VwqNJ
         po4t65bAt05W7AEH4+t1r9IRkvuHtaTmUVWHnyy7GM69uS+qjNCWx1AmcXGgHMcTeG9c
         1F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730217; x=1750335017;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J2Df3rjHwe0FG/vDkCe6qdIJH8gKqNp37jgiKCjMZZ8=;
        b=ac/TlIxuk+Q/KY/72yYiBvB619pos9BvsUcKAVSv4+/KMTX8oUaz+g0c1XJsnYj47O
         Ov2Te+QRoA8jedQ3ElXomz0jUj3tgPDXp6pw6CZOyntbh7yVpTlCHTi0jzWgHaO2AJlZ
         RUGKnXXljQiccuk2YQboLxO+B3mKmi2fnaHysYyjDj12RNP/GKDJU/mrNebctlbhGP5I
         ph1z9jkxcU1l9oH1/8xH4rAGp2gP2Ts7hu3BkzHoUBtcv99c+TTj87aL08SjWbUcQyx7
         t2MztkuUYCP3h+XNhGVmDhlZ3Onu6NXTd0Tk8or31vJ4b6DEZ0OABRAzX7vu4TaEgmN6
         VF2A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/040ZVQr9mO65cIqwH6CG+ez73d0WZdig/SU0+C9Eocu8nkaDgGZ1OhgnEj3X/WUMB6wP5M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzW4hooQkNpQ69XZw4KanB2r4zGsV+rZ2ggE9e/9AVqAGMHE41G
	INDAwu2EH6LG8rZYbawIjUpdcsZWMQEO4rcDoOAb4HexIL9BAL3EeHMhVY+q4w==
X-Gm-Gg: ASbGnctYfrZaiyj2L06ATbpfFmqGZFETpkgKBs8DSxDJD5nvB9jOfJ1evGSi+dKx4y0
	+fL79D72IZ2t4Uvg5AGgLT2wckW9v7avVXK3P9vxxsAyN8+yXimOkWEU07yZR3h5QPd0iT4efMH
	hzklNXN/FydTkHZzSEXbmNS9xjM7J4otDF/y2dPhkJ8s7CCL9eDX/ofPsepOrlIvOwjLZZxjiEQ
	m13wwu/cUv6GjR0LXKwURK0pibLPRh61alWkqtlGY74qpuhO8e2ut2Lhq9u/Hkrg99cu5XGKaiH
	J6eK8Tu7m7VZU+wu8OOViPUAiV+coSC3XdQeA4Tyt+ZBHV1Jq1GqSFd/l+51he4ZJrs4FgKs80c
	tuU3l
X-Google-Smtp-Source: AGHT+IHT68F9bp+GNEbJxJhqFGSxkFU0W/c0vw76DGIuCmFxVWqcf/3L6Wamnq5F9TS2vohA9+gDWA==
X-Received: by 2002:a05:6000:2403:b0:3a4:f038:af74 with SMTP id ffacd0b85a97d-3a5614dc92bmr1631896f8f.51.1749730216786;
        Thu, 12 Jun 2025 05:10:16 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c2d2sm19947015e9.1.2025.06.12.05.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 05:10:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 14:10:15 +0200
Message-Id: <DAKJLG9RLFCQ.3H8XQHL8ZY3GT@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Sivashankari Madhavan"
 <quic_sivamadh@quicinc.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: support average ack rssi in
 station dump
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Sowmiya Sree Elavalagan" <quic_ssreeela@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612114620.1055840-1-quic_ssreeela@quicinc.com>
In-Reply-To: <20250612114620.1055840-1-quic_ssreeela@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_051019_003988_684BE6B1 
X-CRM114-Status: GOOD (  14.42  )
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

On Thu Jun 12, 2025 at 1:46 PM CEST, Sowmiya Sree Elavalagan wrote:
> From: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
>
> Currently, the ACK RSSI value is not shown in station dump. Enable WMI
> resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
> management TX completion event from WMI. Update ACK RSSI value obtained
> in management and data frame completion path to ieee80211_tx_info. Also
> advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
> register to mac80211 layer so that ACK RSSI is added to station dump
> message.
>
> Example output :
> Station 00:03:7f:01:5c:4b (on wlp88s0)
>         inactive time:  46584 ms
>         rx bytes:       955
>         rx packets:     10
>         tx bytes:       769
>         tx packets:     6
>         tx retries:     81
>         tx failed:      0
>         rx drop misc:   0
>         signal:         -39 dBm
>         signal avg:     -40 dBm
>         tx bitrate:     6.0 MBit/s
>         tx duration:    1185 us
>         rx bitrate:     309.7 MBit/s 40MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-D=
CM 0
>         rx duration:    0 us
>         last ack signal:-41 dBm
>         avg ack signal: -40 dBm
>         authorized:     yes
>         authenticated:  yes
> 	.......
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-3
>
> Signed-off-by: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
[...]
> @@ -5651,6 +5655,8 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(stru=
ct ath12k_base *ab,
>  	param->pdev_id =3D ev->pdev_id;
>  	param->desc_id =3D ev->desc_id;
>  	param->status =3D ev->status;
> +	param->ppdu_id =3D ev->ppdu_id;
Hello,
It seems this ppdu_id is retrieved from frimware but not used in this patch=
set
Is this by design ?
> +	param->ack_rssi =3D ev->ack_rssi;
> =20
>  	kfree(tb);
>  	return 0;
> @@ -6552,7 +6558,8 @@ static void ath12k_mgmt_tx_compl_event(struct ath12=
k_base *ab, struct sk_buff *s
>  	}
> =20
>  	wmi_process_mgmt_tx_comp(ar, le32_to_cpu(tx_compl_param.desc_id),
> -				 le32_to_cpu(tx_compl_param.status));
> +				 le32_to_cpu(tx_compl_param.status),
> +				 le32_to_cpu(tx_compl_param.ack_rssi));
> =20
>  	ath12k_dbg(ab, ATH12K_DBG_MGMT,
>  		   "mgmt tx compl ev pdev_id %d, desc_id %d, status %d",
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless=
/ath/ath12k/wmi.h
> index ac18f75e0449..49010367dc06 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2486,6 +2486,7 @@ struct wmi_init_cmd {
>  #define WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION		GENMASK(5, 4)
>  #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64	BIT(5)
>  #define WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET      BIT(9)
> +#define WMI_RSRC_CFG_FLAG1_ACK_RSSI	BIT(18)
> =20
>  struct ath12k_wmi_resource_config_params {
>  	__le32 tlv_header;
> @@ -4445,6 +4446,8 @@ struct wmi_mgmt_tx_compl_event {
>  	__le32 desc_id;
>  	__le32 status;
>  	__le32 pdev_id;
> +	__le32 ppdu_id;
> +	__le32 ack_rssi;
>  } __packed;
> =20
>  struct wmi_scan_event {
>
> base-commit: 9f92c4a01c5268f57fa19dd7cbcb1f59b0e66da6

