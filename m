Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2ACC2D0CD
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p311D//fNmx/GnFe2BD77SqJxf5TY8Y/xCia91MxfcY=; b=iqtiPVpK6/EPCkHhLJLdWRkusK
	1CiR+SxQ033OhaWVNpDL8OL0QDwYRBuHPaOtjVDc/JDwXtusPj2J29Yz2oSA5cRCVayb1Yevs7NAk
	XQ8cHYrASZRIXtZqKmbflGjpE7tHtuCCN+4RxlBzdnk8leHnBaNTttDJbZU1dB0+1BH7PCxgraZDG
	S2O7KJRjzS/qdeVA2raOtgcsVvDHJ7LbCCcWalp2Uu/e5CYkgHgNHnV2a7//KY98iIxhvplLUxK0r
	CGxabZcmSL/xeDA5Hjdroe2LOz7r6Zi2mkbEK7d5waJDRP70p5N3JV+WP5Vfy7sk3is7WSpFHjWPO
	IDGyPqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2uA-00000009hxr-0oXM;
	Mon, 19 May 2025 15:59:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29K-00000009XO0-2Ztv
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 15:11:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso44904415e9.0
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747667488; x=1748272288; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p311D//fNmx/GnFe2BD77SqJxf5TY8Y/xCia91MxfcY=;
        b=P9Bp5IQIvyD7Pm6ham7EPFUJPqGVf2Vf9+PHLyZn77T0xHEWvyIVnPWc0O0AgBPmdW
         c4DzRxQdJFolx7hxcIceQSW3MKHXclf34snsfY5Er5zHFktOdxuFqKIJHnUvtl6iOM66
         BFnndNI6B8QXK9dgWmnjJoRAilUssyHHKhCc8lnjdDlp/hmDWsdKEjwjXYe0jLW5ejur
         zfHxz3Z1KiomCYVIl3HhdQfufzuuA003lTTw6GU8jNCEnGL7tQAwWUgLHVSNouLg2ieL
         YtV+BXaDwE/NCgvG02Yf/2/DINwjo6rfN3xAD6oy4KcVOsue0a9XUr1vt985ovpg7sNC
         OtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667488; x=1748272288;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p311D//fNmx/GnFe2BD77SqJxf5TY8Y/xCia91MxfcY=;
        b=Wcaa7UsYrdReWXHB44QaFAnM71sPYAlz97LxiMRu8OumWwCYpFVnWJr59Q5QZ6ck0T
         BwvW9hdnzAZu8h/QXxvcSn37S469t3evn4KrmP5xOjgGqNYxglnTnmd1gvJLT+AGx/n1
         XIl578e/V+lve4pOEOZ+upORS1mOAgF75g6PdJhJVTBTI17fSxWnBAWLFmItU7rJEvCI
         NxMuibaccaumRNOrJnf37FRuIlrgdsX2Hnp3OzV9+4IOzKSegD1Fjz2p5y3eGHoCGEmG
         MZ4gDxvn6hfK/gZMwFBO9lFaXMLEskzZdV6aKHGFkVocKWfvaWrJdNjMtzJN+A95l5Vv
         ENGA==
X-Forwarded-Encrypted: i=1; AJvYcCUOjyWFFNgMLb4v/886bS+sVqlfeUz4Vpiw8Blqnv2O12I6yr9Fsm0S5T9W+Rsf4ZVUNDi7EpM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzlfx9MIbt7LWHgqNWDVfkVcPDakr3DURwrkAaYflq/TEM051o
	N/hXrzEITx+CjQdGjOkDT5ikLfB4h494PrIVeQ75tJ+z5JwyYAgqdGV7
X-Gm-Gg: ASbGncs7TlG4eWh+m9ByhozJ2OXx+87hpLqa191AhWKgAoXzl0J2I2cwjaaAh5vucFV
	MRF3RALVElW3YX1PcvoJW4kXMyVQq93kTxJ5wpGomBzVixRONfU9964tffQY9j5uelRoYO8HM+s
	vaM9b5NpvJvx9M9NPed7rrPw4Mg/mrTvqNXqofVBIbHkveo0bOukVr6gtyS2/rTryuswXqkp12S
	dHue4e0u2UK96fRIku9CHQPS9JGqAKLTwlUwcZzQdOl6CNaGWugap0zhzqzPM7F4bNEaTQPeVOE
	PnIFZU5ylkpJWocPvdsdA8rngU8KWjQ22IfP6sHZ0543xZHzIcphiuBDBEFrY/C7gevI7SL6Nhp
	Qhd8j
