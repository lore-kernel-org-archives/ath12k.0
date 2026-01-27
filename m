Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B2ED2FED9
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 19:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqDCeOy0NkR8KWr9clGAa5Q3eibWQC5JmdYQ/nRh0CI=; b=p7WURT/H2XkSPAGjrLLu8Abkl7
	uonoX31eN7P61++bjz8BpXucFoselUQElCSM/l4ZkT+7IGyVZmfPkv5M+v4NAf12R19KgC6M4zTVO
	SPNq92Fo545L6QxG4OOhBfGDAeyJJDsfWYBJ2uOc4TE1R5qs7zVb723/yRY8qHLnc9HLni5DsdAxV
	LY+dP2iKiF6kHnpMA6GeokA2MFABX5qf8A+P0eIzMhNUoIva9KMQg9v6P3WGwX4BvT1kwD1jZ0Bt4
	JdKmTCSLw4/OBDHJWdOI5DNaBGF6PW7Y4Bug+f4DkN2ieRk0X81ipHtetZ1Be4ui2UDj4SRbjaaXE
	6MqYUsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoOe-0000000EshV-3thl;
	Tue, 27 Jan 2026 19:06:40 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoOc-0000000Esh9-3lON
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 19:06:40 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-34c718c5481so3517742a91.3
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 11:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769540798; cv=none;
        d=google.com; s=arc-20240605;
        b=jcZj89ayuhamcrnQRycJx2IGGt0N7YutoVOFufNXhESjFl/Yh+Opp6sHCG+lCMtfoX
         lfpaw43BeowaAIKeLC76IGiAOEYkTEsWmZZbNjMZzqfZUjjaLHnuNuS+Xri9G2nsorvf
         im8rbh1Zg5YRIbUuoRyABzw6fXUPNnXB9l4uDpXP4bosM+BTLbWiVJU/MDRSINMtEmD+
         0bD0sFYb6D8uAoRAezQeR+jqDYYv2TciCXtiJVE3gmiYZD547Lfp5YQKh2xFMyGWlP9t
         /Fa0Vecia3YBKXnVkX1TZiI4Iu2pCxtzdmqPXwlFQiqSnbn1tY6zm1pzxJZfe0JueK6t
         6W7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GqDCeOy0NkR8KWr9clGAa5Q3eibWQC5JmdYQ/nRh0CI=;
        fh=ufLYLKPkX0L7XyBQ8nPQ/t3T0fhJan6BIBMR1NwE53g=;
        b=axUB9CFiLsvnG65d+1ET2rLGJVDKloJRRb4PG/IDK3H8YzlavNLnahgYSsGBBdy9nX
         PiEJFWDvJIWMnW5x2pc1ap8MJEtWD2gb+0OOt89W4wySK6mcsEZv0v0YyQcjlahsL52u
         BLvDAKNDCn9IKWjfKp8XCMh6t3Y0rJj0pb86BZ05Y0O45vdw2f7hIv9uen6LIShM8oOI
         24tHGjbcWmyhSC27XU0tOrqxWXIN5NSYAwBdeFJhwOzRWggdNJ8a/c35IBcJakSO/WsA
         tJ5iIWDUYQX76lXBBPwkR2hJ4QW73bzbuVJV/ZAWd3CzVzvNOaz9dTTk5v408v6scRlI
         VnLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540798; x=1770145598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqDCeOy0NkR8KWr9clGAa5Q3eibWQC5JmdYQ/nRh0CI=;
        b=W6KCHZ1PGu4At/n8dqsnwUNQYWTTiu0dWboNTuqYnigvbMKkSbXPP83ZdlG2mGYYI8
         POJmLxjb6zfTVo74JBlOwlvB4c/ZSsMvxNBa7LOi76IKS3rkA1EdmzaWkeCk7FnAA6Px
         rcBTJWs875DqCqNNG39IrVNRYbs3dC1BF21vI95tinOaC77mcfbKJc9IEw/03VU1lqJC
         V8R8Xf4PYugBIQ/n5Rlse1/b6ChZqahqYji98qcwGtro1Fv6XuHp57ibFVToPoTbqB8/
         +7cfeluUR6489hFWJHI3/rFGf15rZrD9mBxvuin7GZ7TzoEfNchxx+O7nyTI7xcgraUs
         MMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540798; x=1770145598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqDCeOy0NkR8KWr9clGAa5Q3eibWQC5JmdYQ/nRh0CI=;
        b=vCqJ/6XQ7xd2SNs8nY1U+a9kh6gQLCBBgHE0VHp7T+lnKTU05P/bEpOxRYaAxdc0kr
         CzYT/s99b/IJyIRbBWj+Vb+B1+hqKXEZMevwDoMdt8Autayof44D86dnzzd7u2TU8Y3E
         5snTdgPPWydOebBA0tMZV3+ipB5pDBK6cdjEnbaLoyg/lCXycyZRNYb/S8liUtJe6+MF
         vkJ654UxxcR8wQUyYEsJJy6BzI+1mqpVSX8tcpgohHMyvub8Y1WYMCKXJ88wIDNOZUZr
         TDAVnHpvM7r61IGFi+zL0WYt3iACnQKJDVTC5rtnHuU7f/EaDHGHO5U9b+yClsp94r5g
         AWqQ==
