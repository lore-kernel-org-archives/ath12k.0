Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA33C02183
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfJlQTQQhWbDiL9fmUkK21l5xX6jcHy8qrdZG/LzuZI=; b=M9ZfY9dBZ98u6BeRbo+Sf3w77N
	7mfy2rdx6l3csK5GqEM7Q9TewTttNFPMH1iS6jZrG5NFkqdGlKOJTtxQhnKAMkdJ6bJ4Gq5ZbGTFU
	b0ODEbMwB/fprLX1UYKNnNiHWvIaZCupkUIg7rrpRxmWaRZ3gi+jfLdIy3XVaVtI+bhaSrEUCk5oT
	5qcnAHGS4gnFnOA1Vt+jgz2x7VlkpRXxP4izhhXHbz+K8At0mUBSPXw5LFr/EjFSmXZHtlwnYoCxp
	7KXlbS6of5akN/7kKTp8r0KSVFaQ0g2IQACc0+2WD37zzLH5bLmIn5/AlmE30YoEGF2j/SzGYCSmk
	R803F9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmHR-00000000Kzk-1Mts
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 13:20:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmHP-00000000KzL-2PYk
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 13:20:56 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-386329da1d9so1116362f8f.1
        for <ath12k@lists.infradead.org>; Fri, 17 Jan 2025 05:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737120054; x=1737724854; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfJlQTQQhWbDiL9fmUkK21l5xX6jcHy8qrdZG/LzuZI=;
        b=h7sP772QWdZ8hdYrwxK+Jnb59H4SKpfLIwccAv/s6x4oWuGP8QmBfarSaBgybhXLYx
         TSIf5j5qVo1Ofvgv/S2PS2nadDiKA6aM+r60rIcZPC6c4fDjHtCsGWKQHr8/mGWXvtzN
         kr9Kt2Ql7R0n3QA/4KqnabZvqOmCyXInFfnuQOOeNQa3V+MblUJJjwLJ3zKnoGVrJOCK
         Kl7nd9E0IbCsHA9bcO+otNTVBd4PCZ0f50LN0Nb8GvFR8IQFCyby85vc1TOgehSV6qbJ
         6zytzhOE5BaE6GCVMczM+cPCD1a8NjzHq7iR1d/wkfoGJqvxpPhey2CEiyggEFjgwcM3
         AYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737120054; x=1737724854;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfJlQTQQhWbDiL9fmUkK21l5xX6jcHy8qrdZG/LzuZI=;
        b=o3obwcFjw/yMkXdGW83GZNe8JPYUl6Z45XNxTuNqQ3APtvZxYw8Kk1K4xFzNmGEfe8
         mjZF5B1p3MC8LA3iJjr0TV85ogIf++0sBs2ZOFl6rCdyVztiK0m2aH7GeOzzBR0cyKl2
         TaK9vf3oX6NLUn8pq/tIhmUqg/5VxEohHeLHkvqH8TgqtQHluch1HmPWO+W2Ub7XbEdj
         xzWsYBzuXiBKyxr0+jcRxtlb4wX5VFD/TtdlPCtJrJPg58FjWJs77E2qOFRFcKdF5dM2
         5RLpr6buNNv7LA59OLNloVHn9MBO9mqTjhah6W5e16SGLf1GOh6N2oxO3avKVyfQ+llV
         ssbg==
X-Forwarded-Encrypted: i=1; AJvYcCWPxGdiVxnECV/a2EPR51htpd3dF8Oe5YyAbAExJw7djdXqIJQOYgK6ODAwgzGim801Kfl8OJU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOA4c4kH4NBxe/2+Tuqc+w2FH6i5yMPNKvIorsbkXOuGYa08xk
	lMcxnyOlEfsnAqvaMXsTq+oOLSHkC3Uuh2qRG+WTPVMJjGHISC/F
X-Gm-Gg: ASbGncsne5SEe2HrdX6z2dtuXOfwGJrynXZ7NKVFMZsBWlK5uLGcrc173Xd+VBugsL/
	g8k4YjfzhrNR0NWSGb6PjnpnpvPV52t921j+pTl+OcdR68AkEdtQ2cTOdZhknQc91xTMnyR97Uo
	CKcCGzFI4NrJJ7PqSA8sc+3nNkfC37lWytSWtel0qqXVzKgm70uLa0NXF/gypj5heAjogcJJmk4
	i3g27sXZaMsdDmQRzM1tbKoC/0hSF1A7ep/GzSYxqBRZlD5dyr7mgVn/mIuhwR8rT4jv3ooomY=
X-Google-Smtp-Source: AGHT+IET08LbJkQIdNwZn5g6V1QN+ENLUJkPyo7v6eJJj3nnTntFiYomed6Uvoworcy2Nk6SE8fOlg==
X-Received: by 2002:a5d:5f4d:0:b0:386:2aba:a7f6 with SMTP id ffacd0b85a97d-38bf57c0618mr2480861f8f.49.1737120053690;
        Fri, 17 Jan 2025 05:20:53 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm2547988f8f.10.2025.01.17.05.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 05:20:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 14:20:52 +0100
