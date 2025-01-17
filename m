Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C7C02183
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ODjOBO9MtIgABgcwAyfoWf9VIwAipEtpPJ9eBhJRg8=; b=cWK7Hznlz1mKPooOG042cIflda
	p34cq6bTNSp1UCiMlXyFk6U2udaZej2gMq5/r17F6OYU7AOvwL0a0xrNbM0pvnNmnzd7psr6GMlQ7
	V5s6Lng5N5bGmh0+PQWKFaQFupZXMNFpRlv+VGGOzK0k6D8sr6dagEr70daLgNVKaK5rv30g2op/y
	n1Ir2oAKqAcPk2C6Eq4Zl1jQL98O3KThWGkln5OZyeiQlLpd3au25m9mIHUYZDfdPaa3n3nbdP8fL
	f4YjqOudLd4suR5/W2oNTi30c9o1//GxRaspohEsmaDbbGUPJUsAV7yut6nfa/UVQY3MIWMWiZug+
	7PyQHoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYkbx-000000009eJ-1H4V
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 11:34:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYkbu-000000009dy-2gDy
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 11:33:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so19009925e9.1
        for <ath12k@lists.infradead.org>; Fri, 17 Jan 2025 03:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737113637; x=1737718437; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ODjOBO9MtIgABgcwAyfoWf9VIwAipEtpPJ9eBhJRg8=;
        b=T1YLFpKqD0e2ItczCMBy8r2N6PoeqAh6Q5antTzOK3O5Q36CiZ6tAX/KbQFCg6PaIp
         3VY86luVdW+Zs+ond6LQOPhJpaDWTz9ADlMdAgI7xqRjUIdigF9raLmKf3dlMr7ZMmcR
         z3HqJHFOlkljwUxeVjI0H0Apf4zJMzQD4umfuG8kyKq/gI3H9Ios5GMwWA/nqbcPYJvb
         ij3mcF5yoJgoJ2WB97JLvhTY9T0tniFKfS5Hl53t0bFNDIkJtHHyNbCOz8uExNh+Ft28
         1PI1YxPG4zHRq3rgJAy2u7hYYrzd7ctW76yjaE8shlqnsRcVC+iai0uYIcC+vOjpozW9
         n4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737113637; x=1737718437;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ODjOBO9MtIgABgcwAyfoWf9VIwAipEtpPJ9eBhJRg8=;
        b=jlQcTCh80xGRu5hwGD8/34d1cOCh6pVVkmCPlU97suMj0XkUKopDpud0u83PNJpijs
         iBRxbpMkbt660WfYTjIWPU+DIlpt9EhUOqYM2XGsNM/JSroq0lI6p3VrovdpwXtXVb7y
         YRIvV5yRXPFDiaJPf6pYi3250QAeWMs9aEQg6ZfajnezAxOC2cr7dUbHYvCK99dHRxJl
         Rff3YhBLJvPe6EoPYpWMxumWiotSCwOdMGA2xYjw9FBcBuHH8q13o+D5AHWuuu5MXDyB
         IqMmVx9McYYNJVZQssbyE74gSAb2TMKBAdNqOtouF7Xy40YF4CnzXs1VngDMWd1Z819x
         9lDg==
X-Forwarded-Encrypted: i=1; AJvYcCWUHBJXH29ErJNTbmGmnUwOZG03ZzWl77jfvqiY/kl+rHQFFe/qZ93E2DIWkFtobuQMa4IGIro=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0peelgJvMqykFiR+sH1fpvg2HGVz2cSVumFSfH8ro47xB4TWj
	9JGC4iMEom62kxt/0Hea9v5KyuwxTbBILNbuiCn3xCqHpvDBrC5h
X-Gm-Gg: ASbGncsnaR1L/VBqLBuI0kpviE5FVxNMk3n9Et/BtJG7kCwFKtJST9s1U8fpulXhKMF
	rGBpUSEJC3TBlSWgNU0ESntRxPhuChCJ9Se5IE+ReZs3so7f2+A0Y5EXfsDrtVxjmgOczqCGgI8
	3AG/XMnUgecSNllbYU4thS7jaOh6716bKHGXs8T2Ti2DPA1FOuas+nYbC/+5oUyRfgWI7Mfqvyt
	3j17rJVeT2tbxjehDR/pmuNGkQ4C/+9W9OnmVQ3QC06oN7Qkyt9xnvvMkguS+pUobPyZ1TIVDk=
