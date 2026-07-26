Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930F5C531F9
	for <ath12k@archiver.kernel.org>; Sun, 26 Jul 2026 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v200F8RN3Gyi9qoIEhul2UgJeVzD/qG5lgvFwS9sbVg=; b=UkTcRNl6eMsatiQ2/9pANIx3Fu
	KGAPee1/fl/4SZEhAi1LAhA4SyUH9bf8aoVlcyRqQq9OGejl9B5JSBV1kUQP+nZJr5EUxZUhmmmnJ
	B3yhRQndKLTI00KeGG5h0EE5J4Hrm7eRh/mA1p5QAPn/mdlBo7A0HVw+OKEyNg8CCSxZS/9CT4+JT
	dO/OzM2o/w25tXdt8DkTTGYzWRBlKA9K+Jl5qi+fy4BA65bI2QOzgP7l4BRhpEzeOVYqSPFX/w/mp
	U9ykd4QL6AYXan98NpzEhXl4K2EF/5sqJK4fE21+CFI5EoKjd6nbbKkjBRchuqghk9z2gdEayXjOv
	m5YPlvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0zW-00000001IxF-10bz;
	Sun, 26 Jul 2026 15:42:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0zT-00000001IvW-0fU4
	for ath12k@lists.infradead.org;
	Sun, 26 Jul 2026 15:42:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE3c5a813710
	for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 15:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v200F8RN3Gyi9qoIEhul2UgJeVzD/qG5lgvFwS9sbVg=; b=aUgqhjjRKeWT/B+j
	WLlikbG9zzhXgJJyK/dK9rRc30cGthlbi5vASdtwk5F4MojVeYiemysJ12v2wVRp
	mI8YTf3dkQKmDl5ZVsyREPTS8y2U2fuGQ87jP04LoXaBNK+74EMR6lkG4cQ448KE
	Ha1MHFPbdyeoRZi1UNH9dUrMUVTrZdgg2Ac3xd2jbfb5Q9Nmv+hwf80jKolMdw0H
	8VGA3iOAq8yBUBEFiTo57+BDqx+vZwVvnKgrZEFt946eFg5Z7O27OLv+CsbAWe15
	IPW/WZSN8Tx6+VMzZjQ1xjWRJ3n+2hgy1q4eIze2Fz4ragJTDALZMJBZcTlAv7d/
	4b0xgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn3mgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 15:42:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2903452a91.1
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080528; x=1785685328; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v200F8RN3Gyi9qoIEhul2UgJeVzD/qG5lgvFwS9sbVg=;
        b=BtXiFnyXDP9mFPQyYHVptxsofVGhnpPJSVuh5QSCKjVWK/pwnpHHF4LucYwWH5esyW
         9WkCf5Y3v9m1LaXAGgDa7Jfnt52QH+TJ1vlZftGyXjcVHD9ussF7YOoP6e3GvHoyMW1D
         sjYmNkGKZKzTg/ywWBRTTkSRcw3Y/Qrxy9nJhnPAoSJ84HBLTp1REvz48br454HCCdGI
         FVpjdVew3Xo7xG6uA4Gxe+lz+OND+lcwjOI42I5Xi4Ka/H3RBjJFJWCpgAmL6dz9z/Vm
         +noiNTK6UFOWC3753DRLuOU+QrE2a0g8+iAs5pCLegBNwr9OG7x1xEZk3wc9tKc8j8ir
         OsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080528; x=1785685328;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v200F8RN3Gyi9qoIEhul2UgJeVzD/qG5lgvFwS9sbVg=;
        b=NubzDSsov7TMz2v9TzVd8yNURmR6DPE3/lwcgYOgkHnGj9WX695sYDzw6Y/prE80+3
         hDbFjaiJpVO/J8hSJto2WhUNFdax+NjT3PXze+/4BHYHwPo0ig2nxt1t1oomvFgkNwcF
         f7gh0Sz3mIiS/2hGN/9m4nA9dWetIuwcdHFEzJBGiQ7riB6fq9X0Q65GF9hRwhXriLac
         ntc0PDlwE2JKewPuDGHmoj/FPGeD2pLfFuhHve0CEVvSG7Bh75aiJT9ahGjXaDBl41wW
         8zAoPXM9fDP1HIAzHDfRHawiKwgk3r/I3iWJDGo79F6SiIVK7HXFfLRWAmauc6A3FS/u
         kzdg==
