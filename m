Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57309C982FA
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCs7pv5QqIjoR61lLvcvhkr9df2eaE8KCWdj5A/isNE=; b=DrCcQ+JZkEXE90WjvpX08J4dMl
	Yl+RDZ01XHD/BOEl5K+OYG+IBBgb0xnXXGWJHkEhDtvFRhKUjQE4J8vQTdrs8qIIeymGG+i6prk49
	HkjCgoQktwoNtAi63ggvkV6TeBn++otWWe59i5y3cbXV5JN2JeOaJfxac6BZ6fFa7e5v35d5AgaG0
	f2qm/ciDp1MuQ6i2r2m3DaqePbIworkw2lESXjx5C8Sf8qREyqW+VzQCVCrP4imdCXjqC8PW4ZaHK
	mpn8YOU8FWf1fYsH9Z+mUlo3Sf9v6crNe7BdWZF3lsdeZ37g1mk/1+9giuIYqD1og58mhKk5rkG3l
	Eyw6nrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wp9-00000004vMj-3Rb1;
	Tue, 22 Sep 2026 09:30:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wp8-00000004vMQ-39jD
	for ath12k@bombadil.infradead.org;
	Tue, 22 Sep 2026 09:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kCs7pv5QqIjoR61lLvcvhkr9df2eaE8KCWdj5A/isNE=; b=l4rl4AR/lq0sVKQJMqa9friX+/
	vJBMNSpvFrmFxE7+8AkDPjKrAE0f3UQbcv4QYPvccKBHJuUDUY7VEko1vr/ZM5ZHd7/YKOrVMZVA1
	gNnboXXPmdRGYz5ZByH72ojaNzfqJKxN1aKEfLzAwCFCO6HXLZR2zZFgcv6CKYxJfVWl8YkIxTTCW
	z4z4KmSB84Z1yoHaXnMY6+ICJWSoYTuRVgPCJFcl2iVdXuTv7pfJPlWBFyvK9tIIGFtu6Bm7II2h2
	0eTvWDUxCGX2LXHYeawcyLPNglKXYKVcetOGWfVnAmzBWQHHr8U783Waco4rqAONPCdcJA/pgKsHw
	wgMsz1kQ==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wp4-0000000DMrw-3FPo
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 09:30:01 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48439feca17so3012244f8f.1
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790069396; x=1790674196; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kCs7pv5QqIjoR61lLvcvhkr9df2eaE8KCWdj5A/isNE=;
        b=piDeMHEtxq+VYtwA9mF7CCTBn4af4XF2bdLpwAnshe81hiuulQE/JqZViRPFKXfjBO
         Y578QcgaVv1tWtZGujABHDYEFddsDZm4dafARG6EzZ05MNbNKZUGVnIopLLrgxY4U9gY
         oL8BtKZvoNtIaOt6ag1FbS4mamH/6B0u1MuX0+/0wCR1lafqxck99KtVxIw7WpiM1XlW
         iXgJ7nLk+8jPwVGIU1bag1+566t6GKbutyVlnQlG2UkL6DEIsCBo9wmBcSuyOlilz+21
         ztmG2Ftw7vROoe4ULPCn2Fjt3f8YxA450TN0c8IbTPHVfFsuLzDBTim6LeuM6pM7UFd3
         VJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069396; x=1790674196;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCs7pv5QqIjoR61lLvcvhkr9df2eaE8KCWdj5A/isNE=;
        b=t+U+dU+tsn79p0XR2S8pWT+bILwptIuG2YtedfqTpPqYf5hywQD2DsLUaUDzRpjhRF
         uB62c2Nmbgj6QBS9vZJ2QEi2JDC2YL1ufkjIpJhL5FiE9Xx0ODmYY/TimL0a2hRU8mIV
         8ldZ0ygwKFDNljLjdWZ5zFXfCDp5xtOwlR2oiMk8/UovwRM5sivO/tBXHqyX+mXCYKz+
         YA3Gx/NdK4i1QR4Z9hbulXHsILQDvNRjAjw0wEJlBFF0OhYqTv50uqzo5wud2v2sFTEm
         6eGk94A4O5r7+wWTzZ5YHIIg4AZmFwop8Jjyyn9z+SvVIbaS5ZFUAUMnLPdBUiTDUY2N
         1zIw==
X-Forwarded-Encrypted: i=1; AKwUvBwCrh1Dl2YDh+8AzKUn3G6STM8hKE9dUNKcmzamzLyslC/2nUs7UmCA6v/dnGVXXgvWTXZUnq0=@lists.infradead.org
X-Gm-Message-State: AFuF++ljxFehUBCQmAUPg3AkTqlccCZGP+rslNiize2mWwdvO2F3xsKe
	ghNfLMcNkMrisMtBaQn3xRXFenKdSRaCyTgEXi6BjxVPlHHRlnCZ2g6X
