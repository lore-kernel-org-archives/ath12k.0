Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB064D6101C
	for <ath12k@archiver.kernel.org>; Thu, 29 Jan 2026 14:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcLENt0AH5rhLcl7Jm2sgoJkBXC9N8ulrINMcIPia5k=; b=gJOGICfRr0noiaxv6kSmcYTKyk
	z7N1Ji/eCGh+FuwIhSDUoHHPE4s8gIuZbyGqtoidTd3+YiNOg4S3fuGzoxzBh/rTvxoEbu1wJLG9F
	tLQVxegAw9Ys6YsYT8kklULBzbli2+56BPX1yKuoooFQT0kpotSOYcd9UXUPSY6xx2yLDdA7a8uSH
	dnh1jfcvQk/AyVGvAU2OvLYJJ4x9TYos1j0tSMHpjf/fJoCNoYsi994mgcfuhNABnqENquWZVW8Tk
	LnWFdUo4FZnfElTOALnvKcBbAbr3ZGZbZ09w+yMwewttFkQ5dCav29G8BuyQbpRINbbZPXNzEvIEp
	iwYN3a5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSfJ-00000000CMA-1e6s;
	Thu, 29 Jan 2026 14:06:33 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSfG-00000000CLp-3N3L
	for ath12k@lists.infradead.org;
	Thu, 29 Jan 2026 14:06:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso373117a12.1
        for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 06:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769695589; cv=none;
        d=google.com; s=arc-20240605;
        b=PBNcBzlLhtl6uHQ7DzwaeCGzJItheO3E3V3enJXJYad4gkUjwC/iJIjQSo1B6GvXff
         WKJzmPzl1orKMe4oUArLFXowG5omEPguzAZ17G+zFwxPjKlAR76k/NNBBurZS7VD+ajn
         c8B6DU5V50vUe+vSugdKkWJs5d3HkaCeaQ/8k1X8+ufxLWxBsa+/wRtWw4kqyMZB10YL
         YF17doDduBrA8tEYLS9/GWEv44waZz0+EjlDWG4zSYIxNuPVdQdRochHBCJaRYZFBNiI
         trD9n3Nxz+7APn1onudop1U3hnYTzIoYhsiGP9tlUzHmwS8/txaJo9EFMZ0qmEw9U5GR
         BHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RcLENt0AH5rhLcl7Jm2sgoJkBXC9N8ulrINMcIPia5k=;
        fh=ufLYLKPkX0L7XyBQ8nPQ/t3T0fhJan6BIBMR1NwE53g=;
        b=D5NsWom9GbhGQAIAD1j1sv3/id9tQgt2iHuy0uC7//4wathjWknH0zdUI/oVuWj/tv
         0/2hKo6TXlzeYMlgObXHlvBcMc2AMaTOtknLBXMSLm5lJVy+B7SG0hUgiIHboGrVazMB
         owrukP511z5x1K9K3M3GmhYpoDJZfC+5mwVe3rtXIRNIfIDgwu98xXsuv0dvGL5f+dC2
         Hi0dzZxZUlMiDl7lK/XA0ZvHjV6jOqc2XZPdlZlxKv7IyQhjnXDLFz7nv/BPZL3hYL5m
         cJLCVSCXaL9jggf3I23dGVNtBT9+2S8PRQCaRzAKcNQ4wtw1guUCHNIrS8YY1qdze7n7
         C+Ig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769695589; x=1770300389; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcLENt0AH5rhLcl7Jm2sgoJkBXC9N8ulrINMcIPia5k=;
        b=HI9jXWzSsYTForu47MVeIugYlMpMxf4PqdmCD4Mic0+2XGNHpN78p9LOvRuDnbQKir
         AU1uuKpzmw0dcoNVVXOIlzscdHpdBejX3Ewo/dgV+TmMRyxIYf4GyqKBP/0nRJSO3lzN
         IdGaWwxmUeleEhbxFps+0gwZhtIymSX37t79P68cAuK/5X8dwuFvDbshLt00irmT/PV1
         pihWx6uDkpnPJSayUIVex2WWHH4OYVdhrzkwIKtaKjOwMDrVd7YRt0icWSgJvwKUbFQi
         UAf8XI/BztsBPbiPDb8Q/F7cTbosPs4iuyora8FBDmeEThAscrrNdj2Z3MYeyDjdWtQD
         JZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769695589; x=1770300389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RcLENt0AH5rhLcl7Jm2sgoJkBXC9N8ulrINMcIPia5k=;
        b=FbRPqH6B088H6J6F3TEtdQePPZyRUJzxqyIlaoe984hia0WsXQ/QZdV8vmiHaUjE25
         ugZX46gHITWrwoFMoKpi7GpF8GsP/lUfFqXgz1NfvcBohxXKxldFLg6a76NJE2wiAoJh
         l8EfxROygnId3qgSvI69CVva3yPArNvjayDG0mXsVJ4S5Xz8nX7pJKdDD0034vl1MNZL
         l9eDvH8qcCCaAGLZRa+7/qQIRe9agKoc59UYUShnA+xb4CYcwKu3DnbrDCbRgNoBmpgu
         sKcaUhue1AXVov77RyOncLLiXsXwLCXPH9ad2Tk3XkKj1Dtw1YMzBNxPtXTztmZYqeCc
         nmEg==
