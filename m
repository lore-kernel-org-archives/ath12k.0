Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EE8D25932
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 04:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NlII7TAXZebUu1p/KKdfJCc4A2tlDtBUvsS8b+u0co=; b=J7psmH3BfE4fDvdMLHEWLQNcc7
	FJKq4R03//jAYmMRj0hGRRPNlkhXK8xg1d2gN7O8mEOAvVwdMAeY2iJ5Rm90Y0feu8bKb01dI9Z5V
	KG9x9xjLcYxqZlHQnWJiM35kc8tCYqsBwADUspPTd64KWcwhQ29GoToXPiVNWTpwc6qsDxj9X3DGz
	EX9De/lJPAu/HVX5nyQOLoukWVQeVT4PpdAMM1nM3pcFFna2oTbRZSkJVmcP1GzU10b7jEIskrh+b
	xJoXdFR5FWabji4AhIEGF1kStypvAXFQvXvZLjZtc6Pd5jFmCg5Ya3Ry8yi7+xV/1asYR6esIciI7
	4hYodZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkaJu-0000000Dd3E-2lVX;
	Tue, 27 Jan 2026 04:04:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkaJr-0000000Dd2g-0zbk
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 04:04:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a0a95200e8so34999735ad.0
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 20:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769486686; cv=none;
        d=google.com; s=arc-20240605;
        b=iHPv8eF7AS+XqegWiLcueDG5GiKo9IyHY2qyNRS+gagKtnO0st5SJX2GWkSrCngTKH
         KLHjm3rH75MR2PoT3zXMDncP8kkWPswkXdCyT26xG2yi+Nd9bzs2EFI04Y3b2kDgdiX5
         hmH5be2a7vBqthsduJvgcmMbyZA04Q/rlWJDv5ae0/3C+kO5ye8dakEFuDQXBH8PyNac
         Me2szj7knM1qUs5mbCD2q2sG4+HJObdDlN1Fch2in2+PNly+E53L22HDVqzJx+Ejauqr
         BxzT7o+3+3+pTy/S3LKG3W9aw+wxI3DiP0P/ovmsKyQTjfDxGeMsLs1lOXG/yt/6fKZH
         O5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NlII7TAXZebUu1p/KKdfJCc4A2tlDtBUvsS8b+u0co=;
        fh=ufLYLKPkX0L7XyBQ8nPQ/t3T0fhJan6BIBMR1NwE53g=;
        b=Tp5Rez4q26ro2uYRaeM/J0+VgoxiaJXyWX3q3avcTBsx9yHjYDTVkId2XxGMUlj2gr
         5K/hyLbs0eXVmrPcGy2RD8avZ3AFTSCKiwpZpt+rNYclfOHvEIBeiF1+7MgYIdlN0zOV
         KreaGdRsU1ZSFGzKLs2tvLtPlS0ufbcB9i6vBJhFmfgagFkbtVJoM3gVmC3j0tDrWJwc
         IzFbFKRpoKGr1bjIg1TGRFspTLTdPN43DeVHwldaRT+DURWWeE8tXU0bZpv3QKurl/g4
         B0MaVY7uPgPzuLsgFI4FbkihzSIslF+uHqFMyOls8Nq3grajH3rriVfO1gv6ObYqqooj
         ynzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769486686; x=1770091486; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NlII7TAXZebUu1p/KKdfJCc4A2tlDtBUvsS8b+u0co=;
        b=FL4m7DHpTaiLeXpBiHtiq1OWpugzAYR4UF27AQw3PZtudwBgTyEIs9i8PCWFmouYBI
         MEy2vI+ki2C7/i3NzcQBmn/HX6lWlxJlcMJpH+O993rpGtXrdImdL90JVwC61PRoq6zz
         jrhFPeUWO2fIB0mDYxRRKWCEpInbzDkiQHfUlEQMOW1XR9lBXXU5QozRnNp3vzxvL+Ea
         qlJnVNsm1vjyEW3xqnUpvFtB2+z4P7IJo7jp1ikjHrGoiAt9EIq9YIMAtAobESpASy6T
         ZSyVr49qnHdJ6k+p1s0NWOwzC3usj+ZrB6kweVbmIhD7G7/G3xWI7OHpqvOd888gKY+X
         3v7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769486686; x=1770091486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NlII7TAXZebUu1p/KKdfJCc4A2tlDtBUvsS8b+u0co=;
        b=YS0izNen9L+fSaZkymVK3Ous4T15djQABmVq2YIUlnklxncxdhiWueHWxnLbkCpT8M
         rJ1LUXtAbXf4FFgPvV8FRU4ha4Zth7alvqRiLbGERq6kfANwJkvjv9yVNHzJS1oUHRSD
         qFxA7VRIa5rzU4KcHXRowbF4PcHJ3U4w+HV9MEXjaBEZ7FKCxfnRXsT2YQLmxDxCVcmB
         VqCpJK/yidB61KbTPJvDtLtYQLcq/NjRGNEu9+GTlN9KpzQePRC1y14gPozafEOSYahz
         C8V/ktpCysalCbeeLhjy1fLrVVClL6pWzT83aeEtR/QwBeyxdAvrWEsObNHMq3q7V5Rg
         m8uw==
