Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0A1CA6CAA
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU4lUQv1xAbHw1WmtS2XtfNJZJXUJbo4VT1ueuu/oCk=; b=FBhM9tmsgG/2pb7LEgx+1PLuFv
	/IOox2qoH9ZBSm0j4Qgu7B1a9TEbXZcNpcOI5Nmia10tjvfcza8E+vkFZAhDAwvdWwg4NZU9nSqVJ
	e+Mf6TxA0MsHN83kfnC+N9SBMNrnLlDuXZa5Rux9jntzmaptQn4hwaADTobI65RhTsrEFvQkkSOpx
	Ztt7WuWn0GHO7CDT5GdT+O5fzZ7teetjM8jG6KaXxdjx23/epvltjPfuyj0P/nRZmFF/vc7tyi7wT
	iVeNQYqM0g7IF/IqvNSWGsUQ/nCknPHqpN+5ngdWQAhIP86wCn/OPsiL2xQez0uBW2NMwg9q7TIn/
	LvWdD7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkets-0000000DtDn-1sb7;
	Tue, 27 Jan 2026 08:58:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vketp-0000000DtD5-3EYv
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 08:58:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso39557305ad.1
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 00:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769504292; cv=none;
        d=google.com; s=arc-20240605;
        b=gAU/ak7A2uG4Y1xHSqxoIrnt8EpzHgBVyDoRzujihT4JRFYwDrYrzdxIHNHxtv1YSn
         ywZxOIoB+vPhYwiTPN7Tzc/QhBQdUzvttjR4qMNzE84xLtA/g2GFHpNoqQyY1jdcdqdt
         E5Ne9kmQHe4IQQhjHc0B9+zfe+YIcOkVgCvNPXO1hqe4VBezqtCkwJJo91jawhr9+6tY
         C/qM09yDLl0YpBAXVCKNPf3dzjSSqmxujiqFAWIgpAwFnS8fQWZc7ShKLa3GDCSPmUfP
         chIc/FWkGKh/70QD6Ow+iS9l4jKbikYx2lIgn1dBAsEKFxNHFs4jKSLa7ps36B3B2J/+
         Vj2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PU4lUQv1xAbHw1WmtS2XtfNJZJXUJbo4VT1ueuu/oCk=;
        fh=ufLYLKPkX0L7XyBQ8nPQ/t3T0fhJan6BIBMR1NwE53g=;
        b=So7lvGPRjGCnGzDmhOGYwm8vhpY6bO8VfYNbbI2/RQlSQGLregiLnoS3YE23Mp782+
         V+KR5iAUZb1Jn3Y9MaK69JKjIixKTYqCygR+lirfEFKXct9SRzWmSU0nU7ThBA+k2fcg
         BTfhbUJakJ64JLeFFKGrjaM1W6wpDziDu8Qp58mwx+YQaL7e0vNT/4dlHtB9Ial39ES0
         SAvW3XyoM7qp/KFlqlOw4l4G4qg8YU6Y8wPhiT+BFmVL+jWBMws/H/j14A2Cg3+jF7uz
         StYjEEAHZVhJdkQQwy3n4qo5Z5Xd0UguMDkhc40s58jEYHYaj35kkYpl9u1VUH359FRQ
         KA5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769504292; x=1770109092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU4lUQv1xAbHw1WmtS2XtfNJZJXUJbo4VT1ueuu/oCk=;
        b=Wtm+2E/nKSR4Mz5flJleHGVEntl0XuWMvWdduvyqDRINmW5Aj23JCi1KnzvFCnePWo
         SV5RsxpCHXrNAs2IE9WbggSCFZsCDIpGb+PY+IZaXIKYTnjImD99CNj9NAX2LnKWldph
         1b/4Gkh9G7ze3m3iyJ++4IT5pAnU+c+CekWCu1hPGbsXFiS1CRYxfmY+z/uB6546Nev6
         5u6+9nhgqulCiaDIzRmVBrifHRYLY14j+MCi07dIavCFVkxPpQC+daVdJeJEs40Jd0LE
         ZGA9We09ZfPoSHTpm4JeiuY5F4B1G8Vm2xEek27KFu2jfwOaofxGnQdhjNwxe/vyH+Zf
         kJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504292; x=1770109092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PU4lUQv1xAbHw1WmtS2XtfNJZJXUJbo4VT1ueuu/oCk=;
        b=HS7SC/A05886+K04xhXCKEh0QDN0n2yGwZam4kSiX723q+jPbP+pXnPu3iNYH0lftq
         2wePw/t1/bcjJH6kxRti86r5nDLY0OMJ6Xpn+oEJG9A0MPBTyASD4ByCBd5R7ZO6d0r9
         5kzx+a0MnMaM/pjWx1oC6Kf1E/94bx9RDn3htpESPjYQWFunJ41gzBV02FsM2tK451BO
         LqEyjzlGpTLBic+gzECPSuYRZ2KHG4lBslMjhtn0CWV+nq5nNwXal5zr5mI+JdgXWwJH
         NO/WmTpQFrd4SzLcuTp7Bu6XFnB/d7ABg/KjPGvQuPG8N6+X0T1/h+2mOrOrXJZnpXIW
         /0XA==
