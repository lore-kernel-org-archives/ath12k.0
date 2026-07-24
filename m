Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495D2C531F9
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=; b=TGfzGO2+qjdUkFcuGcib+ajr9K
	zCOsjheVM/tNfVh42jSxCaDeHcTI90ggOfFBqxd5L20SByBaoEe916kB12M8wmK4QwTJC60mTEhuf
	HPx4rHnKjJX+BU/XsttBHHeuPSYNhmhF+8gWzLKQdWBFFBEvF9nBgljV8K2/iCq2YYqbKAyH6lV/F
	f2pqEQLqYPezftQJF2m3IftTqVob4RvvtsX4J8m9W7BhD3lsJYVcNUItHIaO/hOj24zIHfAbU4g8/
	uozBk73//4RsvFzT1emjmHrZJSNBz2tcCGeEJdko8+4Gt5In21qH8nvAoRwmWOuVFzNOjPPcL46zv
	F1fbu/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBq0-0000000Fur1-3b5U;
	Fri, 24 Jul 2026 09:05:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpw-0000000Fuki-2ZSG
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 09:04:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lBNI2137557
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=; b=AHCha4M6TFyeZlQv
	egQDz9kystbL4aLnNC27Y4LRGKI98RWi+yyjy8Rh9PENjQ7FWmh7kPx0R598z+XV
	jY5/Fj20q2w3xmzrdhTPdil6aDgVcPM7h0cENez3f9NEaqrHMZo4OMm5Yv8qHo56
	1I2rnksgzPeUB0vgB6oN3AFWg4fh0UkmiY81NiaWe8Q+CMci0V2QnzOO26woCPbj
	q3rrn0qy410bIMr58EFz7lcp68iH+j62skdDJPgj4YxABAKxy+7Auuzbg0mNJqbq
	0N3FzPV6i5WVtBrrwdSFrPLLyX2ny514iC/wIAF16wzgSuAePQwy0RePpFooB67U
	VKr2uw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1b1b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 09:04:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cae7a8b9easo404605ad.3
        for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 02:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784883895; cv=none;
        d=google.com; s=arc-20260327;
        b=Gcwtd0HZZIQjjlRI+TepZEOz5KxykJ+znn64c0MoUHp5+Ko1OS2oYmlvkk8YNNyGLs
         S+LUWeHtVqTRgq52QkPwQprPyO+U+dE1hbZ1YrvW+EEaG0apd6GWT4Lfi2hHPnxsLO4P
         Fa+2XzgVHFc7Uf070y+dxQ/kWJuPNAyuDuGD3jJ0YCslJnRB31AhPfF2BdKpugpX+NN7
         VIxu45/depb1Gd7D/RTs+mrRbPKrUIwq2YMISvdc5YrY6ec/316HgG7D3gn8UJqLwF6u
         jQ0RIlRnD6VHXovU8M3cq0qqc2Hw5a2Jxg/Q71Pz5so03MT7ainJDYI9frFUEMOwHQkV
         cKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=;
        fh=vSKot95xUyB8F6gKjwg1HSPZKcsE74VpDjr1Kuo2V8U=;
        b=h/2JkTlkP0LAMmtZJ9EhePGj/4d0j+hHNHnBcdFkJdcagCOVPWpb4QeFfJ5iW28K5R
         fbhAxRJaaaRbnNkmMtw+8Czd+U3B5zXbDV7IGlt0lHQp2xiaJWbN/UkJNQaBwFDoq//s
         yyH/FibdJ5kWuJ+SHpBzXLkXNA9VWCB0peOmRyqUa1e8/s30gyXXbbZHSwhhkFjgqwKO
         A0trocai+4znxobb/SAdF25a2qzJTKx2GdLNC46JizBHpAF6WqAjFSY2JL49vDDh9JJV
         3+pzKY4yAKDqu/v4zo/bZPdsdAQlDmpug2g0slgWNwIPdciRRWx3pvQQGAImwK1r36kp
         bTbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883895; x=1785488695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=;
        b=gKM8htglwJiAK4rW8uIxJgXkoRSZRFVTPPDIs8gH41A5nz2U48NIddPoWbjE6AwCft
         Gl8epmWcvM78OiUhxjs0Gf/boWyQFBYPR2gRRN4DQOGZfxLj6nPm6oI/ZEHC4ojCvyVq
         01mUVzHEZMMdRKGqLtDjlTi45jDWINC3YTu+7rhZjv3VNYHHWOYIeHEY/vEux4nM0qSt
         cHTQkRPFH5j/4zdyHeTSRSmTGWiFzg4cD+omnKDGK70uR1kn8Z1l5ZXr4iwUB7eIHIWw
         RqvPHtbF44iSAf5vHOlXgMq3n0MQ4pzyTbvcckAWV3eSkFW+HRAPy68Kkyffs1VTAlFR
         Nf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883895; x=1785488695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=;
        b=rlq8xVBMuIoZ1oRlEZbiVh46sJIDFKm2GcUFXoinWTCcqTfMUnZqQmRCQp7uIW/grs
         DRsvhsL9MglOv2OE79EUeLrQ3oUttkzb5qpWUCIDlF9Yt1/0cEYq/CxWKKqg/EvGXAxt
         J8RPAo0XsMLvCtDQY+vmz4igjIuiuqd1ulxFhAM1ZnRnRgXjqu56mFyW/9cZ8D6dPy5J
         hJGzjRllOFuF3NAZLlzjA4bbR79Otpz+vwobYgIA8stR8A6z4Y0JH0AFdVCj02FwBkod
         FUF0ALBUA1nJv63ViNfULSW1b1g79AhKv+wOvubYsSyz/czRT04qa2zUS45uoD1VSVKc
         hGGg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7+kj+ikXRX/eGdHik6fagCRphSLmsoEl5dVTFQ7DneyQfHVwTDBhLQxdr+JZxEjA4cxggbbI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz70YjCvwuNvLLK8P/z7oDYTMjFp/EKNeC7KLo4jaUIopZoZ2Dv
	HRf5QBPwptFbbWRYT47oiLso0I/4pi3NFVJV7gdBb85N4Q1vFm0nxS2RtKnrmcb+sT150oFpx7Q
	9gNkIm9DxANi1mg2XlejQyLEHbixXWoyDP3snclkBKFh+fRT9gJbxlBz+eKRYx4B6cPShZ9S8j2
	eh/GWQPdXLgElXJgbrQVWFHaxJXIxbiaWlrQF0gUA=
