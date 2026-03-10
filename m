Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A09EB1054
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1BrqlpE4ZhHPUd6Grw7WJ1SPZG0SYXSJN4gOgLU8d8=; b=iPBV6V7F2AsAGmYNAwyJzCRru7
	MuVvaA5TSTwQUkCTfL8TfzFFYlXdlX/aZmKuPML/l3PU9/uJ2gy3LUatUG4jZvcEA7w1dL6xonEEA
	QmgufXUcaJm+YWK2coMDBztF64i8xF4sCa5DtiF1wqd4MIQ8r8W7FkJwMBQTyN4T/msrr5e8feUr4
	xDMn0hEJ8X4zXIKPTzTmgVyy5Ys1IZKJMUSou5pDIGdN263riZqbZwQYzwZ9qJrpBMdZDWJxry4N3
	hRKZ2xOkEIxyk1t2tmbb+ZM6hCoq3FIcGmflLA8YqsAIBtgbHEs6pT1AY6JmrY41cXbLuD0C6DN1c
	QNt5Gp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyEr-00000009iUT-2Z7B;
	Tue, 10 Mar 2026 14:39:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyEp-00000009iTv-0thF
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 14:39:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACnWSW3892673
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 14:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1BrqlpE4ZhHPUd6Grw7WJ1SPZG0SYXSJN4gOgLU8d8=; b=Y39o2ZcnCpGZRsqD
	SjwwJXi8CceLWJvmhgS9Pc0mNe3yRVFahm83VRfOJkdU0r3yH3sb2cTTIdvt9YxV
	kenP0z4zRxKe3nf4/2bqbF8+fMLqFf0JZggzM5lrZHBd5kzc3leNd68y9h7BZF5E
	YoPWD7qJcaBTEA/jRsKhmqVl6/pR8VhtozayqHaZsnODX3Mw039UVQ4RfEnK5e3p
	HkXL3ndrmZNkaJY/n4ECh0xxS1X5nwxVus+/YaV5h92CPwK/bIK9/j6ewYy1s+SY
	lfeO/gNAmVavHZVnckWuwNbqy0g4HpMvWfXF3ooSnB+HlYjN9cHlOd6VjlHh+aJL
	WwTFWA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyrdx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 14:39:10 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d73fe3f986so23991502a34.2
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773153550; x=1773758350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/1BrqlpE4ZhHPUd6Grw7WJ1SPZG0SYXSJN4gOgLU8d8=;
        b=c0VvaIb4gvtz6yebPwV1xm6s0HehbjJIwLEoHiKwQPYQNOrW8ecD0DPBDzFgtJAUF/
         KMXyXuA1NhF7HmR7ISw2ysRY0evtCFGjaKQGXa+k9Ak6yvSaL3iRdtdpCIVpDtjt/Tir
         UMynxQcPFjRPJGoLLPrWXxPYu1DWnO0T65+RESVTLx1w9mc2Rm5o8ttEaqVaE87mX1wP
         hUVXRhxYJ9YoCWkkwsQ3+OCxcWzo8X9+wU2BimNKWDmSXjRgzv/Z9Oye0WFP5Cja9LHO
         xVY384YFb/JRJ1NZ7C3m/xemu2Y8bUlcYAp61C46yoO3os4N16cJ/46oCn0tqTTYd4ge
         HDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773153550; x=1773758350;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1BrqlpE4ZhHPUd6Grw7WJ1SPZG0SYXSJN4gOgLU8d8=;
        b=pcoPYIBZjTZocnUXmQl45umHGyNBPt6mToianuB7vpuEnL7apu9/b7WvhhA1/TJR4C
         Vai2i5qeJKQn/NoIewAU+ubDbtSopqIUwdHXGHWKjmK0pGfcfU4ykKpQSxZnpB8woEO8
         eI0kBlm8bMyv3anN+rluO9egZuuLOnCosayq6ZopfAQFqfnmRSYb/Sguw2qNJ5WAf4pj
         iWMRd1VRkt1oy77LiOpJ8Qr2BMe/ZUbK20WfyLPZfGKlUtwM3JB+BMi1HuVi8lRPWAPh
         oA1+ej3CeL9yRM+lpeSA8dJ3W8f7/5CrovnJGmoVEvB+Pcm5RCH5sSpC4zdJAvyecW6+
         G2hA==
X-Forwarded-Encrypted: i=1; AJvYcCVJoZypivc/ipkpCMEz8ROLwBdgG2ucv3njWVz5c2sYLGmtTXHskfo7eX7W7ZEvnWVuAj67+zE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqGgMh6gxfTMbHCQwUmBa6zniqQp+imBBX0ZysbaYE+927+JOc
	e7nbY8EponC0AWBCo3r/OLBbg6JtuhkadwQUr0/AJDdNe4ZeNf5Trzz/IbwX4v5aEMpCgs8K0Hy
	jDqGVQKnPlGwP/XsiOMn2R24Pm/fITQCfp4SJiQKBYbNDl5GbYAjaI9UIzPVqu99l