X-Gm-Message-State: AOJu0Yxr78AVzrJL40SeFnPpxGw4CZG6st9+Oy3Jl1bD/xpj+haf5WLx
	6RPZrJHZJKhdXJffHYMZlsRDLZ1jKan8pieKeIJdqGhrmTkBCGF/N7zjiLsjtYgtHJ/cSNnwOia
	sqqPMcNKkO7A8LyzygOK+72A736jEzzd8V/2B8wl1AQ==
X-Gm-Gg: AZuq6aIgOpwzz6VQXaT6rkfE2XkiwhdkoATKQexzma/l6hAVbipnYnYDR4naRDDYivx
	35wUz4yyh0CEQWRyiW3VqZxai/T1R2I+4Zvd+4LVJXqx+YcuoHKTXXVm9hDAeWXlEi/+AevjIkG
	sDGLLJpmPch/w+7FC2VX+HlPF3tkzorsgq2mJs3i5mjwpBkW10oOfvqulAVrSBcNw1x5e8XE+zs
	F7/SkjFF0Li7YWidNDChksc8Ah65gpDPZJVTx5D3RXUBH2jvVn0WMl7arRvUQZq1ArDv7vq8sff
	XhPM+j+2VjVl3cajLSSHNmPUR+6J
X-Received: by 2002:a17:902:da82:b0:2a1:3e15:380e with SMTP id
 d9443c01a7336-2a870dc88aemr4512735ad.34.1769486686171; Mon, 26 Jan 2026
 20:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20260126095244.113301-1-bjsaikiran@gmail.com> <20260126095244.113301-2-bjsaikiran@gmail.com>
 <776ae681-9db7-4051-abe1-07530f87d485@oss.qualcomm.com>
In-Reply-To: <776ae681-9db7-4051-abe1-07530f87d485@oss.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Tue, 27 Jan 2026 09:34:34 +0530
X-Gm-Features: AZwV_Qh_KtUjPrbR6pKqraFjqNXJOMwM-O9Veq8b69C6AaKOjsHboDih_EcVer0
Message-ID: <CAAFDt1sgAC6bHOVtELmcQVx=L1dTXDsQFtO+N3R_C2C35VOxhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: ath12k: Remove frequency range filtering for
 single-phy devices
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_200447_309267_D9880CFD 
X-CRM114-Status: GOOD (  30.08  )
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

I checked the logs again.

