Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2F2C43458
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 02:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/d9RTLRv5JinBYgTb6BGJL8/az+AyrEr0a4TEEeb6k=; b=GXMDOsQkpG6cV+qYXvLKPBHNxD
	+YrB72n9BW+c67Hs6TSvNBaA14fYPpemt5t34xVOBk7CYicNu//lDP5wd9IiUFrmo3xOgo2TL0GrA
	8Icoj8WbWW80n1gMs33KCZl+WHPrf29AE9mPoIVgu68SdcCNbFdvf0PkeYBUdgEonu7oDABxCGUTI
	NAZFhLY/JOuU+aaRAf8E1MvcNy6RQc52JCjy9bkOXHxhrceS37RDUkQy3l6+w+MhZSapYC60jhppf
	SV2htscrza4Nnc3vpj57T4v5yHKxZNLmonJv4kewGHjv09B8Hph6C9RDYrLFK6KPFGoWTQ8HvfF5x
	OSNV/RXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT2U-0000000AlLx-0Lzl;
	Tue, 14 Jul 2026 02:38:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT2Q-0000000AlKG-0R8I
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 02:38:28 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso7811378a12.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 19:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783996704; cv=none;
        d=google.com; s=arc-20260327;
        b=fY8t+s94pMOu+7bH8/yBf8rVS9x7pLSQ+D8F1JcRyH6R0GW9klnvdn7aMoHd6IDenR
         XuZT7GeJW22upQIlB4tzDAd/eRjSbc/UGiZptaAc/zJ75GDOWWmRV5K/ThhBaQ/W2oDE
         SNEL2YprZKrgyk4jsLSb6Ps38T7JyXzJ45Q5e16EuWtNyy6OutK2LVCPPrFdpAnBEw0Z
         ghVhvPWH4RoPy5r6zq3MrHv7WwFxsMj/5/d9DmjRHb6gvea9xkeZcScSdLAm1vXjopYE
         6/4siMhRTkHmDEg2PZaLaHbihoRwu4kwMnTRZXTCe9GxKKBryjLqm2u3TEKQa9J3caEY
         JEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/d9RTLRv5JinBYgTb6BGJL8/az+AyrEr0a4TEEeb6k=;
        fh=vunSjro+U1Phz83i4HMh6vO2sZKm/2IYS4qBEis/PIc=;
        b=ZqLcqXUjXgL8G+6nNJmuQVYQXf8k1AV+Qqgu8z6zyu2hyCVutposlBrZrxXaHO2Aei
         D/PyRa4LD2ET51msZp3xW5SKOE3ixjZIxHR5yUb8/PYWKq/56LGWfYOSHogCEfslGCJs
         SJp7uelZIhQoyl777i7ToDai755k5/8igyl96mNox5jSN2QhfHy3qzUjcWTMPemyOxC4
         r1R6a97BMalGwx8bdvXDRiB3sIvvVwYFZVI8O+hUzohcph+lR773jqWrSrH4jWwZPZoj
         3cMBYvqlEgQrrUozZRm9Q2hjG8KPwR3e0r0PMvkMJoNH5JKE+vSFfVSri5uut1+26iyz
         yPKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783996704; x=1784601504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/d9RTLRv5JinBYgTb6BGJL8/az+AyrEr0a4TEEeb6k=;
        b=cH+9XL6bOM3VHN/0fLR+6eLihkJVN0BVZSRI+rmyZewb/my6iiCbZb4cxNAwPaNbNK
         IMn8RGZcWoKP6lAgNGd0JU+eae6JNo9g2c83w4F4y3yJ/kIcL1Y7jNWME6BrVNFSeFKM
         W33uBwLh5Hi6tFUV92Doi1ELjipOqz+ucNnh020QBzqR3RqKHanCZg5pbIE3YZc99fZ5
         7cgpdqulXne9IDt9y4C1/yMc9QUBOMC03yk/EE5hxMTzgSPyhr4wPeIgRv98JDLmPz/c
         tWniBcOvPogioVB7yuQVnv9NzzsCmT4+mcexBuTPLGLIGAiX6Sx4U+f9LR+dLSZiuf1F
         Fwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783996704; x=1784601504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/d9RTLRv5JinBYgTb6BGJL8/az+AyrEr0a4TEEeb6k=;
        b=l5JH5oiPA/yKEIl67b/c/AsxpDjVrKoYmlzdHdF0FbtQfz6d8WDsyzGh5UuszbXaY6
         xthTtlDhWJHfuGV24gqom+C/sgI1MSznUFBJjqzUWHz9tdr2dHEudoVpFzfqa19Hll6f
         oqTg3SUZ0ukxAUE/7oKS1TqrUgQP080YM5KiJ/G8qAxP++6CmY/nkaRKdtJmkW8FQpGU
         El6W5OSgIqAiCrPs0rJi7glM73yIqb/hIANdH3M53qxRTS0WSlZHGp57diPNlmdu0qR1
         Ba1BGzYX1EBXTVRQiLVdQLio+o8WNxfbNE2Fm1vq4iWE77wE4S8DoyPaqbjRfmHZl8ds
         09mg==
