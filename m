Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084F1606A332
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d10jGJj4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=guQVGrwx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cDgwY2jZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O+iTB2sWcEPdjLUfuDanELNYMg3s5WE5cPIFIy2cSUE=; b=d10jGJj4AsIryT
	kAFdtKJG4N7goYz+ftQBfZQayUftEI66JM/jIkG/3XrnBZRO2A7VPXWDzveaT9twuVil6sxaH+Rum
	Y3PvxmRQwDjjwU+za2SWwSM+++n++ACJ5MEGpxK0iCWXMT78nKHuEnVERZ3RalaHUGguEHYjzAakZ
	afPxy3vltk6d7pESTQb1uvalI/JsZRoW9ApDmVqtStdFXlGD+b55dOxlphEITg9qRaFJ9uHlJD7Tb
	iuZvEronriF+AjsepKu5jmSX5N9q2NWX/zJCojvV56y20cZgPdiAME9uVb6+M0UJkJIyEMybGjZQX
	IH9AFrsabmqhtT7O1ZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVDy-00000004UDx-37Gt;
	Wed, 04 Nov 2026 07:15:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVDv-00000004UCw-3Pb1
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 07:15:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46r7Tg193801
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 07:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+iTB2sWcEPdjLUfuDanELNYMg3s5WE5cPIFIy2cSUE=; b=guQVGrwxqr3g3k9q
	HPN8kLpq1G+oRg5fOfkBHVmzFiXk6V5dtaWw83j274PtCzRs8ZOK4oN80lHN9NWf
	6dEsKVX0OWLm7bfntOJ2I3exFjhbH9jnVsBJhiRJUfrI5/tdOlPzpVVfUJN0IU92
	z/9f2/9uSd6XWUSfa4kszrGOAq6zpwqUIBFAMd8wLfc3nj+MtuOt+PwkggqfPKef
	M/3VaauG/WroWIOBagsApvmCLSRlE7o0AC+OMiiKvEwfGE1+FLUPm271Ln05sp0U
	25y+TXYNlyt2xIDDFCry9C921LHok5TIEIPuC5Jik2f3HuHXOYnh1jciTHgRUcWa
	ocDu8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njh7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 07:15:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso463004a91.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 23:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793776555; x=1794381355; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+iTB2sWcEPdjLUfuDanELNYMg3s5WE5cPIFIy2cSUE=;
        b=cDgwY2jZrdc7z8f7z8zN+1IEHYTTMfVJfxvoZhob51G/mvCAFacJmd3D3tPsOlaSaL
         ObGzPua/Gb4RXnOgCSc1G7QFye8J06H3JCFOUZzp7ODmLI6AuXYr4wDtlDO9xzoTFJxk
         qlIU8CxzqtVBUpMlBuwrKXkA89wnY1X5uT3t6dZLEnQg5oJWq/9eAKsmoTlTeNp36GRl
         M5rdD4lHKmoQEZW1pemL+VCobSkHmmTpGUYyvm2VO3snzRMtPkpX2LAkTCtWLSttKqpi
         ODldfqdNf1sQywdz8p9Fq9MefyvPz3V+jPloITtpekz/5NQAhND+KHE9trMxFhtZy4aH
         Lucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776555; x=1794381355;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+iTB2sWcEPdjLUfuDanELNYMg3s5WE5cPIFIy2cSUE=;
        b=HOYS2tIbW2zbJbh7Q00uUG9agnZFzAmq2joE2Z6oMs2Eg1JFORr+86MWkbC9Q8f+X8
         uNZr9zvwXSAw/nOulNPwGlPJC7tJOSpK2NuLY0MYiBKgh6lm+wH7zx2ZwPkwf1RsG+dT
         Y8Nl8tWjRjLzDlmUhfJVqWRf39uG1W2yp22bhD6D9RrCLavYGpT/+Z+aqTqUCA/+s57r
         MM3rffHSdfry8vQxI7cHZuRQAqG0qGwDDTTmouxVRAqMHsrQxsSL9J0N80f0rjozPYb2
         4jQdEbFXp+wU9lvMLmLLwDEkxH7M21hC3FFk6NIS1xrinJivQK2UuN8d/JZC9pLflkXJ
         OhIw==
X-Forwarded-Encrypted: i=1; AKwUvBwZgVjYE9VCsXatp1c7CCm/KqiGaz3L1l0OnQHhkkldMZcploRlu2eyTMCEL5SiJqqP5EBA08g=@lists.infradead.org
X-Gm-Message-State: APuU4Z8SwNKUvvP/YglD+uQBmbO/vTOS9r4yCMbXO/PXtNfvXMSksgVf
	4Ng+/GLTH0RIlvZIp8oWSUZy9Bd1Dy8AtpA3VFw3EwOuw0uYONWe+V4btUwSKyBIdr9ASGuruP/
	LohcxnJ6tM0fPUjmld98qGaA2Aoy/Xw3xUEqSnnNfjt+Yh7JRIKtnkmtU5g7ktkV6
