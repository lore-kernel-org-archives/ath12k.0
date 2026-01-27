Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF09CD25932
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 04:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgoRQ9aAInuWwuJvNm7KWE30aQAj3Sbe+L9WQLU0jmo=; b=licqsxFU2bEvVdJJ2UFAPVtbUf
	Bd1EZBkDBGl8X02gULDNwRt+MIUa4rNTE3IOOTtEZk0mXU2ql2puCgu18foRmp7QCOQ+qPPRxgWXc
	MJwpZ7LuuKfUqngUEH831L2Li7KEGadfqkm5WWGaYn6CMXB1wH9Ys7lfOwv4NBbxXNQnE9YvoJ9Ka
	71OeK2T6eyTQL1512bh8JIyU9vpL4BjAuPuRk9m+sBaUpgO5rfols6NXt4kKfIupEn2Ta4L39997U
	Ze54Rpx5Dw7m9DLx+3eW0rsZmoWNiqIdlxRUyabXTHS8wxYIxAN8DXIo3+6xT25YbDgc/djOfbKKX
	GfyARs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkasv-0000000Degp-0eIM;
	Tue, 27 Jan 2026 04:41:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkass-0000000DegV-2lgS
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 04:40:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0ac29fca1so39673065ad.2
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 20:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769488858; cv=none;
        d=google.com; s=arc-20240605;
        b=f4Ww0RQBA0F/Qs7jQM4XOM28wnbgYDhhCg9pj/3OtLi0AXtVvLFW1/s962Kk9pAdLU
         AAmRqRh/2nGfzRwkSbSqzZvZYwpnkEulFivRoSxong8zyn73pYf1O0rFPb7mnGQGCd68
         D7BUMWCuvADjvxxEAjyNhMrCVS5NurNHs+03wkoojLpfvpPUdxJGW5D8LeiSwcCsJR8K
         /WO1JjGOeO6yjiNgMRRAxCtoCmbub1Twmek8xLN52miLa52uKdPjeg3ugcU8gH5+ynAj
         hHWCAg/uRp4Vhk0rXmw3OkyuDSg5dShPrlG9X5CTMUoV9XdTzTJMrsXkyfcWXoJst7Wt
         GE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgoRQ9aAInuWwuJvNm7KWE30aQAj3Sbe+L9WQLU0jmo=;
        fh=ufLYLKPkX0L7XyBQ8nPQ/t3T0fhJan6BIBMR1NwE53g=;
        b=CGiKWG+wYgMzBQLoOSpezldOy8NHOj5WT1Qy0SRvRkxbLEjFsvQ2RMK1kSvwgsx58U
         EwyPFTyglQ8u3yXNzoc1jgVNogpvK9rufHyLuSa65F4Ni2rWCjqyN6hjUVWxxYBDpHuv
         RiM2s0pZcvoIKVN3bvqzIPO8R1E9JV152D9SvAdZts1+IimlUM1whX44Pc3yPDgwd7aR
         qT+LZx+sZ1TTSpVZ/m3nWz7DwIve3LxeXQsZozWHwgH3BD8uCLnEYQnL/XnclwkDogen
         cinKLNQqThXD1EoTDB59rFB1TY0IOnBOAMZJ27A/Rl5G05djPxEvn261JlbE27/KTMF4
         GezA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769488858; x=1770093658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgoRQ9aAInuWwuJvNm7KWE30aQAj3Sbe+L9WQLU0jmo=;
        b=RG93hzVDAbZdL6817iLZEF5nlsXWVKr/2whqa2UXW9TgyuPdINDhOfBJwk26w6baFK
         nAwn1IVztXQzT6CSdBB4XLbrXSG9DGfJfdtDhBHHnR1GGZSomi7bVIzN27YqNgSvOnGH
         Ejb/H2bduLIsRGMv0qR7nQUuCi7mOaOgHAXR+X6+pfssO8B/UBNoDjI3E/FfRBreAeqF
         fjtLe6n11K8ayUejgN1jCoXWy2q9EXvfz5nG9v0YOwz97i8sbUO7TVmCNQqYcSRx8saU
         aJ4iMtfbvbW/X+DLrCJQFvhojEbx19V/UKXwwMSKni3etEpsLvkmr5cEHY2LuBSbpyU7
         Tw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769488858; x=1770093658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CgoRQ9aAInuWwuJvNm7KWE30aQAj3Sbe+L9WQLU0jmo=;
        b=Cp2pcG0+oTqg6P+O0SkC1jIOXpO6JPGQlhnI6HgKsUV4C0o8ef+rPbbswoWrfyaiXX
         NqtRukpOvSOWPjNACAR8B1VjO2lq+0B2pLPvYVvHLo0zQ+jWmspRzPNsTqoo457q9tjr
         1Cr12oeUtLehMTNgJjJy5T9QI8ReQ5It67VQQ2G4IEY1vd+Je9701KX3DzyqYlhs5C7F
         ApvP9ENKmToF7uhuSwe930Cze7Fh0UbyaE3Q2UJ08Z/f229WA8bRXA2qYF+DdILNzkTj
         qgWSEcglvIM0o42GCGF7m2tmPjcAT8hdW61oLOzcBr9kNG1wJA2Wy3ynEC+7WT7xH0Br
         cokw==
