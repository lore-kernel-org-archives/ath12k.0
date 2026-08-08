Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7D3C5AD44
	for <ath12k@archiver.kernel.org>; Sat,  8 Aug 2026 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DDHErlHnBZz4VB/m+ePIzuov6kkItLoeXRusC4Jtj0=; b=gr8fe/J4bk3VuHRCEfbWPFoGlL
	CkJVR5vNvpTabIBTgt4DhZoP0MijCFW8v4jaC9UhgHPZSkJjz7q+SEMvORqRdGNQLTi9KAdWLXu3O
	6ucB9cBmmRZfkfUVe5B4R86D4DfGwqx5jfKnPbnPCZrFtV16/ta9/3rEgtZVCpgoZ/7YUBfF2V+IG
	21mOAj9hEBuI5/jwvhx5moYL0GMmzokQWYMZ7tMzGRQxWSDyEZH3/5WV+nVfFfgezjrDbLvo5miQE
	k9YvLeNG6uz7P2cRscjybX43R7cDsETmwLXZg6rkf8I9PuQHs8W9JOE2rq3GwAejl7c3yyDD5amkr
	fYcn6WVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsm0M-00000009aYD-2Ikj;
	Sat, 08 Aug 2026 18:42:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsm0J-00000009aXV-3eEc
	for ath12k@lists.infradead.org;
	Sat, 08 Aug 2026 18:42:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678GmVaL348185
	for <ath12k@lists.infradead.org>; Sat, 8 Aug 2026 18:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DDHErlHnBZz4VB/m+ePIzuov6kkItLoeXRusC4Jtj0=; b=KRHwmGjby/MZWAt6
	Y+w/dytUnBVUtxQyajM/anT1Dlooq2bHgMtgRZRyCfx7lnr4AdcHzxY1BZo/mXKB
	AkVuHREXgXsdEE5JX3KQsYXDMKag9qgm4r48MMpvjRqUU15uPmbVxjCJ0u5fGzM1
	imCqfpjO7GiO97lYhGmCd7LD5AS5x1Mfl+vANiAb3eOf/ktg88zRhnmYX72RQEu6
	ev7sgFotwJHJILp3L2721fTbmTu/NoZgIq9YIEKNrJl3aimb3xGJpzn4lpJmKvTc
	BxR50rG0Y+BgjzBFANhVZli5leWiA++U9GJI/IzVWNNZOcyUwA90op+wjaD3sLuo
	Opia2g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhv9fmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 08 Aug 2026 18:42:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso1259696a12.1
        for <ath12k@lists.infradead.org>; Sat, 08 Aug 2026 11:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786214561; x=1786819361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DDHErlHnBZz4VB/m+ePIzuov6kkItLoeXRusC4Jtj0=;
        b=gnfqdlIUY3A/oRcQo3zjZZh43bw0cU7vHB/DetQZYJsnMWyC2RZOyIvWAKsWiTX5x9
         gNRuv/ktLo5glyupiBekKmbMRMoHuQJy6kQr46mMd1X4F2uVu3nUQ2dWp7/xeh+EVSpo
         FgPR3IWN8SM9C0/80H3LIy4vpxSsvAAeQwg74nQ4G5ZYsG2vgHqU7e4D7u0JioQvyuBw
         tOu5DRezdn275nWN3auYG4kx+pBus0sPrxX9DYAuY4XW9POECsFSQRls2OPhO8dWBloN
         TswsdxXkvtYdbgE+zuKj5Nhjgbgzn3A6inLEgkSQqwxNV1g7LwIuWCc5kwR5hEDkYAVc
         4w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786214561; x=1786819361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DDHErlHnBZz4VB/m+ePIzuov6kkItLoeXRusC4Jtj0=;
        b=TcX23g/YJPX2PTpOC7wpsuH/2X79XY45bZKHxCNqhAq0yd2eAEL9DwwW2VZyOdsY3D
         UprFKYORL0Qxr20CPRsgD888dtbLbqHagHJHeMFf2yvri+VUibeNzJEp0Gf55rSWRvap
         WHp+M3IRma7P5tYvQxOCOIATHnsww0f/S66uJrcYhXFa7wTxC1BYUoSWQw1fId+WD1ET
         Lm/PraHKloYu6N0AAvVvnPcy6KHqMtveiAqjmAG1aDkq+Ad5lQER/iOBuwBJNEcn+Kp6
         FxBbrLxhIjyOC6ZKzUI0Io79FMJ0M3iStvCC9+IypoiSQOZb9i5CkGQ7iI27i/jpKECL
         NlBg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4YJ8YOBixBehbuvfFW+Ru4ST2e1qluxwnPVNj77t1zOU/j3KfpwJM8wbGg8URD/2n0VQqc7s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUGkK3dNHmD3xulp6tKTnt2I6yY5YcMgjEsobvHl4ksHQ3Lsyc
	LaZHZV4VLKUfl38mOfa8uMNiqOQXigA5Rl5aE9pF0ZfjawgWQUbKZXYfGMSroQa1qVYwUIWc7aV
	qGtgFh//ynfWxg6s7TIKE5u1DvtJ+9hoyvMwUBiNBiEXgNN3HIhloTrCdBVFnLrd5
