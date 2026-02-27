Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58435FD7F91
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0Lc1eqGejEKqbReUge3UeZ1gxHJB7/DI9+f5ViN17s=; b=gqUrxMNQd0xBJY9SNXxwwNSYjy
	lOEKwOCc6iHxTT97k6Px4S6PRV8fXAdVVu6pu/on6fmYxhC1+Ass2La9NDQ53Ao6U182G8Vcc9WPC
	KTsrzVxbX+sUVbTY6WkP0VEOziTAw7FqI4OXJNk+/bm1TTlwWghUkiEpEzJzQOtvrYByDTp47xOyI
	Ft+hKYiVlmfKxQ7qULJ2JM1LWaX4Y8Tj8s/Q8AwfXrPEscXTE5XSMgOjiM0lU2iPbEo1A8J95RDDi
	G0pOtlG3YCAltvRrtqq2p4ixFcfR3VsnBitBCfo0xkPYeGUpRW8gexp68S0X9VliHtLge2sdTEGXd
	nAdxPQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvC4-00000008FAU-0BGR;
	Fri, 27 Feb 2026 10:35:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvC2-00000008FA8-0YSl
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 10:35:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RADC9J2403004
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0Lc1eqGejEKqbReUge3UeZ1gxHJB7/DI9+f5ViN17s=; b=QdNQ7pkA05zumX1s
	TQ4WaOmA7RK5Qa6zgvmjAGxmnVKYJ82djZlbHt+zELrTCEKQ3ULBvWUfEug1vHoD
	nSbE9b9WGluI/anv/aua3LdhTSu8LGP4K6gf7DVelNvibMoAYi6HkcUkhIt4D8f6
	ym1cWCZgHXlwaiSu7q4gRQhTcyjkKnmdbQXzfSX9oxA/k3Fuq5VTj4y+2n7oUYoL
	ZKSaPeWQ8E+wbU+C2JMwf9KaqYLvZxLd6rQQZRCT6a/yLAcjjFsvPCbH3M+8bUXZ
	gj7tWR9vw3wSbiq+3C6J3SH8WAcjvrv4JJdchblzbGuQPnBLnhJBR5LYRDAXJ8sT
	tjm5Ig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23adeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:35:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c72d23dfso9701975a91.2
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 02:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772188532; x=1772793332; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0Lc1eqGejEKqbReUge3UeZ1gxHJB7/DI9+f5ViN17s=;
        b=kovoaq18noCc7DdLRmpEneGaeBbRvn97k6uHJODIE1a06ZiBSwUDkMOUXqcXqwpIOl
         V/qLCN4GZxZIM/cNw6+p+qB2vq+lOJMGq/qH2eFHxmHZN3JfZXvOGRzF9eE4lmGylFOE
         4GuB1NkkKjYyaSGXJQ+UaXAh4k7C01klBKw4Oc8NYfa7bo6t+NTt1G/inG9/r/I6UGXW
         KGUtszSM5k4GM6t4Z/0/MlVWsU8zIsThY7YdcW4YRZgeJhEEZsHvQB2wigYLwJbzvtjj
         IXOuUQTl0zD4jHQcjHBUB7C1lAExG8BBouIYQsYAicF5DfhZEqlE+EK1ZupzHM4vLM0P
         oZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188532; x=1772793332;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0Lc1eqGejEKqbReUge3UeZ1gxHJB7/DI9+f5ViN17s=;
        b=SmBOidGgp1NX9oER/M6HzRMZE1htibP8gigA8VxKvtxx6ekjq1a7kom2Dj0MWqF7iX
         Ljq78BQ8/GSmQ1qO7fROrxrqmVgXoSuMMCq8I5LC1zNO5E3g//F3KhbE3NGMukDS/Tff
         TX2Yau/Z1TwcXSzHUQLIvog/jmOVUczbU4Pc5cUmxc8R+7tOzN5cZ19/vSipmqBGZw0M
         ANxuVgOIqih/GHMxRj68FBB1tyOZn8X+Ag2jtxnbBqE2SQQzTZeI4/5hBGuR/YKSkPu6
         /51hOFH16jTeQTeGDqnr9clP70b+hb5qNVhbXxhxQb+SG6OgNbAQgLG6aSso/pJ/LUey
         XukQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbXM2Q+SnFTxdcX3P4uLSfpcs8uBUEexG1XgkM33Px7kp+e2Wci5hQoEu8oZlPahMS9s5eWlg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMoFkVceKhdf9/D4jbQceNJnlJg2DVpOaLX3IH6wU95flIAIkZ
	JV3/uM7kBf7DIZrVF0b/W5S7yjBM5wAn6yJGRvyNraN5M6C8rtkriA9/hFXMVbqYtDa7r2NTbhP
	bVp/FVRq1pcOkVH+8nOBjFqY27DKWwfsQmjA52bLlIKvPnHsDrVYGCtGKM/p5s5ar