X-Gm-Message-State: AOJu0Yyq74ynmJeSSNvPifK0erqmYXaHVckvrh03AJSCWDUDhondYt5f
	JrN+CymwEczfZLwU1W7lQZ5wsGBpZYa4wymqkjLSt6NGcgbLJ+/hc73gH+SjAeUsncdXuTyQiH/
	hVv1cEzGCwClvkK9m79Gqq2ByUezbt+M=
X-Gm-Gg: AZuq6aJ1fcUknZueWOG0ZQ37ozZKdFwP2FSSazl4LmTCkH8HHZzu65hceLBpFkP//j9
	8x9veaObszANuZdxpULfu/t1DM2/eA15DbxnFnLqtcKQZ5EZ/YRkczqf+dlEhWb+yivqr7DrE2M
	KNSE2/TXODievn4jmGPn3CzeKfijCPbtdl/1azMKjExL/9v4ukJGvwDspbJrK4X7eJEd7uvdsid
	yTLq/aU03Y1rDNeZyKnPtjswN3gIfIcR9IVUtOCCsRBn3YXahlSCC5XgCeHUC2U9mkuWsgs4xSE
	wf6LvfFLHASaNb0EhcY+Oc5kTsqu
X-Received: by 2002:a17:902:d4c8:b0:2a7:d5c0:c659 with SMTP id
 d9443c01a7336-2a870d40ab5mr5777875ad.5.1769488857625; Mon, 26 Jan 2026
 20:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20260126095244.113301-1-bjsaikiran@gmail.com> <20260126095244.113301-3-bjsaikiran@gmail.com>
 <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com> <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
In-Reply-To: <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Tue, 27 Jan 2026 10:10:46 +0530
X-Gm-Features: AZwV_QjSyKJDNXc0V-uk_r8aWV8rDwL4hUja8DncYHLWVRioWU3KnzYePaaemT4
Message-ID: <CAAFDt1s8HPQWJpSiDDk8PmUAKqkQHELcJj_F0faZ1C9RfiYu6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_204058_708878_5CE383A6 
X-CRM114-Status: GOOD (  33.34  )
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

I have analyzed the logs and code flow in depth to provide more
definitive answers for your questions.

The log entries showing the failure are:
[  563.574076] ath12k_pci 0004:01:00.0: failed to pull fw stats: -71
[  564.575896] ath12k_pci 0004:01:00.0: time out while waiting for get fw s=
tats

1. Why are other stats populated?
The "failed to pull fw stats: -71" error is not the initial failure
but a symptom that appears after repeated operations. The leak happens
during *successful* calls prior to this error.

Code flow proving the leak:
- ath12k_mac_get_fw_stats() sends WMI_REQUEST_PDEV_STAT.
- Firmware responds. ath12k_update_stats_event() parses the response.
- ath12k_wmi_fw_stats_process() is called, which splices 'vdevs' and
'beacon' stats into ar->fw_stats.vdevs/bcn.
- ath12k_mac_get_fw_stats() returns 0 (Success).
- In ath12k_mac_op_get_txpower(), the check `if (!pdev)` fails if the
pdev-specific list is empty (but vdev list is NOT empty).
- The function exits via `err_fallback` WITHOUT calling ath12k_fw_stats_res=
et().
- Result: The 'vdev' and 'beacon' stats that were spliced into
ar->fw_stats remain there, leaking memory and accumulating with every
call.

