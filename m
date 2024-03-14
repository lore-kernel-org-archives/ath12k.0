Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01DEC54E5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 07:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN7o+/qmYgcI6mfFvGvyMIK9dyOtURHv4+OCyOKUvZw=; b=hwWLw0ytvXwFRYDXv90Wk2RUN9
	1WVVh7rcM9Nx1MRoe8ZhJt4lLETlcUn7fo8to3i3sSMtxUQE1wn+rKWkCyjO6gzTRPW0Mm+WgOxK+
	8QrVRKN1lb+LfDvqbFCq6VLH7LYkoXDFXYoJiaFchT28WIDUXl1rgdaqbDxT6Mtv9QYT9osmJ3GPe
	G40dSUEbVy77I2QjMcwbbktB3pH97wzT8qa5pCwkodPhVfnGX8TAuB012//YyqfPAFNj5nggKYdrQ
	C5mm3Kbcl/574OC46ja5Gwl4g6g+vtG7arkKgCJSsT423AAWNOCJzAu+Z0EKxYHHhdAvCB3xFjE2c
	oCy94Tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkfvR-0000000DT5L-2bTU
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 07:54:53 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkfvO-0000000DT47-2Wif
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 07:54:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6ca8c8be2so465451b3a.1
        for <ath12k@lists.infradead.org>; Thu, 14 Mar 2024 00:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1710402887; x=1711007687; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cN7o+/qmYgcI6mfFvGvyMIK9dyOtURHv4+OCyOKUvZw=;
        b=Cxc4mcR1R5gqQRjH7BilBuLtQ3GuSS3tcFH35vZ5Ohi+da3J5k9HL6lbr+Wjynsphs
         IcYEit6G5HuYPPsU4/aevIePIT1t3l69VeNM1qfxrN7bxy9rP37Drr6whlKtWo4GzDVL
         t6nIsxn4ACMRktxQUrhHBOxYsRMhUXL5tyAJ+KHQa/2QxjuiG6J+g3haTaJs/MeUFKtP
         rd9wBfKG3y9G7TdTjhr3n5NpqsOj7+stA/zb5VLky4CZekRTDQe+aMuCOd9pZQmSzDJ8
         s5rpypZT0eCTVCy/+gqBCzobxUWDWTEhvZttCIBbxH4jMRvjVg/KXNMBjLhLMrdmqEQo
         b1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402887; x=1711007687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cN7o+/qmYgcI6mfFvGvyMIK9dyOtURHv4+OCyOKUvZw=;
        b=A+t3+stHe//3vYm6JCrnKe+zCwkmIgEfSV43u7Hzs2duOFot4bLC7sDMMDrpEw4GFr
         BlRogQMUm6J2bhjNZeyCzFhdc2FRxM2SlV8i+mziep6lHYFeRPZXXvkMDLQLvRbxFZCa
         45Y6sbhZA/nX5Euzw9kHllVkOgLzN4TV2N0KDLR2dXc3U5klYrEIkV/HzV8037r6LsBA
         25CwODmtDeJZZDMl+g+YhuTxfiV+KZgqyXP9QpsUpa+9JSbuhydws2pkqQz+k05jg6Ct
         IgFESejJuRjfCcPMdyrqhGfqRRFzK/w46db+XX+2MfUgDsbWsB0wBYs+ZucL957iWPho
         e+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWJt1S93hqrZzNTRQCRS2oo8B0jb4H0w6OBsSwd3NFQ3nWiq+rnux1rj7+Qwaqg8AwNsStWrQcsosfTLSu+FhSYQaB1BKqpvOrBqg==
X-Gm-Message-State: AOJu0YwF7PKYI5Xk/uB+k9P/nFAXcBPt/gmg03xTCsna0OeePD0UjHZu
	X2rmpJezdxraj6X19Jsr7Sq2OieAwMiMfMQ1OeOpwXio2rnh4Jb+Ax4PkmVPf5FEvChPciJOkAx
	aWrHqsMKSaq18+NtrR+HTsZ7+nJf0MAA7MLLUumhwwW6yj2CY
