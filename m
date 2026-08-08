Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47726C5AD44
	for <ath12k@archiver.kernel.org>; Sat,  8 Aug 2026 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuvSutLPjPyL9CCFdoTwZ+Nso62iCYQCLauMvboUt2k=; b=H6IB/WXKFs3nMbM1Ku8JUpLFl8
	3H7aJimFlsgnEWKeaAsiQonGGovYg+MwoiL+0OtyazEy1EAW21EMdysLXWjmA5GZEaSjQ4hePMLF4
	VcPeRh1d8i/CR2slSzn0c1VrYI7OyeS0ameyq7R/SyJrX6dS6lEyphyso1fs0QKF0Qwy6Hgifofeo
	ggLz8X9vwFomAvaKGgU17v9XCy4rcZicc/N8L4ai0ebYTiJns4OCyiejzLXGzY1ydEqCUeBzWT2fg
	Wr85vSB4iW2u3MxK5XqZC+0tu7bfPoMDBtRX8P1ZUn7FRHVFlM5pgyOQs9RNGMkrhxknUOqwcc6Jc
	YpLsV1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsmjq-00000009eJM-3Ptd;
	Sat, 08 Aug 2026 19:29:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsmjo-00000009eIS-0dgL
	for ath12k@lists.infradead.org;
	Sat, 08 Aug 2026 19:29:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678GlXO4043857
	for <ath12k@lists.infradead.org>; Sat, 8 Aug 2026 19:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuvSutLPjPyL9CCFdoTwZ+Nso62iCYQCLauMvboUt2k=; b=pBELRQgydIm6D/Gb
	5TVa3LH+KEImXFbEoDoXTBwwhz3YBO6ATRaJAtTkw89FvQh+VQTuTBfHuD6t6/OS
	+rQ4BYMVeyIMEWOpnO9Bpt/Jg184W79p8Zomgj2DgBOpHKOPbeR+HVr6WnqwhvgJ
	utfYL9WkM8FEarK5SjoJyP5UpGjWPoX5S0/UTaLQx4zfJTZ365NMIlS/6NEB0dfy
	NHeR+QYEIlGB/8FXOfXCMhl9NiHiX5O1/vgrELslPeL6U33sKkCxAJk/bHijf2/I
	kEHWO8TVv7T/6/W2A+bxLQOCfx0KaZY7sa8Mm1GiKKuyUIXvJpxG9/RV0zWlUZYM
	FzpNsQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7csggc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 08 Aug 2026 19:29:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so753327a12.2
        for <ath12k@lists.infradead.org>; Sat, 08 Aug 2026 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786217383; x=1786822183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuvSutLPjPyL9CCFdoTwZ+Nso62iCYQCLauMvboUt2k=;
        b=Q77uxRseev3HbhnLq17EppJYVLZMC5nZCJkzUvjodv3oOdBmf/Ht5jbRdEBiEpwH3Q
         LHPuMvOsOXxNT+GDPuISHV7Xto9nI1SHEnkcGfIieSnvWamFaMTJmw3dA65xica4oI3g
         j/r15bneGXyOWb45khMa3iM68cVOw68mgzCTk8WqPXAec8b2pyIbYhrmXm3KDV72kMfB
         eoGxeKMuue4UCbn3lAh+iPngm4ERYdxGQa+7MwNTsRr0iCbQdYud9/cpmLFmzLGl6f6t
         Mwe3DDOgufsap8hf56B5OJjqOVW8JsOPcUVZe5Z645n4z/e/J9cE+yOQTanXMP2tEYXE
         5diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786217383; x=1786822183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuvSutLPjPyL9CCFdoTwZ+Nso62iCYQCLauMvboUt2k=;
        b=KZQaaO6n8nR+n8P23/X49DI6zLJOeJ+U220Frz+O0KcQD0kacYp58+WUDsiaLtvmVI
         fPpcKF4gPlaWKX8pUY5wG+fifZuEFFeCaMeJ3Jzje29xapwBjLxeW00X+z9WgyC4EyGy
         e0cVjYTup18FjXCfzqaXOSfbub3GWdE6vE67YscOCCzbgOM+KelbXjQyheLpOK9yKCF6
         D2O/XeRbzRMlWqGDG4r8cPeEt5urQVNqyxdkwJ2HNqVrMAwVNqf54tmU7IHAFL3RUVNo
         kQnNzsQdy58EMU5wzkIarlsbYhV/w/+/Enx/R+tmpTWJ9Hj/ZEJXPGC+A5MFJwxSaQFJ
         rq4A==
X-Forwarded-Encrypted: i=1; AHgh+Rpa9E+8c9orBfI/4dLxFbbG7ZNRsmGF+cV2xk4qT/CckuqSRAY3kGoqexh36lpGlQabt/RRDSs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjZbckZpgUVhWknY84PLei8qXiWfd39hyOjyVHXZiBlloatfwL
	StylMrM6cLwFsRHFHgOm62NO/0rxafbWTK9HLDs40Qc1QVZR5E58ZwHJ1caULAIPqpyUoOVZUB4
	xI7uKpbhw9i+fqLp/E64gbviVpvP4NoHjKlMTXUHaD6dGQBdaqnuyPEMhdHn7er3uTbaE+gS8
