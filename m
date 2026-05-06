Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C488CD3424
	for <ath12k@archiver.kernel.org>; Wed,  6 May 2026 05:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2tY4+pnycU+w90UF9osCn3xcRDllh+pintXaUXr9DI=; b=Gx3Vo9QjS1jLkXu2ebEwkhSz4g
	UoxOYUEBpVCAWlpGnS22EMHVc57pXY0AVUc2H2n08MFjpo0Qfa6BWz7o7Yy7eeCtguMx7lB3TrMhq
	1czXQHtcSzacw61jcWgFtlgjbipVJOB7plSHO59mXkMfn5VJc8R0lk5Y2l2CY4eKMIm30i1Hw10oV
	eSORCZ/mNHwuYp6yqT/o1A2fDrs5R2g7swXHm8jBw6uHiS2cqcv/DWxEUC0Bkkr6Mtpw7WqlZgHg0
	WTT0ID4VJpmrfxE0cAEMs9bcqr7QfebQkjE9BuLR7MGQRsAKdTVa9nwFur3z5jmoAh79GreODTmv8
	Hd/jX+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKUsf-00000000n9r-11BE;
	Wed, 06 May 2026 05:33:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKUsc-00000000n9K-0tbN
	for ath12k@lists.infradead.org;
	Wed, 06 May 2026 05:33:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645MfBSM911988
	for <ath12k@lists.infradead.org>; Wed, 6 May 2026 05:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x2tY4+pnycU+w90UF9osCn3xcRDllh+pintXaUXr9DI=; b=O9J3K/+mtcme+e4O
	vZbL3VNY+sudp7t5Z9HM6QqrpKY9RWTWx4HZU6TY9OKEhEFz4+2qrhf1iIEXIE0m
	jW0jzJ9wiMfXnl6x3TuxQCm+x0hJk+ptWUmHF9f31k/ib+FSQGjKGP63yaGCytVt
	fI+nOfyVmhkmVcmCVOW5AxGfS7Js1o6FGpxsniFv6nm90ZRHRqZcrmQ98hiEzAlZ
	Yi8x9NBBiMavTzbrMY9+MNI8appZDFdLjfBMe6+xJXctzZvmdp9LsDyiRVTOYLHb
	oMmjulRjIZLkf+3aR9YJ7+kzHitL2vPWmoa778KtT8vox3pFjbSIO8ISku+bt5f/
	2Qtdag==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jk1dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 May 2026 05:33:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c72715b26so414575c88.2
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 22:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778045584; cv=none;
        d=google.com; s=arc-20240605;
        b=kZNXArUibeuYUHDy0AjVZxlYJAA6KeSKqiSx+GNfYU5wDwAaaUZu3Yfqm6crMuLSod
         x8CsTDitou/6tkAiWR+RO+QEsHlagTmDF4ROFfeo6piFqivGiedNhdXaOzx+1MXvgacW
         ZtwRWPxmRqdytcLUDSpdzQwZ49ShgX/PNS0c8UzdL8L/h0aGD3QV31owZv7CCs5FuxpE
         dQ+LxRvFKvrrJIhfshR2U+TA+GHcZMGDp6ZZ4RUkTXt5wc1Ywy2XLoSO/pwTwNRXHyDR
         w5+Xp5Nm2GvYpTyyTfW5yk78wO2lCSNQ9cDWtG7/xlNy+M38LpivNXX8wfI+ihoYfXec
         IfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x2tY4+pnycU+w90UF9osCn3xcRDllh+pintXaUXr9DI=;
        fh=Vyel2hDoCFGZc7vxVsXpE5l2ZH2KYWOw7p8bl6cl/yQ=;
        b=YO9f1uradGowXTuY7FIs8KfMfu5QSpw7KrDGUJ8f1yIIYDCXzc2qXBERVbyGJCyrb5
         qY62wqixUDU/4tFoXApUQKjNZ9+gyDH0X32K3tPONGhpfMbMqQ3ZA6MqDwya/Wpua3Kt
         DriwICmYneu8UFPirstPxgae+gPWV11SJqX1QQ8VLSJJePQAuA2bBHQhN316gW9lTCZe
         xQs1FUECBAjmK6pGcvkqs1ElwdKfg0O3MBwg7wJalVD6gKPmzTFn7hR5iZdB/EFMxevR
         KO8+BqZunzNyUazpqwm/cbmJ568hfVDfhOwLHDVM70PyFqdNUNn79bQXcLG1OvODQZmR
         SJWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778045584; x=1778650384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2tY4+pnycU+w90UF9osCn3xcRDllh+pintXaUXr9DI=;
        b=cXdAjIYBYlLjcWCU9l3SCcLVodJ6z51mgwCCt6eM15q8D34sjtFcE11Y78nxtXVy+f
         OpWCsdvJjVpsWMSKAXowqknB3+unsYhuOqCiqTPxyObFXbztbRho4YcjFBUgenRXPMRz
         2gLx8NsLHhKASqwjlRA9cVCBrYxIsgrd9hv/BvtIGF95kLxKf+R4FUOyWv556lBu++oK
         DKG7vZuHWfSBqyaxOdmHBtPxWeQx/E/DxiA2KruWp70DEi1IKUpsnysjgIjGnDz56iFe
         ZnxYhDCBuHeHl579KYZM40I7jV9yjaY4u+Ujl4w7GEqpsIKmxvo+qm9Q9cL7JxEhbIhZ
         w5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778045584; x=1778650384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x2tY4+pnycU+w90UF9osCn3xcRDllh+pintXaUXr9DI=;
        b=LldRNiuLojQ5zzYevMZwFgeooOp7EFIJ0OH0djorxdC0eUjmboAhT75Gi+KR9kTHcd
         Qfz0ecLWL1H+bRzPL0Fp1jTw0yiY2JRDOzKcscqz6SbanXRo1wU3MuSt12Buzi3KEEwq
         478uOSgFgG85Swj7Dn9t00ZjSjppqyZUvXjpeJhKxETbQWAONfILBtp2gcbQVfeh0Gl0
         xrlvRZ1O8Zg1i6PWhO3s6H3NcvM6jNMaSHWdANLJb4uXtt8Obq/zK/dDrdzVazbo8sRT
         6w42VOx0vSZbRFZ3vXudZXBHpI8rtPLoIVdo/XsINnlW3XPQ4ipVbNHJCXJzIbbsjn4X
         qfIw==