X-Gm-Gg: AR+sD13dJiNtxu0tuVkWalgN+cdAqU+uy6f0E/GWP7uu/8Uwtx9v9jbr5C8fFW8VWTx
	9uggW1aGk8ZL9PMxkmfrlAZ9hvdXsTtxp04S04psoOooeeSwSrjKvsADogk692+LdwyqF/EOK97
	LtvzTUZULdLV5LYDfVpngZoowfo7R4AhCmW6WyFbRx0/eOirV6G8n4jkRsGNMO+tCVuCUYifIyH
	NmI6LT6eIJJG6MjGw==
X-Received: by 2002:a17:902:ebc2:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2cfbd0a236bmr26057485ad.3.1784883894636;
        Fri, 24 Jul 2026 02:04:54 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2cfbd0a236bmr26057285ad.3.1784883894238; Fri, 24 Jul 2026
 02:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260724053121.15759-1-jtornosm@redhat.com> <20260724053121.15759-2-jtornosm@redhat.com>
In-Reply-To: <20260724053121.15759-2-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:34:41 +0530
X-Gm-Features: AUfX_mwXA07Oamtx03sMzNZNVbXTzN4dYKzsEBRAeKRrqOc10ocw-mkQ-MvjSVg
Message-ID: <CABkEBKaZOEh4OrZTYfFOj8QZHY8Ruxn2rcXL-axWHwK4o6MECA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] wifi: ath11k: use queue mapping for WCN6750 ring selection
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: WCQ9s14cXEsc2sr2tOzegzHm0C7lkqcJ
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a632ab7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=20KFwNOVAAAA:8 a=bisvXKnJg3u-O0vvLn0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfXwTQ7dU27LdIl
 89mMvztNlhg9j+g2QLw2j4raH/CUd1zPY6KTE5iYFiAR7YcmrdPXeJYrZmg6YiZuNd2etsNynZK
 1ykq/7vXmChPrHeBmBTf7tVaA4sX85UF+Z7uju9XoLnysse/zXsKvY3wpro+fuMEfSvd/LSjhXR
 kLpN6Whu6Q5UYONlRha5z1KUAzseSzuNFH/hJrtMSs0PWQ9NVLW13WDPq3mo1iLj4GbPTANFUUR
 SLMY+5/sG3os+xiCVz8jX6NoOINhqCjiwMkSoPY+q/ibSfbmXabvlR5sWmwJq73YXAvGIt35tVa
 RF7c+qID0neSbHkNfeqXAaeX3B642uY7MlwtRatSPI1cYjVSQEVfdvceECkWmmonJRXftVJPTFK
 el3fHJmyzOoEjxZUIZop+lx6KNxp8IoJYmMfx3cgf4ci3VONENe7zkVoWVmrCQEbE/hChTiyhel
 WgjYJRWQmuGAm35guZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfXwJwhg/S6V7ol
 4Ny6g9BLpTNNhHvgE4Vq08N2nZT5CKryT0PNDBQH3Fhh1aaT9qIC3owsGKbl5AWTPfjH7fIvwg+
 AGdvvgRBWzmoo0jP5HnX32Za7xNpW30=
