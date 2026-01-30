Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFD8D49C64
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZgo4czabFDecvZ1XJQzu+KiEWSV57OKqOvlHlgmzmE=; b=bYnQanzoppAlp4j01wTb5oRjSb
	Jbc+QRjKIkVudBD/5+bD8sXobCgTFg5Rlwy/sG6saRn6xXfp5oFPYs4vhYZfpXKaqNl7a+iMpac1+
	LnujmbLSSNZp48wmvdc3CQyKBETZuQ5y8d9jH7ooE9pyquXZsIkprCbVtP7NMDL/wnrsBz8V9jvn7
	dmg/GWGXsbvTC50f7cdV3X6f02qpsA0pvERqBdakXK2Kbc8bX3WSPDc5EgBVENw8fOe0CBAKKmlAI
	90x9Hl9HzshzdgBcCZn6cle9ZLwgirwkZJAcvyiZwnh8ZwWmXrFQlsIoKtVk2SMZeaZKPUodP+CAQ
	HlPVOTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlj08-000000019Q5-2tx5;
	Fri, 30 Jan 2026 07:33:08 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlj05-000000019Pi-2W3O
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 07:33:06 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c635559e1c3so756150a12.0
        for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 23:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769758384; cv=none;
        d=google.com; s=arc-20240605;
        b=OkOMr6bi2RCjOdcnkKgTKU3L0x0eM0Rcq+GQ2MZe5E3Cor0CerzBoxU4ra6XFBUoCd
         MiE/tRsRUdy1EX/i3mcsqW/52ZwOsUOon7vrvqY7utzIwZDo4icjiCIDjYwR593sHr6y
         Snh4wRtrAPbH4YbpHe5vGzqRmQRheHLq4EEB0qwxwEKc71RWZx7JWgB1GTazp9H8AQ6l
         Mju0li5zOcfqc8cV4QKF9v4WMcDVJ8K74T+G/Z+kXK4FfQWD8JQScIXPEMqm7vk8mb8j
         SPRsP4HI/3F0p22hGgcOMGf0FKyXTbVCy9+gcwp/agDTmG60qxLe5LufKVoGiyFwjDXw
         zeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jZgo4czabFDecvZ1XJQzu+KiEWSV57OKqOvlHlgmzmE=;
        fh=ufLYLKPkX0L7XyBQ8nPQ/t3T0fhJan6BIBMR1NwE53g=;
        b=gVCuRS3wXmArm1Fy3RL8n9QpIqkKQqoEuBeWVX2CGTC03Wtim/2LhqHnCB7uyLHlwL
         LckT8tP6mYL0jx2EAgjKQyBkuAeKcIx+9aQgb4fboj6gumERaxsO9hyYNpM/YfuAlPQx
         JRixsWOIYkqp2qGOTMe0MhlXlYEOOqrB6fUqHw3F8c5fmHOMIF/TftqwCY+y0RwJIIxc
         a0hK//WfJIDrMGUkBFTObeY2TdDKlu1va4g9rhTxPrxz2E1mz812JZy4deOyHuqRrBqw
         hfDqPYcQz0GspBx8YqT3AJtGRquYnE+8UpylPaW3YavE2Cs6/MjGdsGJ3uxhLrizrueO
         NdwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769758384; x=1770363184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZgo4czabFDecvZ1XJQzu+KiEWSV57OKqOvlHlgmzmE=;
        b=Ob/Z4NM1PdpALVKIFtcw9f/yrNkjFb6gJdh95Q5wotYCOGhfDb/vGRx+i/id0ZIf/8
         +48i/gNNT8UdxQPkZJJPjv79EVXBbttxIhFKfBxAv1WVCoGsDCsS6qdDclVzBhwPX4Uk
         ypOtN9s+jwneXJ+v76MTbppCNHntld/M2cccNfxUtN9cyF88TzX1Fc77oLJzeVKP4khl
         ZC/X8NYM1yFb3hllUdVl97dTyerkwQ6Uk249RbAkkLVmNqn3lw4iGxMIcX8nvaA/xrdg
         bAs+vpxJ/c40CbD0U/2/evzGvbxB53ZvIJC268RkX7FKEmNAHitqmJrRnoAKjpmFZGCr
         +siQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769758384; x=1770363184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jZgo4czabFDecvZ1XJQzu+KiEWSV57OKqOvlHlgmzmE=;
        b=tUYaI+fFBhT8/9GV5qzUwxfIsJizhbCQI6qDuIIyVY+IYujU4s2umbKXV3aGAio4K1
         mYs653rlb59mt81V3Uo5w+IF1wE3gtDn7MdVgtYfuBw1TaM35auzq0arT2ZVFESa1po/
         z6sPkiJhl/Ul6c6p4x1GLKMQCRoyCeHVy91BnEvZ30HLrt/kaJW6RL2nj7+dVRHarZ7r
         F0Bs6fnxo4XkuvpVy8/PWC4y3YDKiysXa3fEq+GNzt0gBWhgZMa6lZsqmU1bI5c8aT8D
         kN6Lf3nUJiomv3Oc1HTc1MInM48slOBSFsn63PKrzp5FisUD2ATohotv+mmn5FTwAibz
         MrsA==