X-Gm-Message-State: AOJu0YylKCxg+bVTKbQn+To9eU+daafz9iVS4fsN/LkQQ2e2WZX5sQM6
	/C48Odn1nGGHelaGxDlhIGr9A4JrMUYFnS/5UWZFkAp0zou+PqIIQ0DPp5ex0vW5+347Mrig7Ou
	I0RX0kY841HgnIMT88bu9ybobD//kC2A=
X-Gm-Gg: AZuq6aIiEXfusFZ9Cbenza+qffEoZKU0JdhHxoAB5tobMccvELon8luSt4JrT9zJJP6
	KDlQsZJJbBvh8zXZMEs5Kh7uu6Me10/MfiyWI5e//38zddWOcWkQclgKPttgx2GfDmQdRaAFdM4
	NmoRUE4weh+CzyjNzIC5mC1K2gNVIJ+B3OZ1WMqshQHax0RH+PGuRlXHzDs0kPaL5a06Pk/331Q
	kxeyFJ/P7tf3zs50r6gVMluLdsd+Ct+3U3lEP4jTVEhZS4qJo3Xl6gW3JTeF+6Wl394pqA2F4kI
	wUeX48rxbz7s1y5pwDhnLejBasUV
X-Received: by 2002:a17:90a:c88c:b0:340:9cf1:54d0 with SMTP id
 98e67ed59e1d1-353fecca19emr8148301a91.1.1769695589142; Thu, 29 Jan 2026
 06:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20260126095244.113301-1-bjsaikiran@gmail.com> <20260126095244.113301-3-bjsaikiran@gmail.com>
 <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com> <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
 <CAAFDt1s8HPQWJpSiDDk8PmUAKqkQHELcJj_F0faZ1C9RfiYu6g@mail.gmail.com> <7fb6b431-58ea-47bc-b251-5144575db17d@oss.qualcomm.com>
In-Reply-To: <7fb6b431-58ea-47bc-b251-5144575db17d@oss.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Thu, 29 Jan 2026 19:36:17 +0530
X-Gm-Features: AZwV_QhHbNenSWHu850YbkxhJb3eHlb_ZpOB6u7ptj-ZZOVmyFVj8PtOT56zULg
Message-ID: <CAAFDt1s_NtY1vXa5STRW7oQn9yDJBC0g7CPSZXn0tFhd+CSHrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_060630_856190_536767C7 
X-CRM114-Status: GOOD (  44.44  )
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