X-Gm-Gg: AR+sD13Dh2YLBKX1r5fhxtHkkiCCzBkAaAVmQhCSNzIt3GdymQnpXLGHesrFvdfo03b
	82MYgImdgIW6d0UL/ZI762siQYkVZjn3ugIo95O8VeKdA2qEalaXPwxIiauWJLAJWut0k2olq1R
	0O2BlMMWT+brSc+IlkturWEwynX8/g/yZB1EOpnMyCUDQyX8/VzI/ay9T5TRDg85a2yu2dw8lQK
	ng2AUbQo7Mm157dB9sE3EJifHN5LPnmz/CumSAgH1oCEn+grnKF5rIubvrA40VK/aaPljvVSf+f
	JJdwu2lOaj46CeZeaUbV1RNy7gN6wsZ45WJHcBxyaxuLtEN1J+Npo/5d6EJsZwZjv1gl2LPaHap
	ptooOxeqf4BeC89QJvyYhiN53Sjnn2fpsqmceKGqHKmhrIZnOXoJj9xq37+5/
X-Received: by 2002:a05:6a20:144d:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3cb85efabdemr39590888637.28.1786217382798;
        Sat, 08 Aug 2026 12:29:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:144d:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3cb85efabdemr39590853637.28.1786217382245;
        Sat, 08 Aug 2026 12:29:42 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm25876629eec.25.2026.08.08.12.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 12:29:41 -0700 (PDT)
Message-ID: <0b72231d-59f8-49bf-82a0-76d2c7862729@oss.qualcomm.com>
Date: Sat, 8 Aug 2026 12:29:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260807105843.20203-1-jtornosm@redhat.com>
 <20260807105843.20203-5-jtornosm@redhat.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260807105843.20203-5-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VnoqgAL9mcWHUzoAE9kyAo3fra0OLfSV
X-Proofpoint-ORIG-GUID: VnoqgAL9mcWHUzoAE9kyAo3fra0OLfSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE2OCBTYWx0ZWRfX6zoj0LrISxHR
 acEOGWUfFSfdLT4OhfcjJmuMQFlWiUKoGEY8K1zrleqpDo2nHbWn3JCq7kYtvlSjEyTPmvpTbPW
 2O2ZI+fC4/Fxz5/9hlnZEVYjpEiA2D5/n6eLft0lVqVUuej4tADIjK91nZGJgTemctyMPBTvz+v
 xsb/Q8dW1VaoMDzkbFeY2tgH9iZr+08neqoDcFLxptLQiBan0nmGTN8ndBycRJ9a2uSljVARohH
 q5W618ccrZvBz2kj6SfAB2GOqiOaiO9Yk+4vRFCDWkk0hTdWagEBfxdafpPPPYZSe5MWrmaNCmH
 12og032jRP8Ek6Avr2Fjyknbrc6ObPzUMBxl3xPL4Rqm95bXR78dXsZnlaSddf6we0OPksUUF/4
 pKK4YZ6kNJ7ex3B1xixw2pXo9jmLvTujduOLKYEsUAPGcfGHFYSZWCB5c1hg+1ek5Vjv7iPwsZs
 SggOZdNxw7MQxggeqyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE2OCBTYWx0ZWRfXyG2GG1KhIEEA
 S8HdC9gFx9lCZI5OmoTHupu6zxmgP4csRPmF2dWmiIDGDAHXRPUyvVs/lkKtr1hc+BES8jT7egV
 BdCcuF522OElrCppiHGVpq/RMxMmG74=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a7783a7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=Vholvesw0q1f2_GdfVUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_122944_201893_475EC97B 
X-CRM114-Status: GOOD (  29.91  )
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
> Under heavy traffic, ath12k can hang and experiences -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> This issue is more commonly observed in VMs with PCIe passthrough but
> also occurs on bare metal systems.
> 
> Implement a custom wake_tx_queue operation that:
> 
> 1. Checks hardware ring space before dequeuing packets from mac80211
> 2. Uses per-ring locking (wake_tx_lock with spin_lock_bh) to serialize
>    concurrent wake_tx_queue calls targeting the same ring and to ensure
>    bottom halves are disabled as required by ieee80211_tx_dequeue()
> 3. Syncs with hardware state to get accurate free slot count
> 4. Resolves the target TCL ring once using get_ring_selector(txq->ac),
>    which selects the ring based on the access category
> 5. Returns early during firmware crash in the same way as other
>    tx paths
> 
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath12k's hardware ring architecture.
> 
> This prevents hangs, eliminates -ENOMEM errors, and improves throughput
> by optimizing resource usage and preventing unnecessary packet drops.

Tested-on missing

> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v5: Remove an unused variable
> v4: https://lore.kernel.org/all/20260724053121.15759-5-jtornosm@redhat.com/
> 
>  drivers/net/wireless/ath/ath12k/dp.c       |  1 +
>  drivers/net/wireless/ath/ath12k/dp.h       |  2 +
>  drivers/net/wireless/ath/ath12k/hal.c      |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 76 +++++++++++++++++++++-
>  4 files changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index af5f11fc1d84..3d46cfbf0a1c 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -1539,6 +1539,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
>  	}
>  
>  	for (i = 0; i < ab->hw_params->max_tx_ring; i++) {
> +		spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
>  		dp->tx_ring[i].tcl_data_ring_id = i;
>  
>  		dp->tx_ring[i].tx_status_head = 0;
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index f8cfc7bb29dd..68d2020be9b8 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -58,6 +58,8 @@ struct dp_tx_ring {
>  	u8 tcl_data_ring_id;
>  	struct dp_srng tcl_data_ring;
>  	struct dp_srng tcl_comp_ring;
> +	/* Serializes wake_tx_queue operations for this ring */
> +	spinlock_t wake_tx_lock;
>  	struct hal_wbm_completion_ring_tx *tx_status;
>  	int tx_status_head;
>  	int tx_status_tail;
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index a164563fff28..071cb5d30931 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -390,6 +390,7 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *ab, struct hal_srng *srng,
>  	else
>  		return ((srng->ring_size - hp + tp) / srng->entry_size) - 1;
>  }
> +EXPORT_SYMBOL_GPL(ath12k_hal_srng_src_num_free);

NAK, must be EXPORT_SYMBOL()
The ath12k code was contributed under the license:
// SPDX-License-Identifier: BSD-3-Clause-Clear

>  
>  void *ath12k_hal_srng_src_next_peek(struct ath12k_base *ab,
>  				    struct hal_srng *srng)
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index 7436cf70925a..af0a3ba805dd 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -1100,9 +1100,82 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw *hw,
>  	}
>  }
>  
> +static void ath12k_wifi7_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +					      struct ieee80211_txq *txq)
> +{
> +	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(txq->vif);
> +	struct ieee80211_tx_control control = {
> +		.sta = txq->sta,
> +	};
> +	struct ieee80211_vif *vif = txq->vif;
> +	struct ath12k_link_vif *arvif;
> +	struct dp_tx_ring *tx_ring;
> +	struct hal_srng *tcl_ring;
> +	struct ath12k_sta *ahsta;
> +	struct ath12k_dp *dp;
> +	struct sk_buff *skb;
> +	struct ath12k *ar;
> +	u8 ring_selector;
> +	int num_free;
> +	u8 ring_id;
> +	u8 link_id;
> +
> +	if (ieee80211_vif_is_mld(vif) && txq->sta) {
> +		ahsta = ath12k_sta_to_ahsta(txq->sta);
> +		link_id = ahsta->assoc_link_id;
> +	} else {
> +		link_id = ahvif->deflink.link_id;
> +	}
> +
> +	rcu_read_lock();

does this lock really need to be held for the entire function including the tx
loop?

> +
> +	arvif = rcu_dereference(ahvif->link[link_id]);
> +	if (!arvif || !arvif->ar) {
> +		rcu_read_unlock();
> +		return;
> +	}
> +
> +	ar = arvif->ar;
> +	dp = ar->ab->dp;

or is it sufficient to cache these values and then rcu_read_unlock() here?
my LLM reviewer seems to think that would be sufficient

note the spinlock in the while loop will cause the RCU read lock to be held
when invoking mac_op_tx(), satisfying the RCU lock requirement there.

> +
> +	ring_selector = dp->hw_params->hw_ops->get_ring_selector(txq->ac);
> +	ring_id = ring_selector % dp->hw_params->max_tx_ring;
> +	tx_ring = &dp->tx_ring[ring_id];
> +	tcl_ring = &dp->hal->srng_list[tx_ring->tcl_data_ring.ring_id];
> +
> +	while (1) {
> +		if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH,
> +				      &ar->ab->dev_flags)))
> +			break;
> +
> +		spin_lock_bh(&tx_ring->wake_tx_lock);

using guard(spinlock_bh)(&tx_ring->wake_tx_lock) would eliminate the need for
all the spin_unlock_bh(&tx_ring->wake_tx_lock) calls

> +
> +		spin_lock(&tcl_ring->lock);

seems this should be spin_lock_bh() to align with all other callers in the driver.

> +		num_free = ath12k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
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
> +		ath12k_wifi7_mac_op_tx(hw, &control, skb);
> +
> +		spin_unlock_bh(&tx_ring->wake_tx_lock);
> +	}
> +
> +	rcu_read_unlock();
> +}
> +
>  static const struct ieee80211_ops ath12k_ops_wifi7 = {
>  	.tx				= ath12k_wifi7_mac_op_tx,
> -	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
> +	.wake_tx_queue			= ath12k_wifi7_mac_op_wake_tx_queue,
>  	.start                          = ath12k_mac_op_start,
>  	.stop                           = ath12k_mac_op_stop,
>  	.reconfig_complete              = ath12k_mac_op_reconfig_complete,