X-Gm-Gg: AYBFou2pzHGGx92vXbC4bA36q3d4THEMnvFM5ssEo5k9KLJ/P1BaDKj+dSea+d7XXXu
	Q3DRtWQmm71YWCO502K+LXjRCTo4hZacfH4J1njxg4oWj4pmpI3JL7lP8C9O5inujTb0FrNV2iy
	/E8zj2VX1KsA2WXeh2MR5Rqa9DpmERPG3mZ8c1q7T/7jKOTy/HmolhC49zU2wvbzi6QYWlpAuJg
	1rT+jCGk2jG6FXHfSJTWpLkTKfIg6H0MN876GjVw7nuKbgLt4oLwpK727fPDm0hXf3B6ppsJlzB
	SE2IVDQHXEav0bw2dPp+Fk0qnRUvi8CXlLbVHNGceIeZXTbYJJVuzr16wkxAw7c2zRlBcCKQH3l
	S3t7+Kjy/XAFoz9AdMMl8lOUiEIxWhyoh++CLZeoyzF2H8kuG28Gvx2vGPcBT0hEtTr9AnwrQ8c
	4KyvTO8NtLz58cZ3N8c2yxRomcer5FwWBdQIieS1Zz9QvVxzvx0VuCzDtW6e2nsWpAXFYGzwmo1
	59l0Sk31I6fpBJR7qMZ6wBTg+YvDV9vdsX9vyPsHTtlvx99Q6Y=
X-Received: by 2002:a05:6000:40e1:b0:487:6f2:1a45 with SMTP id ffacd0b85a97d-4871e21c762mr19190325f8f.18.1790069395392;
        Tue, 22 Sep 2026 02:29:55 -0700 (PDT)
Received: from ?IPv6:2001:8a0:c4c6:f00:a510:942c:f93d:df89? ([2001:8a0:c4c6:f00:a510:942c:f93d:df89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886279298asm3082048f8f.34.2026.09.22.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:29:54 -0700 (PDT)
Message-ID: <c30b21e218bfb00a1eb3c52ea0b7c9f0dc828592.camel@gmail.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC
 address pool
From: Vitor Soares <ivitro@gmail.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson
 <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
  ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 baochen.qiang@oss.qualcomm.com
Date: Tue, 22 Sep 2026 10:29:53 +0100
In-Reply-To: <974e540d-d6e2-4ebf-8714-98e4056083d9@oss.qualcomm.com>
References: <20260921173033.846332-2-ivitro@gmail.com>
	 <974e540d-d6e2-4ebf-8714-98e4056083d9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_102958_904174_60FC52FD 
X-CRM114-Status: GOOD (  19.16  )
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

On Tue, 2026-09-22 at 14:13 +0800, Kang Yang wrote:
>=20
>=20
> On 9/22/2026 1:30 AM, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> >=20
> > ath12k supports creating vdevs with addresses provided by mac80211.
> > Userspace can already make concurrent interfaces work by explicitly
> > assigning different locally administered addresses.
> >=20
> > However, ath12k does not advertise an address list, so when a second
> > interface is created without an explicit address, mac80211 has nothing
> > to pick from and falls back to the permanent address. If the first
> > interface is already running with that address, bringing up the second
> > one fails with -ENOTUNIQ.
> >=20
> > As in ath11k, provide a list of usable addresses so
> > ieee80211_assign_perm_addr() can hand each new interface an unused one.
> > Keep the first entry as the wiphy's permanent MAC address. Generate the
> > remaining entries as locally administered variants by changing only the
> > upper nibble of the first octet, which naturally limits the pool to 16
> > unique addresses.
> >=20
> > The cfg80211 definition of wiphy->addresses does not specify where the
> > addresses must come from. Some ath12k platforms use it as an interface
> > MAC address pool, while others use it for firmware-provided per-radio
> > addresses. Gate the generated address pool behind
> > advertise_iface_mac_pool and enable it for WCN7850 and QCC2072.
> >=20
> > Other platforms keep the existing behavior.
> >=20
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-
> > QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> >=20
>=20
>=20
>=20
> I just did test on QCC2072:
>=20
> root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo2 type station
> root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo3 type station
> phy#0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interface wlo3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ifindex 6
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 wdev 0x3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 addr 22:03:7f:12:be:cd
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 type managed
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interface wlo2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ifindex 5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 wdev 0x2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 addr 12:03:7f:12:be:cd
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 type managed
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interface wlo1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ifindex 4
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 wdev 0x1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 addr 00:03:7f:12:be:cd
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 type managed
>=20
>=20
>=20
>=20
> Tested-on: QCC2072 hw1.0 PCI=20
> WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
>=20

Thanks for testing this on QCC2072.

I've added the QCC2072 Tested-on line for v4. Could you reply with your Tes=
ted-
by so I can pick it up?


Best regards,
Vitor

