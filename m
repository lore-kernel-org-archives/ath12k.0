Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC2FC4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frZY594kWfIMrR/24RGxK2/1/2Nf7qSOc8dwbXPUe9g=; b=SiZn4gom4pOQ0Xi1s/coHw6Md0
	lJd1GPIHCsNrjUoYGRKZ/yegCOYbJgVvG7fSXuggz1tAQLKY95jzesjhKMgTAMv48kWWC/wh+aTa0
	e0NW4VNaj0CZLdn/cclTLCEIT1ZHx0b4XBk7ZLA18J0PvwiMfB40fM+p0s6MR3YtMH8qR0NUO2WbK
	XRI1TqAHQgGWzlWA1vh2JaAqDKXlTPhprF4XvsRNltZHGX3YV6hsuJ0t+t08Jdc7ww5AjJLh05NZh
	f6lcvIPzGwnmAKidqflhE+HfIUYYAC0x6a1SUONK3Nltie1lw+mJd4ebVK0ZTXsuG7oQndY9p66C+
	Lm0UKWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBQB-0000000Fruq-3hVC
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 07:34:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBQ8-0000000FrtT-3t5M
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 07:34:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-417d14c3411so6852355e9.2
        for <ath12k@lists.infradead.org>; Fri, 12 Apr 2024 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712907236; x=1713512036; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frZY594kWfIMrR/24RGxK2/1/2Nf7qSOc8dwbXPUe9g=;
        b=ZEpVDqcikn4rH9bXtVLpXXXqSib1Gr5L1q3Q26rEKUUOnm2CeVnEfnKnwa3LqgtiRG
         Uh/4sTJ+S/Reg7AXJG3iMn2RkkOn9NbdwPF3qyGSqbg/FTSGFODTZoapjYEPLxLFs1LN
         cE05YIiw6sKATi8PvmtNgNEGoHMUzSgh2XQuN934Wjyy11oGnd+S8cbDq0SIqOacqEn+
         EVIfNCSBDdASIzq+5oB9K28kQxrQFJnmmGiIwSJI0a/NE9UVIbM6tid8+os9GUNdnwOX
         WdTdRXnZ+1vEoPCN/zfPQDbFHIKaGdEzN0t33w8N90IGngI+C/NWVfmjno3r9XKWsZ27
         SUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712907236; x=1713512036;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=frZY594kWfIMrR/24RGxK2/1/2Nf7qSOc8dwbXPUe9g=;
        b=U85cVEI4pxUiYLbwf/n5IjJwdq/X2X0Y8Te4wp06xZmvBQ4KEJhAbrebt07OOB2lxI
         wYYOUVFFwa3XZZVY3jzLqGLN+fr2Te6F4inSgU5JkgVGFDfi/jzPztU+/r6dIdaB4p6H
         xt1JnugzUfI0a/OYvtY1VKEoXMQiAxdgXtHIbnDqblQvxg0zTUDTniJBa9DQfiQtDqGU
         czf2VhGui3BoIVb4X6sHPkiDkUCYEh/VXJ70FGyDCJVzKC5f14IaaOxPWl5DWvWYm2Lo
         3SVA7zbBZjLNYFJ/eRBIGOniX9+/YFrIKgQNfUi/THt+VSNS06HMD0G9EpwOAYVn8GqC
         npXA==
X-Forwarded-Encrypted: i=1; AJvYcCVvhDmJafZUv5QKflThlV27P1DkpnauJJ8JAJpid8rVcvVp+rP0GSpjd0JXI9uJmrbdBTDuju81k8PFukB1sQ8N9x/bGLXYlZJUZA==
X-Gm-Message-State: AOJu0YzfvwGbny5VdIKFRZ5TryqbT70xRDsYbJF/0sB8dlrB7sUSwRGJ
	YgTKQOEBjipg17FrZ/aaFqAnb/M3Snd7gIrQryQ1b2eZBBUMPdI8
X-Google-Smtp-Source: AGHT+IGrAwUdIyE2YxA7H0TGYK6EyEd19afc7TvtjYj8dcewHihSdOEdHE3HFvT76xHeF5kgHBJuMA==
X-Received: by 2002:a5d:5102:0:b0:341:dedd:9726 with SMTP id s2-20020a5d5102000000b00341dedd9726mr1208837wrt.3.1712907236296;
        Fri, 12 Apr 2024 00:33:56 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600000c900b00346c0062b0dsm3212945wrx.11.2024.04.12.00.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 00:33:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Apr 2024 09:33:55 +0200
Message-Id: <D0HYXSPMY8JE.17YSACO3ROKKZ@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "kangyang" <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: add support to handle beacon miss for
 WCN7850
X-Mailer: aerc 0.17.0
References: <20240412025149.1211-1-quic_kangyang@quicinc.com>
In-Reply-To: <20240412025149.1211-1-quic_kangyang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_003401_019098_93F48389 
X-CRM114-Status: UNSURE (   9.69  )
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

On Fri Apr 12, 2024 at 4:51 AM CEST, kangyang wrote:
[...]
> @@ -5986,6 +6055,20 @@ static int ath12k_mac_vdev_create(struct ath12k *a=
r, struct ieee80211_vif *vif)
>  	lockdep_assert_held(&ar->conf_mutex);
> =20
>  	arvif->ar =3D ar;
> +	arvif->vif =3D vif;
> +
> +	INIT_LIST_HEAD(&arvif->list);
> +	INIT_DELAYED_WORK(&arvif->connection_loss_work,
> +			  ath12k_mac_vif_sta_connection_loss_work);
> +
Is there a need to move the following part ?
Isn't just adding the delay work enough ?
> +	for (i =3D 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
> +		arvif->bitrate_mask.control[i].legacy =3D 0xffffffff;
> +		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
> +		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
> +		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
> +		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
> +	}
> +
>  	vdev_id =3D __ffs64(ab->free_vdev_map);
>  	arvif->vdev_id =3D vdev_id;
>  	arvif->vdev_subtype =3D WMI_VDEV_SUBTYPE_NONE;
> @@ -6316,16 +6399,6 @@ static int ath12k_mac_op_add_interface(struct ieee=
80211_hw *hw,
> =20
>  	arvif->vif =3D vif;
> =20
> -	INIT_LIST_HEAD(&arvif->list);
> -
> -	for (i =3D 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
> -		arvif->bitrate_mask.control[i].legacy =3D 0xffffffff;
> -		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
> -		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
> -		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
> -		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
> -	}
> -
>  	/* Allocate Default Queue now and reassign during actual vdev create */
>  	vif->cab_queue =3D ATH12K_HW_DEFAULT_QUEUE;
>  	for (i =3D 0; i < ARRAY_SIZE(vif->hw_queue); i++)
[...]

Thanks

