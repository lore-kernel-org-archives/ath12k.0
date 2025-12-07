Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F4AD1CDC6
	for <ath12k@archiver.kernel.org>; Sun,  7 Dec 2025 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Opu2+OL/DwS9JbMvMpOEdTVE51EH8OVgiRsdsv9c8zI=; b=LyTttxg3dlnmCKQIxoCBESDYd3
	rFl7+vngxM3rjE9vftHcQazFRBok/Qnb3bBHi/iXLDNARvJ0EQLVsVHEy8+54qQER3ExPwQ2c9ybX
	kpzEjJHmBAlmay3rKg0xJhPbqDu5iakKJka5tZWC4zL5yEg+GDF+q5RXYPMEIMhcGsWgs5Ao3ack1
	AE2s0NBvugdzfzhvK/4e1af/jLzoK2MYy6dFWDmTdG9sGgrDWffDEIJUp1AX0MMONnXtoTWSxOYdC
	m1PeiQ2KuI6B5xvCp+H12fQA8f36pHIza7qxB3WduK3M/0JFd1jcGaUIyO2NCh52QIY8G6QX1Zd0z
	4k85iQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSKRm-0000000CBbb-30B5;
	Sun, 07 Dec 2025 19:29:30 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSKRT-0000000CBae-2ZGx
	for ath12k@lists.infradead.org;
	Sun, 07 Dec 2025 19:29:29 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8824888ce97so49548746d6.2
        for <ath12k@lists.infradead.org>; Sun, 07 Dec 2025 11:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765135750; x=1765740550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opu2+OL/DwS9JbMvMpOEdTVE51EH8OVgiRsdsv9c8zI=;
        b=DKEjyza5P5Shsv1DL5n+Y5U0NWXw18wrOzQdDZvwc9eQTxMembba6VskpdU7OhpkQz
         IzVaH5p4bjVWzdjOzos+6m/bgj/zS0bKfuBH1nshTtVfqTeVMIaG19eHwYL9e9/PPH0u
         p2nvnsrg8Sub9mIZysjZuv0TPB0i5vD43t65hkdja4rUY+fYcMMXq+92SU6pJlpKzln3
         pf2T/xa3f/fxtRdXJY44VE330Wyos17rIS3vM0agWLPZp2xNW2sO5Eco1eFzyUBXTBpq
         o4LDgAyqG8ItW2EGS8SyP9IRvfCevYmGLGVnc0VZWSV8NY4nhxyEFUpvCwt56iLZB5jQ
         HFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765135750; x=1765740550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Opu2+OL/DwS9JbMvMpOEdTVE51EH8OVgiRsdsv9c8zI=;
        b=kSM/Gq+FzYd4d/9DrdhbmWvJ//M6igZit/VLNirjGNmgB69PWpf/bILyG0XPN1ZwOK
         6PZzn12EIRIKJVacwCKdGeeGBi5Kc6uUiPdhmqwvvdrotDWB4K4grO5moFrH0DEHEJm6
         +b7DnI3/q29mdsQd8i3v7XRwdTJGJLly60o1uQAOt+Fn9H/DzgNbc7Q8k+3b4tBHYtnz
         xajvKXKzibz4X7l9w2yDXWit0RPBazCLU9ME3XtUsst8Lf9kJ0+47zfyIXwKG2FBPF8u
         6OSgUsNw15WBQpomFEZNmW64Dq2W8mtNdhKfJ6N2YKqI2HuPqMCDDdrrlNAsQhV/yk3J
         ErNg==
X-Forwarded-Encrypted: i=1; AJvYcCW8sMuTrLWNcrrfb2yln84jIntLGf3NBR9tZzBo1pAg3W8AEJJV8bHfjT6TL/hawk3G+qJR2bk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOK/QfcE5oAY6KwITtZiDdVkntAWq8Fm0N6DIOzV3PnlzVV7N
	p6nYGxdZCsYupKfHMS8YBy6gZ7x1gvOQTCtB4ZOwG2FRxT1+AEoA4eEo8A4wWM3+VXaKWj6+RZe
	GYvDnx+khjyWHX3oRUpB2KUCuh9hO0Q==
