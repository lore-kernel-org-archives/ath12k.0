Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A258BF3ED5C
	for <ath12k@archiver.kernel.org>; Sat, 11 Apr 2026 21:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX0UwOuxeC6CQxXcxigTUXyZtEmIGhSjadTlb5iN6j0=; b=pEIhQQUAYqiQ4e7LfdHu07s5V6
	qWP2h+/VTUEUXsamMSbrPKnGl9C3dF++zR7/SMgCmV2t/EbSnfhT6t4h1KWdz6r7maezCfRQeCbiu
	LbRsWzHsrh01obdRdqB/zGOj2U8dFclY3IIiSYrkQf4WzUhCEvjAJnk/Q4Oy5CRpaLkPEHwZkT6SU
	kcT4yEq9D9pS2oP5ezwoevVWY9GtJlbOuVPhGYZoiEtbpbCjRh4qANWPJF9d/9mgxyIniC66qJfrS
	YzK3UJJ53gKKmXsNnaHcGTUvKXauJOjcvq5ziIPr62cqv4pvwj2dYGEjxEZ+W+o14PBk754f6Dfwb
	xkaOrtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBgMn-0000000Dp8v-0tlB;
	Sat, 11 Apr 2026 21:59:49 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBgMk-0000000Dp8a-121o
	for ath12k@lists.infradead.org;
	Sat, 11 Apr 2026 21:59:47 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-12c19d23b19so3196089c88.0
        for <ath12k@lists.infradead.org>; Sat, 11 Apr 2026 14:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775944785; cv=none;
        d=google.com; s=arc-20240605;
        b=be0crC4E2+BhIt277zJm4DjoXU3t6BmTxPbuKTiZ53a12Tq9vygHNqEOJcQ+/rd7Ew
         OPc7f+0Ilia3jM+WI+x9hvU2SSXyftsSigQaje8WW5zuZV6oAMkWW72NVHDxcSHI1Lh7
         4FoWQM8taw4VLloBA+UW+4LtY0onoU/bo5TYd3ExP0QjuoERgot/CUdNwEroW8CKuRcM
         +3SqixqoZBCi+ZTNaZcfbdILHr15A5lfqOfUpKm/Wz+fwCVFnT8LnjwYv9Tz3MGrZOAl
         oONivbK+NXhZ9nxOZPk8T/CWKvAXakxZIiE8r/RwKcOOmoQjI9YctkoOqxKRwAUD5QXR
         dlbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NX0UwOuxeC6CQxXcxigTUXyZtEmIGhSjadTlb5iN6j0=;
        fh=1SVnUWCOlqesgPz0exmlrbRHUNpcaNpUxuycVPutrXI=;
        b=g4slikKV62FR74g8nS6kh6FgpiAvrOsJ1v+buMyO/m2Lga5Bsrcu7xPOY3Hczubesx
         ofY1xr4kUr9bW1tCwaoLJFRaAsWzXGbVm4vrkUXVc6DqUbJdQz91jBuiVI02Uw0nb5dJ
         UimXLXyjiCwOz7pJmVrA60SR9ll3eQnkpVtsurLtM9ENUetkgmjoEheCxv2AgDbdCpXA
         S5WHEWPMhR0blzKDtdENltEaGdxUVQ7DU+Q40pnopLE+HUf7/AWV85WflgRryt0+cquy
         o9TWec4rcfEtwh8jY41RQ72UeUN8IzFJ01/OzzPPzJjafcpa7aFGEp6eRVl83wOYUdzS
         jIiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775944785; x=1776549585; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX0UwOuxeC6CQxXcxigTUXyZtEmIGhSjadTlb5iN6j0=;
        b=BhT7ccXoqdl8V9/GMpiiwX0YPacYrQ2PlizsBR0e2beEBPRHiCfCQx5u1WW6cAnJ/m
         vbJf6EDyCrMJ47u5wvh7eF8amSSIWei5/tFCFbHYR/c/X1hbNVcUGp+4tSliBPQNzbfM
         5LgIjTI/3qu01iGxaTyePoMNYqrDPdpP738+KRnPVW/KiQGNQFk+yZFnrx0F+axKvY0u
         CuLqvvgd7u29mm5KUXRax6lA/8+bFpYiDIbcf5AqtRwTF2nW8ipdPuQRRdmzTaXHu7pJ
         6CdUNJebs0ZimFHp7FkKzEbB+yQMuM4GbzrPFWx+8qir/K59nu9xhiE6JYtKakquc0t9
         zPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775944785; x=1776549585;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NX0UwOuxeC6CQxXcxigTUXyZtEmIGhSjadTlb5iN6j0=;
        b=hq3yYvIDQUmRFh9z5cQbb4mB5VaSL9+iNwFFG6N4ZnxDGFZ8RtWXAwWavQMqtcrWK+
         mWYbSkm0EIzcmmCTsx5GOGdCDkxPvE4Dos3pNilY40vhxhJ7fV9EOcq2E7F9IxlOq9dz
         UrAyTSxgVJnTpKYc0JHdiOEog70Yi7efbMwqKc7XckZzISmV5e3U+scpQC4W5mcg5K4o
         B5OGiriaEgG2hOuRQI0uk7pusqbVuu58wA3Q+F0gOqcj5xUJABB6h/Jc0ASCmN4wULyG
         9MjjdCswCl7xbYNnxjiiGwPvuL7Vax6JYUZKzdvBMTD1fGjHis0d6WxM+rqfgARgFvno
         4hLQ==
