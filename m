Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50579C0218C
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uc3fJA8PcltY1mYa3Gco6h17ujJWBhmbRWOgQCakVFs=; b=Dk6CwMSTzcR2BJ7+pKGkDLTlLY
	ptOso6e6KTr5vcawiG19Nqia4ydmxkzqZ4o4N92L7SP/hJ3Qsyb5E5L6h1Ff/8EIzwjA7aD0dvvUR
	2ZqrJkMbhB6JgLqPd//1gGUfZuA4h70A1K3JiGKynWuVmwV+P6nD9JpIhfXz4HqLumhX0t5edoXWA
	/Evv/4Z4ek1oODV2Ff4u3rLBhkKuKIKrJwGVj7gVRMVVqw0ki9f+t/WPZmBERBjmwyeKjlyyfuyAF
	2NQLRSwEtywey6RLE1c7IMuELc1+/wUwtjz8YlHuV/ewDPAsAGOYi7LnQoOwJHeIOqNmioCLAD0OK
	ysn5x49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbmqT-0000000Glmw-3mEz
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 20:33:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbmqR-0000000Glmb-0rgL
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 20:33:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436a03197b2so21196075e9.2
        for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 12:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737837209; x=1738442009; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uc3fJA8PcltY1mYa3Gco6h17ujJWBhmbRWOgQCakVFs=;
        b=P8PaJzjSiRmzPEN+rSfGI33XN9r0izMQKECmPdgO+TRgKEfT1MKh0AAf5i/zb8SSwO
         RK2nKlMwy6B4jtqLl9q4959GfOAvrDXHB/sWTXqie9vGQC/SGaez2LdX3nY7CGquY7SP
         8B0eCUQrXuY2uwEGMl7fX7bRF2Vm0B8XvRsR2SrZUPCMOfPMFyAZkO1KnrWbhGo9OOK5
         cBPHL0AACe7rYJboz05Qdrezj8HWya8C1/vrJQzIfFp+nK3U9CIeIILsevEtNWCEm916
         MTB4nrRMNotrN5SRjFOEEo7LmauIJ8/4QrNeI4RF9SSTMfGBLbJuB8B2cNw9PWc5uocJ
         FyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737837209; x=1738442009;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uc3fJA8PcltY1mYa3Gco6h17ujJWBhmbRWOgQCakVFs=;
        b=I4SG26qQUIihvtGeZfCH4bpoRm189/PJ1Hgwd+iRMF+37AebXDxzv4lHinVYW1Zx1X
         7T53JNCKPfGF41agpPLf2USiMD3XHHwUpg3oPXJ+09U19YE5hs+73ojnkL8noTvLvpGL
         sDGgrz6hkHJRQX9u5QQope+Gvd3/FvGbfn/2F7suCm8oLIXLKpB0WdDUNHmXXX9BgQUM
         xsObLyAwsjRiL2YtU/+RTOKRXDzYHzz7DwmajTguJbsNtF6LAE/8j6pD9o2xmMcZ99eA
         G3hPy3tpldbEfMVevvIC4QA38LDMbyvdUB54QktyXPEc9cK8/I1KXmNzY8FDLeN9qUHj
         /NiA==
X-Forwarded-Encrypted: i=1; AJvYcCXT5ZuUj69t93D+F3H5+cxnQekRSR2Crwnm9odFgS7dddjoXOO3jBCYDkgcLwgxd2Eb/Xtu6UA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJg6AV7osR3X1Os95RrcnKkDmXqM2V4SEndMJT3qXw/nie8NhX
	wFbnwxPW8/Ndn9ghOfVl90OuyZdsUwU35Ke+PybWwpTw5oNnO/2QGgmXDw==