X-Gm-Gg: AYBFou09iT1F0cRXaTS2fNO9o47Ryf7wY9Qk5EHHJd35gtUSLZLqtKnp9Es/I4WorXf
	oYlLFHxfRGkALCUTTk4bD0SwxkRItNtzYTMAosFffHWHf+k08QYUMRgfU0AA1gRNS/qWT8ylzwM
	DTesX+TdToakF7w/bGJDlmb9KrBZg8suDGAGujZkaBGjvECK3PY1Z4zL2133Xqyhotudct8ZhZg
	8FkjwEnaAS7483PHM02FdAOYnkSRPsHKuw0Quu8nXSxQq79TeEzB3hmJuqi/A/+1MHE9912pvXN
	4xxtHW2nQ1M80xLcYdL658PaHdS5Sckg2lffgbAtrd54xLtyRi1PpEb2jQXYh+NjC06NneLriZn
	+mPmxqx9Ac1DP1jTkCy6UtHbG07MVSwRGCnBNjYKZPMswQjj2xLE9GFfh/pfrcbWasqkVpGFpsG
	F9fSOt50yqx5at6y9gyMdrtXTpTDsaF7GsNR/pMp+B7fwN
X-Received: by 2002:a17:90b:4a85:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3ae897994c4mr12728509a91.50.1793776554614;
        Tue, 03 Nov 2026 23:15:54 -0800 (PST)
X-Received: by 2002:a17:90b:4a85:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3ae897994c4mr12728493a91.50.1793776554082;
        Tue, 03 Nov 2026 23:15:54 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm7753646a91.9.2026.11.03.23.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:15:53 -0800 (PST)
Message-ID: <3980be1b-b769-4127-9820-1ecc6333c6a4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 15:15:50 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfXyYT4JtLHp2ko
 Ts3ihPIBB+WwayCX4f3aa6fYo1Z7qyrPIomRTXXqmBpwQ0FtJO9AfPomG1IvpCYlWxxsTWeqJWx
 lkW00vXoRmbwqat/nT9NVu8uB6g2Q8mY57orcmG8xsdro/7/uNDwPbdaEeXx+nItVIQ/UX1f8h1
 2FySuUFo7bu3x7lMOH6PDFjfh8bunhhSjJnf8EN6WHL1dLtkhVqI89vqaSV3ue3JIfDdhEeZIpo
 W+ILWCN8Grj4wpB6wwS3sB/9lj4roTTZEb45IqwPewxz/3dv7dkSft9Q3dRDgZHHee6sx47F/0d
 GrT6QL6+1Jc0tLIctoHO+xP/tgPEFU/76hS8yn1hiVoSSFfpgfvwq+NjcllSkMAMSqo59F/sp7Q
 qQ0ReCgvGHL13MAVTGCmsZNIUX9IU1fcKSpSaEQ1pE6kUXMrUkvQ9RkcsPvPN1HNG3b10Voqh4e
 BlTV4M0sN+FT6k5zjDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfX2MOdXAC5wMIH
 8MQnXQAW/2SRB+Pc3ZHiPfPWTDhlH5YZ5YkVesqnVyQh4LK9hYXL2LldNdEx018zgvatwWxoQC5
 zxRgultL8ejkJkaKCYRtdvMDh0Wox2k=
X-Proofpoint-GUID: 0Zx6PtRtA7NMR8eCQ4hhmp1W3kG652Id
X-Proofpoint-ORIG-GUID: 0Zx6PtRtA7NMR8eCQ4hhmp1W3kG652Id
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeadbab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WH3b8gmyxz3kVt_5t98A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_231556_724379_7B89A414 
X-CRM114-Status: GOOD (  14.06  )
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



On 11/4/2026 2:30 PM, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> Patch 2 refactors the shared free/load logic into
> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
> rewires the m3 and aux_uc wrappers to use them.
> 
> ---
> Changes in v2:
> - Addressed the review comments.
>  
> ---
> Madhavan Ganesan (2):
>       wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
>       wifi: ath12k: refactor m3 and aux_uc firmware memory handling
>  
>  drivers/net/wireless/ath/ath12k/qmi.c | 168 ++++++++++++----------------------
>  drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
>  2 files changed, 60 insertions(+), 114 deletions(-)
> ---
> base-commit: a2da7677eb9a12e7860814b70a1f6f5b0e347d7d
> change-id: 20261103-m3_and_aux_ucode-8337b881155c
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