X-Forwarded-Encrypted: i=1; AHgh+RqAk4tXi6peoRBKZFz8I6kQ4QiiJ7xi//NwWPdCtIFjSchM4kRRfff+XwIcX4Uu8nv8hr6Ie4A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq7T4jVgsmTu4utmEzFL+Z9NtEfdk0MgseXG+ppKo4TtB0RzYj
	YbAjUAvpkhWUrb+UQKyuPNgCHxGZnKE0zoOiumqZVDPqswoogYiccYYFhTUqSbAAtpnp/xU0vLW
	F9r/hyOxIemPiu5IQOxzPqjHH61gSfzNYHkm1+rgCqJKB+jA1YqWHQ9lU+yTmrdXx
X-Gm-Gg: AR+sD10r/B3xHyC8Ye1yqGE0KZg1pnziS00Dl7ya3DzA2hIAeHOGGY6XSXmKd+ieHgN
	bXCLQijKWLajx0KlxlQ5nYTzESrtLCAAGCWFSEAVgBgnTkbTexzmOS8CmnKMD+0qmc6MCJLVykY
	dD1j3TGIQnsXYXnQxWXjQv4+Hpl5nuwon0gDV4r1sklTfpOukwlYObK0Ejr3ODvVTdWttzY/uLW
	ZIC82CFDGCyfQzYj7WAeQkwrjUaysxlQ0k/mtSJvpLvER5Wr3xJvrBVKrBOgn2LqG8d1i/RgM5T
	hgt1yRJMMkjJlUD6zfY7VDGWvI2jB7TA81cD9MZQV7HzVRNQNyE2by/Y/9bGcN/iQ0rVSMQzCNN
	0hpUz9WDZjWlbM8IC3Tq0ATUsT3S1mQkK5mDq5mabKDQYKK3WdZteg/cUOA==
X-Received: by 2002:a17:90a:c104:b0:38f:474f:e78 with SMTP id 98e67ed59e1d1-38f474f1029mr1178328a91.38.1785080528491;
        Sun, 26 Jul 2026 08:42:08 -0700 (PDT)
X-Received: by 2002:a17:90a:c104:b0:38f:474f:e78 with SMTP id 98e67ed59e1d1-38f474f1029mr1178319a91.38.1785080527937;
        Sun, 26 Jul 2026 08:42:07 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm72975488c88.15.2026.07.26.08.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 08:42:07 -0700 (PDT)
Message-ID: <88f7d41f-43e2-4dd3-9479-8d45f2da668f@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 08:42:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/8] wifi: ath12k: add TCL ring TX buffer
 allocation failure counter
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
 <20260723125448.922361-4-pardeep.kaur@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723125448.922361-4-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eKZVp_YZCHRsyTy-lLvXfWosAbM-VReA
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a662ad1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Jcmr85nzS8LN7tR81WgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE1OSBTYWx0ZWRfX8Ug8/UV5JS5R
 /pRmX/RxoG5izl9aF86WWbW5B5g0vMnuAjgW8uWb8FF+N4Mnk0vWwXj1fK//BTAbl6xhC1j6fII
 GmpbajBFIiN8DA0fjv5W1qVKu0t8Z3vtkv50gKlzcUMobYJkMuKHN7XGYLtDCpkCrb/4mJPP1Eg
 aYXJ5B75+ty8sQn52Py4J2n6cE3tfbfluhCvC00OYR/fY3fnqluAh7AnN39vyYx85zti31HBF3P
 WAOoDLJqIFAW/NpkenGN2dHb4p9Qt6is+XYtRjqSt3s9PYBkAPS0y4LsqWNMpath+R1nT8TbBl4
 UCLhxlBgul1Vn7cR4MaMXfW7Bcv84Q1uS4np4X6iM1uXFxVYO2/uR51VDZJNxsGpI1PkjPpEfFA
 kkHSrAM3w4mSKOh78rIpUrxrreJt9GOjMSQ++0uvppTESmvKQIFMObaImRjep3gA1G/8lI3qiOm
 y9/vIjFD7VPNkDh8wEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE1OSBTYWx0ZWRfX8JV0bWf+Y8kT
 OZ8ZIWojKv5xcqVmF/zMv9pPzM4sN0OoN22TuIZi3GxDJfT48MbqQXquVkx3kYHjN+bQ9tiy1XE
 qwNYBhIO3B5YGk/2TW4+F+QDqaWGAcY=