X-Forwarded-Encrypted: i=1; AFNElJ8Xzre6DmoLwDBeiGZ16hJNyXi+aqGJ1sxHKnkD91ffhNomjd8NMqsU2SUXPucJ7KRZkOn6PtM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz99o+LQBOEAnIjsC4rXuBuJV52BEwSsLPu08uv9KqGrf4E4a7T
	lT1Tf/Am5+0gKRdFRQlpLd9diKoFc7FBZ6lk1v7Z2D6iB6CK+PeU49jMRvioGR+BWIm/Z4uCKaE
	zdGvcxz13HkBdbaWQR+QNU3VDP79ed+51p8M3kMEffAewL30aFOo5qSNeNNrJ170FerXsZK0eK/
	d2UTN10u3MZfgbY+ctYPf550Nf7Bn8x3Ug4hu+Zm0=
X-Gm-Gg: AeBDiesru4ty1K6O2WePM3BQI4Faj/0B82/V2e+zoC1kZCkb8LwhoVmyf98KxyGwtg3
	dW4O10wya1bgq2Zvhuvp3FMkTPXJquO9j1lDEACe48GJKExWAwG+NmNtVRBX9HCXXXYHm7m6XE7
	OvhNn9CidVwmzTM88G4GmIMnUQCE0IHd36E+BJuoEMc/jxxIPIukdIrW5213LBfcdOicAL1G5+/
	8iE+qmntb6RWT6EJg==
