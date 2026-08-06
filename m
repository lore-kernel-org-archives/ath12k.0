Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98147C56205
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 05:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgMEv8RBPh4y366LZ+1BocbTIa3kWw/yR9S8afmJwhM=; b=pw38QJAPUzncbcOtVrTMeWjjft
	lFB9anWXv9qiYdraAeZczry1NrsBwFm+4hZ2XNF2GNKHBv+UjNDBvlmeMEw0nmPUnjJSasveu+CC1
	lcxPf1SOTlfFHjsz/5VoeD5PsLTkX0vPIp50131goiccNe4Hn3Mi8vIGWAOMLhsoBF0e28AntGk3E
	B3kmyzQULlLBtxjRb0fzuguPlw1aEWBBzftbE3P72CRPmqJD27kYYeaRHoJ5/m0un96vugBr+99JY
	zJbzajyqrfaBvag3saBMQaccegivj8vpC5xP+SNxwurLy+acUaP/v5q4Dh0ZKUL1Pm9Em4m8FBuZI
	ua9dXKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqOA-00000004w90-0iyI;
	Thu, 06 Aug 2026 05:11:30 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqO7-00000004w8S-37gN
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 05:11:28 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so4495316d6.0
        for <ath12k@lists.infradead.org>; Wed, 05 Aug 2026 22:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785993086; cv=none;
        d=google.com; s=arc-20260327;
        b=qEOLLNI8fdfZgQ42liN1VCYKxibkAswKOGXWzfU+UhKlqcruVb6zjfAqSYwAhJUZm4
         a4GQ1wFwDh8PAHKlRpDy+1iSOIMYahjrVT0DG+Q1UPzCivymG+kGqX4WYSYpqhZp6Evk
         8RmH4NOw+XV21aHBGt0GzWCs/UZyyMaIQT9FQb2P1MSsKQx5NK9Hmy3EafnnLmix/UF+
         FGIEq0rGqixW2MGoXTzuycaVtJMqhEjeg6EDSn8DOsaCQmOgZbB1qg4SdJmpckz2KNbi
         qSLhMukGt3IBWaRkrM8vxHwvuXHk2/J6/REpOglJox2KFg5zRTYRXQcBAQPkQTyg16bn
         TvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgMEv8RBPh4y366LZ+1BocbTIa3kWw/yR9S8afmJwhM=;
        fh=3BCAAcb+v1ycqn+vTr5QSHSnQckpDocDR34xWpe7dyA=;
        b=jYpLXnAIvdQfU28rL3WP2T67lug2Ejf8dKHQWT2ixfFQiFO+mTesAcpcvHdpvQx9k2
         5fno3zQoRE4i7krgc+ALGLP5kdfTJvUf5XUwOkW/i1DRkV0kERXhICwys9D1As1dJ1MM
         yCXgJjz4RTdSQNA75//ZkmZc7PQNb0Cv/IsVPpK3q9LbDssBmyYJeoWkympTcWqiDKRk
         zCPWIeOi/vsT3LZ9uV/JRh/d647aVUg+fYPUMCJwHt9k4XtGmes5yaxp2GeCNrLfMbGm
         9eMAbT5uNsKNuSrm7aeq3DqWae34TYO8uMYeTBX+lVMfemWgUB6N97G8jbHbp7ErDDSX
         PHWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993086; x=1786597886; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgMEv8RBPh4y366LZ+1BocbTIa3kWw/yR9S8afmJwhM=;
        b=m1O8sEW9APV6MRztIoS6ESkMAPzHsJOBlvDMi7n6G8gMbaZ8KIm0QiZaNHFAdmzZZ1
         vTAUdpxSauSXWjL3rArUjR4FzmfAUYHi1MNRrumAjgvxI3HxWA3YnZYSaSow81uhuU0R
         Xb+ziEpwSzYLLDCO/SH1p6mHgWU2pEGyjA0iMM2C3CbxiUiJ5YSt74jibohsBcR7WcmH
         tEqlIQJyYj3nEYIkMGBGzeQ7xtFzlzVSIQuO4KKcHoCDW51MYau7BrK3AoFQFsmORM5A
         2KExMODn0di2x4MxWlCi67lBGAaGEt9hhM3z9JcGUMxT4nwgzqrwLh6hMN+osk95C786
         AifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993086; x=1786597886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgMEv8RBPh4y366LZ+1BocbTIa3kWw/yR9S8afmJwhM=;
        b=X5OLhxPC+sbK/BrkLNh9oFFIU+6BeVgD9ZQnDRE5F/XziAUiOnRxk92quJdi/HBe7t
         Y+n/Y2r2gT5SXHnACDHfVwRhPeXigvmvjH5q4A8Z3PmknvaiCDwcf/18Mxtb1nHlrOO0
         BHo7As+RJxv+lXzKYJj+o+Bo7eeN4Zr+J3eBR/Ro3IDu0I/oXdii/eCWRvdj74EvR4Qt
         7uQLt6mQJ0SwXGr5NY+ODt+dI+P7BGD8X66/E4k6eIPAYpvduaTnWOnwJLqXyXF4JjC1
         f0KoKBR86c5F/jjI8KnMfeaSjTKuORHvzXi7jTSsACH1+O359wtE9hZ7mYTb0qFRCC4n
         aAyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/lTTdLtd+VWE7TOcQC8kFbAew1I4oN+pByAXIMG0S989PwFaAJUeaQHgA6KajXKul+c1nEXw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtSqhrQ5MNMLtc4opTc8UBEeRU+p4D6cPQUb25QFJpnmjWyUUv
	ZM4itH4UQHkawn7wwFwFxpw8CZvFtefi/IVRh3hGnBA1TArQ/EOdjfS+TpbRnCk9mvvP9QVO9Cj
	Vmz7QiMS3mlNCesnTGu3y3IFc8GI6XwE=