Message-Id: <D74DNZH2FACA.1EWK96IOHSY6I@gmail.com>
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
 <D74BE3ES4HZC.GJJ2MY3UH462@gmail.com>
 <e713770a-2032-f007-f828-d24935b042e2@quicinc.com>
In-Reply-To: <e713770a-2032-f007-f828-d24935b042e2@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_052055_614476_22FBB5C0 
X-CRM114-Status: GOOD (  24.83  )
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

On Fri Jan 17, 2025 at 2:06 PM CET, Karthikeyan Periyasamy wrote:
>
>
> On 1/17/2025 5:03 PM, Nicolas Escande wrote:
> > On Tue Jan 7, 2025 at 3:10 AM CET, Karthikeyan Periyasamy wrote:
> >> From: P Praneesh <quic_ppranees@quicinc.com>
> >>
> >> Currently, the monitor interface is not supported. To support the moni=
tor
> >> interface, configure the monitor vdev state identifier, configure the =
HTT
> >> filter setup, subscribe the mac80211 WANT_MONITOR_VIF feature and prev=
ent
> >> monitor interface to transmit packet. Therefore, add these procedures =
to
> >> add monitor interface support and enable the monitor interface support=
 on
> >> the QCN9274 platform through the hardware parameter.
> >>
> >> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> >> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.=
0_SILICONZ-3
> >>
> >> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> >> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> >> ---
> > [...]
> >> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wir=
eless/ath/ath12k/dp_tx.c
> >> index b8f0df6f7a05..81d1ff918f48 100644
> >> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> >> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> >> @@ -1,7 +1,7 @@
> >>   // SPDX-License-Identifier: BSD-3-Clause-Clear
> >>   /*
> >>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved=
.
> >> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All right=
s reserved.
> >> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All right=
s reserved.
> >>    */
> >>  =20
> >>   #include "core.h"
> >> @@ -1277,6 +1277,8 @@ int ath12k_dp_tx_htt_rx_monitor_mode_ring_config=
(struct ath12k *ar, bool reset)
> >>   					HTT_RX_MON_MO_CTRL_FILTER_FLASG3 |
> >>   					HTT_RX_MON_FP_DATA_FILTER_FLASG3 |
> >>   					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
> >> +	} else {
> >> +		tlv_filter.rxmon_disable =3D true;
> > Shouldn't this be
> > 	tlv_filter =3D ath12k_mac_mon_status_filter_default;
> > To match de default value ?
>
> In standalone monitor case, this will enable the default filter=20
> unnecessary, no ?

I'm not too familiar with the driver but clearly this is the part that brea=
ks
sta info update when running a monitor while an ap is running.

And as this is a valid interface combination it should work right ?

So this change works around the problem I reported earlier, I just confirme=
d it
on my setup. But maybe this is not the right fix indeed but hopefully it
points towards the culprit.

>
>
> >>   	}
> >>  =20
> >>   	if (ab->hw_params->rxdma1_enable) {
> >> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wirele=
ss/ath/ath12k/hw.c
> >> index a106ebed7870..021a4b565e8b 100644
> >> --- a/drivers/net/wireless/ath/ath12k/hw.c
> >> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> >> @@ -1,7 +1,7 @@
> >>   // SPDX-License-Identifier: BSD-3-Clause-Clear
> >>   /*
> >>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved=
.
> >> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All right=
s reserved.
> >> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All right=
s reserved.
> >>    */
> >>  =20
> >>   #include <linux/types.h>
> >> @@ -1049,7 +1049,7 @@ static const struct ath12k_hw_params ath12k_hw_p=
arams[] =3D {
> >>   					BIT(NL80211_IFTYPE_AP) |
> >>   					BIT(NL80211_IFT
>
> YPE_MESH_POINT) |
> >>   					BIT(NL80211_IFTYPE_AP_VLAN),
> >> -		.supports_monitor =3D false,
> >> +		.supports_monitor =3D true,
> >>  =20
> >>   		.idle_ps =3D false,
> >>   		.download_calib =3D true,
> >> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wirel=
ess/ath/ath12k/mac.c
> >> index abf7c7ed8967..27d44b508884 100644
> >> --- a/drivers/net/wireless/ath/ath12k/mac.c
> >> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> >> @@ -1264,6 +1264,12 @@ static int ath12k_mac_monitor_start(struct ath1=
2k *ar)
> >>   		return ret;
> >>   	}
> >>  =20
> >> +	ret =3D ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
> > This is already done a few lines after. Shouldn't the one after be remo=
ved
>
> yes, will remove in the next version of the patch.