X-Proofpoint-GUID: WCQ9s14cXEsc2sr2tOzegzHm0C7lkqcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020456_732941_CC1BB621 
X-CRM114-Status: GOOD (  28.03  )
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

On Fri, Jul 24, 2026 at 11:01=E2=80=AFAM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> WCN6750 selects the TCL ring using skb_get_hash() to distribute
> flows across its 3 TX rings, as introduced in commit 7636c9a6e7d7
> ("wifi: ath11k: Add multi TX ring support for WCN6750"). The goal
> was to prevent out-of-order packet delivery that could occur with
> smp_processor_id()-based selection, where packets of the same flow
> could end up on different rings depending on CPU scheduling.
>
> Switch to skb_get_queue_mapping() instead, which returns the AC
> (access category) assigned by mac80211 in ieee80211_select_queue().
> This provides the same ordering guarantee: packets of the same TID
> always map to the same AC and therefore always land on the same
> ring, preventing reordering.
>
> Using queue mapping for ring selection also provides QoS-aware
> distribution, where each traffic class gets a deterministic ring
> assignment, rather than the random distribution that flow hashing
> produces. With 3 rings and 4 ACs (VO=3D0, VI=3D1, BE=3D2, BK=3D3), the
> mapping becomes: VO and BK share ring 0, VI uses ring 1, and BE
> uses ring 2.

Combining VO and BK is fine? since VO is a high priority. @baochen any
thought on this?
>
> This matches the approach already used by ath12k for WCN7850, which
> has the same ring count and uses skb_get_queue_mapping() for its
> ring selector.
>
> This change also removes the dependency on skb_get_hash(), which
> is relevant for a subsequent patch that removes the skb parameter
> from the get_ring_selector hw_ops callback entirely, enabling
> TX flow control in wake_tx_queue without requiring a complex peek
> to inspect frames before dequeue.
>
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v4: new patch
>
>  drivers/net/wireless/ath/ath11k/hw.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/=
ath/ath11k/hw.c
> index 93f9a03c48dc..d679e39dce03 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.c
> +++ b/drivers/net/wireless/ath/ath11k/hw.c
> @@ -891,13 +891,7 @@ static u32 ath11k_hw_ipq8074_get_tcl_ring_selector(s=
truct sk_buff *skb)
>
>  static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
>  {
> -       /* Select the TCL ring based on the flow hash of the SKB instead
> -        * of CPU ID. Since applications pumping the traffic can be sched=
uled
> -        * on multiple CPUs, there is a chance that packets of the same f=
low
> -        * could end on different TCL rings, this could sometimes results=
 in
> -        * an out of order arrival of the packets at the receiver.
> -        */
> -       return skb_get_hash(skb);
> +       return skb_get_queue_mapping(skb);
>  }
>
>  const struct ath11k_hw_ops ipq8074_ops =3D {
> --
> 2.54.0
>
>


--=20
- Tamizh.