X-Gm-Gg: AR+sD11NgDzzyFO9cPDs5H7QNrKKEE28k8sTZU0/5xqensoblhvJr5yuGoppVcFbkHw
	cV24l6OSklKP4ra6wCCzeJFwxnzGwZCQP8YWz0+F5lv/Mi/MVVFxmocnWmXt6DuGImd5cHKomVF
	tgO7FTL8CBrSmD4PjrzKp2FD1ZsFcOD8TY0tCLLB4chh9+XxxW5kR4uFLSqmUZkluP0ObCMGiMV
	JTVU2K2cJv67fwI6IDvDbUquFZ7CiWZvCbTZNifhX8/YlRn/eCwmMUI+OGkCB6Oav6IZUxHINTt
	olAIDMN+1YiQACjGSR8U7/3ZkoXK5H3kS31gN0kA4WKT
X-Received: by 2002:a05:6214:f25:b0:8f1:ed00:7fd8 with SMTP id
 6a1803df08f44-9088f7b8eccmr48849346d6.3.1785993085612; Wed, 05 Aug 2026
 22:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260801004243.489010-1-perceivalpercy@gmail.com> <88d5042e-21e2-497c-b86d-3cdf8c0642dc@oss.qualcomm.com>
In-Reply-To: <88d5042e-21e2-497c-b86d-3cdf8c0642dc@oss.qualcomm.com>
From: Kamil Bienkiewicz <perceivalpercy@gmail.com>
Date: Thu, 6 Aug 2026 07:11:14 +0200
X-Gm-Features: AUfX_mznDfeEMS-VWWTO4_p31iY5MFEpIwhVYBSCQLBJd3y4jNQ0MDuzru0BpCs
Message-ID: <CAKXN084AmmjNWLM2fmczTpvDxr15t9-YmvZVCKGbO6TYzfOOrg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_221127_806161_9AD78626 
X-CRM114-Status: GOOD (  34.78  )
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

Esteemed Rameshkumar,

Thanks for the review and for the correction =E2=80=94 you're right, and my=
 commit
message is wrong. I've verified it in the tree rather than argue it:

`cfg80211_iftype_allowed()` (net/wireless/util.c) short-circuits before
`interface_modes` is consulted for the 4addr case:

case 0:
if (is_vlan && is_4addr)
return wiphy->flags & WIPHY_FLAG_4ADDR_AP;
return wiphy->interface_modes & BIT(iftype);

and `WIPHY_FLAG_4ADDR_AP` is set unconditionally by mac80211 at alloc time,
not gated on AP_VLAN being advertised (net/mac80211/main.c, in
`ieee80211_alloc_hw_nm()`):

wiphy->flags |=3D WIPHY_FLAG_NETNS_OK |
WIPHY_FLAG_4ADDR_AP |
WIPHY_FLAG_4ADDR_STATION | ...

So the missing `NL80211_IFTYPE_AP_VLAN` bit cannot have blocked hostapd's W=
DS
path, which sets NL80211_ATTR_4ADDR. The `check_swif =3D=3D 1` case falls b=
ack to
the same flag, so interface combinations don't block it either.

The premise the patch rests on is still correct =E2=80=94 mac80211 skips ad=
ding AP_VLAN
for us because of SW_CRYPTO_CONTROL (main.c):

