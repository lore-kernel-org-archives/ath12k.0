Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26ACC61DFD
	for <ath12k@archiver.kernel.org>; Wed,  2 Sep 2026 07:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37uu6taAU91xhz7SXKEmRucnGk+Ox84t3g00a5LtrVU=; b=bfj0ez97SAeoIv/B9TjSdEnjhN
	C0FBJvm/VK6nwiTy3C9CDaaCSo+vVSN1HD45jVssAvCULyO99wf+7x90eZ4FqBqlIFk5wuZtVN9Oj
	ySDfx2/9IMRS57xV7E4wsqnilYL+e+pEXIINMW4+pUkLK5/bT0O3YsOlqjSthxorRKCF/JQfEznHQ
	9XSS8swe82syVeKYyDKk7EcWYBctbi1Rl3J+OadTscpBKgpt7Kz0e8lihfw+Qi/eQ9dZljtBFHJCg
	Yw6Lj0UzagqOpZ7iylasokdhuKLZlOf5qc0JeraTGpm4dPTFxJBU5vPPc6RbAFOKCnEi20txWTnAk
	GebLIPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fdX-0000000DyUc-1UgH;
	Wed, 02 Sep 2026 07:43:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fdT-0000000DyUH-1cyr
	for ath12k@lists.infradead.org;
	Wed, 02 Sep 2026 07:43:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VVMH1451379
	for <ath12k@lists.infradead.org>; Wed, 2 Sep 2026 07:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37uu6taAU91xhz7SXKEmRucnGk+Ox84t3g00a5LtrVU=; b=jJEw57KCbL7NKk6t
	jCvGYyfzOKezm68+GEGc4AW+DsV2WrD/J0A/YhisDwcCHJdwcMCYjm4qVZWi+EG7
	ckgpbZIWF6Un29xTpUM+vDnGZ20H/UXPoUXtCoG+snWPXg3eCbipsa5Gd8yeiRCk
	zYCcSMEGBy7W8t255cs9k/AnB2+uWz+6AbEBNiWSsy4dvLNP8Sew4BKQ7jBDhjl4
	VNhGSF+6CeuBO2gEQ7s5A4zlPrx/s+ovWmBNFZBUPw37EB7G67HcTXmAsmKUqbz9
	aB//zAAwmG0hXTMMQPp+AmbPYm6lLtDMuljaXmcA4ffHzAUFgzdTpZfbYU62xyi1
	nQYiag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx0vgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 07:43:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1085234a91.1
        for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788335034; x=1788939834; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=37uu6taAU91xhz7SXKEmRucnGk+Ox84t3g00a5LtrVU=;
        b=cM+gp5lVaCjL0F7R0NN/DGdF/Kz5N/6hGA+T7l+MzDwECKhELPMNAZs5lWZOMQfYNb
         e+u0FHEdEmTDtK2Fi0q9JTASgOGIYAmFlf73TMbk+/f541Ub9M4Le/FfmbRnHO+uNVYO
         jPTSFXO/tbh8sWznrSYphipkz6NKBDPzEZFP1wM1cJC9edjxuDThN9CA/7ObSerI0ZB0
         sB7yb/IR0V5YqbCYtHMqjNv7/H6dTilvc5BPEwl+Fk1UEDE8tFK/WIEOeMMWzjzTo0CU
         xqqJ+w1zMQ4MgGFTOdKNFblYyHhh3UoCEQHE45/EeIJTyJFzt7Q5TZq3oalkzwzfyJUv
         Ws4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335034; x=1788939834;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37uu6taAU91xhz7SXKEmRucnGk+Ox84t3g00a5LtrVU=;
        b=X3Jzwrp59JSio9hcLKVkVNE1poG+fggRW/AkDfM4wXBvOiOsUi9aifl+vZ06W7OIAJ
         PQeleCWkLGp/tzHrL1nrgSY+PcxCrZcjQic1ljtg2t8u2rCpa4I1+xGcw0N6D+v6r7/Q
         FrfK3G9TCuUYXpJNdKYbNRbNeSpfldso3MI4cZbNwabD/uUf29zKov8fjaCjvJtEig2A
         IbxjBuKdhMC22leJFzCz5DJELiz+C0R3YtHiXoy9G1B62Wn+t7j4+2q5PMiZDvekokvy
         S1nBpLAeDeET/V8xr2mqV0knWMpq7HnHu1pPGpxA0/B/WL7F9XUr7jWo0bnX16qRQ0rZ
         BsTw==
