Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E81C44507
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 01:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=; b=5E+5ypKiZ31mgobYGusYOF7xY/
	iJ3Oh7d5KjIE1MK/SIZF7RvSwxxc6v3oRxVX6ADAIXHNuMi5AUPen7nWGHSLp5y7/r/wtCM/j0UH5
	F1LPG8HZTKq3f3Ck1HbLl4kgqMKlwVfpYJ3ECvVPc0GLRW4V8UFXWYse/jjjcGU3ynenRuD7c52FP
	QqNMc0YaVttdxT49oD9/fQqgY2UVBRY7T77yw0iGJcsh5etgQnBCdh/F2noahwRisWdQnvYBmFFaN
	/F7IXBM0IkRJCZb6gcBig/tjuK2bwQ8xsrfGB73ZaxCbaki8WO4WeV4UA79PziyTWHjHWCMTruj1N
	yKnBB02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBMC-0000000GEJD-1CcV;
	Thu, 16 Jul 2026 01:57:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBM9-0000000GEIH-1nfB
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 01:57:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XtKD1125307
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 01:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=; b=eC/gUW6tCgDbZDyM
	v9NCuygzxPGI9CJ2e1fdQemuN0QQWuF7aWk5MoBNjQdZ7FtRrCyE7dDY2u3sqqca
	sbkLRcKZZbHKfcIS6LPjMoFi8GOVUukK5mfxwE+qcNa+9RnD4LwRaAVg12ysDR+S
	nzk79Sl11jugfrQukPXbGR4Clifl9itiIg9CC5u3M9kAQqpY2JCZgvQOpaesHzL7
	kAcg+p0oJNzOMNsRocSml1dFXUj7AeBu9oDTNZvPXi9m18aS9B993P+ky9x6W/YC
	dWMNsywj8sERF5+NTk53Qhn5CDhf6zjLCMfx8cw4kiSIdS+fi6KP7k5++VqFwBrI
	Cd9DiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q63egf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 01:57:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811343bd68so1843091a91.2
        for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 18:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784167063; cv=none;
        d=google.com; s=arc-20260327;
        b=N6JFKuW3bjgBtgibh5ojjgWlkhqOTpyrKJV3MCcn9R39ScW+zfvCuRK468dGuiS460
         lWs/dY9dTEBjLdWRB22hLPsoAhyxr3NV5RB3dt0E1F1rJ7IgTxI1wqpXecNZxJ9szkec
         Be5OmAtGBcG2O4poZLWx/Ld2hkXdKNRbbPVjF7lSep4k0vp9JhAKXgvBltBhrnJ3OxbW
         QkzWGnppsA6KSRL8WQx53fZwwMVyZ6wgPKb3AebmkUjOz5W3L656yZ0+T2hJF1qfWCA8
         P7DkZS0qZYSYC4t0umM7e+8yVNxBPqPze4KH6K5WxGxiBtiAtxwBOeqp3QwRlXXfMXCE
         sVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=;
        fh=xVxM/dPu9MCo/DgFgcKDae4ENbrSlT8xdXXdySG2QbI=;
        b=S0HPaKsjkt4aS78WfCWjRrYVXRWKH3uhdqLwBuxpFH5A5/0q4kcrJMI3RQTNVvl7vb
         Widz2XZOMC1PngzALob6LmV1g+CMGudlvP8bb2TDZLUAGZK9LrZ1u4c/7p/LZUDqUxZi
         gMvgyhuQU0yvyll02IO3R2MDxKevJzhqy6jqThMWcTR7W7zKzPjaniDrO1AEUkYbND9C
         /lp8TmyOpJKYspvC1eJf3NVBJN6elZnQ+GQ8+24CO77INwdXZabeggRVCj1Giwupk/Je
         Wid2adYpmmNk+9gyvL2i/msRpcVhQNdZa/Q4gIexhzVTjUzVTEoPRBkRzMHejj7pWAP4
         4f2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784167063; x=1784771863; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=;
        b=XRHtQMCg5qstW6Ce7L8vnodlwOOtytlYx+84pwj/gK11ytyHLCc99b3EI1nSg5ax9T
         2ZExsBUUUHKzbk71Nb6WHnBBTXoFeOPUSBc78qKymQ68wQNJNxV69uhHpVXNHhvxR/B8
         3n+k2uWWQFoOEuMvzFt5eO/68Kxa5rC7mfpB5b736j9bcZbAc5xFvB5JZH/UFOOvYYFp
         IZK3d3USsspOr3N6/+o+oQBQgmgvyqZ4b/aUwwK9SrW6Dnl9obPnF4sPTDO6ycAooLUn
         4fLAbQ0bQPKYjMMA32hbC9BfJiIRFjdfkf187bGaMSVwzsZ/lUpBu8aEt/PTLW4I46Zn
         nRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784167063; x=1784771863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=;
        b=Rn5o6HxyyH28b6dnAg1SmR8tBzkth0kRSqygfPOjzlsTeJ/YPKj6SdakIffpcadgxJ
         jefDb329lZTJ5rXo7FvT+qsPvEtR9CMp2MYqHw7vhn+TONvju1LphXLx16vqJ2xwRBUd
         DahPG+dHDFDEOrV1FZVU/GPtgoofup0mzwwFD7zcqihqbZ64oh1TcDuqWjW4W8txPwCT
         qsx2prnjPT1e92q/SQVbi+To4TzhioiUFMdxGtOgka7bbKPYCaY2YNIA6wIS9ZrWctQO
         6PBAv3wDkjXeH4LvyNNrl6pt/a2H1kboADrYb/C0t9nqva2k62o2qdYFu6YcEBOH+YxY
         F2sA==