X-Received: by 2002:a05:7300:2327:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-2f5671e15a8mr425074eec.1.1778045584224;
        Tue, 05 May 2026 22:33:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2327:b0:2d5:9438:2a02 with SMTP id
 5a478bee46e88-2f5671e15a8mr425065eec.1.1778045583591; Tue, 05 May 2026
 22:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260505040920.57521-1-laicheehou9@gmail.com> <CABkEBKbVG-UGWOQUgi0Q4M9HkMqOF-nc2gWTwBn9gebC8s7U8Q@mail.gmail.com>
 <69fd7b6b-ebda-4203-a798-6227feba7350@oss.qualcomm.com>
In-Reply-To: <69fd7b6b-ebda-4203-a798-6227feba7350@oss.qualcomm.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:02:52 +0530
X-Gm-Features: AVHnY4I4gzfpUwgkPXbBTsTjvICWhp0LY0e-Oi5BVBF1LqxZflnFqdSaxaU8mOU
Message-ID: <CABkEBKaMvDsACmKzXy7RyrF7eJ+5hAxbG3LcZOZ9b_eENbqnpA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS
 reporting in monitor mode
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: kwan1996 <laicheehou9@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA1MSBTYWx0ZWRfX+nxNLIMsDfhU
 AtyKQU8J3gv6VF70G6yQztIlABR9eHwauDsAWbW9wQdMydJVakuvj16b/YtLtI+LP7C13pSs0OV
 sgVYJGazNAHJarvN6MoYBV2JSf5UhOswXRHzCHC/mDd5693vl5uQ31wLryG+Xs418/biD8u2aVT
 XQvC56HHAHBFNAhDCsH7XmZVEKW1e3B3egU5zM0p4SLvvv1kqCt3VKAukPaLv+tCL3Uqy3iPNvA
 CFT3580ot/I7I8Ht1n2yeNy67Xikyza/Ruzr5K9RFs5ANSJCCSaInNF8V1LwLC3Q9dkGbsNcvDY
 abwlZjHcScSG66hNinyg2lcGR1ZicBaPi1jV/W35EXz2g2u+6ZHRCjI56ePZkV6HnVB1jnUdRpV
 cCgzGMopxEmxpKlziNkGtW4z0OMFezF3ytM71/4J2hWXtF8N0/lwJBh8sOv+Ki5FPqV3Ve0jhTf
 8ubggBSXEAydaPzQWRw==
X-Proofpoint-GUID: 2-ufJXIj_WkbJJjMfLAnpOp8JK5U-HLx
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fad291 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=rYbqYaeFVUH_0xll3yUA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 2-ufJXIj_WkbJJjMfLAnpOp8JK5U-HLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_223306_286616_34BD3D82 
X-CRM114-Status: GOOD (  25.94  )
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

On Tue, May 5, 2026 at 10:52=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 5/5/2026 9:43 AM, Tamizh Raja wrote:
> > On Tue, May 5, 2026 at 9:40=E2=80=AFAM kwan1996 <laicheehou9@gmail.com>=
 wrote:
