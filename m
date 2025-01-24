Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CB6C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZzV7UQd3KYL5z123q5GLS6PMxoAVbzEGbiydCidK8E=; b=dREQIDZKGnRRUX/M0LQ1OaVYou
	ema7+CDnbvEOZdRnN4P+dqd1pMa6aH8qcxxUauvrQDOXSpXxC4BO4mGd3uoUZwB8s84EZYEpr+cb+
	tkTZPWmfEmqQMy2gpXgA7NdxaRB+zzrYfyxcUHIE2MIwirIkwPJmuw3g5X0jtdJpeIwYI8P9xslgU
	Ov2Xp6t8CMyGd3uh0sZ7Vx44mWuGnYDov0Ig3DR+csC7ZF1pKLu34GA8aOmfFwXbxfWbwZCFeIQLb
	h+iVbkI010c993hTO2Q5Xibv247r0g0gyPAalUiy8iNCf6P1jFK52/Ch2VTalWricy/MYti8ENKlC
	/0Q2m01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbI83-0000000Eb7U-0F3G
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 11:45:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbI7z-0000000Eb6r-3Su6
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 11:45:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4368a293339so22064295e9.3
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 03:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737719134; x=1738323934; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZzV7UQd3KYL5z123q5GLS6PMxoAVbzEGbiydCidK8E=;
        b=Z+KSp2NK710EhThpR7OqR6rny9NCzXy6RvU/r1uuIsXaz6NyP2dOT06xtrooE+MDET
         3xLVGhhVRiQEaowW5MVSUCL5l69Lr/yHujTi+UFe46UQODUpA6YegGXyUx5p2rIne/Ub
         lMEO14QjgVCceGZABJMvkLxIfRkr+1FBSCta+07cFUZUcZUto7DYErZ8VHPVi8RmBddH
         xJd3dDxixcf2AYTj8Mxza8BDpLpnAYpiaKLx2mqI8NASbKaxEANOsJEUifuA9vHWY8jK
         OFyeKd9qswx2pEbzdTqUEqjEjbU1wcr2eJuHAWr1+BT3OktSDyph9L7ch5HGXbizsSSL
         WXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737719134; x=1738323934;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZzV7UQd3KYL5z123q5GLS6PMxoAVbzEGbiydCidK8E=;
        b=HX6OdNxJxDjRKx/SH/MpKWDpGXH1jIM17AVmrVbfqsBmBNWk+k2jXbCMFBvvX5cDRe
         N2L+QOjMMrRqanHhGohYf2Kxx7TFcQPSxqb1kkgcUsnpaz9ZG9JZGzyPc/x8aGGf5p53
         8lOaCUbwa7fyQZhO09KwoVfriTlgSNGYM/MGgmsZcD27Y6yOmgk3T7MORzj2zEE0XPLA
         weUZeOlcQuv2RAuRA8fWccZWDDHN/Uvn+uTePCy92upy4xpS+xwX0cO9M6gNTwlEEnVx
         FAG/sR6ozLZF959Knf0vnX+Shlgo6fDgDipg1t98DoJ443B1JNudY2X5ZQe/4qBlxnN9
         rwEw==
X-Forwarded-Encrypted: i=1; AJvYcCUtmRY8DkuvNHDi2ThKuCY8OWW5QJwEVwpcESikTziCWsXkgmnPWFWj8i/QwwHbxNaBH9Vi+Io=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1RjE2dUbAlyv1rUwNA0qfn12/ReRcp336lVKTRQUlX4Ut/MBG
	uDaArS+6BclPUi4wqzEqcj0dLUo4ot/jUjdMAFMIjKBbcBYzCy/I+8EmsQ==
X-Gm-Gg: ASbGncv/Jwe/aUO1d42k0yNCYYCTdBQaFXg6qmHZPbRdiM4EIObBrDJXy0QpFjhtWr+
	LHXAjBVcf6bFYBDejsNm/wwjrJPCDZYGilxg/6RPWgSrAs2v8RLVXgP9cFtsw4fiYy3oPuIim5K
	1eOhEChEbO6aRV/M+70fHNfHi9IK4XwD8vtNwqoox0Bk0imKoWJ2uEH7YazAacxpy0TuufwCKXX
	YLtYCV3aGvJfu/DQxnQZPDpB0TpiG9RDAwNOHnsAg6aPNeULERFq6tMUWMK9rjqZnRLhGkpNBp+
	I56mfTKOO9nYII4vTTfHXCs=
X-Google-Smtp-Source: AGHT+IHd1Im2HgFGc4fQReF0n7kZNiHIb6VzYaAcl3sEiS8vJFHMmF6YXcPsTpzzWG4FJZdyJbTNuA==
X-Received: by 2002:a05:6000:2a3:b0:38a:88f8:aac8 with SMTP id ffacd0b85a97d-38bf57c0a41mr27541537f8f.54.1737719134079;
        Fri, 24 Jan 2025 03:45:34 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d5easm2407910f8f.25.2025.01.24.03.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 03:45:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jan 2025 12:45:32 +0100
Message-Id: <D7AA0SSICNT4.3GU5SHWIXWH94@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath12k: Add support for MLO Multicast
 handling in driver
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Balamurugan Mahalingam" <quic_bmahalin@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250109184932.1593157-1-quic_bmahalin@quicinc.com>
 <20250109184932.1593157-3-quic_bmahalin@quicinc.com>
In-Reply-To: <20250109184932.1593157-3-quic_bmahalin@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_034535_865882_46A8FE26 
X-CRM114-Status: GOOD (  12.25  )
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
Hello,

As ti is zeroed initilised isn't safer to do 'ti.meta_data_flags |=3D'
instead of 'ti.meta_data_flags =3D'. This way if we add another flag in
meta_data_flag in the same func for another reason, we will have less risk =
of
overriding the said flags ?

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

