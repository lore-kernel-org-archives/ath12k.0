Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E362ECA5FA7
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=; b=pcTGh5RBiSHFsSYkv5eeGILXLT
	h3hVeNrKl9M7J35gphG+QVrPXYUTxU674nnUSOQLivRggLB6v6BDbM6/wce1kXBuVFrbijxKaN2WH
	5Jr2Mm/d5+qecw1uplhz2RzDuKjdqxXMI3us1S7c6FAHEtl5pzk6xzvQqRzuS2TW992MYcy0Dk/+b
	yQhdzA1Aqjkk9OBA0O3HBJ+ECCV1ARrBConcTtThl/zihyERU/MWhWprwsDlKnTIyBLyFTbfljv4T
	EHuNJum7qkVXc4bn6A+L1WdfzE0/tn6vGnkmzC0Oi/IDQCz9pITcZwKnMB9S7OhibUMe2sRXnjk8w
	AIfFtC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbUC-00000004Adz-2hwV;
	Tue, 29 Sep 2026 17:19:24 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbU9-00000004Ad4-37fu
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 17:19:22 +0000
Received: by mail-pj2-x0d.google.com with SMTP id d9443c01a7336-2df9754484aso23001815ad.0
        for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 10:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790702360; cv=none;
        d=google.com; s=arc-20260327;
        b=c4wUV19+Pt1IRGGCUA4d7KxXLM+1irWIH+pmkNQxLhVoIGFE61AHWJYGYuUi30cqEf
         hFQfbQU6UaC65DgCQwjKl6XkjyYHKy1ncFDnVijTv+m/0Ir8qAuXs/IphQ0nzpzafqs5
         UcYbhjbSV6LdAvIdMJzINdpdrPniDsXAmUoywdG63T48T+iluwViwtkVpmiJG4Rcs5Cf
         s65Y/DY2xgIg/2TPHaEO9WwGjIqWmgLMNfUrgx3e8/o8rUMUvr6jRVJDl3+G0U57Ek+p
         B569b+vn8zAfUbYerPsrsLDqudBS9BNuJfZUILBcsjxk5z9UPeUob+1bVdjPD5hNSI/n
         EIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        fh=Ra3tZVOiPmQmImahqhKjE6am58tUmdYWh4dL5YEWNIc=;
        b=phIOkv/bZH2l0cPtRPWeRcFOwX9kentmqa4askgZTwacvMqW6pLyrMTRTePnmHglFt
         n5+BIb+5bgTnW5rXYe3NJmq7gRy0TxTgEFXE3Op4xkWI2w6bhnHf1BKS4LHEEvExgJvb
         nXjGy1ylT2WzIX4Y4xHSMvQUSSVMDhMGYFlcWA6hd+hpdy4Skid69tIr7liBTaTWoJey
         TDpxmCEr75yUFvYqmCHtLlLL+rl1k8YUJdMWcAItZab/WsXA3usN49UHKpnwJv2OZRBm
         QZjXAMes2YxZeveQ0Fmd6rW3H3WxNeOcBddVRSSMc5RFVYL6WZ2HEKgKtViDUiIfduKS
         mtlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790702360; x=1791307160; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        b=ZfVTT+KgufmNSOZvR4XreoiC4WWqXyasnPb5flYINbvH/vBMKyAkmxb6AUFXLlGiuk
         H7OANyQb7fZUF02RvRn0/+ShUEfaPiIPIMIW4XRXufTWTDti0F01f5FuZl9kzslbySOj
         +5U/d6M3RAGhuMl9P49uhI3v+J5BdEKu5i5OsqXsBV67oaLHZpooAgN0qRLnR18Ujiku
         cRCSAu4AMQiZOJGXDF/UBDojdSeX0Wv+aRgHTk0v8mlcfBRhB3pdk3I8xth8O9R2ELG9
         YYyUTWRvAhIbGpvGdVzhqfCLTNmu3iYuzqQ/kFL3DYn77eQVzWyjNSR/q+Z8nY+kvqfw
         La6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702360; x=1791307160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        b=kAbJeptLslDCXYHiOJ2mf3ZVdyrVHH0X5aXIZ8gbzFEqIUMnh7uDbMQMPu6MPB9bwo
         K0iiaViQ3Vn1x+MWDoHpIJt55FmYKkX5Ok5ZUpUZk+Cw3lr+hVIDAV1i5cSGl+4a/6Se
         qzItMQcn++ySyIvAxyiejFpRQMRA5S6+GBVkbmfby8S3yYQZ3SGRc4oWc4Ax/ha6ZhWA
         SWbFKcJXiZEyEAPGo6ngmIv5twEvD5pOjGfye2AcG2hS5bK7tp8F/uou4YCeIMjh6Amd
         DPsUxyOKlB4I43bCV3y/Ue8NWiQdRpz7KBftWwzJW6Vi3jXrSL+xJ5umovtmCwU6K23G
         4XLw==