On Thu, Jan 29, 2026 at 7:57=E2=80=AFAM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 1/27/2026 12:40 PM, Saikiran B wrote:
> > I have analyzed the logs and code flow in depth to provide more
> > definitive answers for your questions.
> >
> > The log entries showing the failure are:
> > [  563.574076] ath12k_pci 0004:01:00.0: failed to pull fw stats: -71
> > [  564.575896] ath12k_pci 0004:01:00.0: time out while waiting for get =
fw stats
> >
> > 1. Why are other stats populated?
> > The "failed to pull fw stats: -71" error is not the initial failure
> > but a symptom that appears after repeated operations. The leak happens
> > during *successful* calls prior to this error.
> >
> > Code flow proving the leak:
> > - ath12k_mac_get_fw_stats() sends WMI_REQUEST_PDEV_STAT.
> > - Firmware responds. ath12k_update_stats_event() parses the response.
> > - ath12k_wmi_fw_stats_process() is called, which splices 'vdevs' and
> > 'beacon' stats into ar->fw_stats.vdevs/bcn.
> > - ath12k_mac_get_fw_stats() returns 0 (Success).
> > - In ath12k_mac_op_get_txpower(), the check `if (!pdev)` fails if the
> > pdev-specific list is empty (but vdev list is NOT empty).
> > - The function exits via `err_fallback` WITHOUT calling ath12k_fw_stats=
_reset().
> > - Result: The 'vdev' and 'beacon' stats that were spliced into
> > ar->fw_stats remain there, leaking memory and accumulating with every
> > call.
> >
> > 2. Exact place where -71 is printed:
> > The error "failed to pull fw stats: -71" is printed in
> > [ath12k_update_stats_event()](drivers/net/wireless/ath/ath12k/wmi.c).
> > It corresponds to "ret =3D ath12k_wmi_pull_fw_stats()" returning -EPROT=
O.
> > This propagates from
> > [ath12k_wmi_tlv_fw_stats_data_parse()](drivers/net/wireless/ath/ath12k/=
wmi.c),
> > when buffer validation checks (like `len < sizeof(*src)`) fail.
> >
> > Conclusion:
> > The fix in my patch (resetting stats when `!pdev`) is critical because
> > it ensures that the accumulated 'vdev' and 'beacon' stats are freed
> > even when the 'pdev' list ends up empty.
> >
> > Let me know if you need anything else.
>
> can you please try below to see if it can fix your issue?
>
> https://lore.kernel.org/r/20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d=
5@oss.qualcomm.com
>
> >
> > Thanks & Regards,
> > Saikiran
> >
> > On Tue, Jan 27, 2026 at 9:47=E2=80=AFAM Saikiran B <bjsaikiran@gmail.co=
m> wrote:
> >>
> >> Hi Baochen,
> >>
> >> Regarding your questions:
> >>
> >> "Are other stats populated?"
> >>
> >> Yes. When ath12k_mac_get_fw_stats() returns success (0), it means the
> >> firmware response was received and valid WMI events were processed.
> >> The firmware response to WMI_REQUEST_PDEV_STAT typically includes
> >> multiple stats TLVs (vdev stats, beacon stats, etc.). Even if the
> >> "pdev stats" list ends up empty (e.g., due to specific filtering or
> >> availability), the firmware should have populated other lists (like
> >> vdevs or beacons) in the ar->fw_stats structure. If we don't reset,
> >> these valid entries leak and accumulate.
> >>
> >> "Where exactly is -71 (EPROTO) printed?"
> >>
> >> The log "failed to pull fw stats: -71" is printed in
> >> ath12k_update_stats_event() (wmi.c line 8500 in my tree). This error
> >> code (-EPROTO) propagates from ath12k_wmi_tlv_fw_stats_data_parse(),
> >> where it is returned when buffer validation checks fail (e.g., if (len
> >> < sizeof(*src))). This failure suggests that the accumulated state or
> >> memory corruption from the leak eventually causes the parser to fail
> >> on subsequent events.
> >>
> >> So, fixing the leak is necessary for correctness regardless of the
> >> specific side-effect error code.
> >>
> >> Thanks & Regards,
> >> Saikiran
> >>
> >> On Tue, Jan 27, 2026 at 8:57=E2=80=AFAM Baochen Qiang
> >> <baochen.qiang@oss.qualcomm.com> wrote:
> >>>
> >>>
> >>>
> >>> On 1/26/2026 5:52 PM, Saikiran wrote:
> >>>> The commits bd6ec8111e65 and 2977567b244f changed firmware stats han=
dling
> >>>> to be caller-driven, requiring explicit ath12k_fw_stats_reset() call=
s
> >>>> after using ath12k_mac_get_fw_stats().
> >>>>
> >>>> In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() succe=
eds
> >>>> but the pdev stats list is empty, the function exits without calling
> >>>> ath12k_fw_stats_reset(). Even though the pdev list is empty, the fir=
mware
> >>>> may have populated other stats lists (vdevs, beacons, etc.) in the
> >>>
> >>> 'may' is not enough, we need to be 100% sure whether other stats are =
populated. This is
> >>> critical for us to find the root cause.
> >>>
> >>>> ar->fw_stats structure.
> >>>>
> >>>> Without resetting the stats buffer, this data accumulates across mul=
tiple
> >>>> calls, eventually causing the stats buffer to overflow and leading t=
o
> >>>> firmware communication failures (error -71/EPROTO) during subsequent
> >>>> operations.
> >>>>
> >>>> The issue manifests during 5GHz scanning which triggers multiple TX =
power
> >>>> queries. Symptoms include:
> >>>> - "failed to pull fw stats: -71" errors in dmesg
> >>>
> >>> still, can you please check the logs to see at which exact place is t=
his printed?
> >>>
> >>>> - 5GHz networks not detected despite hardware support
> >>>> - 2.4GHz networks work normally
> >>>>
> >>>> Fix by calling ath12k_fw_stats_reset() when the pdev list is empty,
> >>>> ensuring the stats buffer is properly cleaned up even when only part=
ial
> >>>> stats data is received from firmware.
> >>>>
> >>>> Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller=
-driven")
> >>>> Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
> >>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim=
 7x)
