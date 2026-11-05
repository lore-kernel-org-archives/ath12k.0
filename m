Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB3606A31B
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i43fBAl6;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kTSpYcHc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4Dh5qbS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VgYh4ixCnIjb0rEr5p1qolrzFm3xYIHBCGByIyBm0kE=; b=i43fBAl66jOt6m
	5pYcs1tetTp4GDq2p936LGByTb/tzse9/6uWhsZzfH3R/TnwHwtrv0RkyC/EzwGtw8v0KF1vCWPxf
	QMsFDUz/SrO5wSVHzgSRmFA3MAVe/17IxtEHKFi6lHQGnYmioLInetuoq8+PDWkkTD2EpFTNdQ/5R
	nISRAxxp6vmGJ0NaWOE3S3+lZ+LcdQLF1sr+RHZKeS+7z9Odt6BETE1vtecpO1qEfAomOBIqmrl3I
	MyJEsDFXf3xPq7Sl7eJ2x4ZgcVW8BRDDfRA5PoNUauR0H+zl+Go2/bV59FVgRMa7jxjpOY4Rfh1Zt
	sYXnkzQvS14UzD/0aVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Ot-00000009xqr-0HdS;
	Thu, 05 Nov 2026 17:37:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Oh-00000009xoE-3nMh
	for ath12k@lists.infradead.org;
	Thu, 05 Nov 2026 17:37:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQV9k1657328
	for <ath12k@lists.infradead.org>; Thu, 5 Nov 2026 17:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgYh4ixCnIjb0rEr5p1qolrzFm3xYIHBCGByIyBm0kE=; b=kTSpYcHc1eF6HoUn
	XmCKZCKwstUxtyGwh6SmeL6oyoKtVD38v8i9Rr4+SRYSUIOWzL9DnvKFEsLlp5Ta
	lwM1kRBCCEaQylxNO2cziZJsPgoXpmwGN0teX4XFZBx/nIgW+rvSOECnvgUXrXcs
	rjNUmqxL36zWgn/k58c7eg2W8uCorc5RbbahAa7IGnlJTzaFKNQFm0ic4BMd4WYH
	MHQwRuxze2XC3eMVZT4C4J+p4pedr/hh9S8756HwSm4zI0LyDG/2k6lWP2ItJqfT
	Xl3H+g92/tjsCuUIQVEknVESVToTxv8TxYxDU8U1hIcRfeFSsUPNVe8d2QspBdIe
	p0vkWQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9fa2rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 17:37:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso3754651eec.0
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793900230; x=1794505030; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgYh4ixCnIjb0rEr5p1qolrzFm3xYIHBCGByIyBm0kE=;
        b=A4Dh5qbS9LNviXBgCHy1hrpi/AV54Wt5X+5g94me3CYsPCoiKk3i+/z9L/gmon1Q9N
         ANEprYBxSB0gztPys9O/Rutz1muTBoTrqCLP/e7ZPZZgYGJg0JLkVFAni3hagnFSs9VC
         yA5wsWFsBZNBLSnrPExCzdUho+JWIhSR/ReE0X0ZKwasBuU1oXRqrmfVdGnN84xHYFUr
         YKxz3bBpSsAqSQi4csDmjXNzRzVsebPy/W/k6xq4sqZb8SjglIy6iw13zULM6vUQLRg7
         ZWa202eUNhDTgOXEdGri4k47DnJ3+Rppc4oJeXup4o6F0Mht68gae0hycaeSGdU9MOTV
         0v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900230; x=1794505030;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgYh4ixCnIjb0rEr5p1qolrzFm3xYIHBCGByIyBm0kE=;
        b=Anp2fpN5GM2PEgCVFcOe/E+XHqj+8OWxVZ4JA8gNMeSDq7VSonwx3Lqu3BjPwKPyHH
         Zj8f2kDLA3js2Eu/XD1evqPUd7gBLXnTjnm/DTQ00krarLnSix0WBNNjrC2hKsX+jzcg
         it6UzmdiuqMs4rHiVYx+CtlphNDgtzoTewKHs+zpzGUr/VSuuXQFRAwkGZutGsDwy1Og
         ECePTCRDYavXhzCMEPN3i4i/Hv2ZtJt58DihrCsFztxUtRKqPIYknyhd9Or+U+Svh1hq
         Tf5YJCtHAubMcbJ7IHKxbLY6WZjgMusLJoXl3UvIgbSPA68gB1PyVnJhTrK0HC95DdPb
         1WRA==
