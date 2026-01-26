Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125F1C88E6F
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruwL22SfmrxRUTrjGZVT2uEo930GUbaibVEF86BXitg=; b=l7/jB8evtRoSIoBs0W2OP+s9El
	JuorAkawc2U3T1ebEF5Qf9aWHq3OS22nfUZLzczJPiQWFiD8kNFqVvyq1A5kYbtJwai3CcDukjbfT
	mouORudrrq411ZyW0XZqfoDBFBmjMnux3LbtiIRqjSQf67gT3fN4bh8e1wnES/xm/TjPc6auSQcbc
	k+Y3IINnyOFpSk3aODuFbMT2QZ3GV9yb0JqtppiHjhqnR4E934DgoF1bkGDoXQBaqu+WPNQOaVPx1
	qimaTsOMaqUZtoOTo2HgKxC0RbVzCVzaexTEzuwykj0zM+CJDuP6leI1xy7y1mhfhhfLbT3QwXaOm
	+d0XzYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHxe-0000000C6LZ-2qC3;
	Mon, 26 Jan 2026 08:28:38 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHxc-0000000C6L4-2HtL
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 08:28:37 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c2dc870e194so1519523a12.2
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 00:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769416116; cv=none;
        d=google.com; s=arc-20240605;
        b=YUQ+cutyPN0dYjdpyDHaKXgKyRRGwBH0A2ynu1zFjXHqXXnfL7Ss0vmzb/PpHvGE7E
         aBbfCjQuLxoUOQT1ecSTdaSlnnwGYQhWof2bJdWSJjFnzYvKlnN1F+s+r/6/ntQc4Wja
         4LX1BvZpD8mhBuHsI+mUmSX6cddpxenMR/BAr+YlrqIIeeDad3JpNfc6kyErtT158qwl
         QrOALhKapeBx4hD9w67s6rz1OdEWXZkORWly1sxs9npp/MicH1Ywz0NmFsiZCaqC/hAO
         uCjv9IcEu5BTH/XSZgGGOrf2T0lZ1UKEftN8dU4N0+DzE9TTlqXSCLKHy81cM8358/Ab
         YAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruwL22SfmrxRUTrjGZVT2uEo930GUbaibVEF86BXitg=;
        fh=ufLYLKPkX0L7XyBQ8nPQ/t3T0fhJan6BIBMR1NwE53g=;
        b=S3OPmL9Diixpr6+rZP0MMMwhjsT7Rd3iuKnuwRC2/D2MAIPaDRk2pS9JMXJWx0dyp9
         jww3PIC9vwl69/WZbZVWFzf4Ws7ejBFT1+DZ8a1AAEpzHmsu8Byz9MLjvJGanH5BySjZ
         RrNp42G8FmQA0Yp6GubiZyiocSnUVIyF/WE/3HaJHALWAjWmQyW2cMDCzahlQDbX7cfh
         x3zq7w2HuBY9e4q791OfZs4WdOKU/wc1tsktyavVs1Z0bswMM3AUAg/MWR+mxLMYgF3q
         isf2sOW2yJtoT7FqzQH0xNlY0LewLzffKMDGkYnXw9CAHBr8/qPd42dR7vPSO0vprg4E
         25TQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769416116; x=1770020916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruwL22SfmrxRUTrjGZVT2uEo930GUbaibVEF86BXitg=;
        b=K29u0cD3MUL2WbruXA8FJv+2da2R8dk5LDzx25LFPKVejuXPnqgNNvPqTiWOafSqlC
         5Ii6044cN5x3JYmcgjadjL50r/xWApcmkqmNRTYj6PD1INA69U306A79d0g2+ZijCo/5
         P4ByyYHiOia2Fr/K2IZRU7mm+XHoBQdKioLSbvS563p7q7bKm0rrdozGhVUjRrhMCca+
         xEr4bogDgwM4HHKLqmXxdAaW5TMxso/ZKhP20OD27txBucQwpCiv7VGz6BPZw7cR5uwu
         9B9fKVR8NSjdiSRIWQ8zz+eLbP9CrHvtGn/TSXC9ucjHDKoe1A3DEozbMNL1Ru2gALAN
         jdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769416116; x=1770020916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruwL22SfmrxRUTrjGZVT2uEo930GUbaibVEF86BXitg=;
        b=FsnC4kepDq0It7qEf9IsvoKDZFYcFbOWi0Qjv5Jghgzee+fd38WY/mJc+D/YuXZjB7
         lYdVdahr+OMbf1XYtHY3xbfn2MRXoKEn/UMMv7Te3xp5UvAk/b4BeHJveOA5rDm/O7Zy
         Y13FlnmavZZwsPpsdKD2w8S4Kx4nQnK2pk3BwnzsBdqmQHR67IOY0v2sQ88psN6N85Mv
         zmFFhrkDoc/J4Pw/BfaN7HWRQYU2a/wGKQyhsw8H+ISPq/IcfVUC0lSqtXtorPSjVhmF
         ZyqtMCS8GmwRyjlg9ahvDKpScaZdQlxR0vBuy/elb/+l495LIlhtJseHoDtABT475rWa
         1ySQ==
