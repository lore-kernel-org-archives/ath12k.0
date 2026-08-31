Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC147C61DD3
	for <ath12k@archiver.kernel.org>; Mon, 31 Aug 2026 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6IMBdlMGgMvEJy6upP7aINcUJJT4RA76aNd/khHM6I=; b=XFYKd8bO0JcBjlH0g2foQ2EnME
	ruA26lyxqHtNQLWu2HNJNVPgjTy7rWkBy7fW+aNt65ztCJ8P8h0px5DqOioeb59D2lIsgT+mjjD8v
	U9ySnCgNuZa/4aUBcAMsMCGoJ2jUylNIdPeM2T8rruVUsHAGNFzhHHqO5wj70GsM7ykfaBQ7a3Gjo
	iQl7LoHosz/yCNeVKXRGZR+J8uXcdx4K1+LU2z72lxtoGJSP06UtRQ63DgodeR0Wxxt4nvNSvYwl+
	x53uJKSNDbyaxMySApdR+lZ3saRlylk84cqfNuHnHKqVwm2s5jVSjtHS21cBrGwnwNEo0Eh+m13BV
	Btkv5C0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0uxV-00000008Zpg-25aK;
	Mon, 31 Aug 2026 05:53:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0uxS-00000008Zp9-2nMR
	for ath12k@lists.infradead.org;
	Mon, 31 Aug 2026 05:53:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52Khr1933573
	for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 05:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i6IMBdlMGgMvEJy6upP7aINcUJJT4RA76aNd/khHM6I=; b=HfXIJHXbmG2SG1Fp
	ltjoQr6H/q/Shio/qtoTZ3XfgtXnTpvCdv6SCKOyO1YGrln2btWnca9QeuJfazMq
	ND5BloJsBdorWbw89FXJzoLDyntdGJMCa119HfKawEgtXPYjX+dUTocylUPqc28S
	PnlOUP2umvRB/eCJ0A5hZFxjln4Mo2uz2NE+DQHtt36gWJ7iTYXHRjpXXocCWxYE
	b7xh5fNQDW+TtoEimtx7jgkhXezDTmZPWvWvw5vLzKJumKYtkcF6TGV4ofsirDM0
	KtoyF1QFoAFG5SYePXLF6FrSHw7qdQffXXhkSF0tjyII8Hw4xdk6/+8tXUFrrYhb
	kNUPdA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq84krd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 05:53:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3967eca9c6aso1034719a91.2
        for <ath12k@lists.infradead.org>; Sun, 30 Aug 2026 22:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788155605; cv=none;
        d=google.com; s=arc-20260327;
        b=VC/iVqR7pcqsdOeWHKf3vtoThXaZt7t09Os8K3Bn35tMcQhjklOHZbCOGFagTNX551
         rUQnqdFus3p6rODRJAmS0T5sa7T49E1FaKacmG62sCiER0mdT9A9cRIkXsuyfETlk7yV
         CR/mTGxxZnyhUWirOPdX8/cPlyb3Kns4FahYa1TGsvHt2NuvZcJNeOhHpVlg7H9Uleyu
         +jaTdyu7/kH5Aig4V7U+A8YGF5RoEBDKu5AFc/cWHnMGojoCEzhtyIMX4DqxMJfWKAHg
         VD1xZB5IdpbHyyy7uZJZK94rFsiuxhYN1G6Zeda8U+JOHJqHnsi3rp9wx/8gK2RA4qBi
         20jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6IMBdlMGgMvEJy6upP7aINcUJJT4RA76aNd/khHM6I=;
        fh=ma8WaQBWuqpV1IqQJIUqXjIlzsJlkrrjzGv18pjCMac=;
        b=FJNfqQeq5k87QCt80sevMq27LK1q0Cvcck8ELs0BaBUwOp9ushEtzFFnYyvD5Nxdt0
         9uyK7S2SI2eU9LswwNK9lSKZSXmuZNfqpF9UtIQv6dKyghmQIwULrtRrAVYRqFzzpIvL
         cr2DIkwcr4NLfAZOTYRcDqQELi4/X/StJpOU7NoH4y73lrz4Bc7EX3pUQevjB0u1+cON
         JKGxh/4YO3IiyZ/TFlBiGKXVE6Gb+9+9ph6u6C0h9+2CTk2IHQDrwtg0RMY/QKrEITvV
         abOFm1LH4JCNqT5twxzrGZVaAJc7lc98WoGfyKFLugrj/O/QOZ0//PV89+QxoNMk6s4p
         dAJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788155605; x=1788760405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6IMBdlMGgMvEJy6upP7aINcUJJT4RA76aNd/khHM6I=;
        b=U7PMOIP3EpAaKRZRXJkNqFQRHSPEgkPNcAigs3CpJXZ/RqMUmYoEv2WEDu6EvPI+f1
         xgc59BmYjBZBudO7vGuv9+KWUHClHHsuHsxkD3/Hu8HtMbaSvmxpqWGX0gnuTokxL7H7
         zEw/yBcvU2GszwT//gLfwY6IRQ5H1KLO6/sHzc1VnyqwLY9JuP9Ec72z2nJTbgzyWc5L
         FWcDhlYxaffh2USm9aZdmRGE5z9HxuLqXije95U2RPLaNmqdB8ZeWGCuGCQiuuiyI4k2
         bXhNNB3BvbcZmxeFmm2JzALqTCDQ7LAhYGBGUt5UZhIDPHWLxt07fHr48Nzgu4zfsEbJ
         JR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155605; x=1788760405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6IMBdlMGgMvEJy6upP7aINcUJJT4RA76aNd/khHM6I=;
        b=IThxh//gOFxPvVOyOM/Bzqwx4KJnP0sp701f8MOT+BFjMzwwP1Hj1CA89apzevVUEE
         eRWrxBuzoOKNViZk6hobfehRoR8vcAb2+XLdU2PbQRQ7S+h92oCuyhrspVPCdFCMmKqQ
         OJgn4TQmvE89GVpuiW1jTwqxyGShQtfupaIk5APwMkxH6uLEX+TCs2e+pnIk7wwzeiAA
         1DqpF1VTMzO9PfzP5ZnZB9Iq/+YUhe+1/nIa6vtrZio1tRImYrmA3f7oo5YQoDelI4KT
         GmD1P9IJbmRkffnviFTIhqs3j1W/2i7729ibg4Xsl7z4gbxkgdlnl5cw3aRxZHgKnaM/
         /K0A==