X-Gm-Gg: AR+sD10C0bkJoNhO6XbkeL0w4nLkoRvFwN5RHhBbsG6KC2PXxd7lYETnvakW6s6CsYx
	+lZe30tmQBZknB/C5gJY3GLf7kGsQImzsyOOIs6uFhAAKWEc3sa4CeGd/EKQJLPyfLj3d/Yg3k8
	9N1EeoS9M1ED/gHO153ta10hVYuB8Vb0mE8zhH/3A3UZVwwM9TrzbQYXvI0RJoOSrJNN67hxbGc
	4Bd70nFR1vt4GYN8D4dIWjhtN9SjTf1RIdhsCP+A2ZL174KMyZ/tPXbNn+2trg7JwSgU+DTTyeD
	elngaZxp4npn91eVHVP+NctIpr3ddGZxgmV1ASVcVmQDzNNkz4mg3ocNC8NCzdkpFScw+I02Syz
	qFGmD14DApnhLQH8hgt1lTYV5fSEIbx3Jfdmsvya9pmUJ/Fn5KbxoD0RFUJDs
X-Received: by 2002:a05:6a20:7290:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3cbc0431ddcmr13212936637.27.1786214560817;
        Sat, 08 Aug 2026 11:42:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3cbc0431ddcmr13212896637.27.1786214560339;
        Sat, 08 Aug 2026 11:42:40 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm36459413eec.18.2026.08.08.11.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:42:39 -0700 (PDT)
Message-ID: <2774127a-01ce-4d26-b8fc-e68f49da2bbc@oss.qualcomm.com>
Date: Sat, 8 Aug 2026 11:42:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] wifi: ath11k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260807105843.20203-1-jtornosm@redhat.com>
 <20260807105843.20203-4-jtornosm@redhat.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260807105843.20203-4-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a7778a1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=UlviFDkLi7K7RJw89-AA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: J5RAnxP5MiQVteNBGAkAMvZcGK0ZF3Zp
X-Proofpoint-GUID: J5RAnxP5MiQVteNBGAkAMvZcGK0ZF3Zp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE2MSBTYWx0ZWRfXyFi9VkmMEJod
 juu1E9tOnh1cKU17DsPf5M9HxnjpDlb4Ioi3XkvGT1DN7rm+ENL3+qvtM2ZJ9lCz0c825X4fp8R
 UiNiMyxCHGiQCelKgKV8xrm0OjGnfUn5HXdqbn2Fp3CwRXK6AeLSXkAf0KFlBXhAGeLAX8nNDxn
 tw02A8xAfXyaMhRIggue8Gxbm1u42Js3UzAIptK0ejcLnbwCibdZXDKaZhn11Bdt9pD/3UFe++a
 opgI0F/8uf554r1yGiC12zBeo1EtKQB44QEkU6rDnJcdHlXlE2m4t0SdL6D8b9b0LHSTEdX8U5a
 vjXQfOlRO5M6IXsfiGlcO8X/d5KoJ3iCDBbIg6SEUWQPxBrdSjZe8ILxJtdHHdoiuoaC0GYDdY6
 s3+mSVYziFc1uEKx8hF6lra/xAi+cqSMXCoohLja9E18Hh6EfqRNhJrqaHm2WZhdD8hQkaaKyxU
 BK/iMXzts5dNM2pwZ2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE2MSBTYWx0ZWRfX/KmrZ1kJWDJN
 X67BhoFiGlMPEmKSoeW+nkWwkLgHBKy3q5JkJVcIpwWgGOgh5IBTa1locNNWj9UvHoRhHKCOA2d
 +glnE4+ShukIXVf3TC+GPXGK773J2gE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_114244_022485_55CA7950 
X-CRM114-Status: GOOD (  26.41  )
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