X-Google-Smtp-Source: AGHT+IHFyZHIyrcYe/USleuAgTaUwD4OgFsuo7BATAmi0EMS/lWwD3Aj2fSBu9c73EXwKsCdHYts7A==
X-Received: by 2002:a05:600c:5305:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-442fd622eb4mr158353615e9.10.1747667488104;
        Mon, 19 May 2025 08:11:28 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm214209205e9.18.2025.05.19.08.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:11:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 17:11:27 +0200
Message-Id: <DA08F3TG062A.151WKWWF5OPL0@gmail.com>
Subject: Re: [PATCH V13 8/9] wifi: ath12k: add support for 160 MHz bandwidth
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Pradeep Kumar Chitrapu" <quic_pradeepc@quicinc.com>,
 <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>, "P Praneesh"
 <quic_ppranees@quicinc.com>, "Jeff Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
 <20250418174818.3336510-9-quic_pradeepc@quicinc.com>
In-Reply-To: <20250418174818.3336510-9-quic_pradeepc@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081130_696833_957F01CA 
X-CRM114-Status: GOOD (  19.74  )
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

On Fri Apr 18, 2025 at 7:48 PM CEST, Pradeep Kumar Chitrapu wrote:
> Add support to configure maximum NSS in 160 MHz bandwidth.
> Firmware advertises support for handling NSS ratio information
> as a part of service ready ext event using nss_ratio_enabled
> flag. Save this information in ath12k_pdev_cap to calculate
> NSS ratio.
>
> Additionally, reorder the code by moving
> ath12k_peer_assoc_h_phymode() before ath12k_peer_assoc_h_vht()
> to ensure that arg->peer_phymode correctly reflects the bandwidth
> in the max NSS calculation.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
[...]

Hello,

With this patch set we sometimes see the following warning shortly followed=
 by a
firmware crash on QCN9274 running WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1