X-Gm-Message-State: AOJu0YyXBld/CC5sxzmtz6+083VTon3OY1hEVmvn6d3qwPAycSeMmm++
	MEbNYqTEDT900jOFXr9HJ0JFwLthOvZG8l34rxtHfhZocz36YYARF4NbE8BWTRiTfNlBPqxWZpM
	5Yzsb+/9zEXI+hE5CmVYg7PRKMdgcUac=
X-Gm-Gg: AZuq6aIBAwy58g+vKHITArHo2CXp/mMwrzwXwAj27msFVgYNwevzlP0yootOfIzpSf0
	htUD12Ljt6eFEFLbcBbEMTOpdnNvNPttuT4Lfziyqcs7yBenIlnUmqB6t0BfIlMisctdyxJ8wOE
	z8i0sEOgHyq66IcmWJgEdpE4AZH80V1fuTB1QshyVi0zeHgDVq/+ptrHH6h/ly7N3WRdc+Hs5aA
	11p59sai08Ujb/i+0Qn5tUi0cn1/ZItwIzzIRn1jeM/i/zNRO7MY/E2dvMOKOTwBpUZuJjcPgH6
	6snV/ck4mxEtx4EYWIctnoYRMIvoPILA1sl8Cr0=
X-Received: by 2002:a17:903:2ecf:b0:2a0:9402:2175 with SMTP id
 d9443c01a7336-2a870d613b3mr10649075ad.27.1769504292292; Tue, 27 Jan 2026
 00:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20260126095244.113301-1-bjsaikiran@gmail.com> <20260126095244.113301-2-bjsaikiran@gmail.com>
 <776ae681-9db7-4051-abe1-07530f87d485@oss.qualcomm.com> <CAAFDt1sgAC6bHOVtELmcQVx=L1dTXDsQFtO+N3R_C2C35VOxhA@mail.gmail.com>
 <45061c9a-6f01-4228-9737-0222b4b49059@oss.qualcomm.com>
In-Reply-To: <45061c9a-6f01-4228-9737-0222b4b49059@oss.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Tue, 27 Jan 2026 14:28:01 +0530
X-Gm-Features: AZwV_Qg1RPufYvgrZ0FZi9GiRAuYpA21EVJ3rHbV9_hVbHAErLSOAhFnJSRuvtc
Message-ID: <CAAFDt1sdE3Wpp5CByTZmBk=YnQxFhAwmbC5XpYaqYq0Wdx547A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: ath12k: Remove frequency range filtering for
 single-phy devices
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_005813_823310_BCB6D031 
X-CRM114-Status: GOOD (  40.80  )
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