> >>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> >>>> ---
> >>>>  drivers/net/wireless/ath/ath12k/mac.c | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wir=
eless/ath/ath12k/mac.c
> >>>> index e0e49f782bf8..6e35c3ee9864 100644
> >>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
> >>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> >>>> @@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct ie=
ee80211_hw *hw,
> >>>>                                       struct ath12k_fw_stats_pdev, l=
ist);
> >>>>       if (!pdev) {
> >>>>               spin_unlock_bh(&ar->data_lock);
> >>>> +             ath12k_fw_stats_reset(ar);
> >>>>               goto err_fallback;
> >>>>       }
> >>>>
> >>>
>

Hi Baochen,

I tried applying your patches on top of v6.19-rc7 (which is the latest
mainline release candidate I'm testing on), but I ran into build
issues because some of the dependencies seem missing.

Specifically:
Patch 2 ("wifi: ath12k: fix station lookup failure when disconnecting
from AP") uses `ath12k_link_sta_find_by_addr()`, which does not exist
in my tree. It seems your patches are based on a different tree
(ath-next?) that has newer changes not yet in the mainline.

Could you please point me to the specific git repo/branch you are
using? I can try to build and test on that baseline to be sure.

Regarding the firmware stats issue:
I verified the firmware files match the latest available (MD5 sums
matched), yet the "-71" errors and memory leak persist on my device
without fixes.

I successfully applied the logic from your Patch 1 manually (since
[ath12k_mac_get_target_pdev_id](cci:1://file:///home/saikiran/linux/kernel/=
x1e/x1e/drivers/net/wireless/ath/ath12k/mac.c:989:0-1008:1)
exists), but I haven't fully validated if it alone resolves the leak
in all scenarios.

However, the fix I proposed in my v2 patch (resetting stats when pdev
list is empty) definitely stops the leak mechanism by ensuring cleanup
happens even when the firmware returns partial stats (which seems to
be the trigger condition).

I'll wait for your pointer to the base tree to do a proper test of your ser=
ies.

Thanks & Regards,
Saikiran