X-Gm-Message-State: AOJu0YwADEcjIEM3u8hrxgF1ulZjFfFB9U340tmCZxK8MvfFQZunIylS
	R05QVIDRSK7u5KTcRCIJOIgKWKAhv+5XKQDrhtjIp7zMveRmv2hUhiIDUhxF0Jl2l0l4CD4oQhD
	SfleSTdiQO1GfWRQxecBNC87drjsSEw9bQlqL
X-Gm-Gg: AeBDiete9Ge0saSICzYshnsxPXPhxV3NjThMRy6hk1iMHYKd4rw0MyKyiIrRu1gCl38
	MPskEUkHZr14cdxCP8Y++gqgZfF+2BSjSXzRHwX/SeaKxMUkI5NvrIew4/f0oviCKh83vgF3nJA
	QFmONfpPz6CvN51Y863GLuA94vx3yWBzF2yPhCaZqmwSaw/ixeaOVYPNSqnP6dI3qsIcXI3SBp9
	2QGxtpRJlaYzSUqa9hklPdk24w51oWAZe6WMtINnz2CCNY+PKF3tKjXnhYHkbBiS05BtneeL/6E
	Y72dU0WrPBwbsgt7AQ==
X-Received: by 2002:a05:7022:68d:b0:12c:33dd:fa15 with SMTP id
 a92af1059eb24-12c34ef1940mr4636666c88.34.1775944784691; Sat, 11 Apr 2026
 14:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAKYSms0Q1n3YLbCrMEkH+gTzEzmD2UhJjOC+YD3AJhoQebhfRw@mail.gmail.com>
In-Reply-To: <CAKYSms0Q1n3YLbCrMEkH+gTzEzmD2UhJjOC+YD3AJhoQebhfRw@mail.gmail.com>
From: Jacob Wilson <jacobtwilson7@gmail.com>
Date: Sat, 11 Apr 2026 14:59:29 -0700
X-Gm-Features: AQROBzBrJocrshx5uy-w_SPEXotfRlGvqovIBuwTFKolG_KWZLeTdTVEuBJRGdw
Message-ID: <CAKYSms0NMbftkW1hZgLOhuN6NOqdtu7v_EomO-DX+Y-BN9ykSw@mail.gmail.com>
Subject: Re: ath12k: WCN7850 beacon loss on narrower BSS after prior 160 MHz
 6GHz association
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_145946_311927_EDD883C1 
X-CRM114-Status: GOOD (  22.24  )
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

Quick correction to my original report: I initially characterized
this as a channel width issue (160 MHz > narrower), but further
testing shows it also reproduces with the Edgecore AP configured
at 80 MHz in 6GHz. The common factor across reproducing cases is a prior
association to the Edgecore EAP105, not the channel width per se.

Specifically:
  - Edgecore EAP105 at 160 MHz 6GHz > any narrower AP: reproduces
  - Edgecore EAP105 at 80 MHz 6GHz  > any other AP: reproduces
  - Between the Ruckus and Extreme APs without prior Edgecore
    association: does not reproduce

This looks more like an interaction between the Edgecore AP and
the ath12k/WCN7850 stack specifically, rather than a general
channel-width handling issue. I don't yet know what's different
about the Edgecore that triggers it. I can grab PCAPs of the association
if needed.

Given that this may be specific to one AP vendor rather than a general
issue, this may be more of an edge case. I can report back if I'm able
to recreate this in the field with other vendors.

Apologies for the incorrect framing in the original report.

Thanks,
Jacob Wilson

On Sat, Apr 11, 2026 at 2:34=E2=80=AFPM Jacob Wilson <jacobtwilson7@gmail.c=
om> wrote:
>
> Hi,
>
> I have found what appears to be a repeatable issue with the QCNCM865
> M.2 (WCN7850 hw2.0) Wi-Fi radio on the 6.19 kernel. I searched through
> https://lore.kernel.org/ath12k/ and didn't find a report matching what
> I found here, but apologies if I missed something.
>
> After having a prior association to a 160MHz 6GHz BSS, when
> disconnecting and associating to a BSS with a narrower channel width
> (80, 40, or 20MHz), repeated CTRL-EVENT-BEACON-LOSS messages are seen
> in wpa_supplicant logs, and the connection to the BSS with the
> narrower channel width becomes unstable.
>
> This "beacon loss" state persists until either a system reboot or a
> manual reload of the PCIe device via:
>   echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.0/remove
>   echo 1 | sudo tee /sys/bus/pci/rescan
>
> My setup is as follows:
> OS: Gentoo Linux x86_64
> Host: HP EliteBook 845 14 inch G10 Notebook
> Kernel: 6.19.10, Gentoo dist-kernel (sys-kernel/gentoo-kernel)
> /proc/sys/kernel/tainted =3D 0
> Wi-Fi stack: NetworkManager and wpa_supplicant
>
> Test WAPs:
> Edgecore EAP105 (160MHz on 6GHz)
> Ruckus R310 (80MHz on 5GHz)
> Extreme AP3000 (40MHz on 6GHz)
>
> To reproduce:
> 1. I connect to the 160 Mhz 6GHz AP. The connection at that point is stab=
le.
> 2. Disconnect manually from the 160 MHz AP and connect to any of my
> APs running a narrower channel width
> 3. Monitor wpa_supplicant logs, and I will see CTRL-EVENT-BEACON-LOSS
> within a few seconds, on a repeating cycle.
>
> Of note - when my connection is initially to a narrower channel width
> AP (80, 40, 20MHz), and I move from, say, 80MHz to 40MHz, the
> connection remains stable and beacon loss events are not seen.
>
> I'd be happy to provide full dmesg, .config, iw reg get output, or test
> patches if it's helpful
>
> Thanks,
> Jacob Wilson