X-Forwarded-Encrypted: i=1; AKwUvBx1ORcWzxAb7x1EH9Q9yGs5gFf1hT6Q9k7rkK9Pa1Du9MgmQJ2Jc8aDfZn0JrO3w7WnUv5ZB3c=@lists.infradead.org
X-Gm-Message-State: AFuF++m8k3iKpdIB5nc/qQqNNxHTI8I5HhddXnc/qjXcbNvII3LeKFp8
	yo/+Vx5WuK0vpXkTHdnW2MHv9LVduvboUjxzrqYFzx40HWeM6GgIkNAICPkA27yqRfaOUcgl59b
	ZigzcW+5Oqsk76vOoDcBLv8Y9hjxtYltLcHTse0NQwaPduOoaAt+W3fo+KzXmziUY
X-Gm-Gg: AYBFou1wy0/2Gvi5stzAKk3gi0XcrgBxUTqZevnY0MF2Ega2T4t+3QiAPQBKC4kouzM
	eYJybDCE/SJx5KUVP1TGGY1MLiL6VK6ooglKpB7bGviX0BYK61ws7oUAA7BiFVX/J1OfJz0yt7W
	rdvI8FR4VZ8Da8eR+ik7TPMZnH3v3yIgqkgVvSa6x1laywz1oL1zba4Jegqn50DULeWjIoIshl5
	/qGV9y90Eb7GCVj6jTW10Ze4ngIbdmh5xhkih/Xyid+0b3XdnaH43899A6JYO3JxIQ7IROg0wRI
	NmmX111XQltYWsqHkv/d/CtKy6iWD4Ix5LWXYnsMeTnGuJKGNT1pFEr7JOGlZYbrVTXYvwXLjlL
	K1PWslZJwuhXl+aNh3kF7wPj6cnJz2YBpvW/rjUbs
X-Received: by 2002:a17:90b:4fcb:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39aedf22274mr4775062a91.7.1788335033634;
        Wed, 02 Sep 2026 00:43:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcb:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39aedf22274mr4774985a91.7.1788335032956;
        Wed, 02 Sep 2026 00:43:52 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea09b6csm3942023c88.4.2026.09.02.00.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:43:52 -0700 (PDT)
Message-ID: <001a3142-c2f0-4f9f-9675-1bf1f6f640b1@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 13:13:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix NULL dereference in hw scan cleanup
 path
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Vignesh C <quic_vignc@quicinc.com>, Mahendran P <quic_mahep@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260902010117.3225320-1-acelan.kao@canonical.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902010117.3225320-1-acelan.kao@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aDvXmklIGG3bTOK__kblUtPgD1hSQrVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA2NyBTYWx0ZWRfX/VNX8eYeM/9n
 u4M54EDyOT8hfyBOUr/5Uct7juK1uMtdjy6nMz6zEj1DccqHnZnNwd9Gz8ASuonR29sHharDZRT
 gJAMI1oaJj12ymFMZoa5E0gc9mYxoaGJ+yIzhkli3xE93fmB2TJ3Tvig90VA1+dq8nPBvYsZShv
 XjpHyI7c/1+VFxjir0iXO9Dx9cwL/pec52tzL942IYts0JpLf8Fn1WJ+zLzXuSwsNCp7MuCW/D0
 1TS7E6Kdja44OvVstBkEXN8ncEpEDAmVCrF8v2N+B5+CSB5jM5c21YY3MrnQTWznXK6mb5FTvxv
 VE8r2RVNteMEVdwRjGEM0maY4rC/vft9EKmMqyWbXUoQ2tlLaw8oHzeyrWPsW06CQboAMCk7c6C
 4fJoWt2X5yWehFl9LSYXXehSHHuCy6ctTc5F44HvZkSpo8Etk30amc21Ex+yYPXh9U/ln7kgx53
 W0yPZREj9Kbi5j0Tafg==