X-Google-Smtp-Source: AGHT+IG/lL1tGT8pUkeu0A2+qzoAZei3Uz5BJOvgcI6NI2QLRo2V2am+Q+iMK9F7GfX4WbiCWc94PrXdNrcRfpaX310=
X-Received: by 2002:a05:6a21:a596:b0:1a0:f2a4:40da with SMTP id
 gd22-20020a056a21a59600b001a0f2a440damr1353534pzc.6.1710402887344; Thu, 14
 Mar 2024 00:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
 <CA+HBbNFQ+25u_PK2j3vYtiCZwv+shVAVeAHKqQCwhyCopORt4Q@mail.gmail.com>
 <874jdigf76.fsf@kernel.org> <3b57d932-0848-40f4-ab2d-a8d4afe11df1@dd-wrt.com> <e1c3ba7e-b358-42a3-a8db-f9c098132350@quicinc.com>
In-Reply-To: <e1c3ba7e-b358-42a3-a8db-f9c098132350@quicinc.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 14 Mar 2024 08:54:36 +0100
Message-ID: <CA+HBbNGZJdvHBeP0cFwK4XgEWxggxqE1RGAXrJmavaExv6NH6A@mail.gmail.com>
Subject: Re: New staging repos for ath1*k firmware
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Kalle Valo <kvalo@kernel.org>, 
	ath10k <ath10k@lists.infradead.org>, ath11k <ath11k@lists.infradead.org>, 
	ath12k <ath12k@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_005450_667772_4C7A6798 
X-CRM114-Status: GOOD (  23.27  )
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

On Wed, Mar 13, 2024 at 8:32=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On 3/9/2024 9:58 AM, Sebastian Gottschall wrote:
> >
> > Am 07.03.2024 um 17:49 schrieb Kalle Valo:
> >> Robert Marko <robert.marko@sartura.hr> writes:
> >>
> >>> On Wed, Mar 6, 2024 at 8:23=E2=80=AFPM Jeff Johnson <quic_jjohnson@qu=
icinc.com> wrote:
> >>>
> >>>> Historically, prior to being incorporated into the linux-firmware
> >>>> project, firmware for kernel.org ath1*k drivers has been first publi=
shed
> >>>> to Kalle's GitHub:
> >>>> https://github.com/kvalo/ath10k-firmware
> >>>> https://github.com/kvalo/ath11k-firmware
> >>>> (ath12k firmware was pushed to the ath11k-firmware repo on a tempora=
ry
> >>>> basis in anticipation of this move)
> >>>>
> >>>> But in order to have repos with multiple maintainers, as well as to =
have
> >>>> a hosting platform with more control, we have moved to CodeLinaro:
> >>>> https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware
> >>>> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
> >>>> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
> >>>>
> >>>> Note that most people should not care about this -- normally you sho=
uld
> >>>> use the firmware that is in the official linux-firmware repo:
> >>>> https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware=
.git/
> >>>>
> >>>> You should only need to access the staging repos if you need a previ=
ous
> >>>> version to work around an issue, or if you are testing new firmware =
that
> >>>> is supposed to fix a problem that you've reported.
> >>>>
> >>>> Please let Kalle & I know if you have any issues with these new repo=
s!
> >>> Can I please ask for IPQ6018 firmware to be updated to 2.9.0.1 as wel=
l?
> >>>
> >>> We have added IPQ6018 support to OpenWrt but we are forced to use the=
 old 2.4
> >>> firmware since anything newer is crashing on IPQ6018, we had the same=
 issue on
> >>> IPQ8074 but it was fixed with 2.9.0.1 firmware.
> >>>
> >>> Even for IPQ8074, there is newer 2.9.0.1 firmware that is only
> >>> available as part of
> >>> QSDK and the community would benefit from being able to use it.
> >> We are working on getting the AP chipset firmwares updated but
> >> unfortunately no news yet.
> > why isnt qca releasing the latest firmwares at all. i mean we all know
> > that the qca networking tree contains way newer firmwares for all
> > chipsets since a long time
>
> Kalle & I are just the conduit, but I've relayed this thread to the folks
> responsible for feeding us the firmware releases.

Trust me,
the community knows that you are trying your best and a lot of things
are out of your control and we really appreciate that.

Regards,
Robert
>
> /jeff
>
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

