Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576FFFF8855
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8/YiQfhmqRY/IAROP7g/igP37JipicyKl59Byo7gDE=; b=EWprIid4gHv4hop3qmKjOoTj/w
	VgPU6hpvEPuqp1YOhrcNbcAk+lMLwA33/JP3Z0P8NFjPLbcMb4jPhwKSpnKDmnzN0+SeasCNGcyZ6
	0etbBhhisVF5pcGqNPY6q6DibKHGCG43ZfiH1I7MVUQjIwNsds4kx+15LjDIeUQyoP4K5jUJ0sabn
	19PRmGP7vB1LXls1H/zFB8O1cV/9zZiyBnJBsWFY6d8SOPi7/XhMlnknBbjjuQJ7r1fwHBBX6q7Gx
	Zb7EJJEVKsQUDD+jK58MpWSHk3MZjNseyEV5TQHFubeyFifkOqBsQbPG/zF9ciJdws7zamh2YvQ+I
	ISRBzA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIrk-0000000Gw3k-0RoF;
	Tue, 05 May 2026 16:43:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIrg-0000000Gw33-3Yfk
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 16:43:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645G44Ni3741203
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 16:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8/YiQfhmqRY/IAROP7g/igP37JipicyKl59Byo7gDE=; b=T9QTDCN3d3QZFS1p
	uriz708aPh7giDV7ThXdVh0IFmcsrrqzwnfKGUV+r1qKLmLKoUMgnrOl2qrZ615e
	rSBN8XXSxFYeGDjjToF2pNq/qDNe9JsoaEjBiNC5CG8eylVeR0tV7UQDvb17ZKo/
	MMbJqF01sFDi5Ntyj3LBH3ERgXes2CabrSYs4ZKsYuDAgiJfiFELlkG3yvMk38bn
	QmTcst3w82iEYVdjqyCWM9LRzy31e8HOc3jcldmgQ0ulPXUhtTrl3lGaeKnXbAwm
	c9/e/CJFPpqaREP8apVdgLAfuvk1vQNOo13dQ1YRuCjRLJAL4ELFIiHEiRKgoLqv
	r8Nj8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyefq9m35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 16:43:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f129211efcso113948eec.1
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 09:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777999398; cv=none;
        d=google.com; s=arc-20240605;
        b=EDcziI5gSRLe9ohD85ErwAPP+cgNoBylPji/13B5ZwPg2kEMAwM1hydJqdiae6yaRQ
         QmH1z1TBqM1dwDF1L6C0oCCsrvZs+WqWNCh65NAt7GPPW4YGoFTquwaL5n9U1tos/qR/
         EKwwcBcS+OpYqFcaIrfzrZqPtPx0xc/3VaNuA2dASAoqTUEOc9IsCCkj616FilGcYL4h
         WcswtUNao+yaC0azQl7t5VufzyIjTJA885XY1JsgAnjyEwNCK2TpYjgMO3MR4R9JfSgx
         QGDNyoWEiNzxuWLeoY1ueTWzx9SKbC6rr2miq6NRmKt/jc3wbQMvcGSQvymINkBRzWC/
         10wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O8/YiQfhmqRY/IAROP7g/igP37JipicyKl59Byo7gDE=;
        fh=UE9ov+ofPgM8UPA4lUXL1UDL8fznk+3/h0MOLsSolD8=;
        b=Q30FP0t+KypGwdN/0NXmOC8OtHP60rsmsX0LQd73pPjVQTBtPNNcRjZRx9e7BWTaj7
         FRXOB901Ysdez3gWb0BTNk77MVxz6agVbcHqsx7Ld61BfTcYZmnQBlPOBG1Uz4/bNuPV
         QAd9CpURjMeiRyJM3mTspfYCM4EqUuaijRpeh6+sH88qZBLw6q9odoLMusGeUGHzitVg
         urDMp9BsXdSJk6WDmkq4SGAF2NgDHdxm7P7CEKPEcnlIIJ8fa/YzPFQkzel1CwhJ4l+m
         /kUgasa9Rsseovh6p/sYStA15IVY7NZhFO6rNwr8VEaqMB/PGnjyFYwoYkIARs6n/DKb
         YJUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999398; x=1778604198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8/YiQfhmqRY/IAROP7g/igP37JipicyKl59Byo7gDE=;
        b=Gt3MGXt0kUTfIOuNJVxdyLJ4TyzQUAMjQsnYMI+9Nq9VSwuTk1HXKjTNOymV3OHt4O
         COQvnuMjtYXrc4dywIyib7EWA72XzSf/TkYJZqkXe4U8yOe0N7fVXrn5buJZiI9Cut9l
         VgcbIxHGxT+McpqScFO52wJHRML4lUA1E+8vQG7AiZcek4Kv8HZ7V/3DTrvPOPnUyYyg
         70fO86KU3lydSxpfLt8Ixp5agSO9vROByy1e8ZaRqHR5GFxCpxFDUOSy7tUoikWfYEOQ
         sVjPXL/tEGpUv1ZNrqcn+G/KeKwS3PxC+SuaJoB5HJseWDOdRA4/hhRFsHsFctiSQjFG
         El/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999398; x=1778604198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O8/YiQfhmqRY/IAROP7g/igP37JipicyKl59Byo7gDE=;
        b=LPX7u6GqOyfKiVJeECuNGficfU0Y0jlHQu1cT/vrKZuSCKV4+PqaAjvjyQN1Rb70fy
         L+Z6qKHZoVS3n+0AKC44aru9DkOxbYS7wSQTnlZGERy4s1/a1EJ2uxFrsU4dqQlM0I5N
         SnGOev4tN16wdXe1NTMCpR6K1fJW6gcG9nnqJJhRnkm098/d7wowdL+3yev3mAvJ53mE
         weAZrOO0K1BErbk2GWyqiEQDbkpAugg1EAHT8EhQgD6iXKjz64HhnAfSmfI3Nesy8KK4
         FY4bXmdu7/z35v4l6qpT/iBKXyO957+kU+A3HBZl9qUquN8axd1l82H6hgub1AalN2Oe
         y57Q==
