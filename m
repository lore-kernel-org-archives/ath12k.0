Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B55C5DF81
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 01:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ty45rSCduvncTI3R+4xQH3a4ms0gZDBpX8wGB7Z8aYQ=; b=EqZDe1bBSSUDQ6l/F4pqLEplK1
	9BvPyTnESdz7gSyYD0s+gPdZZIjgPjAbm1m2w2pV/Ng97ktsd4sWNhNsQ7S9PQBz94L7vjvysZ579
	jOQKnrLyDI8zpErzl4NYWayrBO7JgfoShiQLcGKinwI7U+8nuYUy9mrPKXKxHYPXFFO4rQDLUiaf2
	MCsG4iPhCELmdStBhWWMFXYQu738r63YyZCtybAx/uTitr1Xkzfe9umS5m3NX5AxY4VK5k2okautY
	hkv7Ga0OGNs5qo/vLc1NuOb78HvjOOXrQhFVglHFOL8Bvue+8Bzib8y0WvbzTXzElu5rOW0Hp6Hb2
	t41HsxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVS7-00000008qaz-3S4W;
	Wed, 19 Aug 2026 01:50:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVS2-00000008qaG-0wJ2
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 01:50:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67INlS1Q2699731
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 01:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ty45rSCduvncTI3R+4xQH3a4ms0gZDBpX8wGB7Z8aYQ=; b=WXIqqhus/M8hg0SX
	p63atbjJrywGVM5wNzBIegXnhZGmD9eCdtIY4XZow1Tr3e052TKxD21rbTehjTWb
	uerYjWxqcK6gpWOmMItbhAaSi/RHOshWTsIsoe0bdMMfHseN864zRNnZC3h+Y5Qv
	XVi+A1msJ9KOnfZhWLRzsPmId37suZ/yzfcJi51d36Y+RXmendUFFaCnlOX37/L9
	eqQFFAPD4ppJ0bgK453XM44e1+eWVf6j3Y6R1FbH1A08tMFWRQaf29JL3Dk/fEeN
	PR6+Ih1MPu08VWTw+WgfD7wxAcyWReOeO0aWjAZ3ARk83YTcHAA0KH43nY3SfjV3
	tcBOlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfn8sas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 01:50:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so711243a91.2
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 18:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787104244; x=1787709044; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ty45rSCduvncTI3R+4xQH3a4ms0gZDBpX8wGB7Z8aYQ=;
        b=RFjykd/ZMi3Y3HgdGwfJEmglhc6ISCpfS0mjLEq+pbfN3F1l+1hqQ+7pmu8xwG8W+p
         LICCOC99mretf7XCeTjW6s0Qn+fSB2KtC2DLmyNS9GkyjayZZPW9MU3vz5Ogr3PBdP29
         BDnUwdHIuLe25vY648cwEUfub8ji0IL4dugacCRnqR2DTiDaFgGvTZq8EdCT/Xc7MK3W
         pSvICl74uh2ImmyknUUcVDi7T19Lvm0LjAPWGtHq1qmdikCRmF6nty/nrEqcfUlAeGiX
         06TWIZe0tgeSPuguwU/dDJ5bChOr/z1wIEZ4P6KJhzxSzgJh/ylixZGeHcTQ8slU9/xU
         hfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787104244; x=1787709044;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ty45rSCduvncTI3R+4xQH3a4ms0gZDBpX8wGB7Z8aYQ=;
        b=BfNrLOKN1lflFbZ2u789AdDuZ/3QgO3gx+EkmAdGcQCdsTYn/2+r74R75cCB05Ex+f
         3s6dbu9ipzhToM0SQWTqu923m1Vzm4cuGX+Z/k5kZZpLnqbeBIcQcDNdN4d9+KgzZJiW
         XkmqCJ6Knq0D+sbH/jAG2dIo+3SsXDGL1dxIppjIwJyUWpM3QztIJAQPiUxNL0+8IOQT
         elie3mgLwEKqRLZpJYWjfkCI8wiQ5+EHTxOG38SrS/rlQ6AUg7SDk9vYgGq9eeHBn5Vx
         OgrVBnkKi48LXmjaXRLTtN3I007YVAy/28C7cRTPbP2OVMGdQqBGbRPz0EJrnUFvMGs/
         d4Yw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2htgjCLVjXbOHl+rpQpcx14z2ZYm77uvmKBxQEPMKQtL6wjmb6m9UA8FfTkXrMm+OWqIho3c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz04VfzjNQE/1DLPwO/HEDzqa3RB4F6SQgMu0iXq9SX0qjKGfKO
	uSvTfoPJTOMOkwtMLhhyeqMf2iL/48bTveEYiJfIG52appx8IxJP1Xpsu8ryYo9IfRhBBw3V3MD
	NrrFxRleT1vFh6hLyX35Gs/Rgk3JkxcQDOAhe/RZCIt2xglyXk0NpTrq+LjBH4Iva