X-Forwarded-Encrypted: i=1; AHgh+Roiygfyk2mwZOwwtSpYDgJ/Ow9wV1tC+crVpZxBc5Wapy8ZrveqaUD+hV58mvOBtGuo6BEst/4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTzaJ+n3beyIclu6vx1icpPkNudmNB6DzGyAfBb1KeusG4bsqB
	pexddGxXq+z3AOzeZn5Pk1y+jAP7Js1zZ0d5mswwVT/OurVcnzLmGM3eRReJPRZOerZttzxsfV3
	Newdb1lYIfHjljSiuZpUVg32MzQMvRPEh1E+NvHaB2F6wJB2tB1knvq7GfivwJ4WiHYDX+sgr0z
	Bpq/KnriRsZhIY+NeAbrE3wjpXPYt9tewlnH/oA1A=
X-Gm-Gg: AfdE7clUkL15VuDeestx1wbqo8fKoBoJGXhaJ9DMCwkMEXGaisMRGztWzh5wxkDmcwZ
	MBtdeSCjZZi4qwxojC3CKUyZ3rAPj3nHiilPe6u/TGVLHHmfYqgkBaMjaisG9j2ab+yedcIOOj+
	1PAmABEvsctsObnQM76EfrCTs67IIJm8akbDFd5lCLyNr5jsMzIuJVoqWuldUtO17TFKNaWh4Oz
	GgvdNbAzv9pI54KMy4=
X-Received: by 2002:a17:90b:3d87:b0:381:fa5:5217 with SMTP id 98e67ed59e1d1-38dc7848a6amr15709338a91.7.1784167063266;
        Wed, 15 Jul 2026 18:57:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3d87:b0:381:fa5:5217 with SMTP id
 98e67ed59e1d1-38dc7848a6amr15709314a91.7.1784167062784; Wed, 15 Jul 2026
 18:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260715125017.277242-1-jtornosm@redhat.com> <20260715125017.277242-4-jtornosm@redhat.com>
In-Reply-To: <20260715125017.277242-4-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 07:27:30 +0530
X-Gm-Features: AUfX_mwzFnOaWEdPGknbaBHXtvjCifI0N1LyjfWnkPVHNRa7lXOSWWzCDn6Dj7g
Message-ID: <CABkEBKa26vR52mX85t4xuZbrXz0FiRc0O_NeDFSNAQpSx=RR7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAxNiBTYWx0ZWRfX3ckgk2FaHDa7
 /EZvShJ45nwMbAmrRIu0j4p3Kbz6SpWFIFQjG2wm15+SJw2loQCd17mxip1mmHeRgC0iQIAi+Bo
 3D5wopZiSSjMX7s1A6FzWeSUkPDmkPk=