Hi Baochen,

1. Here are the MD5 sums from my /lib/firmware/ath12k/WCN7850/hw2.0/
(sourced from linux-firmware 20250901):

2fa9a691f199b25aafce48967d93c85b  amss.bin.zst
7cd6eb50e9a6ad98e658a53033214c9e  board-2.bin.zst
62c117046e52cb78c922635bea177afe  m3.bin.zst
953ba9719c55664a5d91d99b412caee1  Notice.txt.zst

2. Logs: I realized CONFIG_ATH12K_DEBUG was disabled in my recent
build. I am rebuilding the kernel now with the debug mask enabled and
will provide the verbose logs in a follow-up email once tested.

3. Regarding the Frequency Logic: While I gather the logs, I'd like to
highlight that the issue likely persists regardless of the firmware
behavior.

The freq_range filter assumes ar has a single contiguous range (e.g.,
start=3D5150, end=3D5850). For a Single-PHY device like WCN7850 that
supports disjoint bands (2.4GHz + 5GHz), a single start/end pair
cannot correctly represent the capabilities.

If we set it to cover 2.4GHz, it filters 5GHz.

If we set it to cover both (e.g., 2.4GHz to 7GHz), the filter allows
everything and becomes redundant.

I will get back to you shortly with the logs to confirm the firmware state.

Thanks & Regards,
Saikiran

