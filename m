Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41127CA6015
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fF0XFpFenZbIc/Er1V55JyxWsHMotKBuTpeuIL22FsI=; b=FtvK/TpKdiHtRU9WqawZS32J15
	1Em6aTY7+HPq8iNYDdSa7cnuNpH5uqHC5uSgvSe1B+XQMdqhN0MNMXS8IisGYiJSzCFr96Z5dCjGu
	MzRhkJuYHxNyY2GTwILsDkLxWPWzz1NNTVxZwiFyGqvtd3gwRrz7OanaUDKanYaaoUFITS0BSmzN4
	E+cGUE9qWRD3VBMmJxEinCNLDIXn8N6xVGonrE4DfasI6s3t2t9YyEvciuZVzb3T1GkhD5xZGcGhq
	2ZemX5v79og3b1YSqX7pUYIap4l3Kj0fM40Phz0AqK4OxWpkINd3wNKwK3ldLVHYrnNBlFG9rr1ES
	j3rbkwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBqe-00000006TpO-3YgC;
	Fri, 09 Oct 2026 14:45:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBqc-00000006ToI-1JbJ
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 14:45:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKKu52916638
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 14:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fF0XFpFenZbIc/Er1V55JyxWsHMotKBuTpeuIL22FsI=; b=IikOdLpYuSsGUZmZ
	A8gPH5ms9LeZSRP3WGtlQSZW32lYme/ggWnT0zUvKiSJhP6B17DqeUR4sg0T+fge
	WFMHHk7VZz52+CEjfDH13IqVYU9O0bKfiuayyEgyD09RxxDHZNXWve09JTu48aBV
	T6/64vM2jx8CcnupapZRgs2S84Xyvd/AeVxN/gcmSnLCOY6pFq/66rMte4Buq6rz
	uD863wyso7o/7iTr9D4jXE3rpj9BgRmXRGY5a7A1swGSnLgVouz8Slgfot0l9AXS
	GWKb0tpgeofTnfiSmmXaGI7ccVyD85kWGeCFB0Jd1/6W2Y49lwC6KVm3di+/ouP3
	Lo27hg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufttdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 14:45:21 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-86c3a053d9bso59808597b3.0
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791557121; x=1792161921; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fF0XFpFenZbIc/Er1V55JyxWsHMotKBuTpeuIL22FsI=;
        b=V80QZEZywiOjQ8hZkQ04btWE9ANvotBE7Z6y0gOyrtVv9CW69xudXYYMwyT1Mw823W
         MvFE9QhjPcpmD7cXZRq5JTS9En7kaHfEvqEuHfgzJWlhH9v1TR99cVcu6w7BjOaoq1Do
         wcIhEdvuZp/7KaX7R0AnEgVAShVpguW5l7olCJl0CMTyTO4TjqURCfV7nGd0QSWCCWqk
         FiOB1TjVgpe7HLtmerYoP5sjSx6hkUwq4KhOUQhqHioNoE0VZXjcmtCXo4vXdQHt/AJ3
         10AsIC8KSuGJTY+0PFrqprCuvxtgcgc90mcHqbf9d96fpW+puO8rXuZgMjaxvFHN2VLU
         y1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791557121; x=1792161921;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fF0XFpFenZbIc/Er1V55JyxWsHMotKBuTpeuIL22FsI=;
        b=x7f4+w1eq8nGbvCZM/EZ4Q6xMo/P4HPFAOUmKKu9T/syYXpJK3A8qajR2yCYRTmdOh
         gg/LvrTbAduUmlStlsKPqIxy389FM6IBxXa33Djg2qkzVb0m+XknKBtMEBQ+pbJ1j9z9
         +neEdWfAZnH0CAihZmJ8TYzGr1v61mGL08LZfByRtB00dtiM+Hm7G4LxcLtHyhAs0ND9
         16H5YBwIkkw0D4kXKGuG1Qjofb1QVnYZVkf7ZoziApXqXjm5llyVRQjh9Xhq5cRYMKUn
         0PCFfoLDc681EUnCRTLyLI8gzj+gDE/ALzYGa7zHe4aZZViZUwFhy9D4gW2V9zR2in/g
         bWYA==
X-Forwarded-Encrypted: i=1; AKwUvByQuzQuwe2EoFSQXuJazCdPOPlZSVQboAWUeWRDU1K6L3WYu43BgDbf+Mv8iRqXC/hcKDcy/k8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJUlnsV7H9Dw/KkCQ2pRtgc0OQr/e9mSVkYHmCXMwn0ri5KtGky
	X8z+nEcLaFpG92TFOM1mRoh/byFjQvLpha8cMI3F4tfFV7F+MM4K/a4oVHUmx7CIwOtPbZnxiUs
	UZa5FvpFODl5b02QDl2SQG1MISwOWrp0hMV0ydrENBVCuSDIqQojKWy69lt8aG/Zq