X-Forwarded-Encrypted: i=1; AKwUvBwCWMpobJba8WoQ0mt5tFbUN+euJoDPL2JOV4bbp5z2K+GgeHwOXHIeglhQo/Mq1LSZ3/C+ZbA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9/thxzhleGYiYWV3RQpkhpSZmDtZBMkKLoj2PkqQo7xWUBEaDz
	9jacPZGo30Fc+Ra4LQOTebKAM6/xczPbTE/NfxmvNZPe/YVCNOQuIcuKHB2PAEDBIDDWXKT7Z36
	3H8QC3j+LCzpLjJDsrSzzc3yoK7S/XpzOqeeQcDE6OoajukhvEzHWOHbBv4GqnMDeYua6ROzJ
X-Gm-Gg: AYBFou2kj7M6cU9YN14BP0E2CZFuXN1u/jfkRtfackpoBxDfm9tk5fv36j//ErlA6se
	NSF9WYOZyaQai8CBMGDw1Lu/02zPuqwRVEmd5GFrtb827ZA+2trBQ42UxcRS833ex45vgGe1+93
	F5T6wywGxx05pc/q7E0pBSxQrZnpFQx9yXvqcenK9EUSJaYXBmUxpPixpvoDnUgsyoYiKgCLDeW
	u6ie3Jho8FyqU2jypCxa4stUR3LegEL313VDH2bGMcwJ+eDxHwMsLqbZ5Go4mXecF9PZGrsyVOc
	vofjn2o6mmDunZa1II+72mGvkvr5V7RlXggmRiVvZ/qoJbGtCJ5+PyMSZx9WCBo/VyancP0W3DU
	rjxhwKlH9hPAbjZZ81fvNXHZDb8iRnw5t+92LTzhmKwHWULhqQ1b7mWUbLJIlqMigoVQML4FmE5
	NFVDZt4/sTXNSBvB4=
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr29719438eec.37.1793900229523;
        Thu, 05 Nov 2026 09:37:09 -0800 (PST)
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr29719382eec.37.1793900228538;
        Thu, 05 Nov 2026 09:37:08 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm22087653eec.24.2026.11.05.09.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:37:07 -0800 (PST)
Message-ID: <b780a16d-8302-4f54-968d-e411bf12942c@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:07:03 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix potential SRNG configuration leak on
 init failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfXyUDqE0uHtwoN
 QNYkSjtv5pKCBUj6bG2nH8lcq8XzOBVhoq+p2CZSEotiv32u7wHPNx62PaYchXAjjn227GSU+Dn
 B7JN7+gxspqdGW3/31vv2bFQPy8RoVV1OzFyma2GJqeudlZANAxT5YFrC2Jg5KQWHBvtvXt/WhT
 3vYvb0QM+tH5X/RsVxVSJivMZbLdyeHqy9CoSJE9LdS4Q8McWzJiSyjdXBCj5nS/wzYf8EI4esC
 tG5Jvz14/4cmzmE+3in+Z5pYBf7pisJPh7wm0skyMrVz9bFKKwCxiRG41Njunu+lMQCoSG7ZmIN
 TEvc/RE85LOH+oBIvA9eUeRj66rOy6kzTQM4CPpzoeJWt7SC/FIuIwzeU5JzmJuq/M8P/zsbvrW
 cs1QUkP1qREUaOYjKIwM8zUc6DQrrhbIGoVUkknynlsFPheJDE2JUsOkv0aR/BnUuDVeO5vx8US
 pNO6OASuXuFDk7PaTaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX2sI39klk62di
 1KeARujWQXKOWuzhz4bqOZ3Yu3INmYAzMg9AVffIgbgmgpHg6CIbktNX0qYbs3HErgC8IzVRQ+r
 N4AauxEG/J5SotrVIdlWTgJJJHO4hxc=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aecbec6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9PK0hdjxVsNkJ1tq3w0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 6qMlgFJtaS7YudHKttXMprCyQZCDzwJs
X-Proofpoint-GUID: 6qMlgFJtaS7YudHKttXMprCyQZCDzwJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_093720_594285_854B0B62 
X-CRM114-Status: GOOD (  16.79  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 8:03 AM, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 Clang W=1 changed-object builds passed with
> allmodconfig and allyesconfig. No hardware/kernel runtime test or full
> linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
> 
>   drivers/net/wireless/ath/ath12k/hal.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index c0c3d2f047ef..8dafbe44df38 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -744,7 +744,7 @@ int ath12k_hal_srng_init(struct ath12k_base *ab)
>   
>   	ret = ath12k_hal_alloc_cont_rdp(hal);
>   	if (ret)
> -		goto err_hal;
> +		goto err_free_config;
>   
>   	ret = ath12k_hal_alloc_cont_wrp(hal);
>   	if (ret)
> @@ -756,7 +756,9 @@ int ath12k_hal_srng_init(struct ath12k_base *ab)
>   
>   err_free_cont_rdp:
>   	ath12k_hal_free_cont_rdp(hal);
> -
> +err_free_config:
> +	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>   err_hal:
>   	return ret;
>   }
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> 


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