On Tue, Jan 27, 2026 at 1:11=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 1/27/2026 12:04 PM, Saikiran B wrote:
> > Hi Baochen,
> >
> > I checked the logs again.
> >
> > The issue seems to be coming from how
> > [ath12k_regd_update()](drivers/net/wireless/ath/ath12k/reg.c) handles
> > frequency range updates for this device. WCN7850 is a single-phy
> > device (single [ar](drivers/net/wireless/ath/ath12k/mac.c) that
> > supports both 2.4GHz and 5GHz/6GHz.
> >
> > In ath12k_regd_update():
> >
> > 1. It updates the range for 2GHz capabilities (sets range to ~2.4GHz).
> > 2. It then attempts to update for 5GHz capabilities.
> > 3. Because `ar->supports_6ghz` is true, it uses the 6GHz path logic.
> > 4. However, `ab->reg_freq_6ghz` appears to be uninitialized/invalid at
>
> Hmm, this seems like a known firmware bug. Are you using the latest board=
-2.bin? please
> share md5sum of your firmware binaries under /lib/firmware/ath12k/WCN7850=
/hw2.0
>
> If you are using the latest, please help collect verbose ath12k dmesg log=
:
>
> modprobe ath12k debug_mask=3D0xffffffff
> modprobe ath12k_wifi7
>
> > this stage (possibly due to regulatory init timing or country code
> > issues, On Lenovo Yoga Slim 7x, SMBIOS does not seem to provide a
> > valid country code. The driver attempts to set an invalid country code
> > which the firmware rejects. This inturn triggers this issue. Fixing
> > SMBIOS parsing/defaults is a separate, complex issue that varies by
> > vendor.), causing the 5GHz range update to be skipped or invalid.
> >
> > [ 11.699027] ath12k_pci 0004:01:00.0: Failed to set the requested
> > Country regulatory setting
> > [ 31.111995] ath12k_pci 0004:01:00.0: Failed to set the requested
> > Country regulatory setting
> >
> > As a result, `ar->freq_range` remains effectively set for only the 2.4G=
Hz band.
> >
> > When ath12k_reg_update_chan_list() runs:
> >
> > It compares 5GHz channels (e.g., 5180 MHz) against a
> > [freq_range](drivers/net/wireless/ath/ath12k/reg.c) that only covers
> > 2.4GHz.
> > Result: `center_freq > end_freq` is TRUE -> Channel is filtered out.
> >
> > The filtering logic added in acc152f9be20 works for split-phy topology
> > where each host ar covers a specific range. For WCN7850, where a
> > single host ar covers disjoint bands (2.4G + 5G), [freq_range] but
> > [freq_range](drivers/net/wireless/ath/ath12k/reg.c) (start/end) cannot
> > represent multiple disjoint bands at the same time.
> >
> > Removing this driver-level filter allows the firmware (which knows the
> > true capabilities) to handle the channel list correctly.
> >
> > Thanks & Regards,
> > Saikiran
> >
> > On Tue, Jan 27, 2026 at 8:52=E2=80=AFAM Baochen Qiang
> > <baochen.qiang@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 1/26/2026 5:52 PM, Saikiran wrote:
> >>> The frequency range filtering added in commit acc152f9be20 was design=
ed
> >>> for split-phy devices where multiple radios with overlapping frequenc=
y
> >>> ranges within the same band are combined into a single wiphy. Each ra=
dio
> >>> in such setups handles only a subset of channels within a band (e.g.,=
 two
> >>> 5GHz radios covering 5GHz-low and 5GHz-high separately).
> >>>
> >>> However, this filtering breaks single-phy devices like WCN7850 that u=
se
> >>> a single radio to handle both 2.4GHz and 5GHz bands. On these devices=
,
> >>
> >> To be accurate, WCN7850 still gets two phys in hardware, it is just in=
 host that we treat
> >> it as single.
> >>
> >>> the freq_range is set to cover the entire supported spectrum, but the
> >>
> >> exactly
> >>
> >>> filtering logic incorrectly restricts channels, causing 5GHz to becom=
e
> >>> completely unusable.
> >>
> >> how? what are the actual values of freq_range when you hit the issue a=
nd how are they
> >> calculated?
> >>
> >>>
> >>> The issue manifests as:
> >>> - All 5GHz channels filtered out during channel list updates
> >>> - No 5GHz SSIDs visible in scans
> >>> - Only 2.4GHz networks functional
> >>>
> >>> Remove the frequency range filtering entirely and rely on the firmwar=
e
> >>> to handle frequency restrictions based on actual hardware capabilitie=
s.
> >>> This approach works correctly for both split-phy and single-phy devic=
es,
> >>> as the firmware has complete knowledge of what the hardware supports.
> >>>
> >>> Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-ph=
y devices in single-wiphy")
> >>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim =
7x)
> >>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> >>> ---
> >>>  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
> >>>  1 file changed, 13 deletions(-)
> >>>
> >>> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wire=
less/ath/ath12k/reg.c
> >>> index 7898f6981e5a..48c362a86524 100644
> >>> --- a/drivers/net/wireless/ath/ath12k/reg.c
> >>> +++ b/drivers/net/wireless/ath/ath12k/reg.c
> >>> @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *a=
r, bool wait)
> >>>                       if (bands[band]->channels[i].flags &
> >>>                           IEEE80211_CHAN_DISABLED)
> >>>                               continue;
> >>> -                     /* Skip Channels that are not in current radio'=
s range */
> >>> -                     if (bands[band]->channels[i].center_freq <
> >>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> >>> -                         bands[band]->channels[i].center_freq >
> >>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
> >>> -                             continue;
> >>>
> >>>                       num_channels++;
> >>>               }
> >>> @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *a=
r, bool wait)
> >>>                       if (channel->flags & IEEE80211_CHAN_DISABLED)
> >>>                               continue;
> >>>
> >>> -                     /* Skip Channels that are not in current radio'=
s range */
> >>> -                     if (bands[band]->channels[i].center_freq <
> >>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> >>> -                         bands[band]->channels[i].center_freq >
> >>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
> >>> -                             continue;
> >>> -
> >>>                       /* TODO: Set to true/false based on some condit=
ion? */
> >>>                       ch->allow_ht =3D true;
> >>>                       ch->allow_vht =3D true;
> >>
>