X-Gm-Message-State: AOJu0YzgH3XNNMc7dY3ByZQfaIQSp5tvRVGSEWOWs6uTRliegVlll+E6
	8tHS+yeJDFFjTHyyfGrSWY+INGZBd+3snuTlIrOMfWwn6GsXBhTTkIklLh/eX3qZ4bWkKu2mCkd
	n+C5ub5GqFM6t1jNxnUIWNKvLZeGiro4=
X-Gm-Gg: AZuq6aJSHUFzFgoyBra/Za3LoYZSQ0E8VbH04r2gkBCNSII9jjqdeTxN4W7ZOXgdOHL
	RkvFsLVJgYDAw3VbrOIDOXQgWdNI9L9ggWZg1PQlaP4HMKxfHIuo2R2htXdfe7+qQDygyWGA8uG
	ZPjoxVWwy5/W2y5O2mKm9zpicKIonOPI3AGHc29PmRCB/oPctsKggiZMpR69maRwkOiEORdPe8E
	VYl/rzsNh/e/l0oEQk8Zsdx9j/tOM22/srZzqUmBsXX2dXQv76BCOSrmJkwc628kZjefMeBdTaE
	gyyWtrXEK5OgNEIZlxWihy5I08Vu
X-Received: by 2002:a17:90b:1c01:b0:340:be44:dd11 with SMTP id
 98e67ed59e1d1-353c41885abmr3255851a91.27.1769416115449; Mon, 26 Jan 2026
 00:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20260123155750.6007-1-bjsaikiran@gmail.com> <20260123155750.6007-5-bjsaikiran@gmail.com>
 <ec1a3721-a17c-47dc-85d3-0e0b97004c2c@oss.qualcomm.com> <CAAFDt1syi0jLvrho4mnvwsv8HtraT78wP8tCLFHRw3oiTq2E5w@mail.gmail.com>
 <ad7a2168-58d8-4afa-8744-84a34a63cd09@oss.qualcomm.com> <CAAFDt1v-CBHPTMHQB2B9o3X547agCj77RF9tpp_sgUAPkUaYSw@mail.gmail.com>
In-Reply-To: <CAAFDt1v-CBHPTMHQB2B9o3X547agCj77RF9tpp_sgUAPkUaYSw@mail.gmail.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Mon, 26 Jan 2026 13:58:24 +0530
X-Gm-Features: AZwV_QguPEtYHp3uC-OUaC0C2KVuNA5vvGUniFry68WwZ_WU_sC8ylxoTS_bfJM
Message-ID: <CAAFDt1t8tEd_oH_MLdsr9wgDC82Ae_QSD2kgYA8VwGE0Yia8LA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: Remove broken frequency range filtering
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_002836_647268_430A6DF3 
X-CRM114-Status: GOOD (  29.54  )
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

Hi,

After further testing, I've found that the issue is simpler than I
initially thought.

The Real Problem:

The frequency range filtering was added in commit acc152f9be20 for
"split-phy devices" (devices with separate 2.4GHz and 5GHz radios).
However, WCN7850 is a single-phy device that handles both bands on one
radio.

When the filter runs on WCN7850, it incorrectly restricts channels
because the freq_range is set for only one band at a time, causing the
other bands to be filtered out entirely.

Testing Results:
I tested two approaches:

1. Adding a conditional check (skip filter if freq_range.end_freq =3D=3D
0) - This did NOT fix the issue
2. Removing the filter entirely - This DOES fix the issue, 5GHz works perfe=
ctly

Conclusion:
The frequency range filtering is fundamentally incompatible with
single-phy devices like WCN7850. The firmware already handles
frequency restrictions based on hardware capabilities, so this
driver-level filtering is unnecessary and breaks single-phy devices.

I'll send a V2 that removes the filtering entirely, with an updated
commit message explaining it's designed for split-phy devices and
breaks single-phy devices, If that's ok.

Thanks & Regards,
Saikiran