X-Proofpoint-GUID: aDvXmklIGG3bTOK__kblUtPgD1hSQrVD
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97d3ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DfNHnWVPAAAA:8 a=_5F5FPPE-e8PIXcV8AIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA2NyBTYWx0ZWRfX0wka80vWCWZW
 O7d44el6jIr1y88gR2uXMX+MsKSTq1ML3zEQVOVZaqG2d1UB707AFekZGe0Cf4zXCSl+c3DPobN
 TwrZOx0WbX8HFIIrVAwfCVIX0sPimaQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_004355_468882_E5C26351 
X-CRM114-Status: GOOD (  29.67  )
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

On 9/2/2026 6:31 AM, Chia-Lin Kao (AceLan) wrote:
> ath12k_mac_op_hw_scan() walks ahvif->links_map in its abort path to
> tear down the scan vdevs it may have created. It skips link vifs which
> are no longer present:
> 
> 	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> 	if (!arvif)
> 		continue;
> 
> 	ar = arvif->ar;
> 	if (ar->scan.arvif == arvif) {
> 
> but it does not check arvif->ar, which is cleared in several teardown
> paths while the link remains set in links_map. When firmware crashes
> and the reset worker detaches the link vifs from their radio, a scan


Thanks for fixing this. I'm trying to understand the recovery path that 
detaches the link vif while leaving links_map unchanged. Could you share 
more details on that?

> request arriving in that window fails, enters the abort path and
> dereferences a NULL ar:
> 
>    BUG: kernel NULL pointer dereference, address: 0000000000001508
>    RIP: 0010:ath12k_mac_op_hw_scan+0x170/0x8a0 [ath12k]
>    Call Trace:
>     drv_hw_scan+0xa0/0x160 [mac80211]
>     __ieee80211_start_scan+0x305/0x7b0 [mac80211]
>     ieee80211_request_scan+0xe/0x20 [mac80211]
>     nl80211_trigger_scan+0x610/0xa20 [cfg80211]
> 
> 0x1508 is the offset of scan.arvif within struct ath12k, reached from
> a NULL base.
> 
> The oops happens in a task holding wiphy and rtnl locks, so it takes
> down the rest of the networking stack with it: subsequent scan, netns
> and NetworkManager operations block indefinitely in D state.
> 
> Check the radio before using it, matching the existing arvif check
> directly above and the arvif->ar check already used elsewhere in this
> file.
> 


One sequence that seems to leave the link vif assigned is:

ath12k_mac_assign_vif_to_vdev() :

assign_chanctx -> ath12k_mac_assign_vif_to_vdev
       -> ath12k_mac_assign_link_vif: links_map |= BIT(0)
       -> ath12k_mac_vdev_create: arvif->ar = ar0, WMI fails as FW 
crashed, returns clearing arvif->ar
       -> returns ar (NULL), but still links_map has BIT(0) and link is 
assigned

At that point, links_map still contains BIT(0), and a subsequent 
ath12k_mac_op_hw_scan() may de-reference link0's arvif->ar.

Is this the sequence you're hitting?
May be error messages from ath12k_mac_assign_vif_to_vdev() help confirm 
that?


> Fixes: feed05f1526e8 ("wifi: ath12k: Split scan request for split band device")
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 99bf5cf79d102..64a636f3ae3c6 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5821,6 +5821,16 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
>   				continue;
>   
>   			ar = arvif->ar;
> +
> +			/* The link vif may have been detached from its radio
> +			 * while this scan request was being processed, for
> +			 * example by a firmware recovery running concurrently.
> +			 * The link is still set in links_map in that case, so
> +			 * the radio has to be checked before it is used.
> +			 */
> +			if (!ar)
> +				continue;
> +
>   			if (ar->scan.arvif == arvif) {
>   				wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
>   				spin_lock_bh(&ar->data_lock);


if above is the scenario, along with this change, would it make sense to 
call ath12k_mac_unassign_link_vif(arvif) when ath12k_mac_vdev_create() 
fails in ath12k_mac_assign_vif_to_vdev() ?




-- 
Ramesh