X-Google-Smtp-Source: AGHT+IGvLIKvsqNW/P9Ywv7yw9j5IjfOYKM/JKR7riVV1MLqP/1HvyFrpjCQqxtjOMT0cR+RZvT7fw==
X-Received: by 2002:a05:600c:1e18:b0:436:8a6f:b6db with SMTP id 5b1f17b1804b1-4389141c12emr20626775e9.22.1737113636530;
        Fri, 17 Jan 2025 03:33:56 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c73e7140sm92797595e9.0.2025.01.17.03.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 03:33:56 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 12:33:55 +0100
Message-Id: <D74BE3ES4HZC.GJJ2MY3UH462@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "P Praneesh"
 <quic_ppranees@quicinc.com>
Subject: Re: [PATCH 7/7] wifi: ath12k: add monitor interface support on
 QCN9274
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
 <20250107021017.3857555-8-quic_periyasa@quicinc.com>
In-Reply-To: <20250107021017.3857555-8-quic_periyasa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_033358_680538_D08D98A0 
X-CRM114-Status: GOOD (  17.57  )
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

On Tue Jan 7, 2025 at 3:10 AM CET, Karthikeyan Periyasamy wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
>
> Currently, the monitor interface is not supported. To support the monitor
> interface, configure the monitor vdev state identifier, configure the HTT
> filter setup, subscribe the mac80211 WANT_MONITOR_VIF feature and prevent
> monitor interface to transmit packet. Therefore, add these procedures to
> add monitor interface support and enable the monitor interface support on
> the QCN9274 platform through the hardware parameter.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-3
>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> ---
[...]
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wirele=
ss/ath/ath12k/dp_tx.c
> index b8f0df6f7a05..81d1ff918f48 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights r=
eserved.
>   */
> =20
>  #include "core.h"
> @@ -1277,6 +1277,8 @@ int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(st=
ruct ath12k *ar, bool reset)
>  					HTT_RX_MON_MO_CTRL_FILTER_FLASG3 |
>  					HTT_RX_MON_FP_DATA_FILTER_FLASG3 |
>  					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
> +	} else {
> +		tlv_filter.rxmon_disable =3D true;
Shouldn't this be
	tlv_filter =3D ath12k_mac_mon_status_filter_default;
To match de default value ?
>  	}
> =20
>  	if (ab->hw_params->rxdma1_enable) {
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/=
ath/ath12k/hw.c
> index a106ebed7870..021a4b565e8b 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights r=
eserved.
>   */
> =20
>  #include <linux/types.h>
> @@ -1049,7 +1049,7 @@ static const struct ath12k_hw_params ath12k_hw_para=
ms[] =3D {
>  					BIT(NL80211_IFTYPE_AP) |
>  					BIT(NL80211_IFTYPE_MESH_POINT) |
>  					BIT(NL80211_IFTYPE_AP_VLAN),
> -		.supports_monitor =3D false,
> +		.supports_monitor =3D true,
> =20
>  		.idle_ps =3D false,
>  		.download_calib =3D true,
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless=
/ath/ath12k/mac.c
> index abf7c7ed8967..27d44b508884 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1264,6 +1264,12 @@ static int ath12k_mac_monitor_start(struct ath12k =
*ar)
>  		return ret;
>  	}
> =20
> +	ret =3D ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
This is already done a few lines after. Shouldn't the one after be removed
> +	if (ret) {
> +		ath12k_warn(ar->ab, "fail to set monitor filter: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ar->monitor_started =3D true;
>  	ar->num_started_vdevs++;
>  	ret =3D ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
[...]

And this is probably out of the scope of this patch but the code in
ath12k_dp_tx_htt_rx_monitor_mode_ring_config could be simplified by returni=
ng
early if (!ab->hw_params->rxdma1_enable) like in
ath12k_mac_config_mon_status_default.

And that brings the question for me as shouldn't theese two functions shoul=
d be
refactored to share more code