X-Gm-Message-State: AFuF++lVzoR6YSw+T+KBeSGsInqtx06YkmzO+ieI43vvIXslRnFaDnj3
	4x9oOWW9F/xNsI/JZaGK7s2HxLCA40gvPIgPXgtZVJSgTkYbgcH3/CDFdgveP/iDDoCjJNbdfBm
	F2bZ70eSGnS84Iczu+651VPmzCJMYtC5W9imu1O88xXfmRh3d6eIxAC+rg66rWfcNi//vkq3NKx
	qpx0HIt+8/V8UhbTW4KmqhEMBUOEuXQEwgCGXKSKs=
X-Gm-Gg: AYBFou1Esd6gVyaPaBXPFtnqbsUcMLJUw9Fv3NtfZJxRXBStYo285W5lik2bdoTFW5n
	I13/cF9UxcUjbgAHTu9sqv9cv2EQjHZ2a5R44k1NCbhu2m4osrcN6HEP/79fF3Eve97GPsE63h5
	56J2Hpo4kTclCfQNEGer1n5Vw4LWtgw981qNwLc0vWPil5QqVGuPZzbbMBhOnvr1JSTZu0kPvvT
	8ZEE3BW8vt9fcAS55Y=
X-Received: by 2002:a17:90b:5285:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-398bac69412mr9638961a91.3.1788155605008;
        Sun, 30 Aug 2026 22:53:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5285:b0:396:d28e:b52 with SMTP id
 98e67ed59e1d1-398bac69412mr9638925a91.3.1788155604472; Sun, 30 Aug 2026
 22:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
In-Reply-To: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:23:12 +0530
X-Gm-Features: AcwNN1Wy8FyiBhUci_1q7jB0oOpbWXw5bqWZpvaioxq4nfOQgv6iuj3oqi8_Qkg
Message-ID: <CABkEBKYdFcUfMGj1pGmVYrdLQTO0eExq8Z+vMdjYGN+yjQ2uFg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: preserve PPDU state across monitor
 status buffers
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cCiWFSBYdU4ocIP-hcaEULeZzERsySGl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0OCBTYWx0ZWRfX9OXH+s2jhHzV
 MVqxYGaVU/GPllH4/LLigFWFoarpC6yKBVdmjLehrltNzelh2LuXef9MWZsj+JsdOBBE9zzf1uQ
 ErBga9oltzpXK20/TcGwqcJt2yb2kzA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0OCBTYWx0ZWRfX3sFopVt0Hc+H
 GREI40igOze5aMqhU1b90xNq4rexwA5VAqeVIuX4dKPKs+eSgibi84q8zSYJ+s/nT3GwGH95F71
 us58KD1igt0rSC42/PRI0tA4BasHGwdpVeq/OYRL5GM+MFcA2ZM+LtilMigvDuY5taXdgZ+v/FQ
 Q4isPNgTf4sJl2Msgh0j4mMAmzj7On7oVYDvJAW767ahzR5LIu3rKTlst7ZThHqXujzA08atKtb
 ZMAnsFmQkUlmv1nQQuaaOyxN4KfDeGECW8xKGRQh5OY5eBdPdgu+XHh7W2cqYZ5ueuCPUaojcSs
 3kpuLBOhaWCiAvTHtFeZLs3GuYYhjSsEL348wKMPs+B2zPHn/z08z4kkweGWfwThOid1qEP9q3Y
 ys3Ham/Y7mh0g7thf9xulvpU6lXxO8HPQDuUgJrx95W3WAdwP2P6+0vRR8G6RVITQCtdzdw43/E
 II4ICsK/f8Y/TiDk8jw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9516d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=JWBcIGGzIbbpiR4D4CAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cCiWFSBYdU4ocIP-hcaEULeZzERsySGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_225326_716846_C9F7F426 
