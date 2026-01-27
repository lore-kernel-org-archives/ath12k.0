Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B35D25930
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 04:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prkzLPO3vlrT/dESXtDqaOD9/sG0dfRjFFIi+7EgQzY=; b=vSJlM0M15kYrlhc/3N8kBs9Xz7
	uGGJENZSqrBznZeAKq0bQMXsHAzr4pQwLeIIxLi5H73MyBm3G9sHxf4Ouw6/XNEt2OBskg+eLH08S
	7MNvSDQWtbhHRHD/1iMMHPIcdMKGZA1i/3s/9Ue7vGfk0fIv9uP42/BA8pBJyf+r2h+UYWlsL49XS
	VHwYsMKD04GAEeStqhYDb/msYHB8OIvU7Xv1QBkVozXjV+a1roAfnltyIm26BUcCHsicmVfBgt1nm
	HfQBNoohBIHjOmzDzXvPLHGR0LV2X15uJsfW/jtt+9IrfGXaNShk0CksbzRcmZtmhWcLY+C0BwICd
	By4G6Mug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkaWX-0000000DdV1-3lYF;
	Tue, 27 Jan 2026 04:17:53 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkaWU-0000000DdUf-2lZM
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 04:17:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c5f0edc20f2so1353581a12.3
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 20:17:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769487469; cv=none;
        d=google.com; s=arc-20240605;
        b=dt93Un9lPrMFvMYKY9cZsW3XTyd/zfEjKzHJpnUMg7BxE4UZKfI7PB2RaCoshxRrpC
         wTAKiLIUmIEn19fXiy7LbMPmLE0vpx57LcbcZvaCWKWsMkZLRszTlGzeI96Ynvl83fwx
         LgAgBeC9r83vZRytVD6Ymh0PayoTshS3wlgRVoKD5kOXH6XsIYPgeGHwAsaXPvAoXseE
         tT6WkHV8fjFtJTdIpcur4zjZFfpR+pYciLtZfbEKlazDz1/6s+Pcx7ysyB4vQYCUZW4f
         8WIJjFKLsWMNU/8CKa28WIDE2ZrBdghfGhRv58Bwz83GoGmh6aFik9DiSwcAhs6+4d8P
         VFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prkzLPO3vlrT/dESXtDqaOD9/sG0dfRjFFIi+7EgQzY=;
        fh=ufLYLKPkX0L7XyBQ8nPQ/t3T0fhJan6BIBMR1NwE53g=;
        b=Yyq7bDgLHTj/V7SYuwVWDs95Iw7RtZQiN9igHx7KyGbawwL9K9twyXO++MIkuzPq/d
         mMpf+mtFgDIWDMGtcuLlLkiUNSw148UUFAoZVR+rScxLI2q6AOrUoR3ZCaUzgdAvEQCH
         YYF/H/rgB71R8T43Gznw3XT8NR93aEOR8HJWHoAIa/suLTYwYo+4Ar6KtZL+6AN+pjU4
         8E5pJD910en3oDfvzxVkVTvSs70MpQujsvnK87dujdUcCCoTjX/K1xyLqaN9L8V4GUIb
         MH6VprAoWyS74kgF5rI2oAczopkRJBgXOYazAQwPs7nSRpZXfXgMbL1xciL+NwjdPxM0
         qKaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769487469; x=1770092269; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prkzLPO3vlrT/dESXtDqaOD9/sG0dfRjFFIi+7EgQzY=;
        b=mG3AmSxVgrN+Rtj41njiYpp2LW1VN/Rs5ixnsUYxh1el5yilIUQdrHkzS54WF4WdNE
         +IygIO7fxiGfmh09MevA2WZzrpkE0kEDDAjC/Zrxam4fkJXRsKhjtMoh1SZZDGwImGta
         qe0Q7hNp1Glik8WqNX8TZJfd8oiUYjVszqhcavn+fqIJr0FpLqwCzg0NIUa9s7578rDI
         UyzyREl4SuAbITewC9IIDyDMIJL3w4mER+AVO3i4glnDWsSF2yYWI6Pt298YYfCvDpAR
         5kSZz+4A40ftSSLXHPGxeAR3Dh6BLn1da2azRWHs2lo7kY6Qa3LcSCU/bEuWFZL/majg
         HvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769487469; x=1770092269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=prkzLPO3vlrT/dESXtDqaOD9/sG0dfRjFFIi+7EgQzY=;
        b=t+L6XGaNxsDn0CNg+mWtbQHPWU6fwkasvPMLzIulRMQmZTPt/ZdiGdISWdLsWuVqmw
         5t1ybDBGrx4uBZaduT0+qzEdBxplBhedfSQX/jsxxkMG6Ar6Vi+tjeu/A78fiS3Iq9Rb
         +dPkxj2tzdJuRvz2unNsmrMiosmEzSl+duk+JnzlKOv6K0sNF2IdmxB4DVRHWSjxPb3w
         d2mrgyZ/C88x6qbTDopVmRoLngWW3dmWzqlLBj27dWPIK4lxdUjRii2nzL4p07X7/54V
         RhfmbW60IZuwGEX4J9Sus4MtipYnmm0yr0ajRBmOUUrbVgjhHcR4Y6Hp0x3fKO31Fq1/
         97uw==