X-Gm-Gg: ATEYQzx5ZElJkViBIAQ5q9NiJXpHVjC19K4WaXnA1j2JQWgprEa05EtaOj9DfLQ9wDd
	irqWb0u8xwQQbTIM+mrNX56pyGxr83CmuFxghDv4D5rI7rzMy0p23JOm4rBuKLu5s8xY44BIuKK
	lfao7wQU0tAPNfKCoMCcdiHH1gJWYK++b9yp9dKEkM2MLUjjAq4VvOeXkMgEMCRWmxjZeVSpHwq
	6vCztk+VnHnF5ZFlFiRgsgQ3l6N8jpEIRTeQAiHTjjH8ffa/DbL4SD51g9J+NvRWjyYtJ//GAS8
	5tdEOq7KX4EFuOr9zw4zs+D4FV6xRXxWIZxw2XHAqrfHoOb93BV6LBdPvJAj4p9ZfGK5aGPEQUb
	J1df9IeoDyUy4MHq7rOn46YQ9r8YN+rQTbLjAZu3Gkiwz+AFyN1HTQkOXg5q3yFSuJFA+B2CEUE
	rs/zjrgrvutwChNS33MA==
X-Received: by 2002:a17:90b:3501:b0:354:c7f8:6d7b with SMTP id 98e67ed59e1d1-35965cf8152mr2475057a91.27.1772188531675;
        Fri, 27 Feb 2026 02:35:31 -0800 (PST)
X-Received: by 2002:a17:90b:3501:b0:354:c7f8:6d7b with SMTP id 98e67ed59e1d1-35965cf8152mr2475028a91.27.1772188531067;
        Fri, 27 Feb 2026 02:35:31 -0800 (PST)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3590158f8a3sm8044969a91.2.2026.02.27.02.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:35:30 -0800 (PST)
Message-ID: <60467511-80a7-4c56-8e6c-04b2f3eb971b@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 18:35:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Set up MLO after SSR
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
References: <20260227041127.3265879-1-roopni.devanathan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260227041127.3265879-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jYj6OKayk-dNw17KEiDIDkBBn7M6WblI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MSBTYWx0ZWRfXz1TXk/Q3tmrR
 T1qCMYwTs+ZBWWp6IEkfSovlKKp1pHbN55RFrqVyywau6DvcECWkIXG79qGXLuLowyHunfJM0eG
 AT1DzBjJnMNskd6vQFpb0T9SLr/uUI/jzoRcviQJLOtiF8Y79zGCj0tFvi8q/bdojR6U4syxtoL
 ylk/cBurW5LEnArQTVLGGJTIUtKBhHWVvZQyahlQ/2ghFhp+hGHXd0envf2uvVv5mCOAcGj+DbW
 pYGCUjKz2N8CZpNH23ssextwhm2+6GDpSJtH+lRW0CJOLww7MW7TPKMOHPL7sKHjQOIlueWqhFV
 jYAJLhTLoCdqrWzPPnJq6wvYm8ZtIMgskRQFgMT2YsPaQCnkj+ddOmoPlVCLrvdStpfNJvXTTko
 lv4AgLvj1/WoyTIrOJ7vQGXoXuO0n0y/KUbj8UPATEGID/uyCvamsfivulxeVzyytXswehU2kJA
 Kqk7NGsEJxLGTrZFUjQ==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a17374 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=X4JEpTBpwg_adTgisIIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jYj6OKayk-dNw17KEiDIDkBBn7M6WblI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_023534_297312_83A7BE1E 
X-CRM114-Status: GOOD (  19.44  )
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



On 2/27/2026 12:11 PM, Roopni Devanathan wrote:
> From: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
> 
> During recovery of an MLO setup from a core reset,
> ATH12K_GROUP_FLAG_REGISTERED is set because ath12k_mac_unregister is not
> called during core reset. So, when an MLO setup is recovering from a core
> reset, ath12k_core_mlo_setup() is skipped. Hence, the firmware will not
> have information about partner links. This makes MLO association fail
> after recovery.
> 
> To resolve this, call ath12k_core_mlo_setup() during recovery, to set up
> MLO. Also, if MLO setup fails during recovery, call
> ath12k_mac_unregister() and ath12k_mac_destroy() to unregister mac and
> then tear down the mac structures.
> 
> Also, initiate MLO teardown in the hardware group stop sequence to align
> with the hardware group start sequence.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 9dca1a0af73e..218c0a0c9699 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1017,6 +1017,8 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
>  
>  	ath12k_mac_unregister(ag);
>  
> +	ath12k_mac_mlo_teardown(ag);
> +
>  	for (i = ag->num_devices - 1; i >= 0; i--) {
>  		ab = ag->ab[i];
>  		if (!ab)
> @@ -1134,8 +1136,14 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
>  
>  	lockdep_assert_held(&ag->mutex);
>  
> -	if (test_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags))
> +	if (test_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags)) {
> +		ret = ath12k_core_mlo_setup(ag);
> +		if (WARN_ON(ret)) {
> +			ath12k_mac_unregister(ag);
> +			goto err_mac_destroy;
> +		}
>  		goto core_pdev_create;
> +	}
>  
>  	ret = ath12k_mac_allocate(ag);
>  	if (WARN_ON(ret))
> 
> base-commit: 20ad0d58517073b3b683ff786c65dd3142321707

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


