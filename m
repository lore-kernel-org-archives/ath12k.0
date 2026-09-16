Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EC4C88E77
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 03:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=; b=swSe7DexSGDTIXD6Bs2IMBHs90
	NxBch4Vr3MjJUJntwLBjAr9PjTAgE3AfEqGpo99Jf7stJgys8UtBpiR5f9rG+aUJk7588GysYkmEV
	JpAYFHFlgzucD2KDd8D/LCdunxq8G4kbib4j5LBUb8J8UmQ2wpNVpFHbZqyL1wl4Mi0jRYSVtwUID
	WjX9AgATC9LEHvqfByr9cTgEEOcyRQQgVbj7HEABaEAHnS/RE+LiDXmj4eMGF42TSN0LBdrNc5A+O
	w+0Em6RpNjuQiNAUFYLD9HirgRUoXQH/65jSgq9QvyphMxiqQEE9MfUDiX9cvuLuQM1VQQ1FAjH6T
	ocE9lDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g1M-00000008Dy5-3GgI;
	Wed, 16 Sep 2026 03:09:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g1K-00000008Dwe-0htW
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 03:09:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G2Tfv81604896
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 03:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=; b=C2+SAIH3viTGtLwt
	anuftS1UbBrRY8f6gP9mjistQDrN/AsiOiQf3x41sBtkTrxkv2qkMlbOelS7+vFH
	IxyGug34Y/8nBg3B0mKx4XygsIaqK+JD22LiMRTr4Iy5BUaoywgK+ha9vuy514bj
	Yv09UMS81I5PGX+OFQalGYMrKhGXhHuKYqG+0r2uQCrnEHQWgGabyWsvjY/Q0Lao
	VN5Lj1mSx7kknMqcLPpKj1pebCw5TB3fCq4/rVDxP2uuD8c9A8X/6FqQ3xbfhJMO
	olYD8haiGPL22qeTSxSnAJ5yAO7Drp62KAgx0RiblKph5ca7GqEBIgHXjfIu+Iaj
	ZhKE/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjckr3wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 03:09:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so6198933a91.2
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 20:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789528152; x=1790132952; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=jRbop2sde3ao7ECLq3oKepYMJRQ8dSOzPwjIWtkkRnjZhCIQmaxbcEreCsgbb28TF4
         5apD4Ot/GF8CZ+F1DVN3DzRl4lHbzLF/0wNwwpzEtK7l1Jy83bUVR+qsyZVnh1aqDCQh
         wCxuAMJNv7DhT/rb4Lm9jkuA+YR8NOMSUrPbK5g1/szEuht18UDj7sbdyiXaPSG/Ce5q
         aN0vsJnfrKLPvqmp/Ila5NPGTgw9a+LnSkSoqJ/P0Vlyp+/khh5WzkBCEysyxtPS4Hxy
         YIUrDPMGm2rRk1b7sNWA0nQQtv8pn256ghFAEY4oPCiVHC7sM+F9VjUPHKjv1RDTODpU
         jytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528152; x=1790132952;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=Dfg9S+whIiXJTHP+VaLOLq94W4DGLwCzlkyyzvyrI/lK1Rz8WticoAA4Rm6Xo/WTY6
         7YPHeKVZNsIzumfjRBHbX7R500NoasGfgkIa2Pj6MJu3EsVRXHmn6Jgr+AFDAjg8xNXt
         jjE770Nt2xg28jcx5sI6ug5JzF0JYAn4z0U+ynwa2orOAS0lfloiOJY9t1xn3t467NMe
         sDZRb0Tw3GUEiUY/SlXLXkPFMoeM+MLCKn7FHFh9eF93P+ybC8fAzlSL6LU3a/LF5N4f
         LUJHcyWMt21VyXjFj4V8GCMXkc24dRdXhbqqyykZRaPCcQXmhO6sibn0krpVcsgDKG7r
         YVHw==
X-Forwarded-Encrypted: i=1; AKwUvBwjJDlCLjoPuGtp0ezT0bMmOArEBU8zdycI6OodYMWTibfuh9I+rjeP7tFP30d1wKcVqstt8zY=@lists.infradead.org
X-Gm-Message-State: AFuF++nd8sCvr62c7ePKiu30bKyxRpYNzm7C/uV5YhLrwaw73mMtMX5U
	eexR9ZzFO7up//FUcZtAZ1EU1yEkLdWZHAsmGPnUf8VA1qXj9YgHCwW/tdyYFbQGTYCXpwA4PZq
	iAZXIq0cOBpcfKKEZvbGZwsdki4wpjoeLlzjd3aqRbUR0ZbQYaTrJHCc2dWQ8h2eo