X-Gm-Message-State: AOJu0YxPG8vcATlnVEywa7k6wsmn65UGHt3IiVpfE0YEx6A2MtO4W21+
	xjAzG/2lfs8dYABX+CPnuwU5hP71QFIQxo07iYLMWnjRyBZ5VEAsSyXz11n9GV6jFBCCnFomc5U
	pccxgGVNS2IQHFROx/aygae/fPXvCTQLoETAkVFuxUg==
X-Gm-Gg: AZuq6aLWbolWZ6l1ArXg7PrNahp76yAYR8hV3/DjZxUPlY7vD5KxwCpNTGLlUp8NjD0
	7wDp8k8XrNywHY0dvxTgp7+2l2TZmAh9NoUZMb08KNUhnRicVCI+U6j34olEbP1r0RrzWAuu7hP
	MYZJTYnO71lZC0t28Wcz0+CKDUILtQBwzMSE8Y9hFV6qO9CPHqr/ZTVGoVkwTJW4SjYlsnBFNAy
	ZFhQjnizUu2N4PaiKNKc/hSczagnhWTIUjZvX3nZ29U8u57EqSVQjlgOZHwDZ9HjecSiNowFgcD
	YtL0S8hRGgzs5vcG/Roc+IqlesUR
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id
 98e67ed59e1d1-353fecc66admr2376922a91.3.1769540797687; Tue, 27 Jan 2026
 11:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20260126095244.113301-1-bjsaikiran@gmail.com> <20260126095244.113301-2-bjsaikiran@gmail.com>
 <776ae681-9db7-4051-abe1-07530f87d485@oss.qualcomm.com> <CAAFDt1sgAC6bHOVtELmcQVx=L1dTXDsQFtO+N3R_C2C35VOxhA@mail.gmail.com>
 <45061c9a-6f01-4228-9737-0222b4b49059@oss.qualcomm.com> <CAAFDt1sdE3Wpp5CByTZmBk=YnQxFhAwmbC5XpYaqYq0Wdx547A@mail.gmail.com>
 <d6910fe4-cd35-4696-9a0e-13904f512ff8@oss.qualcomm.com>
In-Reply-To: <d6910fe4-cd35-4696-9a0e-13904f512ff8@oss.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Wed, 28 Jan 2026 00:36:26 +0530
X-Gm-Features: AZwV_Qi8BrT4oM6IqRmCL7ONqWn7IQnL7uODuK0OsfolsKAkjFt-2szuNycaB4U
Message-ID: <CAAFDt1suLtUxPh2EwvZqTQgiysK93gH=sXXWcYE+0d1pnpVxpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: ath12k: Remove frequency range filtering for
 single-phy devices
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_110638_953201_AB29E246 
X-CRM114-Status: GOOD (  44.95  )
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

You were absolutely right.

I manually updated board-2.bin to the latest upstream version (MD5:
74878...), and 5GHz is now working perfectly without any driver
changes.

It seems the linux-firmware package provided by my distro was just old
enough to miss that specific fix.

Next Steps:

I will drop the "Remove frequency range filtering" patch (Patch 1/2)
since the correct firmware resolves the root cause.

Regarding the "Firmware stats leak" (Patch 2/2): I am currently
testing the new firmware without this patch to see if the -71 errors
persist. If the driver still leaks memory on error paths, I will send
this as a standalone patch.

Thanks for pointing out the firmware mismatch!

Thanks & Regards,
Saikiran