X-Gm-Message-State: AOJu0YxoOTOe0VQUC6oTpc0/7lujPQXN0FSqkEMdX627JNXr3UoI+BMT
	GPmWhTBuk0AAEVXcLjt0/htRRdRDn/VztBXKLUUoxGSG4jKChQ8H4pS5WZSSOidfxQigZHp8MKv
	+WFTRZixPswnVkfj4m9VT5KdODwO2CFXPqUZfrASsnCahRHZTlUtuhsN5+eZm497sdcWHL1JGmg
	Pr2sD8/mwjv3qaMPjVENpqTxBYooFpWpKAhQQ5criRwrcqh90=
X-Gm-Gg: AeBDiev8ngZJgeI5NSBh8nBnzf+zoy47lkjj6buPraD0wV59bbeQJVbNatBSezt7fLL
	Xr99uPb53nUf13WzYYhEtWHnBj4tghMH5CKAdeI27hZ4YSCAap5O//ln07Wsz8H5vj3cuZ6u4a6
	qEA+T6y3Lc62dikBgg7PxOjE5Wlp6qSUXBEHk9FHOSogj4mMg0bOUS9XzbmuRW3AdlEDFGVz5X0
	qjvGEdtpMv9sjRm/Hw=
X-Received: by 2002:a05:693c:2c93:b0:2d9:2896:2794 with SMTP id 5a478bee46e88-2f41e702b82mr899122eec.7.1777999398080;
        Tue, 05 May 2026 09:43:18 -0700 (PDT)
X-Received: by 2002:a05:693c:2c93:b0:2d9:2896:2794 with SMTP id
 5a478bee46e88-2f41e702b82mr899112eec.7.1777999397569; Tue, 05 May 2026
 09:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260505040920.57521-1-laicheehou9@gmail.com>
In-Reply-To: <20260505040920.57521-1-laicheehou9@gmail.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Tue, 5 May 2026 22:13:04 +0530
X-Gm-Features: AVHnY4KzdHCeV-5OSFkkTeZc7KzEIGZXt1W7oIWCeu_Qt3IBwN13X9ixiyHlYyc
Message-ID: <CABkEBKbVG-UGWOQUgi0Q4M9HkMqOF-nc2gWTwBn9gebC8s7U8Q@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS
 reporting in monitor mode
To: kwan1996 <laicheehou9@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MSBTYWx0ZWRfXwFi5XehP9goS
 jSRvsiQay7lVVNTf7gjcEbOF57G29DrwUd8DV+7E6Jc2e+Rciu5BNrfamgEeqk9RNNqHfB55PWl
 4vYEEopO/afNqjs0pR1yaxQ63OMyBUTUq6pouKTl34S/1YEbag/NCfPrjEKuZ9hQMP3psA42SFF
 BPh8f6/Rpcnr9UIdYOoxaHPZ6f0EC6F9ptdGh1xRp3uhDpeUGWVT4OTurTtOrmSqB4h+hWKNysi
 /j+P0MYxmkrY0BSmz6uloCy1PxDuBCGvMHFT0uzq5dzvB66I3DEsQNCSZKZvsiSlPzrb+7m89Xr
 SeQDk40Y/zEi3AhUsivD8t66VmHRhcofS0zu3DWtmx/vKu93zp4LgJYliM44q3oYWBdRqMXyBHW
 W3CN9teFHKFBOA8V77pDC9nuWlIoxVCu7oZz5GLk2X5LWGVNhr0F6c763tu6GL8Axqsz2J0S5gA
 mB7bHhFhOKAtcTScBog==