X-Proofpoint-ORIG-GUID: eKZVp_YZCHRsyTy-lLvXfWosAbM-VReA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_084211_326257_2B38A07E 
X-CRM114-Status: GOOD (  24.97  )
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

On 7/23/2026 5:54 AM, Pardeep Kaur wrote:
> From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
> 
> When ath12k_dp_tx_assign_buffer() fails, the TX path returns -ENOMEM
> silently with no per-ring visibility into how often this occurs.
> Without a counter, buffer pool exhaustion on a specific TCL ring is
> invisible during debugging.
> 
> Add txbuf_na[] to ath12k_device_dp_tx_err_stats to track per-ring TX
> buffer allocation failures and increment it on assign failure in the
> TX path. Expose the per-ring counts in debugfs under a new 'TCL Ring
> Buffer Alloc Failures' section.

Is this counting the right thing?

One of my review agents has the observation:
The txbuf_na counter is indexed by ring_id but the exhaustion it measures is
from tx_desc[pool_id]

So I drilled down with another agent and got:
The commit message intent is to answer "why was this frame dropped", which is
valid. The practical question is whether ring_id or pool_id is more useful for
diagnosis:
  - pool_id = skb_get_queue_mapping(skb) & 3 — a property of the traffic
class/queue
  - ring_id = smp_processor_id() % max_tx_ring — a property of which CPU
processed it

If a pool is exhausted, pool_id tells you which traffic class is
backpressured. ring_id tells you which CPU happened to observe it — less
actionable. So the other finding is a genuine semantic improvement, not just
pedantry. The fix (txbuf_na[pool_id]++) would make the stat correctly answer
"which traffic class ran out of TX descriptors."

So does tracking by ring_id or pool_id make the most sense?

> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
> Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs.c     | 5 +++++
>  drivers/net/wireless/ath/ath12k/dp.h          | 2 ++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 4 +++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index d54995b7adb2..0f8b458200a8 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1117,6 +1117,11 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
>  		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
>  				 i, device_stats->tx_err.desc_na[i]);
>  
> +	len += scnprintf(buf + len, size - len, "\nTCL Ring Buffer Alloc Failures:\n");
> +	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
> +		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
> +				 i, device_stats->tx_err.txbuf_na[i]);
> +
>  	len += scnprintf(buf + len, size - len,
>  			 "\nMisc Transmit Failures: %d\n",
>  			 atomic_read(&device_stats->tx_err.misc_fail));
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index a94bbc337df4..ac125adde258 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -428,6 +428,8 @@ struct ath12k_dp_arch_ops {
>  struct ath12k_device_dp_tx_err_stats {
>  	/* TCL Ring Descriptor unavailable */
>  	u32 desc_na[DP_TCL_NUM_RING_MAX];
> +	/* TCL Ring Buffers unavailable */
> +	u32 txbuf_na[DP_TCL_NUM_RING_MAX];
>  	/* Other failures during dp_tx due to mem allocation failure
>  	 * idr unavailable etc.
>  	 */
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> index a0e409452a19..ca0e1369af21 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> @@ -123,8 +123,10 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
>  	tx_ring = &dp->tx_ring[ti.ring_id];
>  
>  	tx_desc = ath12k_dp_tx_assign_buffer(dp, pool_id);
> -	if (!tx_desc)
> +	if (!tx_desc) {
> +		dp->device_stats.tx_err.txbuf_na[ti.ring_id]++;
>  		return -ENOMEM;
> +	}
>  
>  	dp_link_vif = ath12k_dp_vif_to_dp_link_vif(&ahvif->dp_vif, arvif->link_id);
>  


