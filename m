Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F8EC44501
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 17:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=; b=fWiab+sGtFCSW+q+cr5qIQHVRc
	88QHSG9enyCsooZBZKwQdVN7qCplWx/DYj0TGsC9QgYbwuCDZAPRZz6CL5JuMWp5ebDGSCME8LAcd
	d1GaUjkE2L2CD4klEzjHc52huQjEWj5SPhA2Su1n0cqCXKO2Jqj1+RGp+u5gPP1tpbhxL5UJAc1L+
	ExgJPW/UOxluCyd+60Q3Nf7MEHuKd5GI4vSmmdKPWAL1glYqJKcMkI4vjXV4sL3XI+RP6xXeV4IHl
	PBUpSsY6ZHF8xNo8u/6uLRjWjdzfbUcm0vi/oJHBVbC/7CMj12t3sGuyKHdXXO9KnTXjHg4M7r/NI
	IGfAi0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK6f-0000000A4cY-0CPH;
	Mon, 13 Jul 2026 17:06:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK6Z-0000000A4aC-2VEE
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 17:06:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8JwF1803508
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 17:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=; b=l9cpGty44rYnBmQd
	CpGqfJgd3s2WwkUQcmF36AN77AeUJC9OQsooppQLOa3AhlRPpipW3Ncvip3r04+3
	RJXso6KMeWwwUqY3b84P7X608OZYXGKRxrvqhQHAJ72Hi3qAgz66mxh+BqyokT6S
	HpSGl8esY9eNz0053mFi6TksvdRX+pRA60FCDWbhs7QJ4czV1QijQG68rynHIBvs
	LRIS42eiWdpT46eG8t/zhpXjPnmHJQUdy3NvdXk+h/22SDAjDl09MK11YeMf80zE
	eq3rTL/cL93ay69LkBCE3/pJPi5QfbyJy5rdouFhrRf9eFfZwai06gWh5fDxVVnq
	wgLWHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4sqhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 17:06:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380f3670853so1111629a91.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 10:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783962362; cv=none;
        d=google.com; s=arc-20260327;
        b=DTa2dF6LqRc1DR8ALLNWw17CCrUxeHvtvgPyw7w4T1OSSVs3AS5gaYGQNSey94WVPU
         awKNYTpTloHHh6H862/aPyCo8d9BBBGY9pRKnvIXoNINnBUy6JclEbTZlkikG0wPRmbi
         l6+W/SQfv1JZeBgY2Z8V8bRB/aiDDsH5H8fmi6csMmerMY4iD9Xz2MV74JL/wBOZSBNj
         GgGwSLXsOzyNuRn2X7F2wbRAUfeAICq+uEDpVz6Rj4lcB/BUManBg/JUQRWq//uBmMAb
         vu2MxNHII6QJVU/ukcimANFfm2/RPBiWsPs8U8HIcBVw7aOOGxoZ7mZNj+dY1/ntNRKE
         3k6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=;
        fh=o2WMHTG8sNSvoKcIP/pPIamHzlIts/UEgsqvgfD641M=;
        b=kW/X27qYH4659fzybtTuh2NeP2hAf8yxD6XzODqizEdLknhOF6t/1MonVNnPiXarhF
         o6ONUSAXLEo1ik+HqjGu+RL6t8Rh92lZoo0cz6PUriqFHsKLjgzGbwmrhY+qsR1xXCyj
         r8EJalM5VW+corsTovOAEPFZpsPLFQqxiG8911EBAMCvYS2dKgsOpE6FSMNsB9cVgmTo
         KfY/oSRpdvlL4Ln6A0Obcj91atsrsgIhOGMS/mkmRS29QLTr3Vs7DZA+j8lmi4mDS33q
         QRbtbuDV4ayky3I8rqBv9QBVlTKLzXDd7Glx+PURSSrqooUnPTfTbQ/nGwWtQeEwJdEW
         +0jQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783962362; x=1784567162; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=;
        b=UOnvmST+BrB53zEKym6EHFGeUF07MuvgVXwBxT8XvIprR9NZQuuB3NeGa2V7L8p2bc
         DFLBaWYx50jZ3I9CPGjjOGlMa2sdpvEN4z5TnEvHNlkXc2sL+N6UUV7Y/zOoCkkwk49A
         YHEH9iHoMUttSwjeaLbXLzTqgjQduNX+FC3CHbROq06ljYNmL0Fi0WSlo1BEy5W+fc/K
         8L9wkDxrWqcClYMv51aBqW/qAm/etBG5ENahBMewbL3bRp5L0AB+I2OEkVAlAFNjTZ6b
         64R1wsa1eM3f/ZkTpeLv5rp/YgurolhzBM3ZpGcdU2sp23RtkL6uYo5vBXInFOpJk26N
         NFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783962362; x=1784567162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=;
        b=QhylFvKmO5/3fcZdwIW/sPOwnt9u9hs5aPEgpjootKSgoH+VijIy7IchoeUFyNVayW
         +H3eZ8kiwxB2HwW53tLIcN5nVBOtgofJKGufqhOcpjrDiwzBm2B/qmRuChJASMFV2IOF
         4MtM1zVVmtBfuzM0wCAtIlttPp4g3jC6aR92wqVkHqo95525D55ziH+CBzSoCPSp+M3l
         U8pY9ayBxQ90NzjRzlzGTo65q6CruJYeTrQRUaHX9oUR9bqSnvATExMgljju/NllDBt8
         NJalKZaB1cqjq2j4Zl82RykTVQ7EFQUmwzouiDKvpKZ8epRVB9eFEm2dFg1mdJMJo8qK
         84DA==