On 8/7/2026 3:58 AM, Jose Ignacio Tornos Martinez wrote:
> Under heavy traffic, ath11k experiences frequent -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> This issue is more commonly observed in VMs with PCIe passthrough but
> also occurs on bare metal systems. It is particularly problematic on
> devices with a single shared TCL ring where all traffic classes
> compete for the same 512 descriptor slots.
> 
> Implement a custom wake_tx_queue operation that:
> 
> 1. Checks hardware ring space before dequeuing packets from mac80211
> 2. Uses per-ring locking (wake_tx_lock with spin_lock_bh) to serialize
>    concurrent wake_tx_queue calls targeting the same ring and to ensure
>    bottom halves are disabled as required by ieee80211_tx_dequeue()
> 3. Syncs with hardware state to get accurate free slot count
> 4. Resolves the target TCL ring using get_ring_selector(txq->ac),
>    which selects the ring based on the access category
> 5. Returns early during firmware crash in the same way as other
>    tx paths
> 
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath11k's hardware ring architecture.
> 
> This eliminates -ENOMEM errors and improves throughput by optimizing
> resource usage and preventing unnecessary packet drops.

Missing Tested-on tag

> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v5: no modification
> v4: https://lore.kernel.org/all/20260724053121.15759-4-jtornosm@redhat.com/
> 
>  drivers/net/wireless/ath/ath11k/dp.c  |  1 +
>  drivers/net/wireless/ath/ath11k/dp.h  |  2 ++
>  drivers/net/wireless/ath/ath11k/mac.c | 52 ++++++++++++++++++++++++++-
>  3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index f389b97acbdd..2e5978ec2b05 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -1087,6 +1087,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
>  	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>  		idr_init(&dp->tx_ring[i].txbuf_idr);
>  		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
> +		spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
>  		dp->tx_ring[i].tcl_data_ring_id = i;
>  
>  		dp->tx_ring[i].tx_status_head = 0;
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
> index 84f66839f0c6..6d99501aa269 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -87,6 +87,8 @@ struct dp_tx_ring {
>  	struct idr txbuf_idr;
>  	/* Protects txbuf_idr and num_pending */
>  	spinlock_t tx_idr_lock;
> +	/* Serializes wake_tx_queue operations for this ring */
> +	spinlock_t wake_tx_lock;
>  	struct hal_wbm_release_ring *tx_status;
>  	int tx_status_head;
>  	int tx_status_tail;
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 2d55cdc4d165..9813f7923c34 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -10065,9 +10065,59 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	return ret;
>  }
>  
> +static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +					struct ieee80211_txq *txq)
> +{
> +	struct ieee80211_tx_control control = {
> +		.sta = txq->sta,
> +	};
> +	struct ath11k *ar = hw->priv;
> +	struct dp_tx_ring *tx_ring;
> +	struct hal_srng *tcl_ring;
> +	struct sk_buff *skb;
> +	u32 ring_selector;
> +	int num_free;
> +	u8 ring_id;
> +
> +	if (!ar)
> +		return;

ar = hw->priv and the hw->priv space is allocated when hw is allocated.
so if hw is valid, hw->priv is valid, and this check is innecessary

> +
> +	ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(txq->ac);
> +	ring_id = ring_selector % ar->ab->hw_params.hal_params->num_tx_rings;
> +	tx_ring = &ar->ab->dp.tx_ring[ring_id];
> +	tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
> +
> +	while (1) {
> +		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
> +				      &ar->ab->dev_flags)))
> +			break;
> +
> +		spin_lock_bh(&tx_ring->wake_tx_lock);
> +
> +		spin_lock(&tcl_ring->lock);
> +		num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
> +		spin_unlock(&tcl_ring->lock);
> +
> +		if (num_free == 0) {
> +			spin_unlock_bh(&tx_ring->wake_tx_lock);
> +			break;
> +		}
> +
> +		skb = ieee80211_tx_dequeue(hw, txq);
> +		if (!skb) {
> +			spin_unlock_bh(&tx_ring->wake_tx_lock);
> +			break;
> +		}
> +
> +		ath11k_mac_op_tx(hw, &control, skb);
> +
> +		spin_unlock_bh(&tx_ring->wake_tx_lock);
> +	}
> +}
> +
>  static const struct ieee80211_ops ath11k_ops = {
>  	.tx				= ath11k_mac_op_tx,
> -	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
> +	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
>  	.start                          = ath11k_mac_op_start,
>  	.stop                           = ath11k_mac_op_stop,
>  	.reconfig_complete              = ath11k_mac_op_reconfig_complete,