X-Gm-Gg: AYBFou1IaXorQlKi6NQFmI8aRtK/Ua/6vInrku79WSKLSwwV0LU6RTD6BcLsnh4QP96
	f68lp1IEKd6hK07Ll4KvuRbyOH5wBZ61efP6NFTOm7wAk73TzLdVQ10U8UOLCZAmQnQAWry2cwM
	n6m764EFJWyLvtIiy+z8ZWByI5cI/TJ6X58XETYx/YoQCpZQcXRdnRbFuLtpvRNjiJHFdUBD3mD
	albogLWO8/SVzOwLNPNkvlzaJLVOD5YqCEPROhwwRYq3RmsmyJd93n7yqfyRGnIc1XZwlPy89K9
	Bn35mrOowhDJn9W/AT6Qfp70sMkDb2TaLYXR/SM5TOMdkJAocx2EcpnsYsecaiki8wSFbWzom+8
	og5VZ9fxL+47MxicCjfljzwrP74dKZ16mE0ROYzp+L5BSm0dxz8/3+TmWjg==
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015605a91.16.1789528152091;
        Tue, 15 Sep 2026 20:09:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015526a91.16.1789528151476;
        Tue, 15 Sep 2026 20:09:11 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3191996eec.15.2026.09.15.20.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 20:09:10 -0700 (PDT)
Message-ID: <6257c447-788d-4362-851e-0d552bcf7c56@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 20:09:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
To: Vlastimil Babka <vbabka@suse.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Daniel J Blueman <daniel@quora.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Takashi Iwai <tiwai@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20260909055846.16539-1-daniel@quora.org>
 <hcr4woicsnz3pbhzlguuwjlego7yli3znhjmsx4cdz66xa74zd@wjtle2yslc4b>
 <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA0MCBTYWx0ZWRfX9Ijpj5uwoVV1
 N4GCdovHa5neqlT09WVhjPg0rkjIzka7qOEpOlHKQ8PTfV1Aoy20r37pQ8ac2CJGyL8L/wtrlK1
 R3xaD5YQfwRBHbxSnV1VczDlmQ/71aM=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa0859 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=_wE0MnXGkHm9nJMVzvUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: Qk92XF8-RGXFL3Cf-AEchtwZvpIapzbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA0MCBTYWx0ZWRfX6K9o+HYNb7M5
 kpn35WjwDPu6I6Pc3p5NGTxRdKcgPH6+EhO2RyZCg6B7InT1Sf8j+bnLWotW55v6o84xJ9zwTpW
 gt7AxExrxefv9feuJPZKESeiPMGE0lv4616SDpSs2RirSIfFpgeagqAt68FUbFaVjWVxNeA5FBn
 pinWyC2/M2NI/NpQx88kwEFMbp6/MlzKKpun084RFBJrDXbLUWp9UxsUsLgapbWP78uMmkbrKlN
 LwsXcD0wRuv2AbB6+AR9ag2DHs40cfY/FW+wi58WLAoM4L8Ka9DGqQvNcV62UqaqAnvNS/eI7rO
 WB+PBjQi64DIGVWykp9AnYgwXDSMNX2/dA74tQ5kSrEsRRa1C3ERK6dvR1Oa8Dc5g8v8QJJL4Cn
 fvOurRrRcgBfzRQhm0mgAgfCehgxXeCcOc4WHAT8kdhdt8VqyMqpLbd8QmSYIqWXSj6Clzevi7S
 NLGpcRen4jmb9l4sjag==
X-Proofpoint-GUID: Qk92XF8-RGXFL3Cf-AEchtwZvpIapzbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_200914_321763_F8823BC9 
X-CRM114-Status: GOOD (  19.89  )
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

On 9/15/2026 3:48 AM, Vlastimil Babka wrote:
> On 9/11/26 12:44, Manivannan Sadhasivam wrote:
>> On Wed, Sep 09, 2026 at 01:58:44PM +0800, Daniel J Blueman wrote:
>>> Since the MHI HELLO exchange was relocated, it is sent only at device
>>> registration. During a suspend-resume cycle, the firmware in WiFi
>>> cards such as WCN7850 indefinitely waits for another HELLO,
>>> triggering:
>>>
>>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>>>
>>> Fix this by triggering the handshake from resume_early in the MHI
>>> transport.
>>>
>>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>>> suspend-resume cycles.
>>>
>>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>>> ---
>>>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>>>  net/qrtr/mhi.c     | 10 +++++++++-
>>>  net/qrtr/qrtr.h    |  2 ++
>>>  3 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>>> index 78347c937af7..2ffcfc2fdb4a 100644
>>> --- a/net/qrtr/af_qrtr.c
>>> +++ b/net/qrtr/af_qrtr.c
>>> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>>>  	qrtr_port_put(ctrl);
>>>  }
>>>  
>>> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
>>
>> Use proper kernel-doc please.
> 
> Please prioritize merging this sooner than later (it's a regression from
> 7.3-rc2 that would hit people if it made it to 7.3 final) even if it means
> fixing up non-critical aspects later, or by maintainer upon merging.

Concur. I recently fast-forwarded my ath tree and picked up the buggy commit,
so everyone using my tree is now affected.

And just want to point out that many of the function comments in this file do
not use kernel-doc format, so I would not consider that a blocker. But it also
would be trivial for the maintainer to add.

I've tested this on my HP ZBook 14 where I've replaced the OEM Wi-Fi adapter
with WCN7850...

Tested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

/jeff