X-Forwarded-Encrypted: i=1; AKwUvBxm24z+iyqYWai61lvYrLBc8lg6JrAcsQLy9NVftzrT3adCCRQvam1zzWBwHPNqHlsHsumq0Bg=@lists.infradead.org
X-Gm-Message-State: AFq9FYKiBTExT7+oNGWPlQi+amXZ1N4RvxPe7N8tRcarYr+ni40/p2m+
	VOzzk5vSa039zFlPXI4K3j6Sh3D5Z8AOEqrVMzEHSY6DHsEGqPvgkUo16DROBM/VAj0Z63M2ysI
	Mb5l7IfKv5ZTIBI1Uh8HxGVR7nPg/rQk8PcyEmne2cQ==
X-Gm-Gg: AYBFou32KVw4oWGaUrLIJVokVVKZ7ArTdSB1cF86MS/qDSFaZRSDH7o4P6Jlj3BntDO
	BmiuT4iMpo1620er/pmX78bsPv5hat1aDn93sIEh+oNZkFaARmooK1lZ2YLtwcpaoaKEQspq5I1
	Xy19iYYkqd0i+GfXvzLa31h+kKphUCK+1Q8VqZ3WffMu9i4L9qtLvEz4j5NdY1iPqvxI7A3vjnr
	z24Pz1601Zzblji1BP1ztHQsV60y38CKRpwx9XK/VJfUvMsVy5U4OAJH9cmfervI/vpgk0TwI9X
	fRo2A+iSSgS25oq1khwBoI6KHM/iDTw6mI4tI+xv3aSW73yB+HEvuynWZlJa46ffL/flOB9gz1m
	SXUbwCfGV0GIZNTpE4G/jceH4tWDuadRy+Eo=
X-Received: by 2002:a17:902:f541:b0:2dd:c0ff:e72b with SMTP id
 d9443c01a7336-2df7dff6a98mr129292205ad.61.1790702360116; Tue, 29 Sep 2026
 10:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com> <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
In-Reply-To: <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 29 Sep 2026 19:19:09 +0200
X-Gm-Features: AclHuK-ToRBMZLSrRMx2mcPZtu0EDHFcdsd8teCC6hGeRk6_RwlD5j4V__Nj-zA
Message-ID: <CA+HBbNGS7sVROVN3mywPJEcRKn_+FzzxkijN4Uqv0CMLP-CEJA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Marcel Holtmann <marcel@holtmann.org>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101921_785635_1CC90D7B 
X-CRM114-Status: GOOD (  22.42  )
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

On Tue, Sep 29, 2026 at 7:17=E2=80=AFPM Juha-Matti Tilli
<juha-matti.tilli@iki.fi> wrote:
>
> On Tue, Sep 29, 2026, at 20:05, Marcel Holtmann wrote:
> > >> +#define QRTR_NODE_HOST_BASE 0x10000u
> > >
> > > Can it be exposed with include/uapi/linux/qrtr.h also. There are user=
 space clients like modem manager
> > > which need to calculate modified node id to distinguish same service =
from multi modem over mhi.
> > > This is same as wlan use case.
> >
> > did anybody actually looked at the proposal that Denis and I came up wi=
th. It was exactly addressing this properly.
> >
> > It seems you guys came up with some hot fix and want to run with it. Af=
ter month and month of silence and not bothering to review the proposal, yo=
u are trying to push your thing?
> >
> > If you don=E2=80=99t support userspace, your proposal is broken. Plain =
and simple.
>
> I'm still willing to submit a new version of that patchset originally by
> Denis, if the kernel devs so decide that it's the way. For example, the
> "radix tree of radix trees" approach could be replaced with a hash
> table.
>
> There was also some criticism about a layering violation in storing the
> endpoint id to mhi controller. However, maybe that could be reduced by
> providing a correct abstraction around it, so that other code doesn't
> touch the mhi controller structure directly.
>
> Other criticism for that patchset by Denis was its overt complexity.
> Yes, it has more lines of code changed.
>
> This dual-card setup needs to be handled somehow, either by Denis's
> patchset or by Manivannan's patchset.

I second this, as in OpenWrt we have used a hack that worked only with
QCN9074 via its MHI debug
register in order to support boards that use AHB+PCI radios.

Regards,
Robert
>
> BR, Juha-Matti
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