X-Gm-Gg: ATEYQzzdPfw+i4bIsSSddtgF5tBOyiu16yx92ppHvbmM72+ArT6u8i3rkLThDqPZBUS
	EYWy3C3+AdDAfIuwDxWUs3NgymZXWGyFY3sgwOv0qyQgIlVbWb1C1XXJl3mDHslKi+pOYqnO1lQ
	Xa7RLdEn7ShHLDIWx1TZA7hy5SGHHrmJAYj+LIktnA8+vxhBfsixGtFowc1WUlbiwi+LQ46o+q7
	7TFG2qbwumPmjxpRNq46Tx1QF/t9s5idtacP03utfenP9vXgN/Ui5no8o90vz31U59nDQSt2ExA
	hTjivO2jCGuBsyie8H065ftL95t4kk667A+5HRvaHQbR8cUOfFZQdjuo+wlKxzz4tWhIw0+VBY8
	5896hYOJz6WXxScd5oDzS3PD9FrKYqTEaVVYVU51NvuKnSjPFMJ5/QMygbRP/isGHn7mhaq1qK7
	v1x4meuA==
X-Received: by 2002:a05:6830:67eb:b0:7d7:443b:5679 with SMTP id 46e09a7af769-7d7443b658fmr5354928a34.29.1773153549655;
        Tue, 10 Mar 2026 07:39:09 -0700 (PDT)
X-Received: by 2002:a05:6830:67eb:b0:7d7:443b:5679 with SMTP id 46e09a7af769-7d7443b658fmr5354918a34.29.1773153549254;
        Tue, 10 Mar 2026 07:39:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d75ad31186sm2198873a34.4.2026.03.10.07.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:39:07 -0700 (PDT)
Message-ID: <720953de-6015-4189-99c4-00833dee2acf@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 07:39:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260309152050.191820-1-nico.escande@gmail.com>
 <621ab5fd-206d-4cf9-b30d-cb9d6bc0459b@oss.qualcomm.com>
 <DGZ0GMD3VS8R.2ZZLQNJGDDFLZ@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DGZ0GMD3VS8R.2ZZLQNJGDDFLZ@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b02d0e cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=_hkKkB08e6F3NJ6brV4A:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: Oy_lozdEPxNO6kCNVtxYhgnulgYI5Syl
X-Proofpoint-ORIG-GUID: Oy_lozdEPxNO6kCNVtxYhgnulgYI5Syl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNiBTYWx0ZWRfX+WhGFQo4BdMO
 HB90JChKW6VCEALZw73gfsfmu+EvTK9LMjN/YOEQc/UdmDI9kWKmdbyZrU7SLxNBi+9YhZvWrRR
 BcbkFljBIRZjriUEXOWsqon/YG/61ZRT9BfmsJQG5+J5SjUcGN9ONe3DD7y1pyv6/D1+VX49ltU
 Xpr0cYwbpK0iiRii+vZbXfn257JQXDMCei1vID5QlrNOS2/Bz2fbssRQ8qWqtOu5wEZpKGZPZP2
 Ra3VUptPL6gwN5lWYfnlk4u+uBN53BEhNTPODtFiSJosKCjIYgAhFM4+7M/+UCPWW/11Pzaq8FF
 EEETWc5NJ4DfLvpXXSvH2rHXZg+xNf+6rG3ZngxvxavISyJa/k/b7bXhN1h2kPxXiwiKu8sHJV/
 n1I0PsK1WYSNferNLEArPyRZb+meTEBO0uwbz+g+8wsM5TlXc5U4Qlw70ofS45lN7xBHs76jwN2
 sOvdQwwlu46PQCq8qYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_073911_259638_DC9196A4 
X-CRM114-Status: GOOD (  11.59  )
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

On 3/10/2026 2:56 AM, Nicolas Escande wrote:
> On Mon Mar 9, 2026 at 9:16 PM CET, Jeff Johnson wrote:
>> On 3/9/2026 8:20 AM, Nicolas Escande wrote:
>>> @@ -3913,7 +3903,7 @@ ath12k_wmi_obss_color_collision_event(struct ath12k_base *ab, struct sk_buff *sk
>>>  	u32 vdev_id, evt_type;
>>>  	u64 bitmap;
>>>  
>>> -	const void **tb __free(kfree) = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
>>> +	const void **tb = ath12k_wmi_tlv_parse(ab, skb);
>>
>> checkpatch complains:
>> Missing a blank line after declarations
> 
> Weird that my checkpatch (from yesterday's ath-next) did not catch this:
> scripts/checkpatch.pl \
> 	mail/0001-wifi-ath12k-avoid-dynamic-alloc-when-parsing-wmi-tb.patch
> total: 0 errors, 0 warnings, 0 checks, 807 lines checked
> 
> Is there additionnal flags or tools I should run ?

The difference is I run it on the patches already merged in my workspace:
scripts/checkpatch.pl -g --codespell --ignore COMMIT_LOG_LONG_LINE,FILE_PATH_CHANGES,UNNECESSARY_PARENTHESES --terse --show-types $base..

