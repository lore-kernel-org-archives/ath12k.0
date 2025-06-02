Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E33AC5B549
	for <ath12k@archiver.kernel.org>; Mon,  2 Jun 2025 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eel78/sXHR42/56QTeiD/S/vWi3/2pfLC+FExWF9Juc=; b=emNxYLqROEj4wR4tANBzuNBh0I
	MVYlBDoj2jB2t9AOXOvt2w7BsWyHXi/qYSfLpTvI61vn7AfoWwrCMafV8MpfEJnSHDDlH5zuYsVPE
	ab1k3VwWvGI/NVtJTDK0jbBMeGPqKI3HpJKsmvyO8SvAgXjEPlTdBEZj7dBYkZiyAYp+HelZ9na2c
	uz8Q3GQA20r5vSXbca5VdS5IQw+sePzzkYOtqw9nlKXqcRDFf+q31sCGnaPYiBMOxD2BXon38iy4G
	86C/dkzAspHTjE65Pa7BcCWldrrQoQnn63AahsxvtZ3Ek77pV9sEo4OqOMoK2K/bF9pTolpjuMW9v
	iWA1HCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM14S-000000072O9-3zqe;
	Mon, 02 Jun 2025 09:03:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM14Q-000000072Mw-1NxD
	for ath12k@lists.infradead.org;
	Mon, 02 Jun 2025 09:03:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-450df5d7b9fso12793945e9.1
        for <ath12k@lists.infradead.org>; Mon, 02 Jun 2025 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748854980; x=1749459780; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eel78/sXHR42/56QTeiD/S/vWi3/2pfLC+FExWF9Juc=;
        b=X3effCp22/61I5Xh5UudAoolLo5EzNdqF0GopndNFoLvRrK4Fd4n4LO3kWegb+4ekD
         0WwPIC5rQ3xfo+8HR0oL1LfArU9TPb3snPpOKPR6bZSk3M1IJFqPxfCJj6vabgma+1mY
         E4Ka6xk2802+DT04vBWX1b9MDNUIEdH448tnxuel+XxzNd0B5LgBb2W201k76VrEVtJe
         fnawltJiMYFV0r1rsGZb5evTgTM6BeHDL5l1zf+tmPSt49Csw271lKMAAZUFsrxAqFhz
         MWUaL/geuY6tGmEMQpiAbhZ4IHXn+ve9hakP9zcYgCekWFYDWKRWncYiitytE0TLPAn3
         X27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854980; x=1749459780;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eel78/sXHR42/56QTeiD/S/vWi3/2pfLC+FExWF9Juc=;
        b=Nos71diVHX2c6BzFm+xxYGMNVtVzbBmSLH+e5HM0pTfukL3U/N3XANbfGA6Yb8NOPL
         44DSPU5D41IkeWzK+oWaORWDYwkSeW0AQlpOihLfT0MLFMgFe1KYG64XmMEca5IkOD3e
         KX0XvDXMoeBBKezhPhTvurrmUFsgoLE8/Lv+KbyReJlu+WEk5bOkHCb+9wpASZFRyywA
         +WaLY140cW9Y3d0pv6ouH8MriGPursvz7zN1h/GiT28G8QLtZi7Z3HAwDUbgV7OTm+VH
         AcyrVE6MLb7LV5DROLs8pYjj1jMnonRjiq1EQDgKQ7SdfrdcbwzjInSVsy9wa2hQXRsC
         LyWA==
X-Forwarded-Encrypted: i=1; AJvYcCXs/WUAXIg/6uWzDvIWJyq2EmeR2spThc4bw/g0AUrdaoh3sEyq62MBm/c0ep8Jq7ogTLuFQ8o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwy7VZaXGCKfGpIE1722+kvDlH2KhRC8dFhFjZDxLI0xghS6Do
	kNjeFA98AoUx+Av2FtWPTbs6aZVsizWMu2sDlQKXBNTzYxoVgZ1d3F8E3jjobw==
