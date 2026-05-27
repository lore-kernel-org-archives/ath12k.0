Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8D1CD4F54
	for <ath12k@archiver.kernel.org>; Wed, 27 May 2026 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/a6/VVntn4aVTEcppvyfpC4q3kjlo7Pfl22Fi0JgoM=; b=OBjFARqLThKMW4Bw+cC3oRpoEW
	6Vvp5SyJsvf5uWV0Do0fqoTR9rAiJLUGkjT3eJ64ZwfSXcpmfSIhmFboP5sEeXeMGCvocWK/9mKqs
	XXEBGn/W1ERMH3UnPN/QSmyiWSicJ5AZYubPMAgttAIjH9DeyAw2FaoPWDQcoF+rCM4hYwZ79lmk8
	qDmTpTrFde5VqTioJeNi4yX6snpws4Y3eSpjgMVlEdwjwgxXdWy4Wzj8tYcRXnT6B9punnv1E6lyU
	uZ3mPrROLjkOLdS3BjPsxKxYR1SHeFp5gQ5YbYIyZIjdAviwlC/GWbOg2SaxPVnZcIDqRVcMf/RG1
	36tpxBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9W9-00000003XKO-3Orc;
	Wed, 27 May 2026 08:21:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9W6-00000003XJX-3wJs
	for ath12k@lists.infradead.org;
	Wed, 27 May 2026 08:21:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so40203445e9.0
        for <ath12k@lists.infradead.org>; Wed, 27 May 2026 01:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779870088; x=1780474888; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/a6/VVntn4aVTEcppvyfpC4q3kjlo7Pfl22Fi0JgoM=;
        b=D6EeJF0opRo/YNGebzisftgc/mUsMbKz0TdsagHtH0C/KNwZvXuTKDAMY/IK2v1zw9
         QzOckt86P8FEp5+HwmaAf3AQOT2Kf57eGUEgREHRqF2CROSXjKKLLTk1kUvMI6ZcTcHD
         CGLFmaAcdPvosRXWYWJYeGVjDXEpENaSQtebZk3XIJkvBjHWv9u4jisIMermd7rRiSVE
         3PVaj8d87B97MUssUEwuYE6OI1/uzKhJoAaMiGEur6kzIy5AmgZtP0MnWRQ1hXr2bILU
         3CXGO5UWm4PaOvMrVUeW8LYU90xbgLZUSPzcUwpHR444q/APD9/2Wv8OhHJUL8v3Ax9h
         fgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779870088; x=1780474888;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/a6/VVntn4aVTEcppvyfpC4q3kjlo7Pfl22Fi0JgoM=;
        b=BCF/XaWHT5wJl96qN8YGBzfo0aG6CQNjfhbYt94tyMSbxn1VbrHw7JRO4ApkpqoQat
         xfNOTguVjhOk1e5i9faz/fhv2yynET6RzR1tdkkEA+5vu/5840ELSRq/pszNOG13r129
         0L2IwVs+rRkODIJgnPmgovsARheQivWX6tvTmyJv1k715MJukBnZSLoSPM4SifVMZNNi
         5rVgvULCQjBDRDE5x/QZd3lv6qhfC+ZPCVq1iJHCApJiST4gTM5KegBn7RzvJq2TCmGf
         AxvkC0FQXXm3Pw6mHQ5WZweQRlcFVepGt3hp45N8WrL4yvxul6g0Z0gE3TyokZX25n3O
         sa8g==
X-Gm-Message-State: AOJu0YysQD9cUC0GkVLzuh8Bo1IwNt4UvSAmZhjC6KLbFQPpBKdRxghF
	OKKbqbzQJw2lzPqAj3+vhSdfxBgd9KipV+tY/O23zTrt/pQZLbXHDb3JHS+wYQ==