X-Gm-Message-State: AOJu0YwXc4Tgvjw2Oj6Eg9IcON/MC8hsVns8i2g2T5OHJZQ6Qdt3NYOL
	IiHwN58vLNB/qmgi4URktNxaD+3tKvSzbmxXdBjYeEPbydfRGna6offw7ArbCWt7SOFy0UR2Tc0
	WkNMLn+cfa1WxaBnQsGJH6Oq4415cvgk=
X-Gm-Gg: AZuq6aLKcnfxWdPNutUzzZUGefIkhw+xHZBMVKkVrI0LXYleniBwzcViVns3NJx5N2X
	tO5c54a09m//rYCKYCvYmfkvJQwgLTIgAaqh1GRtOWNf1QC1PGP3O3QgP7em+cVCXokNQxEAeY/
	Qp5uoLIuwSUdNr0O5SJDh8jX93Wj7hgdrYF0E7cRMZP0qBittZ17Pph63BK0b6arTrMU25FQC+H
	VQ87i5rrKu4koELcE5cx/RPYlxhPCgIf1XsCrzTvI0CtM8ZBWO0TdrdNhoKZExzMWbtE9YLwPKH
	La5rCiYHPaNm+t/E05StIfKm0E6u
X-Received: by 2002:a17:90b:2dcc:b0:34e:6e7d:7e73 with SMTP id
 98e67ed59e1d1-35429ac7edfmr4608897a91.11.1769758384312; Thu, 29 Jan 2026
 23:33:04 -0800 (PST)
MIME-Version: 1.0
References: <20260126095244.113301-1-bjsaikiran@gmail.com> <20260126095244.113301-3-bjsaikiran@gmail.com>
 <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com> <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
 <CAAFDt1s8HPQWJpSiDDk8PmUAKqkQHELcJj_F0faZ1C9RfiYu6g@mail.gmail.com>
 <7fb6b431-58ea-47bc-b251-5144575db17d@oss.qualcomm.com> <CAAFDt1s_NtY1vXa5STRW7oQn9yDJBC0g7CPSZXn0tFhd+CSHrQ@mail.gmail.com>
 <fbcbeb0f-c073-4da5-9dbe-2518a1d31f20@oss.qualcomm.com>
In-Reply-To: <fbcbeb0f-c073-4da5-9dbe-2518a1d31f20@oss.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Fri, 30 Jan 2026 13:02:53 +0530
X-Gm-Features: AZwV_QgoX3ZhnV6uNxARW-hGvyPBP_Ug1PE8JRNg14ZhkQcHFssPC9IgiaoYG0o
Message-ID: <CAAFDt1uSQce_9AG2488yaeeEjCwQwQubW51K51VHiJF8Rp6xRQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_233305_654611_B4FFDC0B 
X-CRM114-Status: GOOD (  47.79  )
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