[  242.416516] ------------[ cut here ]------------
[  242.423608] WARNING: CPU: 2 PID: 1427 at drivers/net/wireless/ath/ath12k=
/mac.c:3224 ath12k_peer_assoc_h_phymode+0xd4/0x800 [ath12k]
[  242.428475] Modules linked in: dvb_usb_af9035 dvb_usb_dib0700 dib0070 di=
b7000m dibx000_common at24 ath12k qmi_helpers nf_nat_sip nf_conntrack_sip d=
wc3_qcom nf_nat_pptp nf_conntrack_pptp ipq_lpass
[  242.444176] CPU: 2 UID: 0 PID: 1427 Comm: memcheck-arm64- Not tainted 6.=
13.0-02013-gd424b7b9a373-dirty #140
[  242.466407] Hardware name: XXX (DT)
[  242.476124] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[  242.480639] pc : ath12k_peer_assoc_h_phymode+0xd4/0x800 [ath12k]
[  242.487584] lr : ath12k_peer_assoc_h_phymode+0x540/0x800 [ath12k]
[  242.493834] sp : ffffffc08588b4b0
[  242.499820] x29: ffffffc08588b4b0 x28: 0000000000000008 x27: ffffff80278=
1bb60
[  242.503123] x26: ffffff802cfa9af0 x25: ffffff802781bb60 x24: ffffff8016f=
38be0
[  242.510241] x23: ffffff802cfa9fb0 x22: ffffff802781bce0 x21: ffffff802d5=
0dc00
[  242.517360] x20: ffffff8016f38be0 x19: ffffff802781bce0 x18: fffffffffff=
fffff
[  242.524477] x17: 30363120726f6620 x16: 6f666e6920797469 x15: 6c696261706=
16320
[  242.531595] x14: 5948502054485620 x13: 0000000000000001 x12: 00000000000=
00060
[  242.538714] x11: ffffffc08126c6b0 x10: 0000000000000274 x9 : ffffffc0801=
0468c
[  242.545832] x8 : 00000000ffffdfff x7 : 00000000ffffe000 x6 : 00000000000=
00001
[  242.552949] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000000=
00000
[  242.560067] x2 : ffffff80bff6de70 x1 : ffffff80bff640c8 x0 : 00000000000=
00021
[  242.567186] Call trace:
[  242.574299]  ath12k_peer_assoc_h_phymode+0xd4/0x800 [ath12k] (P)
[  242.576560]  ath12k_peer_assoc_prepare+0x5d4/0x1608 [ath12k]
[  242.582809]  ath12k_mac_op_sta_state+0x1f4/0x1100 [ath12k]
[  242.588451]  drv_sta_state+0xa0/0x5e0
[  242.593745]  _sta_info_move_state+0x20c/0x4b8
[  242.597477]  sta_info_move_state+0x18/0x28
[  242.601817]  sta_apply_auth_flags.isra.0+0x190/0x1c0
[  242.605812]  sta_apply_parameters+0x240/0x5e0
[  242.610933]  ieee80211_change_station+0x164/0x200
[  242.615187]  nl80211_set_station+0x3bc/0x520
[  242.619874]  genl_family_rcv_msg_doit+0xbc/0x128
[  242.624215]  genl_rcv_msg+0x1c0/0x260
[  242.628815]  netlink_rcv_skb+0x40/0x100
[  242.632373]  genl_rcv+0x3c/0x60
[  242.636018]  netlink_unicast+0x2d8/0x338
[  242.639144]  netlink_sendmsg+0x158/0x398
[  242.643311]  ____sys_sendmsg+0x104/0x290
[  242.647217]  ___sys_sendmsg+0x70/0xa0
[  242.651123]  __sys_sendmsg+0x64/0xb0
[  242.654682]  __arm64_sys_sendmsg+0x28/0x38
[  242.658329]  do_el0_svc+0x70/0x100
[  242.662234]  el0_svc+0x18/0x60
[  242.665619]  el0t_64_sync_handler+0x104/0x130
[  242.668659]  el0t_64_sync+0x154/0x158
[  242.673086] ---[ end trace 0000000000000000 ]---

It's probably there since v1 of thies series but I just finally got to the
bottom of this now and I've tracked it down to the following hunk:

> @@ -2822,11 +2883,12 @@ static enum wmi_phy_mode ath12k_mac_get_phymode_v=
ht(struct ath12k *ar,
>  						    struct ieee80211_link_sta *link_sta)
>  {
>  	if (link_sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_160) {
> -		if (link_sta->vht_cap.cap & IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ)
> +		if (link_sta->vht_cap.cap & (IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ =
|
> +		    IEEE80211_VHT_CAP_EXT_NSS_BW_MASK))
>  			return MODE_11AC_VHT160;
> =20
>  		/* not sure if this is a valid case? */
> -		return MODE_11AC_VHT160;
> +		return MODE_UNKNOWN;
>  	}
> =20
>  	if (link_sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_80)

Which led me to understand that a sta that supports both VHT 160 and 80+80 =
ie
IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ will end up with a phy mo=
de
MODE_UNKNOWN send to the firmware. Which I guess is the reason of the crash=
.

I understand that VHT 80+80 is not supported by this chipset, but shouldn't=
 we
just allow the sta to connect using VHT 160 right ? Something like this may=
be ?

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/a=
th/ath12k/mac.c
index 048d62a48c88..d3a87af076e7 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3041,7 +3041,7 @@ static enum wmi_phy_mode ath12k_mac_get_phymode_vht(s=
truct ath12k *ar,
 						    struct ieee80211_link_sta *link_sta)
 {
 	if (link_sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_160) {
-		if (link_sta->vht_cap.cap & (IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ |
+		if (link_sta->vht_cap.cap & (IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK |
 		    IEEE80211_VHT_CAP_EXT_NSS_BW_MASK))
 			return MODE_11AC_VHT160;