X-Gm-Message-State: AOJu0YzutKwxNZ8uXhIQ00NBCb2nO/rLFGD+WKkMaPgwywvIQefd5l8A
	SzGssEJc/BmkgEkHmstCK8XYXFkKliFIwKCNqCBhkYTKoYFDqKDYxgJGLHD4xGdEVxsFDNUg80I
	XwECvRV0sKmo1Ef+jxrBqnvo8WSPqPaE=
X-Gm-Gg: AZuq6aLZ9YeZGLrmmJ1mdaRB5XltU+BavM4X6rfR8HsJDgqs9tsGb7er9pWY2J+JNdg
	lZpbTdg+1jgBGtA3dcvMzbWd6udfxpqjOWvtWi9XBZ4cWFdGMPhNP2t7FeCjiE97kLEde590yka
	qzTUoBaTmG7ld09dwnQ6a5U6ZlWOdYDpPyCcfEOPPYsrWcB8sWVQVEINCYf7EOJLiq0/h63sp1k
	A2LaIS5B0r9Is3Ffr94JvB9YoGvMbQ8Pfb4NdS6n8M3Re+ifEhyQf2iTyPmf9tWVqLjDKF5CSMR
	Eg7JvfPx57z0xgEfIxXYaBt3F6S1
X-Received: by 2002:a17:90b:1c06:b0:353:2e1:95f4 with SMTP id
 98e67ed59e1d1-353fecdb296mr599117a91.13.1769487469512; Mon, 26 Jan 2026
 20:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20260126095244.113301-1-bjsaikiran@gmail.com> <20260126095244.113301-3-bjsaikiran@gmail.com>
 <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com>
In-Reply-To: <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Tue, 27 Jan 2026 09:47:38 +0530
X-Gm-Features: AZwV_QhRmen6yNQ1sOp5rPyvCiQFJUICIruHxRD0677ZcMCrRdjd4gNxIEeQPJU
Message-ID: <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_201750_708092_287611C1 
X-CRM114-Status: GOOD (  26.18  )
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

Regarding your questions:

"Are other stats populated?"

Yes. When ath12k_mac_get_fw_stats() returns success (0), it means the
firmware response was received and valid WMI events were processed.
The firmware response to WMI_REQUEST_PDEV_STAT typically includes
multiple stats TLVs (vdev stats, beacon stats, etc.). Even if the
"pdev stats" list ends up empty (e.g., due to specific filtering or
availability), the firmware should have populated other lists (like
vdevs or beacons) in the ar->fw_stats structure. If we don't reset,
these valid entries leak and accumulate.

"Where exactly is -71 (EPROTO) printed?"

The log "failed to pull fw stats: -71" is printed in
ath12k_update_stats_event() (wmi.c line 8500 in my tree). This error
code (-EPROTO) propagates from ath12k_wmi_tlv_fw_stats_data_parse(),
where it is returned when buffer validation checks fail (e.g., if (len
< sizeof(*src))). This failure suggests that the accumulated state or
memory corruption from the leak eventually causes the parser to fail
on subsequent events.

So, fixing the leak is necessary for correctness regardless of the
specific side-effect error code.

Thanks & Regards,
Saikiran

On Tue, Jan 27, 2026 at 8:57=E2=80=AFAM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 1/26/2026 5:52 PM, Saikiran wrote:
> > The commits bd6ec8111e65 and 2977567b244f changed firmware stats handli=
ng
> > to be caller-driven, requiring explicit ath12k_fw_stats_reset() calls
> > after using ath12k_mac_get_fw_stats().
> >
> > In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() succeeds
> > but the pdev stats list is empty, the function exits without calling
> > ath12k_fw_stats_reset(). Even though the pdev list is empty, the firmwa=
re
> > may have populated other stats lists (vdevs, beacons, etc.) in the
>
> 'may' is not enough, we need to be 100% sure whether other stats are popu=
lated. This is
> critical for us to find the root cause.
>
> > ar->fw_stats structure.
> >
> > Without resetting the stats buffer, this data accumulates across multip=
le
> > calls, eventually causing the stats buffer to overflow and leading to
> > firmware communication failures (error -71/EPROTO) during subsequent
> > operations.
> >
> > The issue manifests during 5GHz scanning which triggers multiple TX pow=
er
> > queries. Symptoms include:
> > - "failed to pull fw stats: -71" errors in dmesg
>
> still, can you please check the logs to see at which exact place is this =
printed?
>
> > - 5GHz networks not detected despite hardware support
> > - 2.4GHz networks work normally
> >
> > Fix by calling ath12k_fw_stats_reset() when the pdev list is empty,
> > ensuring the stats buffer is properly cleaned up even when only partial
> > stats data is received from firmware.
> >
> > Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-dr=
iven")
> > Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x=
)
> > Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/mac.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wirele=
ss/ath/ath12k/mac.c
> > index e0e49f782bf8..6e35c3ee9864 100644
> > --- a/drivers/net/wireless/ath/ath12k/mac.c
> > +++ b/drivers/net/wireless/ath/ath12k/mac.c
> > @@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct ieee8=
0211_hw *hw,
> >                                       struct ath12k_fw_stats_pdev, list=
);
> >       if (!pdev) {
> >               spin_unlock_bh(&ar->data_lock);
> > +             ath12k_fw_stats_reset(ar);
> >               goto err_fallback;
> >       }
> >
>