X-Gm-Gg: ASbGnctgz4gzrIBrN5UAx6DTLSJHMQ074XVpKTLEjVhTvGOlFjeSUT0sJYya+AgxeNB
	4rXZEw6K1rgEr5++la1tShYjvT49nya6M8APSjt9FoBeXl2EsS4yAlCoPGmnFtfn5ZqLByzngBH
	ifa3eplB0KrTmAOdAkP0ROdhKdATcej27ZVPkFC43AkDbWraN2XcFMbZ8+hb0KDzxTDIxS7WjeH
	o84Ued0V/ZuEpQN/VOVygINzTmK+DJO92zBVLtIhcfS8c6c92mgKMDB9tfvE5GqDl64mGye4nBe
	MtO3iQSTdLx2jV6M3BFqZ6I=
X-Google-Smtp-Source: AGHT+IHTdd78oq7Xr5vV2iGB1xzykwyYBhthtOv76Oc4OyXeszdbUfb0nsHG8L/UKDs7E7QpZPSoeA==
X-Received: by 2002:a05:600c:35cf:b0:436:1be4:c9b4 with SMTP id 5b1f17b1804b1-4389143698amr287833995e9.27.1737837209371;
        Sat, 25 Jan 2025 12:33:29 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48574csm72843655e9.9.2025.01.25.12.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 12:33:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jan 2025 21:33:27 +0100
Message-Id: <D7BFVJJDJJAD.2HAR34N0MNXBW@gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath12k: Add support for MLO Multicast
 handling in driver
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Balamurugan Mahalingam" <quic_bmahalin@quicinc.com>,
 <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250109184932.1593157-1-quic_bmahalin@quicinc.com>
 <20250109184932.1593157-3-quic_bmahalin@quicinc.com>
In-Reply-To: <20250109184932.1593157-3-quic_bmahalin@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_123331_245749_71C4FEB4 
X-CRM114-Status: GOOD (  11.76  )
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

On Thu Jan 9, 2025 at 7:49 PM CET, Balamurugan Mahalingam wrote:
[...]
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wirele=
ss/ath/ath12k/dp_tx.c
> index 76626d925adf..9d05fe7a870c 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -217,7 +217,7 @@ static int ath12k_dp_tx_align_payload(struct ath12k_b=
ase *ab,
>  }
> =20
>  int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
> -		 struct sk_buff *skb)
> +		 struct sk_buff *skb, bool gsn_valid, int mcbc_gsn)
>  {
>  	struct ath12k_base *ab =3D ar->ab;
>  	struct ath12k_dp *dp =3D &ab->dp;
> @@ -290,13 +290,24 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_l=
ink_vif *arvif,
>  		msdu_ext_desc =3D true;
>  	}
> =20
> +	if (gsn_valid) {
> +		ti.meta_data_flags =3D
> +			u32_encode_bits(HTT_TCL_META_DATA_TYPE_GLOBAL_SEQ_NUM,
> +					HTT_TCL_META_DATA_TYPE) |
> +			u32_encode_bits(mcbc_gsn, HTT_TCL_META_DATA_GLOBAL_SEQ_NUM);
> +	}
> +
>  	ti.encap_type =3D ath12k_dp_tx_get_encap_type(arvif, skb);
>  	ti.addr_search_flags =3D arvif->hal_addr_search_flags;
>  	ti.search_type =3D arvif->search_type;
>  	ti.type =3D HAL_TCL_DESC_TYPE_BUFFER;
>  	ti.pkt_offset =3D 0;
>  	ti.lmac_id =3D ar->lmac_id;
> -	ti.vdev_id =3D arvif->vdev_id;
> +	if (gsn_valid)
> +		ti.vdev_id =3D arvif->vdev_id +
> +			     HTT_TX_MLO_MCAST_HOST_REINJECT_BASE_VDEV_ID;
> +	else
> +		ti.vdev_id =3D arvif->vdev_id;
>  	ti.bss_ast_hash =3D arvif->ast_hash;
>  	ti.bss_ast_idx =3D arvif->ast_idx;
>  	ti.dscp_tid_tbl_idx =3D 0;

And this is nit picking but I find the following would be even more readabl=
e:
	ti.vdev_id =3D arvif->vdev_id;
	if (gsn_valid)
		ti.vdev_id +=3D HTT_TX_MLO_MCAST_HOST_REINJECT_BASE_VDEV_ID;

On the plus side, it's even less lines of modified code :)