X-Gm-Gg: ASbGncuVmy+fxK2X3xymCRi5vvD1Rp6LJk+jW1BqeU+HJUXmKnhgMjsUXaennOwXt2n
	ya8upW19mEyqhbQhe9Mzwy+BrcrsZ+6HMhu1czc3rvp4GS6Fuyt9/1ALgvuFZT/wnR3PmQ0iArG
	5Q5lRhZukCvAnuKjpsyI/OBc6YB6lZFQ6y3522NBbgwGJj+G9mOhgbI9q91aRGIH9zxEvBD+0oP
	p4Kpt7GaVe6e6AVfX/+93wZp7ggKaI6AYqFQzST66Ih+dS1or4IZ1pK5f7YlAJ9j2PJaVJ9S1HS
	tSuDKmsHfjLjWceZXjfbicWJqcFI7pBDDE4Dmnc8uk5Z9KmX2YSVgPNfAY7acKQxpxhZAw==
X-Google-Smtp-Source: AGHT+IGo5JVOeG91mY3AryEUeLOLUb+PaA8X/GIYrgPUS4uo3mn6vLO3rs1WLNv5gz1ImKJndpv6ng==
X-Received: by 2002:a05:600c:6009:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-450ce837614mr108908125e9.7.1748854980177;
        Mon, 02 Jun 2025 02:03:00 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451df39deeesm7330185e9.3.2025.06.02.02.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 02:02:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2025 11:02:59 +0200
Message-Id: <DABXCM595HBP.3PHKPBRK8C3MD@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "P Praneesh"
 <quic_ppranees@quicinc.com>, "Jeff Johnson" <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH ath-next V14 8/9] wifi: ath12k: add support for 160 MHz
 bandwidth
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Pradeep Kumar Chitrapu" <quic_pradeepc@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521224539.355985-1-quic_pradeepc@quicinc.com>
 <20250521224539.355985-9-quic_pradeepc@quicinc.com>
In-Reply-To: <20250521224539.355985-9-quic_pradeepc@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_020302_367067_71CE85A0 
X-CRM114-Status: GOOD (  17.42  )
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

On Thu May 22, 2025 at 12:45 AM CEST, Pradeep Kumar Chitrapu wrote:
> Add support to configure maximum NSS in 160 MHz bandwidth.
> Firmware advertises support for handling NSS ratio information
> as a part of service ready ext event using nss_ratio_enabled
> flag. Save this information in ath12k_pdev_cap to calculate
> NSS ratio.
>
> Additionally, reorder the code by moving
> ath12k_peer_assoc_h_phymode() before ath12k_peer_assoc_h_vht()
> to ensure that arg->peer_phymode correctly reflects the bandwidth
> in the max NSS calculation.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |  2 +
>  drivers/net/wireless/ath/ath12k/mac.c  | 89 ++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/mac.h  |  2 +
>  drivers/net/wireless/ath/ath12k/wmi.c  |  7 +-
>  drivers/net/wireless/ath/ath12k/wmi.h  | 28 ++++++++
>  5 files changed, 115 insertions(+), 13 deletions(-)
[...]
> @@ -2842,10 +2902,13 @@ static enum wmi_phy_mode ath12k_mac_get_phymode_v=
ht(struct ath12k *ar,
>  						    struct ieee80211_link_sta *link_sta)
>  {
>  	if (link_sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_160) {
> -		if (link_sta->vht_cap.cap & IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ)
> +		if (link_sta->vht_cap.cap & (IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ =
|
> +		    IEEE80211_VHT_CAP_EXT_NSS_BW_MASK))
>  			return MODE_11AC_VHT160;
> =20
> -		/* not sure if this is a valid case? */
> +		/* Allow STA to connect even if it does not explicitly advertise 160 M=
Hz
> +		 * support
> +		 */
>  		return MODE_11AC_VHT160;
>  	}
> =20
As this will fix the problem encountered before:
Reviewed-by: Nicolas Escande <nico.escande@gmail.com>