X-CRM114-Status: GOOD (  26.52  )
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

On Fri, Aug 28, 2026 at 12:26=E2=80=AFPM Kang Yang <kang.yang@oss.qualcomm.=
com> wrote:
>
> A monitor PPDU may span multiple status buffers. However,
> __ath12k_wifi7_dp_mon_process_ring() clears mon_ppdu_info before
> processing every buffer.
>
> As a result, continuation buffers lose PPDU state collected from
> earlier buffers, including ppdu_id and PHY metadata.
>
> This can cause monitor RX processing to fail when
> ath12k_wifi7_dp_rx_mon_dest_process() observes a PPDU ID mismatch
> between status and destination rings, preventing MSDUs from being
> delivered. It can also produce incomplete EHT metadata that triggers
> warnings from mac80211:
>         Rate marked as an EHT rate but data is invalid: MCS:0, NSS:0
>
> ath12k_wifi7_dp_mon_srng_process() already tracks status TLV
> continuations via ppdu_continuation. Apply the same logic here and
> only reinitialize mon_ppdu_info when starting a new PPDU.
>
> mon_ppdu_info persists across ar->monitor_started transitions. If
> monitor mode stops while a PPDU is mid-continuation, ppdu_continuation
> stays set and could leak into the next monitor session. Reset it
> when monitor mode starts.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ_UPSTREAM-3
>
> Fixes: 78d3d907d0f1 ("wifi: ath12k: add support to reap and process monit=
or status ring")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c         |  7 ++++++
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 23 +++++++++++--------
>  2 files changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless=
/ath/ath12k/mac.c
> index 9a775602775d..bda055a86f06 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1502,6 +1502,13 @@ static int ath12k_mac_monitor_start(struct ath12k =
*ar)
>                 return ret;
>         }
>
> +       /*
> +        * A previous monitor session may have stopped mid-PPDU, leaving
> +        * ppdu_continuation set. Clear it so the first status buffer of
> +        * this session is not merged with stale state from before.
> +        */
> +       ar->dp.mon_data.mon_ppdu_info.ppdu_continuation =3D false;
> +
>         ar->monitor_started =3D true;
>         ar->num_started_vdevs++;
>
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net=
/wireless/ath/ath12k/wifi7/dp_mon.c
> index 016b0c38e51e..ded7d56cd79b 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> @@ -3211,18 +3211,23 @@ __ath12k_wifi7_dp_mon_process_ring(struct ath12k =
*ar, int mac_id,
>                 goto exit;
>
>         while ((skb =3D __skb_dequeue(&skb_list))) {
> -               memset(ppdu_info, 0, sizeof(*ppdu_info));
> -               ppdu_info->peer_id =3D HAL_INVALID_PEERID;
> +               if (!ppdu_info->ppdu_continuation)
> +                       ath12k_wifi7_dp_mon_rx_memset_ppdu_info(ppdu_info=
);
>
>                 hal_status =3D ath12k_wifi7_dp_mon_parse_rx_dest(&ar->dp,=
 pmon, skb);
>
> -               if (ar->monitor_started &&
> -                   pmon->mon_ppdu_status =3D=3D DP_PPDU_STATUS_START &&
> -                   hal_status =3D=3D HAL_TLV_STATUS_PPDU_DONE) {
> -                       rx_mon_stats->status_ppdu_done++;
> -                       pmon->mon_ppdu_status =3D DP_PPDU_STATUS_DONE;
> -                       ath12k_wifi7_dp_rx_mon_dest_process(ar, mac_id, *=
budget, napi);
> -                       pmon->mon_ppdu_status =3D DP_PPDU_STATUS_START;
> +               if (hal_status =3D=3D HAL_TLV_STATUS_PPDU_DONE) {
Consider HAL_RX_MON_STATUS_PPDU_DONE instead of
HAL_TLV_STATUS_PPDU_DONE to match the declared return type of
ath12k_wifi7_dp_mon_parse_rx_dest().
This is a preexisting inconsistency, but it is good to clean it up

> +                       ppdu_info->ppdu_continuation =3D false;
> +                       if (ar->monitor_started &&
> +                           pmon->mon_ppdu_status =3D=3D DP_PPDU_STATUS_S=
TART) {
> +                               rx_mon_stats->status_ppdu_done++;
> +                               pmon->mon_ppdu_status =3D DP_PPDU_STATUS_=
DONE;
> +                               ath12k_wifi7_dp_rx_mon_dest_process(ar, m=
ac_id,
> +                                                                   *budg=
et, napi);
> +                               pmon->mon_ppdu_status =3D DP_PPDU_STATUS_=
START;
> +                       }
> +               } else {
> +                       ppdu_info->ppdu_continuation =3D true;
>                 }
>
>                 dev_kfree_skb_any(skb);
>
> base-commit: ca800a9302764c445de0da0e84d2252400a770ee
> --
> 2.34.1
>
>
Actual code change looks good to me

Reviewed-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

--=20
- Tamizh.