X-Forwarded-Encrypted: i=1; AHgh+RrwaFIuFW/X7VC1aecgmMe22Xlp9ycXZ9jbFR94feuy5MGta8/nXCHlx2W9XrD1ZX4x4Kfo6rE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvxDj5MPWyN6y6krT0UyTwTC4WFn5jRAU7c7ExG8/eSI3CwF7a
	lvsRgSVLg8hl4YKsfOWoMUz6GO0/I+UXL3W3ncHt0cgjN2CLWEbVDi/BW1PEUbXjoc5qqilp0dU
	uZL0FATsTY3Ol/BDT9bXs7XegSjxN17vGm+p+H90dl31f6Mph4Cn55jXsOs1vBETXRBIOTVQKb4
	b8csqRjOiAy7Lnh2FIgYY5wbe7HEg+smU5vBUNuYg=
X-Gm-Gg: AfdE7ckMMJMPxyhYfWB8yG1xOwYXhxNQd8sgiTjK+Hosjy6z19uMaFkJ2VdI5lyEC6f
	/KcZ3jWFBHV63c0btFOoQI3zG6Vr2bjmYppYl8gGQatK/CkajS9CaSc/cO8kq4aI0BbaLEy439k
	8nHg5UYY4476Y7lKITAeSqsJY+EJL5CemVZ8JITzR9vTROGgNxMV2Y605Ae6cqsqhvhFEtedlW9
	YKKAP3Po7ordtfiYm1QlbochNVTIQ==
X-Received: by 2002:a17:90b:51cc:b0:381:6cf0:d5f5 with SMTP id 98e67ed59e1d1-38dc780f503mr7747514a91.5.1783962361883;
        Mon, 13 Jul 2026 10:06:01 -0700 (PDT)
X-Received: by 2002:a17:90b:51cc:b0:381:6cf0:d5f5 with SMTP id
 98e67ed59e1d1-38dc780f503mr7747489a91.5.1783962361387; Mon, 13 Jul 2026
 10:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260710155443.1761760-1-jtornosm@redhat.com> <20260710155443.1761760-3-jtornosm@redhat.com>