X-Gm-Gg: ASbGnctBOQr99TNo7f59OPrKOT3/++n0WXBOc9KFoHSFF3x/el+0o8VR9QUdCOwv70I
	9gVkGi+C1zHB2swVb4vbVMu51kI/sypZOn06IuPd7nh9xVNWU6vNQdeRlCnarYjDQYFGUgiAPmP
	mzORoLBqXy++6Lv9mGvflEHww7/XT6PGFNbqjnQaI07LNeDO1shASdsr6TklH+v4+zMz6GzIPkj
	5U1onMTj9nyz0Jkjqu455K64DiRSuPbYJ4BDFYII+cN+Gh5AVZKln8PzUT1lXU1HZYSMxzmFLzZ
	VGc1HdhSXg0Pc4Aqn+ipg4MxUQo=
X-Google-Smtp-Source: AGHT+IHjR3mLmPnj9fRaa7D59Q5OP/l7CbN+/RdhM+PjFVUL8+kj6fWBqmoyD4tFOMFEsNhTEVep7TjIbtGOzuXKODA=
X-Received: by 2002:ad4:5ba5:0:b0:880:4ec0:417a with SMTP id
 6a1803df08f44-8883dc4c363mr100694556d6.55.1765135749856; Sun, 07 Dec 2025
 11:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20251201011457.17422-1-daleyo@gmail.com> <20251201011457.17422-7-daleyo@gmail.com>
 <7ea43ef2-b453-46cf-a35e-ea11ca1dbe24@kernel.org>
In-Reply-To: <7ea43ef2-b453-46cf-a35e-ea11ca1dbe24@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Sun, 7 Dec 2025 20:28:33 +0100
X-Gm-Features: AQt7F2oFhC8Mb-l4_CfaR4BEBfSn1QIKcrxVG9maohU2gcvVq5WClxflVEf0V1E
Message-ID: <CA+kEDGEjR7cGA0zZfuKkYg37mJZs3Fn7eKbgkB6hdjDLtGxjRQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: wireless: ath12k: Add disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Dale Whinham <daleyo@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_112912_313082_5BF96546 
X-CRM114-Status: GOOD (  16.37  )
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

Le lun. 1 d=C3=A9c. 2025 =C3=A0 08:34, Krzysztof Kozlowski <krzk@kernel.org=
> a =C3=A9crit :
>
> On 01/12/2025 02:14, Dale Whinham wrote:
> > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >
> > rfkill should be disabled according to the Surface Pro 11's DSDT.
> >
> > https://lore.kernel.org/all/20250113074810.29729-3-quic_lingbok@quicinc=
.com/
> > has added support to read the ACPI bitflag when ACPI is supported.
>
> It wasn't merged. If it was, reference commits, not random emails.

Good catch, It was merged in commit c6a7c0b09d5f, we will reference
this commit instead.

> > Document the disable-rfkill property to expose one specific feature
> > (DISABLE_RFKILL_BIT) for devices described with a DT, so that the
> > feature can be disabled.
>
> This is just a circular logic. Add property to have property in DT so
> that you can use feature.
>
> No, describe the hardware or actual problem instead.

Point taken. Would something like the following be better?

"For some devices, Wi-Fi is entirely hard blocked by default making
the Wi-Fi radio unusable, except if rfkill is disabled as described
by an ACPI bitflag on those models. Add the disable-rfkill property
to expose the DISABLE_RFKILL_BIT feature for devices described
by a devicetree."

> You still need to answer Rob's questions.

Indeed, we didn't answer another question, sorry. Here it is for
reference:

> [Rob] Assuming it belongs in DT, why is this ath12k specific? Could be
> for any wireless chip...

Agree, it could be applicable to any wireless chip, it should be moved
somewhere else. Would ieee80211.yaml be the right target file for
this property? Or any other file suggestion instead? Thank you.

Best regards,
J=C3=A9r=C3=B4me