X-Forwarded-Encrypted: i=1; AHgh+RqZhNnjxOIk9wC8S/89UsZ77AVyl/WWzleuUej3rD8kOWkDtiUWFO6j/bF/iTwhAfYhGF+h4Sg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWlJzvKXFTa/6iuUgqsvaH4J2XClmUywVvlUvqd+hP+Nc+wi6D
	j5j5TV1mimvQzaua8y2ovWAZ92a+/vhijNR+iEwxUJgYFz5hMmEfx7rItVPNJDeg9+wQh0CpUPx
	DK5n2hZPdVUusczr0zSlZHwHb0YR9GTM=
X-Gm-Gg: AfdE7cl7gXaGEedkJFo/wMYg9xwx3dapnxJbuGKLVyaygjjmn+PJscbPdbRqFEULqt3
	hJZ5O2ju0U0qmbGPWqwP8Xu4TbbRZvjJf+uwnVhWlDxoVmtMVWK4h/r0pkR0V3I4o/PgB4O+441
	TXhyy9H2FeLG/AhKs+zFWPtd7KFt+nY0jKZMBXTUpNTPUVpLbbLIYLqXUnWSW2tDvWxlYNG4yZE
	hgWQUaJUv/mxf3QmDViHOxRdB8SSt1QmCnNPa4oVVRueo9ftoJqqKBhO1roqWsL6dlD9K4gKg==
X-Received: by 2002:a05:6402:5193:b0:698:3469:faa3 with SMTP id
 4fb4d7f45d1cf-69cd6c711c8mr188428a12.10.1783996703384; Mon, 13 Jul 2026
 19:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260711153336.542-1-hujy652@gmail.com> <20260713150151.2343583-1-jtornosm@redhat.com>
In-Reply-To: <20260713150151.2343583-1-jtornosm@redhat.com>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 14 Jul 2026 10:38:12 +0800
X-Gm-Features: AUfX_mylnAVWH5R49FbGlpdpL213f370VJI3VfyGRvACS5Vk2L5N9PDNAgH5wpA
Message-ID: <CAHGaMk_FbjCShGw++0m9UT+sK+w23okwvx1vkqid6n9M=WScxQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	jjohnson@kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_193826_154736_44741703 
X-CRM114-Status: GOOD (  15.53  )
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

On Mon, Jul 13, 2026 at 11:02=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Hi Zhi-Jun,
>
> Thank you for the review.
>
> > In wake_tx_queue:
> > ring_id =3D txq->ac % ar->ab->hw_params.hal_params->num_tx_rings;
> >
> >In ath11k_dp_tx which is called by ath11k_mac_op_tx:
> >ring_selector =3D ab->hw_params.hw_ops->get_ring_selector(skb);
> > ti.ring_id =3D ring_selector % num_tx_rings;
> >
> > Are you sure ring_id will be the same?
> You're right =E2=80=94 txq->ac % num_tx_rings doesn't match
> get_ring_selector(skb) % num_tx_rings on all platforms.
> In v1 the ring identification was only correct for platforms where the ri=
ng
> selector happens to coincide with the AC, but not for platforms.
>
> I will send a v2 trying to solve this globally for all the platforms.
>
> > Also mgmt frames use a different path.
> Correct =E2=80=94 management frames go through WMI, not the TCL data ring=
s, so they
> are not affected. The flow control applies to data frames, which are the
> ones causing the problem since they use different TCL rings depending on =
the
> platform's ring selector.
>
> Best regards,
> Jose Ignacio
>

Hi Jose,

While you are reworking it would you mind looking at the previous attempt?

It tried to follow the behaviour in ath10k but lacks throttling mechanism.

https://lore.kernel.org/linux-wireless/20230501130725.7171-1-quic_tamizhr@q=
uicinc.com/

Best regards,
Zhi-Jun