X-Proofpoint-ORIG-GUID: AksfkSPDdbOLUrh1pF8IPBnjwi7Ct0jM
X-Proofpoint-GUID: AksfkSPDdbOLUrh1pF8IPBnjwi7Ct0jM
X-Authority-Analysis: v=2.4 cv=edoNubEH c=1 sm=1 tr=0 ts=69fa1e27 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=24JUTzMKAzwX5QBAHdcA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_094321_027795_0C7A76B4 
X-CRM114-Status: GOOD (  19.93  )
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

On Tue, May 5, 2026 at 9:40=E2=80=AFAM kwan1996 <laicheehou9@gmail.com> wro=
te:
>
> In monitor mode, the driver incorrectly assigns the legacy rate
> to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
> frames, ignoring the actual MCS value parsed from the hardware.
>
> This causes packet analyzers (like Wireshark) to display incorrect
> MCS values (e.g., legacy base rates instead of the true MCS).
>
> Fix this by assigning ppdu_info->mcs instead of ppdu_info->rate
> for HT/VHT/HE/EHT frame types in ath12k_dp_mon_fill_rx_rate()
> and ath12k_dp_mon_update_radiotap().
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220864
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ
>
> Signed-off-by: kwan1996 <laicheehou9@gmail.com>
>
> ---
>
> v2: Fix indentation and formatting issues in v1.
>
> ---
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wirel=
ess/ath/ath12k/dp_mon.c
> index 39d1967..4119bb8 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -1925,6 +1925,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>                 }
>                 break;
>         case RX_MSDU_START_PKT_TYPE_11N:
> +               rate_mcs =3D ppdu_info->mcs;

Can we assign this rate_mcs before the switch case? Since in all cases
we are assigning unmodified ppdu_info->mcs.
>                 rx_status->encoding =3D RX_ENC_HT;
>                 if (rate_mcs > ATH12K_HT_MCS_MAX) {
>                         ath12k_warn(ar->ab,
> @@ -1937,6 +1938,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>                         rx_status->enc_flags |=3D RX_ENC_FLAG_SHORT_GI;
>                 break;
>         case RX_MSDU_START_PKT_TYPE_11AC:
> +               rate_mcs =3D ppdu_info->mcs;
>                 rx_status->encoding =3D RX_ENC_VHT;
>                 rx_status->rate_idx =3D rate_mcs;
>                 if (rate_mcs > ATH12K_VHT_MCS_MAX) {
> @@ -1949,6 +1951,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>                         rx_status->enc_flags |=3D RX_ENC_FLAG_SHORT_GI;
>                 break;
>         case RX_MSDU_START_PKT_TYPE_11AX:
> +               rate_mcs =3D ppdu_info->mcs;
>                 rx_status->rate_idx =3D rate_mcs;
>                 if (rate_mcs > ATH12K_HE_MCS_MAX) {
>                         ath12k_warn(ar->ab,
> @@ -1960,6 +1963,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>                 rx_status->he_gi =3D ath12k_he_gi_to_nl80211_he_gi(sgi);
>                 break;
>         case RX_MSDU_START_PKT_TYPE_11BE:
> +               rate_mcs =3D ppdu_info->mcs;
>                 rx_status->rate_idx =3D rate_mcs;
>                 if (rate_mcs > ATH12K_EHT_MCS_MAX) {
>                         ath12k_warn(ar->ab,
> @@ -2259,13 +2263,13 @@ static void ath12k_dp_mon_update_radiotap(struct =
ath12k *ar,
>                 rxs->encoding =3D RX_ENC_HE;
>                 ptr =3D skb_push(mon_skb, sizeof(struct ieee80211_radiota=
p_he));
>                 ath12k_dp_mon_rx_update_radiotap_he(ppduinfo, ptr);
> -               rxs->rate_idx =3D ppduinfo->rate;
> +               rxs->rate_idx =3D ppduinfo->mcs;
>         } else if (ppduinfo->vht_flags) {
>                 rxs->encoding =3D RX_ENC_VHT;
> -               rxs->rate_idx =3D ppduinfo->rate;
> +               rxs->rate_idx =3D ppduinfo->mcs;
>         } else if (ppduinfo->ht_flags) {
>                 rxs->encoding =3D RX_ENC_HT;
> -               rxs->rate_idx =3D ppduinfo->rate;
> +               rxs->rate_idx =3D ppduinfo->mcs;

rate_idx should be assigned with ppdu_info->rate only not mcs.

>         } else {
>                 rxs->encoding =3D RX_ENC_LEGACY;
>                 sband =3D &ar->mac.sbands[rxs->band];
> --
> 2.34.1
>
>

