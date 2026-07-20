Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BF7C44515
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 05:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv1m8uqJ3lf2q6MHBzpIhc2heNfWXPKnSDMAJyTDSS4=; b=uf5jTVTcObOt/4he7/jWEuGIXg
	aYglq6XuAfzGb+lirVC0Y+B7ieqSmHaGRmKxmKUN8QLc50V1s0xDKZABgXIVYU1s2Aij4sd4+3+eA
	JZBkLSf+DmUqqSUTy0HOGJ8n6GldI2P1+nWZWlYKpVBOyQ2z/7fMcdTwCRX27AIvlzxbw4E3ERCO/
	LJMnAsRc4JShPMEmJYL15z/FS5P86OQrR1O+d+iU9+6VyqIg/fD4LaldYDxrREQF3rfimYA95GEMp
	LAVyYdCErfANxYD2GPvXylygYzj9Ct597Hp5zTF55xZQNlb6uiA6NA/lflx3B3+rmSpKkiznqDnS8
	skYmeXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlg7O-00000005q0C-3Nb1;
	Mon, 20 Jul 2026 05:00:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlg7M-00000005pzq-0doM
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 05:00:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsbg5804392
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 05:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv1m8uqJ3lf2q6MHBzpIhc2heNfWXPKnSDMAJyTDSS4=; b=psBYpSHoPKBQTzsJ
	wN9TcssqHju6mO5Zz8TnDDPLxkxE05esZs6vXbiVvmQQ8/0QqNWlhZ1mI5KiRtZ/
	KGsCcql0HqzNxNhzGBGBdrW2nwPWJwsmq2jMDZ7NmGDjKRz4p/dJaDebx98GoJKD
	MMhHDPq99arqWWu8iRXjkpm+fXB+aOyuxwNgvqGUgVXCWAFMSGobkASmeB7271L/
	vNwuz0U4letzmt0a57oFzJ7qym95mEENOEF1jXWNWKo2b1RnhNpDGkhdBFlUYuJy
	8K0wEkH4AwaK2WlH53+lGLBoA86loMTMQZmbGHkAC0Vx8toA1S/3opAfn9niYu8o
	C2Nf6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04ud74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 05:00:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso6741435a91.2
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 22:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784523638; x=1785128438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bv1m8uqJ3lf2q6MHBzpIhc2heNfWXPKnSDMAJyTDSS4=;
        b=MXRjNl016Q0qkSj6FqPV3FLo6s+fnYMCWUynujwesB2SxqLXSrXcZGNbgTIUzGrf7P
         B2g2mN+3q9k4qu9Jqe4Ws//aUG2VWl4vmST9dIIuFOOuo/otNP/o4Mq7Mwgw0nQj55jl
         aHVelIAVjqgy+fQCQPIZq3kdkmh5Tiq1nEOdYsG24JaKUT734tjkifQ2QAwC8RpVYoqH
         XUSRRL+mF9VAFQMvI8OYWLPjpN0xPH/WnU5L1/ovzJSvtDIlPab7MTUr1ekrSHpdNqtd
         1slq9VvTo1QgUH9zIIQbNSW0bexrkEV88F6YqkoWv31YkrPjvwnhOSdflLReN4M2Oo6J
         8XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784523638; x=1785128438;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bv1m8uqJ3lf2q6MHBzpIhc2heNfWXPKnSDMAJyTDSS4=;
        b=Pso9vbonONGjM2AWEZ7RAFim7YKzI1SHT8gbHic2xU+KPfHrrohw2NH0JrYIFLxxPe
         wOUZgyKsIgSab1uk2zIwCo78N0bMeIHpMs0afcvL736AHNr2a5C4sNNTUgHhmvRypfhj
         KEeGkeRHOKeRVNO9FGPIWTcgA5wZN8SSidK1hAW4NdZgmRXt4Ph8ZtXAAW3gHm7/tx7Y
         TTf40sRx/ScP6fzhq1cMYzI49HNues5UO94lV1EEEaV2T04SSUdXZS9wDK9ddCJcaDPu
         sfBVzOvgRwoHvvZH7rmZWKYvq97nwgnq1b/m4Rx1V0xWj8YNAA7PLCstD/EobBXMught
         uW8Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro9VZbxLwIteFThCFp2nUJ1UNhNAGgF5yTzbnuQMMd5QA2XC/qXNX/wrB/WT1mfojb0seLLwLU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzur4k7t2ju7j69kc//VpdCH0YDN25EpPpL1Mq9eXrjxiOjXAG/
	VvchCmHCuwO5fk6g6osMr81z7n0KaYDyqPis60d9D5YWytfCTA5t0Awbv6ZzEtsHmn2jPXV+RDj
	XWwMCqy1D2cx2okKfq3nhamICZf/l9aw6cGrnFlapxqsHyW54DHVdvyR5/ZNrBagPZ6gR5ofkI9
	A=
