Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07AAC61DFD
	for <ath12k@archiver.kernel.org>; Mon, 31 Aug 2026 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=; b=KmgwI7dZOKfOGgZsF5kqcgkVdZ
	aAfmkBC5vO9mP/8rkvVklPM25Pxm5h3XHjjLt4QiOvjsSjgBhCBM3J9j4idd09C2nxUSUbBf9kqxr
	I56bxIWAOuFabTU37tKO9qfvxX5sJvurWhdIffuJlvw47+HkUBTn51rLmcKQC4yRR/0H5Omdtn5fr
	jv8LMZMFtgtTc3t7xKpTuaxJTVYjjRhTuUWfJFYMjxOmlZG07/8EY0q4FP4m654NrJcOT43gbqORV
	EUtNG73lHcYv3tKc6YM/V/CBL4uZe+JsXgAx+nQ9cj8jcP0G+ocoTIcRqGHqj6GEkPnGn+5Uz8o95
	BL4o7pbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18KG-0000000AQOC-1LfI;
	Mon, 31 Aug 2026 20:09:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18KE-0000000AQNS-0f2j
	for ath12k@lists.infradead.org;
	Mon, 31 Aug 2026 20:09:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIXxVC3851272
	for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 20:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=; b=N6kvjYOyyl1d3Up1
	m7+t9VFKa/VBg+3Q5JSPRALVg/3LadnL6vZxVQV8bHWY6grC7dtO6z3RltnIiaEf
	0/29Vgvi2hTs5WJepVWGQ1XG7kc5Z703ImsCWKQakoX9St33vvEazVQsgnGWxGn8
	1DWShFkuOtcWUV3tqL8W/MeHIvV/n2q8/A4Sx3eHTcm2qu/8jVIZk9ce03l2RrCm
	Ad8sxxAVjhW4rnoFODvjgoTvgvIsD7/waPbJZ0CFv86MYq4FvIa9epVIZmcdJUEt
	vj4dKbTQ/Y/uImHX6Ml5uJC2RDcLJtScM6xjALxS2PbZMsakbBBYrno32SsVcfuA
	jYU63A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayk50w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 20:09:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6df0a1e18so79334175ad.1
        for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 13:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788206988; x=1788811788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=;
        b=LrjeYx7Q7tST0N2bMQh6I7OJFS2Xrl2W1aepVcD9lheTuDMqoM462FbA3jc1TOANMH
         p2CHe1Q/5jtsdkGd1CBavocN59SxHjjeR1ZWo21MHZCAfZkjfFuWTP8v8Fvtx1NQUHlk
         wehrbipdrprWuzZ7KH005Qbfih8GqJArdGm80e4pQDVw5KmxgjOWYjHc0nGlVXz8kgwj
         40I1Fs8/XivvVbRaJiNVhpntMUpInxhILB8IzacK9u/vkvELlPFQ9CbAXJpUt6DugaR4
         Q4WsCBoPDB4QJS7P5T2AmazNm7sx+VFFAkcb+9Af/596Sw9AE6piYl2CseRQkaRqRu/P
         qj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206988; x=1788811788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=;
        b=rDDAW3EvLdXAurqOFK7tQLy8mi3LsgAK3ADiRwsRfaOI69lTOqfzvr298/bVsFp2Kq
         vm+TC5nPkGHn8fs8TjvOeToPghzk9PWXebdCKGvevinbjfGh5lLE3WXRgz0H/y47fkOJ
         zN8ISC9KLVoTxenGF0eyLbEoRjiHl6NWr+bUCQqhxjdXzPaRp6sSF9m3JMfPe7Etkv3w
         TbSSaOiuxesbYxuqum2lg7AJbTmRbhVxBKRvqidW8hyM4yCTsc3mFI28dJHpg6RUaKbZ
         w6mMuyMQLq1wngKGzqZVxuNfJJkM613JJi57pKkjVukMR2VuUv22dHebejH1PpAWmiY9
         H12w==
X-Forwarded-Encrypted: i=1; AKwUvBxqkp796J3gf7QiRLGdp3ogX+GvZxOZP/R5zmkYu4q6tUnt8lTpzPH0XKhI/P3lYAWB7DHKkno=@lists.infradead.org
X-Gm-Message-State: AFuF++mR11ONDEXcwo7Peyh2vev5KcuKS0N9HpjizcK6FLLKpUu0xOdY
	181bqpTYFdoR+KaSjwqpEjP25RsMG9vMFX3sHnrsk4UJE37EvJJEEi4fopaD614O+Q/SBAQN8AZ
	0fCtbrZ4LtJs8W0JFy1++cxCvDGVbk0sDtw4XQqD3Eh5QZafHpyPRa2OjMFxPfmK0