X-Proofpoint-ORIG-GUID: I85-31zaXW1obZTO3o8ygjDQfIUyl6kh
X-Proofpoint-GUID: I85-31zaXW1obZTO3o8ygjDQfIUyl6kh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAxNiBTYWx0ZWRfX/PCg7H0aPNOf
 CGl5Wu4TdBcAse/GeitIpHw8g876BX+lsNV9qDwRso3KQqJ2+QhY3ljooo+2iPJSZHRqpP4qAfm
 QepFzU1tL+5iYzNyJ05fDfpv2M1MlFTGzVw2eaO5V1bU1+99RwWw03C7KLoYQ8JvlKQbZKH+85s
 ytQmeFG/J2Qm3Zj7YGFB2/KGavvM02d3BgDw5FdHhN4hIHJFQjsniHx3Xa05l+K4bKdlQmKLHZM
 8rZrRqbBj4HyyylCMernSXyyg57QE3z5Jnq9jv4NlUNE9KKCTAlFWNNsrJL9eRQGx9xFJXcAZhG
 /PAs3tMO+n8VAencDNAfeWRUZDiowPz7f49XQcF6GJ7eMXcQQsgoJluZp1AbfUSP0sXj7TZjpKq
 agi0QYzeLURv/ahKwCRSlbMnfP9UE/eCswl6ieQVhlHHdP7IluOx3LE3uKhcqcTXFHB5JykCcIM
 zobiG2AimJ+JzAqGJWA==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a583a98 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=20KFwNOVAAAA:8 a=M3vVt1PL3_miW-qGmNYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_185745_582527_B5629D9D 
X-CRM114-Status: GOOD (  25.69  )
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

On Wed, Jul 15, 2026 at 6:21=E2=80=AFPM Jose Ignacio Tornos Martinez
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
> 2. Uses per-ring locking to serialize ring access and prevent races
> 3. Syncs with hardware state to get accurate free slot count
> 4. Uses ieee80211_tx_peek() to determine the exact target ring via
>    get_ring_selector(), matching dp_tx on all platforms
> 5. Returns early during firmware crash in the same way as other
>    tx paths
>
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath12k's hardware ring architecture.
>
> This prevents hangs, eliminates -ENOMEM errors, and improves throughput
> by optimizing resource usage and preventing unnecessary packet drops.
>
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
.....
>  drivers/net/wireless/ath/ath12k/dp.c       |  1 +
>  drivers/net/wireless/ath/ath12k/dp.h       |  2 +
>  drivers/net/wireless/ath/ath12k/hal.c      |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 65 +++++++++++++++++++++-
>  4 files changed, 68 insertions(+), 1 deletion(-)
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
> index d9fdd2fc8298..306d51da3ea1 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -1100,9 +1100,72 @@ static void ath12k_wifi7_mac_op_tx(struct ieee8021=
1_hw *hw,
>         }
>  }
>
> +static void ath12k_wifi7_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +                                             struct ieee80211_txq *txq)
> +{
> +       struct ath12k_vif *ahvif =3D ath12k_vif_to_ahvif(txq->vif);

Is txq->vif always valid? Do we need a NULL check here?

> +       struct ath12k_link_vif *arvif =3D &ahvif->deflink;
> +       struct ieee80211_tx_control control =3D {
> +               .sta =3D txq->sta,
> +       };
> +       const struct sk_buff *peek_skb;
> +       struct dp_tx_ring *tx_ring;
> +       struct hal_srng *tcl_ring;
> +       struct ath12k_dp *dp;
> +       struct sk_buff *skb;
> +       struct ath12k *ar;
> +       u32 ring_selector;
> +       int num_free;
> +       u8 ring_id;
> +
> +       ar =3D arvif->ar;

Shouldn't we check the link_id for fetching proper arvif? this code
always chooses deflink ar and dp for packet transmission.
This needs to use the same link selection logic as op_tx.

> +       if (!ar)
> +               return;
> +
> +       dp =3D ar->ab->dp;
> +
> +       while (1) {
> +               if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH,
> +                                     &ar->ab->dev_flags)))
> +                       break;
> +
> +               peek_skb =3D ieee80211_tx_peek(hw, txq);
> +               if (!peek_skb)
> +                       break;
> +
> +               ring_selector =3D dp->hw_params->hw_ops->get_ring_selecto=
r(
> +                                       (struct sk_buff *)peek_skb);
> +               ring_id =3D ring_selector % dp->hw_params->max_tx_ring;
> +
> +               tx_ring =3D &dp->tx_ring[ring_id];
> +               tcl_ring =3D &dp->hal->srng_list[tx_ring->tcl_data_ring.r=
ing_id];
> +
> +               spin_lock_bh(&tx_ring->wake_tx_lock);
> +
> +               spin_lock(&tcl_ring->lock);
> +               num_free =3D ath12k_hal_srng_src_num_free(ar->ab, tcl_rin=
g, true);
> +               spin_unlock(&tcl_ring->lock);
> +
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


--=20
- Tamizh.