On Fri, Jan 30, 2026 at 7:39=E2=80=AFAM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 1/29/2026 10:06 PM, Saikiran B wrote:
> > On Thu, Jan 29, 2026 at 7:57=E2=80=AFAM Baochen Qiang
> > <baochen.qiang@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 1/27/2026 12:40 PM, Saikiran B wrote:
> >>> I have analyzed the logs and code flow in depth to provide more
> >>> definitive answers for your questions.
> >>>
> >>> The log entries showing the failure are:
> >>> [  563.574076] ath12k_pci 0004:01:00.0: failed to pull fw stats: -71
> >>> [  564.575896] ath12k_pci 0004:01:00.0: time out while waiting for ge=
t fw stats
> >>>
> >>> 1. Why are other stats populated?
> >>> The "failed to pull fw stats: -71" error is not the initial failure
> >>> but a symptom that appears after repeated operations. The leak happen=
s
> >>> during *successful* calls prior to this error.
> >>>
> >>> Code flow proving the leak:
> >>> - ath12k_mac_get_fw_stats() sends WMI_REQUEST_PDEV_STAT.
> >>> - Firmware responds. ath12k_update_stats_event() parses the response.
> >>> - ath12k_wmi_fw_stats_process() is called, which splices 'vdevs' and
> >>> 'beacon' stats into ar->fw_stats.vdevs/bcn.
> >>> - ath12k_mac_get_fw_stats() returns 0 (Success).
> >>> - In ath12k_mac_op_get_txpower(), the check `if (!pdev)` fails if the
> >>> pdev-specific list is empty (but vdev list is NOT empty).
> >>> - The function exits via `err_fallback` WITHOUT calling ath12k_fw_sta=
ts_reset().
> >>> - Result: The 'vdev' and 'beacon' stats that were spliced into
> >>> ar->fw_stats remain there, leaking memory and accumulating with every
> >>> call.
> >>>
> >>> 2. Exact place where -71 is printed:
> >>> The error "failed to pull fw stats: -71" is printed in
> >>> [ath12k_update_stats_event()](drivers/net/wireless/ath/ath12k/wmi.c).
> >>> It corresponds to "ret =3D ath12k_wmi_pull_fw_stats()" returning -EPR=
OTO.
> >>> This propagates from
> >>> [ath12k_wmi_tlv_fw_stats_data_parse()](drivers/net/wireless/ath/ath12=
k/wmi.c),
> >>> when buffer validation checks (like `len < sizeof(*src)`) fail.
> >>>
> >>> Conclusion:
> >>> The fix in my patch (resetting stats when `!pdev`) is critical becaus=
e
> >>> it ensures that the accumulated 'vdev' and 'beacon' stats are freed
> >>> even when the 'pdev' list ends up empty.
> >>>
> >>> Let me know if you need anything else.
> >>
> >> can you please try below to see if it can fix your issue?
> >>
> >> https://lore.kernel.org/r/20260129-ath12k-fw-stats-fixes-v1-0-55d66064=
f4d5@oss.qualcomm.com
> >>
> >>>
> >>> Thanks & Regards,
> >>> Saikiran
> >>>
> >>> On Tue, Jan 27, 2026 at 9:47=E2=80=AFAM Saikiran B <bjsaikiran@gmail.=
com> wrote:
> >>>>
> >>>> Hi Baochen,
> >>>>
> >>>> Regarding your questions:
> >>>>
> >>>> "Are other stats populated?"
> >>>>
> >>>> Yes. When ath12k_mac_get_fw_stats() returns success (0), it means th=
e
> >>>> firmware response was received and valid WMI events were processed.
> >>>> The firmware response to WMI_REQUEST_PDEV_STAT typically includes
> >>>> multiple stats TLVs (vdev stats, beacon stats, etc.). Even if the
> >>>> "pdev stats" list ends up empty (e.g., due to specific filtering or
> >>>> availability), the firmware should have populated other lists (like
> >>>> vdevs or beacons) in the ar->fw_stats structure. If we don't reset,
> >>>> these valid entries leak and accumulate.
> >>>>
> >>>> "Where exactly is -71 (EPROTO) printed?"
> >>>>
> >>>> The log "failed to pull fw stats: -71" is printed in
> >>>> ath12k_update_stats_event() (wmi.c line 8500 in my tree). This error
> >>>> code (-EPROTO) propagates from ath12k_wmi_tlv_fw_stats_data_parse(),
> >>>> where it is returned when buffer validation checks fail (e.g., if (l=
en
> >>>> < sizeof(*src))). This failure suggests that the accumulated state o=
r
> >>>> memory corruption from the leak eventually causes the parser to fail
> >>>> on subsequent events.
> >>>>
> >>>> So, fixing the leak is necessary for correctness regardless of the
> >>>> specific side-effect error code.
> >>>>
> >>>> Thanks & Regards,
> >>>> Saikiran
> >>>>
> >>>> On Tue, Jan 27, 2026 at 8:57=E2=80=AFAM Baochen Qiang
> >>>> <baochen.qiang@oss.qualcomm.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 1/26/2026 5:52 PM, Saikiran wrote:
> >>>>>> The commits bd6ec8111e65 and 2977567b244f changed firmware stats h=
andling
> >>>>>> to be caller-driven, requiring explicit ath12k_fw_stats_reset() ca=
lls
> >>>>>> after using ath12k_mac_get_fw_stats().
> >>>>>>
> >>>>>> In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() suc=
ceeds
> >>>>>> but the pdev stats list is empty, the function exits without calli=
ng
> >>>>>> ath12k_fw_stats_reset(). Even though the pdev list is empty, the f=
irmware
> >>>>>> may have populated other stats lists (vdevs, beacons, etc.) in the
> >>>>>
> >>>>> 'may' is not enough, we need to be 100% sure whether other stats ar=
e populated. This is
> >>>>> critical for us to find the root cause.
> >>>>>
> >>>>>> ar->fw_stats structure.
> >>>>>>
> >>>>>> Without resetting the stats buffer, this data accumulates across m=
ultiple
> >>>>>> calls, eventually causing the stats buffer to overflow and leading=
 to
