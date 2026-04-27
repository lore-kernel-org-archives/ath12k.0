Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B70BFF8862
	for <ath12k@archiver.kernel.org>; Mon, 27 Apr 2026 07:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kUhTkdHvc3oY/y/iSAnX1xxIUfgWoxWMmlhyEq3JBw=; b=m2HejEfxj1I/zmlL5EBCObigGQ
	upFO/qv8ljhewdrxLNhB0SJY8HCFIEp8LqVkxXOxEhD/z7r4b8VU2hxlEoI5xoZQeEpVE0lKv35Dw
	ciL0ft1OTzcvogyeLQN3Xzj7ulatVpy2taZWHMmH6P6lFfOkh0LumrQagZuqIioMfBixEtENvxlx/
	WBA4dMpmABGHSA4xP4Q6XkuqPyPEyFkN/NltgHW+JnyM9KjtV4uk2jfAHblDYfO3I3kAM4OuyavS4
	1taRapQLK2f9yU+m9MYkGj8g+RSrzeb0KEYXuyzFOaKrQXF2qJ6pGLrFMg5M6hssuqzAcb5832/6t
	BGzzCZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGN2-0000000GNh6-0raI;
	Mon, 27 Apr 2026 07:27:08 +0000
Received: from mail-yx1-f45.google.com ([74.125.224.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGMz-0000000GNfj-1nZo
	for ath12k@lists.infradead.org;
	Mon, 27 Apr 2026 07:27:06 +0000
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65075c2ba66so7804424d50.1
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 00:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777274823; cv=none;
        d=google.com; s=arc-20240605;
        b=W1f7JbL0QK/qa+GLHnQLBz9lO6wQku4SabqOw0wKgM/JaoVUGEwHbDt6Z2m5w8J9Gg
         ykDvZlwEO5OhxXG6UfToSA8n5tqbTyp2UGxKwt147v2E2B51PbaForbtvOamOpjCEgWa
         oEyaL/kPsVDhzsVMsSI/djJm1637CvA7lEpEKnVUW0RNpRx7DmdBEP5TnAuNpSStQYa9
         XGfrX3Q3aBo7uL/Hp7Gs7rbHtfy2Wg/rIsG0lIGHD83xVWjnYSJ3f8ZOjTIU0uZHaMMi
         xw3ZMdoxNroU1IxpDcpZH0/s8oSAV3qWI8y7GjUC4G/d8fpgaams9lKkywBVPrrOfJhR
         1EVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kUhTkdHvc3oY/y/iSAnX1xxIUfgWoxWMmlhyEq3JBw=;
        fh=FqzXnRtkdnu32SScM4CNePR9D6xmy+eGEd2XcXNwTgo=;
        b=S7Bk2mWYDCXgmrL0ebRTDUQDEvqW7Z7/o2qTZtUbGPqULlQkXvq0naMKZiehQXDsIi
         QkfvlxbTB+yOR73/bU6epwH39Js/KybsxfPgv65hBQbzGAWWyjKUurbFCz7XiBV/29Xc
         tSWaes9OamoognzAEFrEHhCQANWbVfb7GOwMZt8Jlev+XlLvpOgESEWQWIrCf2Aex4bA
         0LPEcugrl+I/Da1x/OrOhem1tsIvriUQeYkj40G0xN1EiRN3P+8pCfr0rRNMy50fSyu4
         iiSGSO4sbMnfSmiccygiUEyw+EfyRX6SqKAIRFAwnOL6/EdQtUfs9LPmyWn0QcU2QMhB
         dJQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777274823; x=1777879623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kUhTkdHvc3oY/y/iSAnX1xxIUfgWoxWMmlhyEq3JBw=;
        b=g6xbL96+6LzNYw+0XGRleBtaVgVO0RSPM5Y5lrYQlusUaCuxqyN5pAXnzDFlFCsR59
         dPF0Z+bTi4pVJetsmWYR+ONIohMTkhsZlZUmYx+MTc45xYdZo3P+iafmDjZqG7y+YqSR
         r6w3OVmuvkxc+bRkkDxuPNIH8hPOFZ/MZyFd+kaJf4v4zhTxs294qDIroe23kcLc60r5
         gyBaSYRmQ3lECr7xPgZveCkwWvJ9B5vCBi6PIGKkO09gitUXgGEYSOcB3Z5pI3uRmE5L
         MKVAXBTnhM+q+JH153hbQbBFB7sDlInT+J9e90wrE9qZiOQV2wMRGYJtDAFfOlrjWtxE
         1xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777274823; x=1777879623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kUhTkdHvc3oY/y/iSAnX1xxIUfgWoxWMmlhyEq3JBw=;
        b=RBGyS75/HIZjQ73zGodv8LMaKhP+mvWJXSJ29shOQaat22MdpbzWqRK5ixkwBpVETF
         8Wv6UqelZzDFrrkiiUfhO9+0ktW1LKQzqLPjhopyBNowm94bcQzrRFv1NW9CHD0coQzk
         nMww0yuQ7f9N8rvcTSX6B2ywVjMLAzfNP7hHvgBCUk5H9OWbIYanKnvO5NPmx0AuNr9K
         fdMHDP7HGs90tZZvgSWr1+pl7J5RnsqdfqHpNsMRwLKE6tt2vEo/nxyy7J2V+qJPaZ+H
         FgAYAX1vX0oUeXieWqXdwcmHxCAd6tBr0Xy39vZiZwOil4gqmv+3q+gFu0DQ7r3sGqAn
         gq3w==
X-Forwarded-Encrypted: i=1; AFNElJ/4QabTZYS0v5R5f3a7/LaA+REROKjS664sALT1mRhgLnBIz4Mdb8MChKDtjjWK1Vr6LH0+i/g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYaWMzsQPpfsMwxFz9byS0cqylJdP/g0BFKf8E+vdbRjWlc+k7
	DvNS5JwzgLz1tf5an38ofdQWbeFsBNijCcP8SyrvZGtC/NrsDkTkh+BSQOiVIkCrfQ+lFVknTt2
	elo6c2U3r0YdWHKDJMLkjzDhiZhw7awo=
X-Gm-Gg: AeBDieu4jsiXPY65NOW1sH1sizkx6h3QdKbSvhaF27MPYaBRfoQAwOqeo3+92d/nFng
	zgCCXUMobebQjFW3HyBbtCLvJuLjpELugRU0ohSL41XprGseWv9gnZgdIK71uihniwNe/Dq2OL5
	lmOWvOiUs8yVjjHRuO4gKdCPbbZQY3LanfoPqS4YsI74mopxQdrf6qFqehQQ3GUv6o48sbkV1SG
	vMaE2RDC0Ngj5WzdwG7SYgA7Iaec5H3Dv0G8HsjlsMi1jPK7vTjchlyPr6apN744u5TJ2BzAJPB
	HfhzkaqvJ24dANPHWGs=
X-Received: by 2002:a05:690e:13ca:b0:64a:d479:bfbe with SMTP id
 956f58d0204a3-653107e1fffmr37750335d50.11.1777274823339; Mon, 27 Apr 2026
 00:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260310024305.555408-1-james010kim@gmail.com>
In-Reply-To: <20260310024305.555408-1-james010kim@gmail.com>
From: James Kim <james010kim@gmail.com>
Date: Mon, 27 Apr 2026 16:26:51 +0900
X-Gm-Features: AVHnY4LqeV0YZVawJX8Lx_yiM8UhsDDdpU6nTKCbtsDJT8mHu5loXzktWCz1VJE
Message-ID: <CAPdMtfesMMAjZ5gRoOomPepmn=V86NoiFYVuiRaEXhxwzNSx_w@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fix use-after-free of arvif in assign_vif_chanctx()
To: jjohnson@kernel.org
Cc: quic_srirrama@quicinc.com, quic_ramess@quicinc.com, kvalo@kernel.org, 
	stable@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_002705_554653_04C02E3E 
X-CRM114-Status: GOOD (  23.20  )
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

Hi,

Just a gentle ping on this patch =E2=80=9Cwifi: ath12k: fix use-after-free =
of
arvif in assign_vif_chanctx()=E2=80=9D (submitted on March 10, 2026).
It is a small, self-contained bug fix with a Fixes: tag, and the patch
still shows up as =E2=80=9CNew=E2=80=9D in linux-wireless patchwork.
Please let me know if any changes are needed or if there is a better
way to route this fix.

Thanks,
James

On Tue, Mar 10, 2026 at 11:45=E2=80=AFAM James Kim <james010kim@gmail.com> =
wrote:
>
> In ath12k_mac_op_assign_vif_chanctx(), arvif is obtained from
> ath12k_mac_assign_link_vif() and then passed to
> ath12k_mac_assign_vif_to_vdev(). Inside that function, when the
> target radio (ar) differs from arvif->ar (multi-radio configuration),
> the old arvif is freed via ath12k_mac_unassign_link_vif() -> kfree()
> and a new one is allocated internally. However, only the ar pointer
> is returned to the caller =E2=80=94 the caller's arvif still points to th=
e
> freed memory.
>
> The caller then continues to dereference this stale arvif pointer
> at multiple locations (arvif->vdev_id, arvif->punct_bitmap,
> arvif->is_started, etc.), resulting in a use-after-free.
>
> Fix this by re-fetching arvif from ahvif->link[link_id] after
> ath12k_mac_assign_vif_to_vdev() returns, since the link pointer
> is always updated when a new arvif is assigned.
>
> Fixes: 477cabfdb776 ("wifi: ath12k: modify link arvif creation and remova=
l for MLO")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Kim <james010kim@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless=
/ath/ath12k/mac.c
> index b253d1e3f405..ee44a8b59e9b 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -12069,6 +12069,17 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee8021=
1_hw *hw,
>                 return -EINVAL;
>         }
>
> +       /* ath12k_mac_assign_vif_to_vdev() may free and reassign arvif
> +        * internally when switching radios (ar !=3D arvif->ar). Refresh
> +        * arvif from ahvif->link[].
> +        */
> +       arvif =3D wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> +       if (!arvif) {
> +               ath12k_hw_warn(ah, "failed to get arvif for link %u after=
 vdev assignment",
> +                              link_id);
> +               return -ENOENT;
> +       }
> +
>         ab =3D ar->ab;
>
>         ath12k_dbg(ab, ATH12K_DBG_MAC,
> --
> 2.43.0
>

