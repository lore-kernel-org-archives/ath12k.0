Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AB5CA9ED0
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 18:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=; b=ilaUp46/YOdXuiDFU49E84uPLd
	4ce9IY8an68WrkGiI2XOyKAVzT2Q8EP0WmWoSQXCMJdiKNPnZ7h64RC+CcCjjeLhDQD6PYFv4VWeT
	kAUKPx8KB8NYJuRbx8R7yCGtuzRO3Tyd5Ri11zGHfBGmKo9dDA1OgO8/pS1rmtZSmbnmab3g7A2eT
	h2XgOHTDCBda0l4LDzxhMZH5uDpMUgUVlb+L6cFwgwRO4khDuURhYEq6R4RjuXmHAftfMC4lV0loa
	/7Z0D29Ov+O3ElTpR6KtwxnQBXOjTbYhBZ62JtRgK+juLDx59zvTQ6niC6nM3HuRYiPlVG9z5OIvw
	L6xYHnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLCr-0000000BJJP-2pA5;
	Mon, 12 Oct 2026 18:57:05 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLCo-0000000BJGz-3Mq3
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 18:57:04 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6af9cc73235so2002378a12.0
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 11:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831420; cv=none;
        d=google.com; s=arc-20260327;
        b=hht5DugDadNuUgThRnFCs6Rp8YybG7DUnnexg6cYMCc0McMi6ITteJz1MJkCVFQ/a9
         ZgZPrkQ0XhVHPWjQsNPh0mIVBKQEie0iDNVWf3GK3fBzjzi2hl4DOYZkIb/fN/splwc9
         Ny6bwwtFxgrVO3kszm0T5+EGiQ4cPua35d4KR3KyTqjA+hbTnXAua5pevg6M61eQUTK6
         p/WkGgUmz1j35gQS3eoBsfvBS0Ast7XUuYwTB5bfihHSP5WdP+qikmufXCP835rLoFrm
         HqCj7rlACH4GquI0uwP+4042TVYYXJlb/VLRAC6aKMTpI1qgLUVP7S4Q1gEqDGVKDl+6
         RVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        fh=qyEMgEaopE7iUKqAJnq8P9qxQhRHq6ncUFMkpQt3+Ik=;
        b=WC3lx/fLR7+I4wxDZOYJiRNx6cgwZH8241cGRUK0K2mI1Gd3Z+HLb9a8FVeriN0bO7
         sIAcfwzWE+NmsM597VsRfDEG8Sx8g6THNnUlHtL4ZVWV+9HCUbwA2SIW5R/vJeyGYniK
         fDWFUUMpEbnDw1tkFHYvoxIvdDWs9SssumrcARffnFrY8astPunFJuOh96H1tiBnD7u7
         UE9s8TQpBAxJqtGIX/Hr18WwF3i5lRTCoZXTZ5DXVYjfeIAJfQz3Xfw9KuG98ZIyo6yI
         WXodQfVhDduGHTwmaPkZMHjeXmpXrP3YjC3GorU6Fg4CML2k+1o6IUp6JgSBstu241zj
         wLYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831420; x=1792436220; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        b=TFDyNJhGwQSZtG3Sv2WSNPm874t5cSs/R8T/3aTy8Kftha9ccvFq67W0nFDxDpQmqH
         hylDK0ToxdwzWRJDrZAmDMEtusz7e1AjJzmvYu3leTchXCfeYMgAqpvEbBSeVfnz0c42
         KB9WGOXfYOBSkHRDKnGJOeO/d80hnl88BbAJh7eb9pSJFDW/Nhqra88Iit+Gk+4x7KZS
         LK9vZR/Moi3odn6S5/aA6Vr3ISsDmjMCKJ5aPrrc6G1zqoa5eEERvSPE/6UqCh7PLQv6
         lk6CnXKVJTNamhcyk1WX08zUugKVQKJVxxwAR23rUxIq0/OimdLlf14YTOccsGK1DPon
         R2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831420; x=1792436220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        b=uBZRUNlibH+l8eTDCG9C/mpIn/i8Um2Ku8mbRqSSGttdzv6cLzs5+nwV+KWnzaghKL
         etE/gKihhxS5QGQk2tfAGSvkXXcM613jp1rTSLtTI2GK7qTY2+qktU1dcvJdDAJlHqRM
         xwsSh0MfhWPWygmPBJUoSX+jVNCTh7ttDATfT9cM3hFU7dMNhNeSCfC6DjVlRLX7143O
         DPZezn4cIyk1jPSRB60OYDBNMKQtF7M1P67TRwtwQOmQiHb/dVn1Zhk2sN5U44KlzCjp
         4MiakAO4yJTRQnNU3ncp/mm32/G0rzE17ghMvDtzSY6JOK9g/ydHQ2C4WY6etsXcQCso
         JP9g==