> >>>>>> firmware communication failures (error -71/EPROTO) during subseque=
nt
> >>>>>> operations.
> >>>>>>
> >>>>>> The issue manifests during 5GHz scanning which triggers multiple T=
X power
> >>>>>> queries. Symptoms include:
> >>>>>> - "failed to pull fw stats: -71" errors in dmesg
> >>>>>
> >>>>> still, can you please check the logs to see at which exact place is=
 this printed?
> >>>>>
> >>>>>> - 5GHz networks not detected despite hardware support
> >>>>>> - 2.4GHz networks work normally
> >>>>>>
> >>>>>> Fix by calling ath12k_fw_stats_reset() when the pdev list is empty=
,
> >>>>>> ensuring the stats buffer is properly cleaned up even when only pa=
rtial
> >>>>>> stats data is received from firmware.
> >>>>>>
> >>>>>> Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset call=
er-driven")
> >>>>>> Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
> >>>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Sl=
im 7x)
> >>>>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> >>>>>> ---
> >>>>>>  drivers/net/wireless/ath/ath12k/mac.c | 1 +
> >>>>>>  1 file changed, 1 insertion(+)
> >>>>>>
> >>>>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/w=
ireless/ath/ath12k/mac.c
> >>>>>> index e0e49f782bf8..6e35c3ee9864 100644
> >>>>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
> >>>>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> >>>>>> @@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct =
ieee80211_hw *hw,
> >>>>>>                                       struct ath12k_fw_stats_pdev,=
 list);
> >>>>>>       if (!pdev) {
> >>>>>>               spin_unlock_bh(&ar->data_lock);
> >>>>>> +             ath12k_fw_stats_reset(ar);
> >>>>>>               goto err_fallback;
> >>>>>>       }
> >>>>>>
> >>>>>
> >>
> >
> > Hi Baochen,
> >
> > I tried applying your patches on top of v6.19-rc7 (which is the latest
> > mainline release candidate I'm testing on), but I ran into build
> > issues because some of the dependencies seem missing.
> >
> > Specifically:
> > Patch 2 ("wifi: ath12k: fix station lookup failure when disconnecting
> > from AP") uses `ath12k_link_sta_find_by_addr()`, which does not exist
> > in my tree. It seems your patches are based on a different tree
> > (ath-next?) that has newer changes not yet in the mainline.
> >
> > Could you please point me to the specific git repo/branch you are
> > using? I can try to build and test on that baseline to be sure.
>
> My bad. Please try the latest ath tree:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>
> the base commit is ath-202601271544 tag.
>
> >
> > Regarding the firmware stats issue:
> > I verified the firmware files match the latest available (MD5 sums
> > matched), yet the "-71" errors and memory leak persist on my device
> > without fixes.
> >
> > I successfully applied the logic from your Patch 1 manually (since
> > [ath12k_mac_get_target_pdev_id](cci:1://file:///home/saikiran/linux/ker=
nel/x1e/x1e/drivers/net/wireless/ath/ath12k/mac.c:989:0-1008:1)
> > exists), but I haven't fully validated if it alone resolves the leak
> > in all scenarios.
> >
> > However, the fix I proposed in my v2 patch (resetting stats when pdev
> > list is empty) definitely stops the leak mechanism by ensuring cleanup
> > happens even when the firmware returns partial stats (which seems to
> > be the trigger condition).
> >
> > I'll wait for your pointer to the base tree to do a proper test of your=
 series.
> >
> > Thanks & Regards,
> > Saikiran
>

Hi,

I have merged the tag, applied your patches and I can confirm that the
leak has been fixed.

Thanks & Regards,
Saikiran