In-Reply-To: <20260710155443.1761760-3-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:35:49 +0530
X-Gm-Features: AUfX_myqBTA6Al-ASglZ6zXCxWVTaIWJ0S_u-PpqBDiSUnLkbGESlFGPZnjNZcY
Message-ID: <CABkEBKZABhFkS9MVqbeRFHLUXoNaJC-qocmcPVmZ8ov2j+DMzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a551afb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=20KFwNOVAAAA:8 a=6vpvkDlHG3n5nyPZv6IA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE3NyBTYWx0ZWRfXy5NW/Woo8V2X
 7O6/ypOyOmNaMF6e1UYNi+Q0FnAmgFXJEOaNk3uH1SjAGGe+F1e06zgLx1QxhawNYOO5fXdpLOj
 QVjmpHNBp2+tzjCmdhbf3SiYSBOzHK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE3NyBTYWx0ZWRfX0C3ITEDyFD+Q
 rKch2KSvf1EwXH0Piws7MaqyXu0wPzPORYLlvl68BsI+36aX9SwXRlEK7z5UD7lhZ/G9mFdWAz7
 C5VzS2KT1W+ydUfXzTygZ6GFBIURJUHd5kYeFke3pB8XQhVfCCbl+JZNfppPHOeQd2ZyzubZQv6
 KdhZt0NzE25Ge9iq6cA8n+A9T4wU+zfffz/uz3jkw/cThTMPiYf+qOd+FoaQzqy8LX6D4ppDJFt
 Sq++bP48OYRUATA0B62Ojof09jk8YimIldsRuB87VDYIGJAcy1E4UUZZFoImAoiF+b/o8WAoHld
 3vgAkqVCZS1DJ5ui7ochRRy9tgq1E6lIh2NZILbm3TGP+dh6KTHyucDa3gflcpbM63A1efle+k1
 sKR3oXnxxGuXtTLiKaAuDERSFi1aNA6A6l6mHErCZc4UXZwzJ0Bz1uV3M948XxIt94dYFXTvCFH
 ZVDzGLLQoM4D5Tz97ZA==
X-Proofpoint-ORIG-GUID: V1CLniUftrqXZTOZqY4afmHUUP3l6I6m
X-Proofpoint-GUID: V1CLniUftrqXZTOZqY4afmHUUP3l6I6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_100609_534845_BF59FCC8 
X-CRM114-Status: GOOD (  27.62  )
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

