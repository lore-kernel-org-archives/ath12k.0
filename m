Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A1FC4451B
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lb3rvNERG6Trh6qQOAy5/wRaGSHQwfEXmqSq+iCr7LI=; b=vtTVgHtfuNTtSVWlLoCIaFSMpa
	1KWdNV5frzwz5cW5qzBxeLkbwoalbj7v533ty2YGpF6OBdjaFu3KdBhzuLXjPZhOHYSX7wDvDrVIJ
	sNmO3FysImmTuf1HxODC048DnZJ/0MqXgUGD0I1dvQ82Gt7Q+SB98vaFw43o4UsmCYWQUNIqiQKB/
	KnvHqXt+yQdclEPsn8/V+qrvml3k7zZsYtnfqTsftJhVedJCCaugNBwc6UQ2JpwUgZxlaszjocM8I
	S0bYekaivPqegOz9Ph+rESZCY38F5+JarOWhgopo+FLJ0u6pfh2VXbUpr8n+t22iSagAP0Y5bPr+R
	mTuKkHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkG9-00000006IvW-3yjz;
	Mon, 20 Jul 2026 09:26:01 +0000
Received: from mail-yx2-x03.google.com ([2607:f8b0:4864:41::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkG8-00000006ItH-0XIe
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 09:26:01 +0000
Received: by mail-yx2-x03.google.com with SMTP id 956f58d0204a3-6664ce5db57so2080274d50.1
        for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 02:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784539559; cv=none;
        d=google.com; s=arc-20260327;
        b=eIpk8vp/SK0pkQsEwiUkz5AkPfaOdCPiexj12ItYJV6/92ivq2F64r8Y2lICHh6GzN
         U8Wy3uwWN63d29FPxcYOkG2ujXBmy6uLY9UhoWY77aqdhNcDadJYeQBElUYSe9zXm7qi
         VkoB2szmfP7v0ICj6Y3PE9YzOsZAES5Vy5dKzRHhwfVTOQKEdu4ych8KxoKAQqleOyAx
         8nsWG+Ad1XWYk/h4cw2HLfcDUURo26JEaTGt/rdDYqoo8DEJeBbh7wERDUlcSkd2gwGK
         YCuLA8ekheBfzBP9fTUcSv20McXI2BG4CAPAdqnlxKM+OshOjcvDCP4lUX9i6K+DmMru
         lgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lb3rvNERG6Trh6qQOAy5/wRaGSHQwfEXmqSq+iCr7LI=;
        fh=flceTo32yy2WTfWTfYEwjseKjZ/VrjZVNy5jNK319uA=;
        b=GkUgF/77OcKzmg0eKXRKirBhT/pmTLpvQYq6n8rd1zFmZAaGgEmBJWCLh/6hUhlP6Y
         My3WdIue5v5F3G9dsETdu07n0/j1mPuArXDDf/RbyEXZ4zfFNmVBApvBSf0lss0CR9/y
         tjQXeq6Prlrh8JGmZlg7bWI/jGGJEnrI8kk+y8mwNvHH8eeojc/9Wkl7OOhEZqO+qPJs
         hdd9SZ6YQXYZwAiJm/kjr0QsAUcQgEtdwtXTpVH/DoDv9u6SMdAWwC5TtuaB4OtYrxCD
         avkflI6JC4E6qVzcj5ovSAV9pRoxAh1EBbdoO7RPZb+6SKgNeW+p9HFkqHRNUm1mTmeg
         XzMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784539559; x=1785144359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lb3rvNERG6Trh6qQOAy5/wRaGSHQwfEXmqSq+iCr7LI=;
        b=OZIps1AM5Pvpjym3AUdz236h0zUy3NYAd6XDXJo0OFpcnANTnJ5TjbTORgyXdnjfzk
         fRI5ea1Wyu9s0XBIBdppNpHyV6ZlUCaf0vF9/rsTrg+KCy6J2x8u5O22d6XuqmVBlGdJ
         aPnXT0FHNQGHF9tGXHoAI2b4altaOlYnZjMfOaATaVRSE8OaUCLY1NPQtWJX9MMQxJfI
         +bl9FBL1Ph1v6B7j5Zi7yPzMfq5IMjLK/PeWEMefaGhoEt3kvrTYZXSIZKvLkgTtIX/z
         9/gS9XKO6Av23Tx42gUWMu4WOd71DSxHUoV4Yjw/HT6EU8mezRiyFc/fOWM5kfVo6JB+
         rC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539559; x=1785144359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lb3rvNERG6Trh6qQOAy5/wRaGSHQwfEXmqSq+iCr7LI=;
        b=KaeJsjE+xNdmj3M+h43p4RzfIWaDDT1GCImJbd+5FHKexBscrQhGD8okZKms/ITTv1
         HfGm0t9LWXiEfrlG/XhdIrT0aK3ou4/VFy9ZkLcEoL3sbt7sUUafB2h27esu3yW+XzpI
         EYYbFlS8otW953nLsFE1yxapTh39uFonz6AvJ7SfM2MVlVIZqIFIsOuGBuyGj79Ev8qQ
         Ex3LFnkVztqzDPm/g0pCNa18jxKz3z+2qttE9V0MbotvOr8oBul6/YIot/x/QfE1pfbP
         cOO0ITRk0PtpTlYiLELS4kWhmV0w+lrmRxzqfy3bEStp6NfS57JLXGtmfXQ6vtVCMqGD
         u3Ig==
X-Forwarded-Encrypted: i=1; AHgh+RokjdT6YnTcAcwz8l0EDuSXRzYR90e5bZTpz9uftKEWP22i4vYxg0tr3YVXDx3BZe1WqmubY+w=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe8FG4sBKJgXjuwxZSDLIYQTZz2NA94pXcvgLYNQzdZhWrJcoG
	3LeyBN2HpDic9qF0KE3GiEvx53dL0movGhzWU2jQ7X8wSVpvNMUJFnVhVTKZHvsUWmszKQ4Cd1l
	3QTqdwiWnsJUwNCD8/FG9rzjawBGH1Do=
X-Gm-Gg: AR+sD11mZ6yl8rnKow7stvBp8WO5Ut77lsgSksz3i7Z2ypdlBYq2MRYdaVXYqL0nWed
	OuvfXFvPOKXC1hQ+5ioV5456y0GhHo3TRI7a7qMlPDrOQlZtGy6hA1vsqOO+banQTPq9lzKNKwo
	dsdk2QmpBiIk3iO38UqzJfcxZHj05EhW9rT4vYUdOZ8aDLGlIytzUbDvkiI7gqm8vRAZLnUGxb1
	P75n3V4VFGhaUiXPWF1qHlVMcoOEy3jCHI6IsI2FGn8wdIMVr5hOjsIZt8=
X-Received: by 2002:a05:690e:43cf:b0:667:8db3:f121 with SMTP id
 956f58d0204a3-6683ac68ccemr2490841d50.54.1784539558649; Mon, 20 Jul 2026
 02:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260715065218.41232-1-gsh20040816@gmail.com> <5ca16013-e8a0-4403-a2b3-b3b43ea2bb2d@oss.qualcomm.com>
In-Reply-To: <5ca16013-e8a0-4403-a2b3-b3b43ea2bb2d@oss.qualcomm.com>
From: Shenghan Gao <gsh20040816@gmail.com>
Date: Mon, 20 Jul 2026 17:25:47 +0800
X-Gm-Features: AUfX_mz1h558I-KD1cpQBjn39rZY5EPNkCbsv8QW-re0Y30za8AwBWztM33ZCjM
Message-ID: <CAMVcGaDKC626A6=VC+10vtw3KVNm2NM_yPXTbgnA9Efd5eyL7A@mail.gmail.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix frequency range for
 single-pdev devices
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, 
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022600_184857_4559DE89 
X-CRM114-Status: GOOD (  24.31  )
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

The update sequence is as follows.

ath12k_regd_update() first resets ar->freq_range to zero. On the
tested WCN7850 under the CN regulatory domain, the 2 GHz branch
calculates a valid range, so the first call to
ath12k_mac_update_freq_range() sets ar->freq_range to 2402-2482 MHz.

The existing 5 GHz branch is skipped because ar->supports_6ghz is true.

When the new regulatory domain is built, reg_freq_6ghz.end_freq is
reset to zero. Since the CN regulatory event contains no 6 GHz rules,
it remains zero. The 6 GHz branch therefore calculates freq_high as
zero, and ath12k_mac_update_freq_range() returns without extending the
existing range.

Consequently, ar->freq_range remains 2402-2482 MHz, and the subsequent
channel-list update filters out all 5 GHz channels.

With this patch, the 5 GHz branch also runs for single-pdev devices and
merges the valid 5 GHz range, extending ar->freq_range to
2402-5835 MHz.

Baochen Qiang <baochen.qiang@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B47=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 16:34=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 7/15/2026 2:52 PM, Shenghan Gao wrote:
> > Commit 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update=
")
> > made ath12k_regd_update() handle each supported band independently.
> > However, it uses WMI band capability values as indices into
> > pdev->cap.band[]. Those values are bit flags, while cap.band[] is index=
ed
> > by enum nl80211_band. As a result, the 2.4 GHz lookup reads the
> > 5 GHz entry, while the 5 GHz lookup reads the 60 GHz entry.
> >
> > Also, the 5 GHz range is skipped whenever the radio supports 6 GHz. Thi=
s
> > is valid when 5 and 6 GHz belong to separate pdevs, but not for single-=
pdev
> > devices such as WCN7850, where the same pdev covers both bands. After a
> > regulatory update, 5 GHz is therefore omitted from ar->freq_range and l=
ater
> > filtered out of the channel list sent to firmware.
> >
> > On the tested WCN7850, the 11d regulatory update left the frequency ran=
ge
> > at 2402-2482 MHz and sent 13 channels to firmware. A subsequent 5 GHz s=
can
>
> can you share more details on how the frequency range is updated to cover=
 only 2 GHz band ?
>
> > failed with WMI_SCAN_REASON_INTERNAL_FAILURE. With both ranges combined=
,
> > the range is 2402-5835 MHz and 26 channels are sent to firmware.
> >
> > Index cap.band[] with NL80211_BAND_* and update 5 GHz for single-pdev
> > devices even when 6 GHz is supported.
> >
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0=
_SILICONZ_UPSTREAM-3
> >
> > Fixes: 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update=
")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:GPT-5.6 Sol
> > Signed-off-by: Shenghan Gao <gsh20040816@gmail.com>
> > ---
> > Testing notes:
> >
> > - Runtime testing was performed on WCN7850 under the CN regulatory doma=
in.
> > - 2.4 and 5 GHz scanning and 5 GHz association were verified.
> > - 6 GHz operation was not tested because it is unavailable under the CN
> >   regulatory domain.
> > - QCC2072 was not tested because the hardware was not available.
> >
> >  drivers/net/wireless/ath/ath12k/reg.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wirele=
ss/ath/ath12k/reg.c
> > index 89abf2e87ad1..c3bb1df2b1e2 100644
> > --- a/drivers/net/wireless/ath/ath12k/reg.c
> > +++ b/drivers/net/wireless/ath/ath12k/reg.c
> > @@ -300,7 +300,7 @@ int ath12k_regd_update(struct ath12k *ar, bool init=
)
> >
> >       if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
> >               if (ab->hw_params->single_pdev_only) {
> > -                     phy_id =3D ar->pdev->cap.band[WMI_HOST_WLAN_2GHZ_=
CAP].phy_id;
> > +                     phy_id =3D ar->pdev->cap.band[NL80211_BAND_2GHZ].=
phy_id;
> >                       reg_cap =3D &ab->hal_reg_cap[phy_id];
> >               }
> >
> > @@ -310,9 +310,10 @@ int ath12k_regd_update(struct ath12k *ar, bool ini=
t)
> >               ath12k_mac_update_freq_range(ar, freq_low, freq_high);
> >       }
> >
> > -     if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6gh=
z) {
> > +     if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP &&
> > +         (!ar->supports_6ghz || ab->hw_params->single_pdev_only)) {
> >               if (ab->hw_params->single_pdev_only) {
> > -                     phy_id =3D ar->pdev->cap.band[WMI_HOST_WLAN_5GHZ_=
CAP].phy_id;
> > +                     phy_id =3D ar->pdev->cap.band[NL80211_BAND_5GHZ].=
phy_id;
> >                       reg_cap =3D &ab->hal_reg_cap[phy_id];
> >               }
> >
> >
> > base-commit: a1a21995c2e1cc2ca6b2226cfe4f5f018370182a
>