> >>
> >> In monitor mode, the driver incorrectly assigns the legacy rate
> >> to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
> >> frames, ignoring the actual MCS value parsed from the hardware.
> >>
> >> This causes packet analyzers (like Wireshark) to display incorrect
> >> MCS values (e.g., legacy base rates instead of the true MCS).
> >>
> >> Fix this by assigning ppdu_info->mcs instead of ppdu_info->rate
> >> for HT/VHT/HE/EHT frame types in ath12k_dp_mon_fill_rx_rate()
> >> and ath12k_dp_mon_update_radiotap().
> >>
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220864
> >>
> >> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ
> >>
> >> Signed-off-by: kwan1996 <laicheehou9@gmail.com>
> >>
> >> ---
> >>
> >> v2: Fix indentation and formatting issues in v1.
> >>
> >> ---
> >>  drivers/net/wireless/ath/ath12k/dp_mon.c | 10 +++++++---
> >>  1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wi=
reless/ath/ath12k/dp_mon.c
> >> index 39d1967..4119bb8 100644
> >> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> >> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> >> @@ -1925,6 +1925,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
> >>                 }
> >>                 break;
> >>         case RX_MSDU_START_PKT_TYPE_11N:
> >> +               rate_mcs =3D ppdu_info->mcs;
> >
> > Can we assign this rate_mcs before the switch case? Since in all cases
> > we are assigning unmodified ppdu_info->mcs.
> >>                 rx_status->encoding =3D RX_ENC_HT;
> >>                 if (rate_mcs > ATH12K_HT_MCS_MAX) {
> >>                         ath12k_warn(ar->ab,
> >> @@ -1937,6 +1938,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
> >>                         rx_status->enc_flags |=3D RX_ENC_FLAG_SHORT_GI=
;
> >>                 break;
> >>         case RX_MSDU_START_PKT_TYPE_11AC:
> >> +               rate_mcs =3D ppdu_info->mcs;
> >>                 rx_status->encoding =3D RX_ENC_VHT;
> >>                 rx_status->rate_idx =3D rate_mcs;
> >>                 if (rate_mcs > ATH12K_VHT_MCS_MAX) {
> >> @@ -1949,6 +1951,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
> >>                         rx_status->enc_flags |=3D RX_ENC_FLAG_SHORT_GI=
;
> >>                 break;
> >>         case RX_MSDU_START_PKT_TYPE_11AX:
> >> +               rate_mcs =3D ppdu_info->mcs;
> >>                 rx_status->rate_idx =3D rate_mcs;
> >>                 if (rate_mcs > ATH12K_HE_MCS_MAX) {
> >>                         ath12k_warn(ar->ab,
> >> @@ -1960,6 +1963,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
> >>                 rx_status->he_gi =3D ath12k_he_gi_to_nl80211_he_gi(sgi=
);
> >>                 break;
> >>         case RX_MSDU_START_PKT_TYPE_11BE:
> >> +               rate_mcs =3D ppdu_info->mcs;
> >>                 rx_status->rate_idx =3D rate_mcs;
> >>                 if (rate_mcs > ATH12K_EHT_MCS_MAX) {
> >>                         ath12k_warn(ar->ab,
> >> @@ -2259,13 +2263,13 @@ static void ath12k_dp_mon_update_radiotap(stru=
ct ath12k *ar,
> >>                 rxs->encoding =3D RX_ENC_HE;
> >>                 ptr =3D skb_push(mon_skb, sizeof(struct ieee80211_radi=
otap_he));
> >>                 ath12k_dp_mon_rx_update_radiotap_he(ppduinfo, ptr);
> >> -               rxs->rate_idx =3D ppduinfo->rate;
> >> +               rxs->rate_idx =3D ppduinfo->mcs;
> >>         } else if (ppduinfo->vht_flags) {
> >>                 rxs->encoding =3D RX_ENC_VHT;
> >> -               rxs->rate_idx =3D ppduinfo->rate;
> >> +               rxs->rate_idx =3D ppduinfo->mcs;
> >>         } else if (ppduinfo->ht_flags) {
> >>                 rxs->encoding =3D RX_ENC_HT;
> >> -               rxs->rate_idx =3D ppduinfo->rate;
> >> +               rxs->rate_idx =3D ppduinfo->mcs;
> >
> > rate_idx should be assigned with ppdu_info->rate only not mcs.
>
> why is that? documentation says:
>  * @rate_idx: index of data rate into band's supported rates or MCS index=
 if
>  *      HT or VHT is used (%RX_FLAG_HT/%RX_FLAG_VHT)
>
> ppduinfo contains separate rate and mcs so doesn't one or the other need =
to be
> copied to rxs->rate_idx based upon the current PHY configuration?
>
Yeah, sorry for the confusion. Change looks good to me, We need this
fix for ath11k as well.

> btw looks like the struct ieee80211_rx_status documentation needs to be
> updated for HE & EHT (and UHR?)
Yes.