The issue seems to be coming from how
[ath12k_regd_update()](drivers/net/wireless/ath/ath12k/reg.c) handles
frequency range updates for this device. WCN7850 is a single-phy
device (single [ar](drivers/net/wireless/ath/ath12k/mac.c) that
supports both 2.4GHz and 5GHz/6GHz.

In ath12k_regd_update():

1. It updates the range for 2GHz capabilities (sets range to ~2.4GHz).
2. It then attempts to update for 5GHz capabilities.
3. Because `ar->supports_6ghz` is true, it uses the 6GHz path logic.
4. However, `ab->reg_freq_6ghz` appears to be uninitialized/invalid at
this stage (possibly due to regulatory init timing or country code
issues, On Lenovo Yoga Slim 7x, SMBIOS does not seem to provide a
valid country code. The driver attempts to set an invalid country code
which the firmware rejects. This inturn triggers this issue. Fixing
SMBIOS parsing/defaults is a separate, complex issue that varies by
vendor.), causing the 5GHz range update to be skipped or invalid.

[ 11.699027] ath12k_pci 0004:01:00.0: Failed to set the requested
Country regulatory setting
[ 31.111995] ath12k_pci 0004:01:00.0: Failed to set the requested
Country regulatory setting

As a result, `ar->freq_range` remains effectively set for only the 2.4GHz b=
and.

When ath12k_reg_update_chan_list() runs:

It compares 5GHz channels (e.g., 5180 MHz) against a
[freq_range](drivers/net/wireless/ath/ath12k/reg.c) that only covers
2.4GHz.
Result: `center_freq > end_freq` is TRUE -> Channel is filtered out.

The filtering logic added in acc152f9be20 works for split-phy topology
where each host ar covers a specific range. For WCN7850, where a
single host ar covers disjoint bands (2.4G + 5G), [freq_range] but
[freq_range](drivers/net/wireless/ath/ath12k/reg.c) (start/end) cannot
represent multiple disjoint bands at the same time.

Removing this driver-level filter allows the firmware (which knows the
true capabilities) to handle the channel list correctly.

Thanks & Regards,
Saikiran

On Tue, Jan 27, 2026 at 8:52=E2=80=AFAM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 1/26/2026 5:52 PM, Saikiran wrote:
> > The frequency range filtering added in commit acc152f9be20 was designed
> > for split-phy devices where multiple radios with overlapping frequency
> > ranges within the same band are combined into a single wiphy. Each radi=
o
> > in such setups handles only a subset of channels within a band (e.g., t=
wo
> > 5GHz radios covering 5GHz-low and 5GHz-high separately).
> >
> > However, this filtering breaks single-phy devices like WCN7850 that use
> > a single radio to handle both 2.4GHz and 5GHz bands. On these devices,
>
> To be accurate, WCN7850 still gets two phys in hardware, it is just in ho=
st that we treat
> it as single.
>
> > the freq_range is set to cover the entire supported spectrum, but the
>
> exactly
>
> > filtering logic incorrectly restricts channels, causing 5GHz to become
> > completely unusable.
>
> how? what are the actual values of freq_range when you hit the issue and =
how are they
> calculated?
>
> >
> > The issue manifests as:
> > - All 5GHz channels filtered out during channel list updates
> > - No 5GHz SSIDs visible in scans
> > - Only 2.4GHz networks functional
> >
> > Remove the frequency range filtering entirely and rely on the firmware
> > to handle frequency restrictions based on actual hardware capabilities.
> > This approach works correctly for both split-phy and single-phy devices=
,
> > as the firmware has complete knowledge of what the hardware supports.
> >
> > Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy =
devices in single-wiphy")
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x=
)
> > Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
> >  1 file changed, 13 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wirele=
ss/ath/ath12k/reg.c
> > index 7898f6981e5a..48c362a86524 100644
> > --- a/drivers/net/wireless/ath/ath12k/reg.c
> > +++ b/drivers/net/wireless/ath/ath12k/reg.c
> > @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar,=
 bool wait)
> >                       if (bands[band]->channels[i].flags &
> >                           IEEE80211_CHAN_DISABLED)
> >                               continue;
> > -                     /* Skip Channels that are not in current radio's =
range */
> > -                     if (bands[band]->channels[i].center_freq <
> > -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> > -                         bands[band]->channels[i].center_freq >
> > -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
> > -                             continue;
> >
> >                       num_channels++;
> >               }
> > @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar,=
 bool wait)
> >                       if (channel->flags & IEEE80211_CHAN_DISABLED)
> >                               continue;
> >
> > -                     /* Skip Channels that are not in current radio's =
range */
> > -                     if (bands[band]->channels[i].center_freq <
> > -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> > -                         bands[band]->channels[i].center_freq >
> > -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
> > -                             continue;
> > -
> >                       /* TODO: Set to true/false based on some conditio=
n? */
> >                       ch->allow_ht =3D true;
> >                       ch->allow_vht =3D true;
>