X-Gm-Gg: AR+sD12/KPhlek5FK0SDw9PVKdGAbadd/mD3cadHjZUZkAdoFahWKrPlbQ2HyzL8gLf
	di48ZG4q+tEl6+/w6ayxtDwHgPOYybrnbZyRb6pDGW1QA05E2+HxAAwsxk642jc6tuWVh9B6Qbj
	nIy4jZF0Q8+GTCvsAx2cv9Cs8PiFjgler1Bt4iHTl/LXFYjoOeHqqup9kIpHk7WsSnhbnwAbFwi
	XFhkhE7pUKgSEGc+R302YnY7KT0LUic+Rlur3beSm5ScPAdxy87lufLwROSQBVL+8zGn1g/TqHY
	K1eR0IIPnwDExERrrAZ+jgN9Ld4Dbt1+8hWzVnDu1jikoGo8hl/F3Hjl9DyJoM2aq3jYl2kGBHw
	G5z7VahebmLzHYwpCMLk3zla97Bqs9zuofm12EBRqXYJysY0fdz+a0CSR8xN4At0MBAnU0K6AEg
	==
X-Received: by 2002:a17:90b:50c5:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3958125af57mr2184246a91.1.1787104244225;
        Tue, 18 Aug 2026 18:50:44 -0700 (PDT)
X-Received: by 2002:a17:90b:50c5:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3958125af57mr2184144a91.1.1787104243724;
        Tue, 18 Aug 2026 18:50:43 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb17f48sm764718a91.2.2026.08.18.18.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 18:50:43 -0700 (PDT)
Message-ID: <f4f1e338-1206-46a1-bbfd-79fb768dc382@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 09:50:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: wmi: Complete regulatory update
 for dropped events
To: Konrad Dybcio <konradybcio@kernel.org>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260818-topic-wifi_reg_fix-v1-1-18c7c289e528@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260818-topic-wifi_reg_fix-v1-1-18c7c289e528@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a850bf5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-e__KoK9oonTYIwy9uwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: cdizv3jFowQipL-5AD4o9lYsN_R76fap
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAxMSBTYWx0ZWRfXxhJaaa50wNOm
 yXNOHuuCFb7HGOaPhNyocfZ6MAqdkfAWB9OinnUdKyTDP1KeTVLkRWd9MJUtgpBJNZqjhN56Z7z
 eQkHYn5TqkxYA3EsUBcOj9oHR1Yvv0E=
X-Proofpoint-GUID: cdizv3jFowQipL-5AD4o9lYsN_R76fap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAxMSBTYWx0ZWRfX7EGT1yhHcybr
 W7Q9fgrQG2zzszxFtQyDP9V3ADlOnYNHPhpR8iByhmxYsfgoIBypcAVtooqflsmrRxGZrEeuL3Z
 wtKtklmXAmoYeKIeTbJF5Ht/5t/Wne5lN3C5Phca/NjA1H/L4M8UGvxhzz/d5WfXWXaNTBXrAob
 RXIxHIxZGHTxUMVSrfzhwZAD9l8Ypg577fjJVoXMez/9QZDLWdVj9PKrZCQhCgY+ChNlitiA53J
 m8Qfwoa0rLTEnNcXzO2mGC4b8in3OVFITXfzM7BOnuDBHc5xFb1NzNWlmVxbdSD+E8L8GlbJWGP
 J54OsoGtQoHU9ZkUBaCWMsr1mnjo7COz1dYW+zRqgaA6hZVgSIgk6DdEokMBjZ5RVhDbapSPbDa
 ae6136DwsLPFaflqzHGbix5d0WCjj3cD3yOB1PLEKVK7BWRuGszkJvigTFYp7CToSTc54iKFszf
 8c4pX97BUJTMhJZqHXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_05,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_185046_383322_29B153D9 
X-CRM114-Status: GOOD (  21.48  )
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



On 8/18/2026 10:57 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> If ath12k_reg_validate_reg_info() returns STATUS_FALLBACK/DROP (which
> are not fatal), the code then jumps to mem_free with pdev_idx still set
> to 255, making the following completion never take place.
> 
> That then results in repeating "Timeout while waiting for regulatory
> update" messages, as observed e.g. on a Glymur-based ASUS Zenbook A16.
> 
> Fix that by updating the pdev_idx right after the actually-fatal case
> of not being able to extract the reg info data is ruled out.
> 
> Fixes: 906619a00967 ("wifi: ath12k: handle regulatory hints during mac registration")
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index d5160af60e00..4ac78ba6c790 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -6975,6 +6975,8 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
>  		goto mem_free;
>  	}
>  
> +	pdev_idx = reg_info->phy_id;
> +
>  	ret = ath12k_reg_validate_reg_info(ab, reg_info);
>  	if (ret == ATH12K_REG_STATUS_FALLBACK) {
>  		ath12k_warn(ab, "failed to validate reg info %d\n", ret);
> @@ -6991,7 +6993,6 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
>  	}
>  
>  	/* free old reg_info if it exist */
> -	pdev_idx = reg_info->phy_id;
>  	if (ab->reg_info[pdev_idx]) {
>  		ath12k_reg_reset_reg_info(ab->reg_info[pdev_idx]);
>  		kfree(ab->reg_info[pdev_idx]);
> 
> ---
> base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
> change-id: 20260818-topic-wifi_reg_fix-a20c9256c5fd
> 
> Best regards,
> --  
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

there is a similar patch [1] as part of a series [2]:

[1]
https://lore.kernel.org/all/20260729-ath12k-regd-wait-timeout-v1-1-504aa6e7e93c@oss.qualcomm.com/
[2]
https://lore.kernel.org/all/20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com/