X-Gm-Gg: AfdE7cn1YkMud2VP2UIF5mn1La7R9y0pNyGRDOjO4rQKDrxA84H102TfVlmTUOstPvS
	rKz8xiWU1U6H83Tn4nE+Lw4DIFKnCaZMFVSas5QqR1d0b2nCP4Fvn1NF/L9RJvLsXzdqEnMrDmQ
	RQt0dhfgLugsqdBkbKJmehvhtkWoYQ54gM8jSTuZFHT4bopEh50eoYqSjPG43La8yW91gmvWtjg
	/4Qgw5BvHk+GUQZ9tIICHC2ywZOAWVAQ46BhOFJPuL2jsGP7KLSmSfsm8xStuxo7RS+p5gk5KqI
	yN2FHmFbGYRdy15z/s4pSEqnJ1koX64XVvbF7r8lNMwQ37f9LTUl2/vV0OK0SjPeNG7ndX4jC1A
	Dw61m0UTlbrCZH5mCw/K0lhRtmOJfjt6MxR3676ucf3csd6OW915aZ7lee73hRyVmJKilpMnS
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr10975982a91.33.1784523637621;
        Sun, 19 Jul 2026 22:00:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr10975949a91.33.1784523637068;
        Sun, 19 Jul 2026 22:00:37 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e47fe75c1sm1368468a91.1.2026.07.19.22.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 22:00:35 -0700 (PDT)
Message-ID: <df37460e-f8ba-4e11-b412-4aa8b17cd32e@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 13:00:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: restore country code during resume
To: Stian Knudsen <stian@pokerfj.es>, Jeff Johnson <jjohnson@kernel.org>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260717130254.36732-1-stian@pokerfj.es>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260717130254.36732-1-stian@pokerfj.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5dab76 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-SOlkNUPErW3LcS7OYoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA1MiBTYWx0ZWRfX0zMlD3ahLSzV
 uYPQf68gY2jOZ2EEDG/rCydPTR0mGBknOmnEN7lal6aJvFv6ahgyay7RqV3t2W0yMpEISQHYeRg
 pFBc1N9PAIjI8MHOBUOldHvInxsxzxLMrSZ9Ep5NbiL1/ZPaDbUi3T1qYdDPS9DP7fOkFmOqylf
 o8QuAeW6NuEa/SGrTgrYC2DtYdOz16kVBI9CrkMHmW5B1vArOlVw/JBA3M9aqyAZcSV07heNszL
 /keLwltub65UhNOaKasX3y1YTv+puILiKE5ib6cpAJKi8iJAPOsO8I75cYHnUam+DE5chBQ/x9D
 GBTwEBddMXjzYkz9rxKd42sfPUurJpPGV1IPG6cT9uQbIToJqBPZVUp6HLXKEzNKu0wyw+k6uh/
 9DJKW2F+tBHp8bUirbdBPbc3DlWg+MGfxuypBBOaIeMNnqJ1dg39JTbcLQd74/KBt0259mxecZ2
 HHjJ9P8dBsNtZzq2spg==
X-Proofpoint-ORIG-GUID: GP6S4iMVZhNQ1N18B3RmUE1fpyAK3VTv
X-Proofpoint-GUID: GP6S4iMVZhNQ1N18B3RmUE1fpyAK3VTv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA1MiBTYWx0ZWRfX1rYICL8x4rdS
 Bm9j4tJWvziznVwj8opqL8YHdanzJlYXK9QFewoucuabAW2igc3K8B95lLFPkBXOjJBpHbgb4AC
 7eXZeNHEaQK+K56SQMnKYFx3aJMlBxQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_220040_314987_D2DA6421 
X-CRM114-Status: GOOD (  23.68  )
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



On 7/17/2026 9:02 PM, Stian Knudsen wrote:
> The country code configured before suspend is lost after resume:
> the device is powered down in suspend_late and powered back up in
> resume_early, so firmware reboots with its default regulatory
> settings and the previously set country code is no longer applied.
> 
> On WCN7850 the firmware comes back in the world regulatory domain
> (country 00) and takes ~7 seconds to rediscover the country code
> from AP beacons, part of a ~16 second total delay before wifi
> reconnects after resume.
> 
> Restore it by resending WMI_SET_CURRENT_COUNTRY_CMDID during resume
> if a country code was set before suspend, i.e. when ar->alpha2 is
> valid. This follows the same approach as ath11k commit 7f0343b7b871
> ("wifi: ath11k: restore country code during resume").
> 
> Note that only single_pdev_only devices support suspend/resume (see
> ath12k_core_continue_suspend_resume()), so handling the first and
> only pdev is sufficient.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume") ?

> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/-_iDJ_M5RrqACWB0qmtleg@pokerfj.es
> Signed-off-by: Stian Knudsen <stian@pokerfj.es>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -197,6 +197,7 @@ EXPORT_SYMBOL(ath12k_core_resume_early);
> 
>  int ath12k_core_resume(struct ath12k_base *ab)
>  {
> +	struct ath12k *ar;
>  	long time_left;
>  	int ret;
> 
> @@ -211,6 +212,26 @@ int ath12k_core_resume(struct ath12k_base *ab)
>  		return -ETIMEDOUT;
>  	}
> 
> +	/* So far only single_pdev_only devices can reach here,
> +	 * so it is valid to handle the first, and the only, pdev.
> +	 */
> +	ar = ab->pdevs[0].ar;
> +	if (ab->hw_params->current_cc_support &&
> +	    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
> +		struct wmi_set_current_country_arg arg = {};
> +
> +		memcpy(&arg.alpha2, ar->alpha2, 2);
> +
> +		reinit_completion(&ar->regd_update_completed);
> +
> +		ret = ath12k_wmi_send_set_current_country_cmd(ar, &arg);
> +		if (ret) {
> +			ath12k_warn(ab, "failed to set country code during resume: %d\n",
> +				    ret);
> +			return ret;
> +		}
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(ath12k_core_resume);
> --
> 2.50.0