On Fri, Jul 10, 2026 at 9:25=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Under heavy traffic, ath12k can hang and experiences -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> This issue is more commonly observed in VMs with PCIe passthrough but
> also occurs on bare metal systems.
>
> Implement a custom wake_tx_queue operation that:
>
> 1. Checks hardware ring space before dequeuing packets from mac80211
> 2. Uses per-packet locking to serialize ring access and prevent races
> 3. Syncs with hardware state to get accurate free slot count
> 4. Returns early during firmware crash in the same way as other tx paths
>
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath12k's hardware ring architecture.
>
> This prevents hangs, eliminates -ENOMEM errors, and improves throughput
> by optimizing resource usage and preventing unnecessary packet drops.
>
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.c       |  1 +
>  drivers/net/wireless/ath/ath12k/dp.h       |  2 +
>  drivers/net/wireless/ath/ath12k/hal.c      |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 50 +++++++++++++++++++++-
>  4 files changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/=
ath/ath12k/dp.c
> index af5f11fc1d84..3d46cfbf0a1c 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -1539,6 +1539,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
>         }
>
>         for (i =3D 0; i < ab->hw_params->max_tx_ring; i++) {
> +               spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
>                 dp->tx_ring[i].tcl_data_ring_id =3D i;
>
>                 dp->tx_ring[i].tx_status_head =3D 0;
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/=
ath/ath12k/dp.h
> index f8cfc7bb29dd..68d2020be9b8 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -58,6 +58,8 @@ struct dp_tx_ring {
>         u8 tcl_data_ring_id;
>         struct dp_srng tcl_data_ring;
>         struct dp_srng tcl_comp_ring;
> +       /* Serializes wake_tx_queue operations for this ring */
> +       spinlock_t wake_tx_lock;
>         struct hal_wbm_completion_ring_tx *tx_status;
>         int tx_status_head;
>         int tx_status_tail;
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless=
/ath/ath12k/hal.c
> index a164563fff28..c1c656e4550b 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -390,6 +390,7 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *=
ab, struct hal_srng *srng,
>         else
>                 return ((srng->ring_size - hp + tp) / srng->entry_size) -=
 1;
>  }
> +EXPORT_SYMBOL(ath12k_hal_srng_src_num_free);
>
>  void *ath12k_hal_srng_src_next_peek(struct ath12k_base *ab,
>                                     struct hal_srng *srng)
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wir=
eless/ath/ath12k/wifi7/hw.c
> index d9fdd2fc8298..e3a6f9cdee24 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -1100,9 +1100,57 @@ static void ath12k_wifi7_mac_op_tx(struct ieee8021=
1_hw *hw,
>         }
>  }
>
> +static void ath12k_wifi7_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +                                             struct ieee80211_txq *txq)
> +{
> +       struct ath12k_hw *ah =3D ath12k_hw_to_ah(hw);
> +       struct ieee80211_tx_control control =3D {
> +               .sta =3D txq->sta,
> +       };
> +       struct ath12k *ar =3D ah->radio;

This assignment is wrong and all traffic is incorrectly steered to
radio[0] as ah->radio is a flexible array, not a pointer

> +       struct dp_tx_ring *tx_ring;
> +       struct hal_srng *tcl_ring;
> +       struct ath12k_dp *dp;
> +       struct sk_buff *skb;
> +       int num_free;
> +
> +       if (!ar)
> +               return;
> +
> +       if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags=
)))
> +               return;
> +
> +       dp =3D ar->ab->dp;
> +       tx_ring =3D &dp->tx_ring[txq->ac % dp->hw_params->max_tx_ring];
> +       tcl_ring =3D &dp->hal->srng_list[tx_ring->tcl_data_ring.ring_id];

tx_ring/tcl_ring selection should be corrected.
> +
> +       while (1) {
> +               spin_lock_bh(&tx_ring->wake_tx_lock);

Do we need this spin_lock_bh?

> +
> +               spin_lock(&tcl_ring->lock);
> +               num_free =3D ath12k_hal_srng_src_num_free(ar->ab, tcl_rin=
g, true);
> +               spin_unlock(&tcl_ring->lock);
> +
Do we need this check and spin_lock here? already ath12k_wifi7_dp_tx()
has this lock and fetches the next entry. Can we check those return
value here and break the loop?

> +               if (num_free =3D=3D 0) {
> +                       spin_unlock_bh(&tx_ring->wake_tx_lock);
> +                       break;
> +               }
> +
> +               skb =3D ieee80211_tx_dequeue(hw, txq);
> +               if (!skb) {
> +                       spin_unlock_bh(&tx_ring->wake_tx_lock);
> +                       break;
> +               }
> +
> +               ath12k_wifi7_mac_op_tx(hw, &control, skb);
> +
> +               spin_unlock_bh(&tx_ring->wake_tx_lock);
> +       }
> +}
> +
>  static const struct ieee80211_ops ath12k_ops_wifi7 =3D {
>         .tx                             =3D ath12k_wifi7_mac_op_tx,
> -       .wake_tx_queue                  =3D ieee80211_handle_wake_tx_queu=
e,
> +       .wake_tx_queue                  =3D ath12k_wifi7_mac_op_wake_tx_q=
ueue,
>         .start                          =3D ath12k_mac_op_start,
>         .stop                           =3D ath12k_mac_op_stop,
>         .reconfig_complete              =3D ath12k_mac_op_reconfig_comple=
te,
> --
> 2.54.0
>
>


--
- Tamizh.