X-Gm-Gg: AYBFou0ZQDwl7VaXsZ1e7IF9Y/YzTYMb8JioLPthPcYNPYn/UPkhisJAebnGHdsKNF7
	DYZHmujOSHG4VcjaEItvs8l8D4dUPdzGUIvA2Btjhm+N95DfQpzUn1KzYL60zYBj1x0Ou+MYBz6
	WKymm8jsyCZ7ff05q3X6didddVqbeJOjnRGy/aYAGwtv1viaMDfIG349Sq0TrF77O7gMnisDCFD
	WIwE79RU970q6/N1AkklbLDmwlOyYtYmZ7QAZ0QE1YC0PCuqjKKFl7evKW6YvHsd7iC+HZJb2dE
	OPj6z0A3hRdnHjMmr8uJfW5MMXfec2kYJfXuel25E/cWNfG1LpWrlfevX0B1J53405LVFeTRxU6
	Tbd/isQZQJdVn0ooiJov2MHcISsjPk0aMDRgbSZlOPMzObz2aNRWs+zw=
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr42726635ad.17.1788206987724;
        Mon, 31 Aug 2026 13:09:47 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr42726215ad.17.1788206987234;
        Mon, 31 Aug 2026 13:09:47 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm32698630eec.28.2026.08.31.13.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 13:09:46 -0700 (PDT)
Message-ID: <9e22e5ec-70b3-4ec9-ae75-295fc13a23a7@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 13:09:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3NCBTYWx0ZWRfX5qfB753eAbcs
 PtpIF7VzaiT9079VWC8MU5fJiBq1sL2hBa3/bxJuo3GsjI7j7N+JMuKIpn0nGpJV1xQ6x6nR+hl
 uIZ05QnsV10ZcU8igj96az3CPMwScsM=
X-Proofpoint-GUID: KvkjfT6Khk-U88rdJNLiWl9IQb8j1FYp
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a95df8c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=jTpQxx6w2ecbRakjFwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: KvkjfT6Khk-U88rdJNLiWl9IQb8j1FYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3NCBTYWx0ZWRfXzJXyQ/aJYa4d
 7o+Ee+xexe+5A1Pd6RBbiOonNDYCNzy9DR0uRvm0VOAWzrjboue56K+L76x1ojehefozfgCwBj5
 zZYodPAtfUG8gWLLC3OOYmMdwF9DN8W114fTucRfD2mqc/jUcqPOiQFFNhU7VomdG+ErbiWkLeV
 w5AUhObo2HDup9x+rj+KWLm0UUEEFXcTfHQgpK6/7X3smvtV9LHZgHZRzw6RmZnUUBp6Yil7itz
 wqoSQO7HbBQX1F8jH1Fn/2fnlrkCSCE7I39PUGH5cuHWFbMbTUmwUtLP4CNWy9cRqYTnUSqpYwg
 xHlfAmtrj1/SQAVry9Ne4oqPVBjeZYEBV9Yi8DXRZfm5FGt6+T9tdMbfeW3kU1cQXJcxS5pNcka
 6tZaze1QjbggtFEu0bDikCQZTjEgqxdYC8yeH55aqFUmmH50FKQ6NeSygdqijijxi2M5bypLk81
 oiGgPuXVJD4w8ppLVSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_130950_308262_BFC8A913 
X-CRM114-Status: GOOD (  12.63  )
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

On 6/30/2026 6:30 AM, Andrew LaMarche wrote:
> +int ath12k_core_check_dt(struct ath12k_base *ab)
> +{
> +	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
> +	const char *variant = NULL;
> +	struct device_node *node;
> +
> +	node = ab->dev->of_node;
> +	if (!node)
> +		return -ENOENT;
> +
> +	of_property_read_string(node, "qcom,calibration-variant",

I've fixed the following in the pending branch:
    ● checkpatch.pl: 126: CHECK: Alignment should match open parenthesis

> +			&variant);
> +	if (!variant)
> +		return -ENODATA;
> +
> +	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
> +		ath12k_dbg(ab, ATH12K_DBG_BOOT,
> +				"bdf variant string is longer than the buffer can accommodate (variant: %s)\n", variant);

Also:
    ● checkpatch.pl: 132: WARNING: line length of 121 exceeds 100 columns
    ● checkpatch.pl: 132: CHECK: Alignment should match open parenthesis

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?id=c9d2d0d1c4a0faaba5f57e3c3350707db9f4f3f3

> +
> +	return 0;
> +}
> +