X-Forwarded-Encrypted: i=1; AKwUvBzUNfJlhn4gN4zmuZ8h0Y42QeWHU7c4MxpZpECjZY1tjWXuwrrvPAaQNmsNH+7DLP53mVcJU44=@lists.infradead.org
X-Gm-Message-State: AFq9FYJuaDlf5aQWU6zzqmixqpKyHH/6gJwoECMF7oGqA7X4L/I8CXKE
	98bD/zXU7HjeBOM2HEC6sAIiPzwe8sjyIMGhclMQi9Cy0iTtAm329vmEFbHdgjoUygAo+LjSq7P
	UP5QepIyCBT+QoJBSN5Qn9tojwvqmL02CWto=
X-Gm-Gg: AYBFou17OlOWmxYob9AuAFSoPnSOWv9kv8dFtUNIwlmP6ToctKSAnYXnm6HgKr7RNlT
	gnX+LEcI423lKX8eR74p4jfdq3eMsaKuECuDtYoXqNrYyHytwsm2bKBH5RRUxlHrLege/ggyYTM
	0UN8rofZ59Gc5Ce6+WPQ2DKvxgMAXnpFTfY7Dib8Yayx0+wDyD1OrICHJX1IfTiKfgVG0EzR9oh
	FyILWT8flIbmyO9MJiNgTsyuqu/MbezVCVo7ViI6pXRxsqEMkCF2xSyIa7pR0iGlO0A14ZqXMob
	oxqHh3kxctDN+CMjbfIfbAe/Bz2SSQG+e+4Qx/8R46kZCs3V60e0aQ==
X-Received: by 2002:a17:907:7b8a:b0:c2e:1e4c:35a0 with SMTP id
 a640c23a62f3a-c31a702fee2mr1083958066b.14.1791831420287; Mon, 12 Oct 2026
 11:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie> <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
 <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com> <6a90eb12-87c7-4942-9f18-6490a91cb0b7@kernel.org>
In-Reply-To: <6a90eb12-87c7-4942-9f18-6490a91cb0b7@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Mon, 12 Oct 2026 20:56:24 +0200
X-Gm-Features: AclHuK8XNRMVa5i_-1gcBHkcX16OiXLgWfJwauZ8ZsGnsvSYHUGeaNp1UtvCa9w
Message-ID: <CA+kEDGEBqMh8X=q54EkQNutxTpqutQ11QdkUr7bvJO8_iFy5JA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, "Bryan O'Donoghue" <bod.linux@nxsw.ie>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_115702_894941_E48A16B0 
X-CRM114-Status: GOOD (  28.22  )
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

Le lun. 12 oct. 2026 =C3=A0 18:53, Krzysztof Kozlowski <krzk@kernel.org> a =
=C3=A9crit :
>
> On 12/10/2026 18:38, Konrad Dybcio wrote:
> > On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
> >> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> >>> On 20/12/2025 00:21, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> >>>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >>>>
> >>>> For some devices, Wi-Fi is entirely hard blocked by default making
> >>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
> >>>> on those models.
> >
> > [...]
> >
> >>> Is this really a hardware description though ?
> >>>
> >>> Its really more of a logical/functional description. It tells the run=
time
> >>> what todo, not what the hardware is.
> >>>
> >>> You could also have a list of quirks in ath12k for this or have a use=
r-space
> >>> utility look for the appropriate platform device string name and disa=
ble
> >>> rfkill.
> >>>
> >>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ trigge=
ring on
> >>> a compat string.
> >>
> >> This is good point. Either this could be deducible from the compatible
> >> or this should actually describe the hardware and whatever is there
> >> wired/configured, not what OS should do.
> >
> > Sorry for digging up an old thread. The board-compatible change is now
>
> I don't get why exactly the board-compatible option was chosen, except
> of course finding workaround which did not need digging out the root of
> the problem. I suggested the compatible of this device or proper
> hardware description.

Could someone give an example of what a "proper hardware description"
would be in this case, to move the needle a bit? It is quite abstract for m=
e.

I guess this was chosen as a workaround since not having Wi-Fi working
for 10 months has been a major difficulty for some new users trying to
get Linux working on their SP11 / SL7.

I can only talk for my own contribution but in my case I had removed
this patch from the series as I had understood from Mani that the
connector binding would have to get merged first and it was far
from ready at the time.

Thank you,
J=C3=A9r=C3=B4me

> > I think merged into ath12k, but I'm not sure I like that, as now every
> > OS consuming this DT has to carry a table of board compatibles (hence
> > needing updates _every single time_ we want to support a new device),
> > instead of being able to convey the quirk through the property
>
> Best regards,
> Krzysztof