On Tue, Jan 27, 2026 at 3:52=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 1/27/2026 4:58 PM, Saikiran B wrote:
> > Hi Baochen,
> >
> > 1. Here are the MD5 sums from my /lib/firmware/ath12k/WCN7850/hw2.0/
> > (sourced from linux-firmware 20250901):
>
> this is a bit old. Please try the latest board-2.bin from linux-firmware =
repo:
>
>
> commit 1d588f106ceea113c4c650b43d948da5746e704c
> Author: Jeff Johnson <jjohnson@qti.qualcomm.com>
> Date:   Thu Sep 18 11:03:58 2025 -0700
>
>     ath12k: WCN7850 hw2.0: update board-2.bin
>
>     Signed-off-by: Jeff Johnson <jjohnson@qti.qualcomm.com>
>
>
> $ md5sum board-2.bin
> 74878eeb4ea01b8ea6bd19b57c99d702  board-2.bin
>
>
> >
> > 2fa9a691f199b25aafce48967d93c85b  amss.bin.zst
> > 7cd6eb50e9a6ad98e658a53033214c9e  board-2.bin.zst
> > 62c117046e52cb78c922635bea177afe  m3.bin.zst
> > 953ba9719c55664a5d91d99b412caee1  Notice.txt.zst
> >
> > 2. Logs: I realized CONFIG_ATH12K_DEBUG was disabled in my recent
> > build. I am rebuilding the kernel now with the debug mask enabled and
> > will provide the verbose logs in a follow-up email once tested.
> >
> > 3. Regarding the Frequency Logic: While I gather the logs, I'd like to
> > highlight that the issue likely persists regardless of the firmware
> > behavior.
> >
> > The freq_range filter assumes ar has a single contiguous range (e.g.,
> > start=3D5150, end=3D5850). For a Single-PHY device like WCN7850 that
> > supports disjoint bands (2.4GHz + 5GHz), a single start/end pair
> > cannot correctly represent the capabilities.
> >
> > If we set it to cover 2.4GHz, it filters 5GHz.
> >
> > If we set it to cover both (e.g., 2.4GHz to 7GHz), the filter allows
> > everything and becomes redundant.
> >
> > I will get back to you shortly with the logs to confirm the firmware st=
ate.
> >
> > Thanks & Regards,
> > Saikiran
> >
> > On Tue, Jan 27, 2026 at 1:11=E2=80=AFPM Baochen Qiang
> > <baochen.qiang@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 1/27/2026 12:04 PM, Saikiran B wrote:
> >>> Hi Baochen,
> >>>
> >>> I checked the logs again.
> >>>
> >>> The issue seems to be coming from how
> >>> [ath12k_regd_update()](drivers/net/wireless/ath/ath12k/reg.c) handles
> >>> frequency range updates for this device. WCN7850 is a single-phy
> >>> device (single [ar](drivers/net/wireless/ath/ath12k/mac.c) that
> >>> supports both 2.4GHz and 5GHz/6GHz.
> >>>
> >>> In ath12k_regd_update():
> >>>
> >>> 1. It updates the range for 2GHz capabilities (sets range to ~2.4GHz)=
.
> >>> 2. It then attempts to update for 5GHz capabilities.
> >>> 3. Because `ar->supports_6ghz` is true, it uses the 6GHz path logic.
> >>> 4. However, `ab->reg_freq_6ghz` appears to be uninitialized/invalid a=
t
> >>
> >> Hmm, this seems like a known firmware bug. Are you using the latest bo=
ard-2.bin? please
> >> share md5sum of your firmware binaries under /lib/firmware/ath12k/WCN7=
850/hw2.0
> >>
> >> If you are using the latest, please help collect verbose ath12k dmesg =
log:
> >>
> >> modprobe ath12k debug_mask=3D0xffffffff
> >> modprobe ath12k_wifi7
> >>
> >>> this stage (possibly due to regulatory init timing or country code
> >>> issues, On Lenovo Yoga Slim 7x, SMBIOS does not seem to provide a
> >>> valid country code. The driver attempts to set an invalid country cod=
e
> >>> which the firmware rejects. This inturn triggers this issue. Fixing
> >>> SMBIOS parsing/defaults is a separate, complex issue that varies by
> >>> vendor.), causing the 5GHz range update to be skipped or invalid.
> >>>
> >>> [ 11.699027] ath12k_pci 0004:01:00.0: Failed to set the requested
> >>> Country regulatory setting
> >>> [ 31.111995] ath12k_pci 0004:01:00.0: Failed to set the requested
> >>> Country regulatory setting
> >>>
> >>> As a result, `ar->freq_range` remains effectively set for only the 2.=
4GHz band.
> >>>
> >>> When ath12k_reg_update_chan_list() runs:
> >>>
> >>> It compares 5GHz channels (e.g., 5180 MHz) against a
> >>> [freq_range](drivers/net/wireless/ath/ath12k/reg.c) that only covers
> >>> 2.4GHz.
> >>> Result: `center_freq > end_freq` is TRUE -> Channel is filtered out.
> >>>
> >>> The filtering logic added in acc152f9be20 works for split-phy topolog=
y
> >>> where each host ar covers a specific range. For WCN7850, where a
> >>> single host ar covers disjoint bands (2.4G + 5G), [freq_range] but
> >>> [freq_range](drivers/net/wireless/ath/ath12k/reg.c) (start/end) canno=
t
> >>> represent multiple disjoint bands at the same time.
> >>>
> >>> Removing this driver-level filter allows the firmware (which knows th=
e
> >>> true capabilities) to handle the channel list correctly.
> >>>
> >>> Thanks & Regards,
> >>> Saikiran
> >>>
> >>> On Tue, Jan 27, 2026 at 8:52=E2=80=AFAM Baochen Qiang
> >>> <baochen.qiang@oss.qualcomm.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 1/26/2026 5:52 PM, Saikiran wrote:
> >>>>> The frequency range filtering added in commit acc152f9be20 was desi=
gned
> >>>>> for split-phy devices where multiple radios with overlapping freque=
ncy
> >>>>> ranges within the same band are combined into a single wiphy. Each =
radio
> >>>>> in such setups handles only a subset of channels within a band (e.g=
., two
> >>>>> 5GHz radios covering 5GHz-low and 5GHz-high separately).
> >>>>>
> >>>>> However, this filtering breaks single-phy devices like WCN7850 that=
 use
> >>>>> a single radio to handle both 2.4GHz and 5GHz bands. On these devic=
es,
> >>>>
> >>>> To be accurate, WCN7850 still gets two phys in hardware, it is just =
in host that we treat
> >>>> it as single.
> >>>>
> >>>>> the freq_range is set to cover the entire supported spectrum, but t=
he
> >>>>
> >>>> exactly
> >>>>
> >>>>> filtering logic incorrectly restricts channels, causing 5GHz to bec=
ome
> >>>>> completely unusable.
> >>>>
> >>>> how? what are the actual values of freq_range when you hit the issue=
 and how are they
> >>>> calculated?
> >>>>
> >>>>>
> >>>>> The issue manifests as:
> >>>>> - All 5GHz channels filtered out during channel list updates
> >>>>> - No 5GHz SSIDs visible in scans
> >>>>> - Only 2.4GHz networks functional
> >>>>>
> >>>>> Remove the frequency range filtering entirely and rely on the firmw=
are
> >>>>> to handle frequency restrictions based on actual hardware capabilit=
ies.
> >>>>> This approach works correctly for both split-phy and single-phy dev=
ices,
> >>>>> as the firmware has complete knowledge of what the hardware support=
s.
> >>>>>
> >>>>> Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-=
phy devices in single-wiphy")
> >>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Sli=
m 7x)
> >>>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> >>>>> ---
> >>>>>  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
> >>>>>  1 file changed, 13 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wi=
reless/ath/ath12k/reg.c
> >>>>> index 7898f6981e5a..48c362a86524 100644
> >>>>> --- a/drivers/net/wireless/ath/ath12k/reg.c
> >>>>> +++ b/drivers/net/wireless/ath/ath12k/reg.c
> >>>>> @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k =
*ar, bool wait)
> >>>>>                       if (bands[band]->channels[i].flags &
> >>>>>                           IEEE80211_CHAN_DISABLED)
> >>>>>                               continue;
> >>>>> -                     /* Skip Channels that are not in current radi=
o's range */
> >>>>> -                     if (bands[band]->channels[i].center_freq <
> >>>>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> >>>>> -                         bands[band]->channels[i].center_freq >
> >>>>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
> >>>>> -                             continue;
> >>>>>
> >>>>>                       num_channels++;
> >>>>>               }
> >>>>> @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k =
*ar, bool wait)
> >>>>>                       if (channel->flags & IEEE80211_CHAN_DISABLED)
> >>>>>                               continue;
> >>>>>
> >>>>> -                     /* Skip Channels that are not in current radi=
o's range */
> >>>>> -                     if (bands[band]->channels[i].center_freq <
> >>>>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> >>>>> -                         bands[band]->channels[i].center_freq >
> >>>>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
> >>>>> -                             continue;
> >>>>> -
> >>>>>                       /* TODO: Set to true/false based on some cond=
ition? */
> >>>>>                       ch->allow_ht =3D true;
> >>>>>                       ch->allow_vht =3D true;
> >>>>
> >>
>