/* if low-level driver supports AP, we also support VLAN.
* drivers advertising SW_CRYPTO_CONTROL should enable AP_VLAN
* based on their support to transmit SW encrypted packets.
*/
if (local->hw.wiphy->interface_modes & BIT(NL80211_IFTYPE_AP) &&
    !ieee80211_hw_check(&local->hw, SW_CRYPTO_CONTROL)) {

=E2=80=94 but the consequence I attributed to it is the wrong one. As you s=
ay, what is
actually gated is the non-4addr AP_VLAN case, i.e. dynamic per-station VLAN=
s via
`hostapd_vlan_if_add()`.

On what I actually hit: the symptom was hostapd failing to bring up WDS sta=
tion
interfaces on IPQ5332, and I developed this patch alongside a hostapd fix i=
n
`get_hapd_bssid()` (bss->ctx dispatch), which Jouni has since applied. Give=
n the
above, the hostapd change is almost certainly what fixed the WDS case, and =
my
attribution to this patch was confounded =E2=80=94 the two were tested toge=
ther, and at
least one of my A/B runs was invalid because wpad was never actually restar=
ted.
I should have caught that before writing the commit message.

I'll send a v3 with the rationale corrected to the dynamic-VLAN path and dr=
op
the WDS claim, keeping your Reviewed-by only if you're happy with the rewor=
ded
message =E2=80=94 say the word if you'd rather re-review it.

I have the hardware set up (IPQ5332 AP with a 4addr client), so if it is us=
eful
I can also test the non-4addr dynamic-VLAN path explicitly =E2=80=94 with a=
nd without
the bit =E2=80=94 and report what each does, rather than leaving the justif=
ication
resting on code reading alone.

Regards,
Kamil

On Wed, 5 Aug 2026 at 20:18, Rameshkumar Sundaram
<rameshkumar.sundaram@oss.qualcomm.com> wrote:
>
> On 8/1/2026 6:12 AM, Kamil Bienkiewicz wrote:
> > Only the two QCN9274 hw_params advertise NL80211_IFTYPE_AP_VLAN; the
> > IPQ5332 entry does not. As ath12k sets SW_CRYPTO_CONTROL, mac80211 does
> > not add the mode on the driver's behalf, so AP/VLAN is absent from the
> > wiphy and hostapd cannot create WDS station interfaces:
>
> Small clarification: for WDS station interfaces, hostapd creates the
> AP_VLAN interface with NL80211_ATTR_4ADDR set. That path is allowed by
> cfg80211_iftype_allowed() via WIPHY_FLAG_4ADDR_AP even when
> NL80211_IFTYPE_AP_VLAN is not set in wiphy->interface_modes.
>
> So the missing interface_modes bit seems to affect the non-4addr
> AP_VLAN case instead, e.g. dynamic/per-station VLAN interfaces created
> via hostapd_vlan_if_add(). Is that the failure path you hit?
>
> >
> >    nl80211: Failed to create interface <name>: -95 (Operation not suppo=
rted)
> >
> > The 4-address datapath itself (sta_set_4addr, per-station TCL metadata,
> > WMI_PEER_USE_4ADDR/WMI_VDEV_PARAM_WDS, 4-address frame and NULL/EAPOL
> > handling) is shared Wi-Fi 7 code with no per-chip or per-bus gating, so
> > IPQ5332 can already deliver it. AP_VLAN is a software interface type, s=
o
> > no interface combination changes are needed.
> >
> > On a mixed-bus single-wiphy group the effect is wider still, since
> > ath12k_mac_get_ifmodes() intersects interface_modes across all radios:
> > one IPQ5332 masks AP_VLAN for the QCN9274 radios too.
> >
> > Advertise AP_VLAN on IPQ5332 as QCN9274 does. Tested with 4-address WDS
> > stations on IPQ5332 + 2x QCN9274; RADIUS dynamic VLAN was not tested.
> >
> > Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
> > Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> >
> > Signed-off-by: Kamil Bienkiewicz <perceivalpercy@gmail.com>
> > ---
> > v2: rebased onto ath/main (8150c22bc). No functional change; v1 was
> > generated against a backports tree and its trailing context no longer
> > matched after .supports_cong_ctrl_max_msdus was added to the IPQ5332
> > hw_params entry.
> >
> > IPQ5424 (line ~845, and possibly QCC2072/WCN7850) appears to need the
> > same change, but I have no such hardware, so I have limited this to
> > IPQ5332 which I could test.
> >   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/w=
ireless/ath/ath12k/wifi7/hw.c
> > index 7b86f324b..a20c21807 100644
> > --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> > +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> > @@ -664,7 +664,8 @@ static const struct ath12k_hw_params ath12k_wifi7_h=
w_params[] =3D {
> >
> >               .interface_modes =3D BIT(NL80211_IFTYPE_STATION) |
> >                                  BIT(NL80211_IFTYPE_AP) |
> > -                                BIT(NL80211_IFTYPE_MESH_POINT),
> > +                                BIT(NL80211_IFTYPE_MESH_POINT) |
> > +                                BIT(NL80211_IFTYPE_AP_VLAN),
> >               .supports_monitor =3D true,
> >               .supports_cong_ctrl_max_msdus =3D true,
> >
>
> Actual change looks good to me so,
>
> Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