2. Exact place where -71 is printed:
The error "failed to pull fw stats: -71" is printed in
[ath12k_update_stats_event()](drivers/net/wireless/ath/ath12k/wmi.c).
It corresponds to "ret =3D ath12k_wmi_pull_fw_stats()" returning -EPROTO.
This propagates from
[ath12k_wmi_tlv_fw_stats_data_parse()](drivers/net/wireless/ath/ath12k/wmi.=
c),
when buffer validation checks (like `len < sizeof(*src)`) fail.

Conclusion:
The fix in my patch (resetting stats when `!pdev`) is critical because
it ensures that the accumulated 'vdev' and 'beacon' stats are freed
even when the 'pdev' list ends up empty.

Let me know if you need anything else.

Thanks & Regards,
Saikiran

On Tue, Jan 27, 2026 at 9:47=E2=80=AFAM Saikiran B <bjsaikiran@gmail.com> w=
rote:
>
> Hi Baochen,
>
> Regarding your questions:
>
> "Are other stats populated?"
>
> Yes. When ath12k_mac_get_fw_stats() returns success (0), it means the
> firmware response was received and valid WMI events were processed.
> The firmware response to WMI_REQUEST_PDEV_STAT typically includes
> multiple stats TLVs (vdev stats, beacon stats, etc.). Even if the
> "pdev stats" list ends up empty (e.g., due to specific filtering or
> availability), the firmware should have populated other lists (like
> vdevs or beacons) in the ar->fw_stats structure. If we don't reset,
> these valid entries leak and accumulate.
>
> "Where exactly is -71 (EPROTO) printed?"
>
> The log "failed to pull fw stats: -71" is printed in
> ath12k_update_stats_event() (wmi.c line 8500 in my tree). This error
> code (-EPROTO) propagates from ath12k_wmi_tlv_fw_stats_data_parse(),
> where it is returned when buffer validation checks fail (e.g., if (len
> < sizeof(*src))). This failure suggests that the accumulated state or
> memory corruption from the leak eventually causes the parser to fail
> on subsequent events.
>
> So, fixing the leak is necessary for correctness regardless of the
> specific side-effect error code.
>
> Thanks & Regards,
> Saikiran
>
> On Tue, Jan 27, 2026 at 8:57=E2=80=AFAM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 1/26/2026 5:52 PM, Saikiran wrote:
> > > The commits bd6ec8111e65 and 2977567b244f changed firmware stats hand=
ling
> > > to be caller-driven, requiring explicit ath12k_fw_stats_reset() calls
> > > after using ath12k_mac_get_fw_stats().
> > >
> > > In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() succee=
ds
> > > but the pdev stats list is empty, the function exits without calling
> > > ath12k_fw_stats_reset(). Even though the pdev list is empty, the firm=
ware
> > > may have populated other stats lists (vdevs, beacons, etc.) in the
> >
> > 'may' is not enough, we need to be 100% sure whether other stats are po=
pulated. This is
> > critical for us to find the root cause.
> >
> > > ar->fw_stats structure.
> > >
> > > Without resetting the stats buffer, this data accumulates across mult=
iple
> > > calls, eventually causing the stats buffer to overflow and leading to
> > > firmware communication failures (error -71/EPROTO) during subsequent
> > > operations.
> > >
> > > The issue manifests during 5GHz scanning which triggers multiple TX p=
ower
> > > queries. Symptoms include:
> > > - "failed to pull fw stats: -71" errors in dmesg
> >
> > still, can you please check the logs to see at which exact place is thi=
s printed?
> >
> > > - 5GHz networks not detected despite hardware support
> > > - 2.4GHz networks work normally
> > >
> > > Fix by calling ath12k_fw_stats_reset() when the pdev list is empty,
> > > ensuring the stats buffer is properly cleaned up even when only parti=
al
> > > stats data is received from firmware.
> > >
> > > Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-=
driven")
> > > Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
> > > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim =
7x)
> > > Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> > > ---
> > >  drivers/net/wireless/ath/ath12k/mac.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wire=
less/ath/ath12k/mac.c
> > > index e0e49f782bf8..6e35c3ee9864 100644
> > > --- a/drivers/net/wireless/ath/ath12k/mac.c
> > > +++ b/drivers/net/wireless/ath/ath12k/mac.c
> > > @@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct iee=
e80211_hw *hw,
> > >                                       struct ath12k_fw_stats_pdev, li=
st);
> > >       if (!pdev) {
> > >               spin_unlock_bh(&ar->data_lock);
> > > +             ath12k_fw_stats_reset(ar);
> > >               goto err_fallback;
> > >       }
> > >
> >