X-Gm-Gg: AYBFou3uZp++dIPeqDj7+eRPvIfDZWFCx/9gZBE0qYAYF8fwnlDk0CnAU6gZBcCSl3A
	QLk7JMgg98NUB6+ADXXR7Q4aOrWxuoGFNWdG6bCRO0GtCg5z5fvu6iso6iS8GJItZMHIiMajGOp
	wxTZrgY73Enei7X+ZhYtgGDS9UvN/4DV3xi6+QMb6pqJPTqz4uQv9P4fUHLKGqVh9k1qAMhbKEm
	N1G6cnzy3DEVusSeBz44moTbQgdrNaAejSSf6Sg7+UmFispvLHGHEd65YLZ4U6vW7spPhEBwNF8
	2S/HXZgAq0sn5y0h56fBh/wSHbc2zfMA1AG41REq5B9K1cXF9PiaWya4iBTXzPgvfHP/4b1QZWZ
	/uiIkHhJARbCpeyhd12OTlgH03BHKEBfN6yD7Xs6pG5Fg9v1oUDiaxSaBWC/Q
X-Received: by 2002:a05:690e:b4d:b0:677:cf4d:a932 with SMTP id 956f58d0204a3-67936a08e59mr668004d50.63.1791557120556;
        Fri, 09 Oct 2026 07:45:20 -0700 (PDT)
X-Received: by 2002:a05:690e:b4d:b0:677:cf4d:a932 with SMTP id 956f58d0204a3-67936a08e59mr667995d50.63.1791557119750;
        Fri, 09 Oct 2026 07:45:19 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356deec5sm882429d50.20.2026.10.09.07.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 07:45:19 -0700 (PDT)
Message-ID: <0a30b3a0-6428-46ae-8e78-50cab4d32591@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 07:45:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 ath-next] wifi: ath12k: Add EHT capabilities to scan
 probe frame
To: Gaole Zhang <gaole.zhang@oss.qualcomm.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: gaolez@qti.qualcomm.com, miaoqing.pan@oss.qualcomm.com,
        hangtian.zhu@oss.qualcomm.com
References: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8fe01 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CFmcTCT05xe6HR7D4UoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX2F8orl91+5xe
 GQAi5Oy4BtdsvcaIMJbfd8OPqSKNtnCSQOY8UxKypv/UBoLY2EASBnNO/eeEvi/gVnljHEzuxh9
 9su+PvvnFXmVhxZvb+D/1Xqp6Ic6tVE=
X-Proofpoint-GUID: XsQcBtBBaaMNXKEaJvddSbDDIqDi1yP0
X-Proofpoint-ORIG-GUID: XsQcBtBBaaMNXKEaJvddSbDDIqDi1yP0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX6nSNR+Q4nIi0
 6k6NRc/75ZpYAOwxFyRzvNHv/s7vuBf28RchiRpgDZmHwtvmusmJ6CM5ZksVdNralFWXOoGPvtp
 hK1Wr8EwCLXVHH1p57D/hHZgR1Fyx0siJA8gu/u31c4PoQORuRG4L3Q/7JmnPYei0oUAFN/yK+k
 ZKWrJ3aXRVccRjOqrtc80EHL+6ovkSKbdzz+ex1Y65zRejAatWfa4TxwBZQbJaizGSE3JJXupcB
 P0yYDEzplWSh7hQy8bGCQGr0wPCA7Dw2iVh+iCdB+joaWVRHDu0tLCydYmY0tvYEb+gQjzWUxoT
 rhK0WyXC1DMGlpZLyhjDSc5qI8O6+nFNVWOZO3b1udiFzbyIse1hrTwOGC2Aoi2jKc8jLq4sxnX
 GxBTSebnPrl5P0i1NEVLQrapvY4bnyS1jkrjdrs6xNqbGWs1l2Mw8e2318IHf/EQqj+k+/pYbET
 0kjBfJCUq+4wBpxUORQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_074522_361797_3A88A1C6 
X-CRM114-Status: GOOD (  12.37  )
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

On 10/9/2026 2:55 AM, Gaole Zhang wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index a98fc6e0699d..e7373a523dc3 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1394,6 +1394,12 @@ static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 radio_idx)
>  	return &ah->radio[radio_idx];
>  }
>  
> +static inline bool ath12k_is_11be_enabled(struct ath12k_base *ab)
> +{
> +	return test_bit(WMI_TLV_SERVICE_11BE, ab->wmi_ab.svc_map) &&
> +	       !ath12k_acpi_get_disable_11be(ab);
> +}

my review agent notes:
### Style: `ath12k_is_11be_enabled` placement** — `core.h:70`

The new inline is placed between `ath12k_ah_to_ar` and `ath12k_ar_to_ah`.
These two are a natural pair.  Move `ath12k_is_11be_enabled` after
`ath12k_ar_to_ah` to avoid splitting that pair.

No need to repost just for this. If the reviewers are otherwise ok with this
version then I'll fix this in my 'pending' branch

> +
>  static inline struct ath12k_hw *ath12k_ar_to_ah(struct ath12k *ar)
>  {
>  	return ar->ah;