On Mon, Jan 26, 2026 at 12:33=E2=80=AFPM Saikiran B <bjsaikiran@gmail.com> =
wrote:
>
> Hi Baochen,
>
> Sure.
>
> The Scenario:
> The ath12k_reg_update_chan_list() function filters channels based on ar->=
freq_range. However, this function can be triggered via a regulatory notifi=
er while ar->freq_range is temporarily uninitialized (zeroed).
>
> The Execution Flow:
>
> - Reset: ath12k_regd_update() starts and resets ar->freq_range to 0 (to p=
repare for recalculation).
>
> - Trigger: ath12k_regd_update() calls regulatory_set_wiphy_regd(), which =
triggers the regulatory notifier to other subsystems.
>
> - Race: The notifier callback executes ath12k_reg_update_chan_list().
>
> - Failure: ath12k_reg_update_chan_list() sees ar->freq_range.end_freq =3D=
=3D 0. The filter check (center_freq > end_freq) becomes true for all chann=
els.
>
> - Result: All 5GHz channels are erroneously filtered out.
>
> - Observation: On the Lenovo Yoga Slim 7x, this hits consistently during =
boot and resume. The notifier fires before the driver has finished repopula=
ting the frequency range in ath12k_mac_update_freq_range().
>
> - Proposed Fix: Since we cannot control the notifier timing, I proposed m=
odifying the filter to skip the check if the range is invalid in my previou=
s mail.
>
> Thanks & Regards,
> Saikiran
>
> On Mon, Jan 26, 2026 at 12:22=E2=80=AFPM Baochen Qiang <baochen.qiang@oss=
.qualcomm.com> wrote:
>>
>>
>>
>> On 1/26/2026 2:35 PM, Saikiran B wrote:
>> > Hi Baochen,
>> >
>> > Thanks for the review.
>> >
>> > regarding ath12k_mac_update_freq_range(): You are correct that this
>> > function eventually updates the frequency range.
>> >
>> > However, on the WCN7850 (Lenovo Yoga Slim 7x), there is a race conditi=
on
>> > during boot/resume. ath12k_reg_update_chan_list() is being executed *b=
efore*
>> > ath12k_regd_update() has finished populating ar->freq_range.
>>
>> could you please elaborate on the race?
>>
>> >
>> > At that specific moment, ar->freq_range.end_freq is still 0. The check=
: if
>> > (center_freq > KHZ_TO_MHZ(ar->freq_range.end_freq)) evaluates to true =
for
>> > all channels, causing the driver to silently drop every 5GHz channel f=
rom
>> > the scan list.
>> >
>> > If I cannot remove this filter entirely, would you accept a V2 that sk=
ips
>> > the filtering if the range is uninitialized?
>> >
>> > Example:
>> >
>> > /* Skip check if regulatory range hasn't been populated yet */if
>> > (ar->freq_range.end_freq !=3D 0 &&
>> >     (center_freq < KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>> >      center_freq > KHZ_TO_MHZ(ar->freq_range.end_freq)))
>> >         continue;
>> >
>> > Without this change (or something similar), 5GHz is completely unusabl=
e on
>> > this platform.
>> >
>> > Thanks & Regards,
>> > Jaya saikiran
>> >
>> > On Mon, Jan 26, 2026 at 11:15=E2=80=AFAM Baochen Qiang <
>> > baochen.qiang@oss.qualcomm.com> wrote:
>> >
>> >>
>> >>
>> >> On 1/23/2026 11:57 PM, Saikiran wrote:
>> >>> Between kernel 6.16 and 6.17, ath12k added frequency range filtering=
 in
>> >>> ath12k_reg_update_chan_list() that filters channels based on
>> >>> ar->freq_range.start_freq and ar->freq_range.end_freq.
>> >>>
>> >>> However, these values are reset to 0 in ath12k_regd_update(), causin=
g
>> >>
>> >> Yes, it is reset at the first, but it get re-calculated later. See
>> >> ath12k_mac_update_freq_range() called in ath12k_regd_update().
>> >>
>> >>> the filter to skip ALL channels:
>> >>>     if (channel_freq < 0 || channel_freq > 0)  // Always true when
>> >> end_freq=3D0
>> >>>         continue;  // All channels skipped
>> >>>
>> >>> This results in no channel list sent to firmware, causing 5 GHz Wi-F=
i
>> >>> to stop working.
>> >>>
>> >>> Fix by removing the broken frequency range filtering. The firmware
>> >>> itself handles frequency range restrictions based on hardware
>> >> capabilities.
>> >>>
>> >>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim=
 7x)
>> >>>
>> >>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>> >>> ---
>> >>>  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
>> >>>  1 file changed, 13 deletions(-)
>> >>>
>> >>> diff --git a/drivers/net/wireless/ath/ath12k/reg.c
>> >> b/drivers/net/wireless/ath/ath12k/reg.c
>> >>> index 2dfcef013277..2d9adc74ac6e 100644
>> >>> --- a/drivers/net/wireless/ath/ath12k/reg.c
>> >>> +++ b/drivers/net/wireless/ath/ath12k/reg.c
>> >>> @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *=
ar,
>> >> bool wait)
>> >>>                       if (bands[band]->channels[i].flags &
>> >>>                           IEEE80211_CHAN_DISABLED)
>> >>>                               continue;
>> >>> -                     /* Skip Channels that are not in current radio=
's
>> >> range */
>> >>> -                     if (bands[band]->channels[i].center_freq <
>> >>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>> >>> -                         bands[band]->channels[i].center_freq >
>> >>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
>> >>> -                             continue;
>> >>>
>> >>>                       num_channels++;
>> >>>               }
>> >>> @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *=
ar,
>> >> bool wait)
>> >>>                       if (channel->flags & IEEE80211_CHAN_DISABLED)
>> >>>                               continue;
>> >>>
>> >>> -                     /* Skip Channels that are not in current radio=
's
>> >> range */
>> >>> -                     if (bands[band]->channels[i].center_freq <
>> >>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>> >>> -                         bands[band]->channels[i].center_freq >
>> >>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
>> >>> -                             continue;
>> >>> -
>> >>>                       /* TODO: Set to true/false based on some
>> >> condition? */
>> >>>                       ch->allow_ht =3D true;
>> >>>                       ch->allow_vht =3D true;
>> >>
>> >>
>> >
>>