X-Gm-Gg: Acq92OHc12EWEwF+UCuvDK/3PKhgM/m67p7mPf8Z76CWo2yAZiukNx+5pa8K5qL+RmH
	VO6BeMvtca4OOHd5wMWdpuYUrOSTr0UjoHskHbTiibyRFRTqSPVRFR72fTbG4OIjSl2CP0KLJIo
	9ApWghVPvwf9sWtW/iRdDF0hYG7eFmiGT8I4yCXQqE/+nLtbeTW6GDxKIs/nefNU0y8K/7oLByS
	8MG04MqIELcOC47DnxHXff1hidux8X0WPGc6p8KghtKlFidf9IfA7HsOBMfduXHv9X1FOt7KTT1
	TNZ3wKNUy8wORugJ+R+1f3C6/QO2xRvrjpLi3M1v/tFsvL7xcqMyAUOS4mqOnQEcEm6dMUBEX0l
	cweHR1tJO9AVll5emA69DTLB60dhb4eOc4PY5lGEzcuQlYFjoJCoi9lfDXn8HY5cdW7R72IK/o6
	1rHO4aLRvU0GaSMqLNd1jeA5rj9PQ9jW4xqgeN/ZkAAdO0g0wfgYiL
X-Received: by 2002:a05:600c:8599:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-490424ac8e2mr262002455e9.5.1779870088004;
        Wed, 27 May 2026 01:21:28 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm371935435e9.3.2026.05.27.01.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 01:21:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 10:21:27 +0200
Message-Id: <DITBAE5TRA3P.19LKP0C208TGG@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
From: "Nicolas Escande" <nico.escande@gmail.com>
To: <ath12k@lists.infradead.org>, <jeff.johnson@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260123144224.2216923-1-nico.escande@gmail.com>
In-Reply-To: <20260123144224.2216923-1-nico.escande@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_012130_990701_98FADD27 
X-CRM114-Status: GOOD (  20.64  )
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

On Fri Jan 23, 2026 at 3:42 PM CET, Nicolas Escande wrote:
> On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
> realated features on the 5GHz band while it should not:
>
>     Wiphy phy1
>     [...]
>         Band 2:
>     [...]
>             EHT Iftypes: managed
>     [...]
>                 EHT PHY Capabilities: (0xe2ffdbe018778000):
>                     320MHz in 6GHz Supported
>     [...]
>                     Beamformee SS (320MHz): 7
>     [...]
>                     Number Of Sounding Dimensions (320MHz): 3
>     [...]
>                 EHT MCS/NSS: (0x22222222222222222200000000):
>
> This is also reflected in the beacons sent by a mesh interface started on
> that band. They erroneously advertise 320MHZ support too.
>
> This should not happen as the spec at section 9.4.2.323.3 says we should
> not set the 320MHz related fields when not operating on a 6GHz band.
> For example it says about Bit 0 "Support For 320 MHz In 6 GHz"
>
>   "Reserved if the EHT Capabilities element is indicating capabilities fo=
r
>    the 2.4 GHz or 5 GHz bands."
>
> Fix this by clearing the related bits when converting from WMI eht phy
> capabilities to mac80211 phy capabilities, for bands other than 6GHz.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless=
/ath/ath12k/wmi.c
> index 84c29e4896a4..14947fdb9813 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -4888,6 +4888,7 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k=
_pdev *pdev, u32 band,
>  				       __le32 cap_info_internal)
>  {
>  	struct ath12k_band_cap *cap_band =3D &pdev->cap.band[band];
> +	u8 *phy_cap =3D (u8 *)&cap_band->eht_cap_phy_info[0];
>  	u32 support_320mhz;
>  	u8 i;
> =20
> @@ -4901,8 +4902,14 @@ static void ath12k_wmi_eht_caps_parse(struct ath12=
k_pdev *pdev, u32 band,
>  	for (i =3D 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
>  		cap_band->eht_cap_phy_info[i] =3D le32_to_cpu(cap_phy_info[i]);
> =20
> -	if (band =3D=3D NL80211_BAND_6GHZ)
> +	if (band =3D=3D NL80211_BAND_6GHZ) {
>  		cap_band->eht_cap_phy_info[0] |=3D support_320mhz;
> +	} else {
> +		phy_cap[0] &=3D ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
> +		phy_cap[1] &=3D ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
> +		phy_cap[2] &=3D ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
> +		phy_cap[6] &=3D ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
> +	}
> =20
>  	cap_band->eht_mcs_20_only =3D le32_to_cpu(supp_mcs[0]);
>  	cap_band->eht_mcs_80 =3D le32_to_cpu(supp_mcs[1]);

Hello people from QCA.

Is there interest for this patch ?
I can make additionnal changes if need be.

Thanks

