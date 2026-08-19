Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EF3C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWA21dAxPlqU4uyBL8vbOkVE0vMfcnd76JLtITSBO18=; b=gYbSDNmnWkALzA6SZGl8GoAxb4
	s0bktvgybvhAuM9sxsOFVnVyVqcBEIdJljvMVaKWfw7TjW0OMtewkbo2YOAmelDxQ0kVuHXBqrcta
	7DfydOb5ENB+jokcqPogfELnSREFc7HDyXabHCkyBhp2NJkGrOU+tB38bVUtaO3IXMgWGPjsyYB/8
	RvfLXR+T++ubTzGcMEVnPAUCWpQUNLU7PWah4Aw79r8PFCL0D2RzESwurihmkXd8RSXLrLOb57B2y
	knW8OK26+nPnK0a19P6QbeldCom4A8YOL2UvleYaLoNtGSK5Jgn+/VFD2B45rBgd8Yi2KOuMUL4ug
	5ckl6/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdC9-00000009Tg5-1luV;
	Wed, 19 Aug 2026 10:06:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdC7-00000009TfZ-2aZH
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 10:06:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZGYD3671347
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 10:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MWA21dAxPlqU4uyBL8vbOkVE0vMfcnd76JLtITSBO18=; b=BtSgcQYs5VtTNGkA
	Jp8X0ED/hfDS3LD6TWCMy286UL/1lIguDdIv/+0LcrTvo556D3aj/upCSFrD2Orj
	vFZhgtZM5cjuJGgGjz0gwm1eECKYMLJednkSGAgDu4i2X71FcYvHRZVKzxg+yfUg
	FgxdyXxttmHyX+uQLmbYRBTX+STHEYuE4ExhGRjFIJE/j5ONWRFjI4lcqaVpGbxb
	8+YC7YXxTl+xWrTZX3LegmJzB+9jnLXnpmoFOS+dqVsTR5qN9UNmyI1MHoh1fmf0
	MUaE26eNYouS2rZbgD/rSkZ9ig2rUnq89pBAi4V86pmU4PG52QF3r0kwv8WUi/l3
	iX/YOQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfttkxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 10:06:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1934333a91.2
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 03:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787134003; x=1787738803; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWA21dAxPlqU4uyBL8vbOkVE0vMfcnd76JLtITSBO18=;
        b=B9tiokvdRBD8/mEFvXaGR/ADLlxlg3zIIAbJM57cxXdRowgl0AhJ/lki3unY26DC4n
         5W66hJsRZKdOlhwqJu+CPI+wrl8A5By8bE/0I5HCW6rTnOJvDkhhHgSKSknUJvv6xxB/
         z4JCu1cP7cyDII1SxBOlBYmmAlIa2agChYqafpiySGr6meYt+UkxmoJcRnHbN0ggs4jz
         Eor8RApj3uB5PH5f9FkRDPKvRsnVXiXAjBRr2QCQ2EDCAzalCEH/uWFn+MhVx86KmBuU
         auJYuygJyvkE8Js77/RWZsFlTk9sLIA6UC9oC3ZslFp7HmMEJjdzXzcrks4FYcMExlq1
         jySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134003; x=1787738803;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWA21dAxPlqU4uyBL8vbOkVE0vMfcnd76JLtITSBO18=;
        b=D7aA8zaYJH6PS8VOcZy52FgWotFvrwNCLKAadZq1D6z1pVffh8OAAYy9kNxs6Zqvyf
         vN0+8vXVXJ5m7iy5LbTf4eHwX7JqEp9ncWq7kknJ89QfbEAakil90AbJRFgXKm1t+njR
         w3zexjQY2ukpXg/usvSf2Rvn2nQl+NYv24h4tAXsIyP5P6ANnq08ZbrYBl+JVOTQxB7u
         5yYmxqb/amdYCON7o5/tCKcCjrO97rkZB0oWgM16s1Pp6eRVp6xkAyMpmR9fF1xvwc5L
         abbj38/Xv1a6Bl9pGpNAFUolpXbvS36wzn+VCNrmFspa7+i0ev4B6J/FWrLNr5754Cwb
         +wqA==
X-Forwarded-Encrypted: i=1; AHgh+RrHDi519eVFcuzbVZZhqjga35hUfddwa7s7r8Ukrb/TWAu6Hw2vCC0zcbvUL3kAsnN1pkbusvc=@lists.infradead.org
X-Gm-Message-State: AFuF++m3Drf8lvqX/TJ1VdGCPI1nYyynW/hL/rQLCQS2WLcfVULJ+NxR
	VchqWg2Os29LqUIQFxvgM/ClgzzAU6+fVhrOm+zh6JSs86wvvbzqIqSbxiTwheJGSDUBgWqWk/B
	FX0HeaYx2P9/TfVCBAlzRNAlPPbbOkvjQ/bsDMb/oJgIqCZmbmOQYEnLzGdZc3tAz
X-Gm-Gg: AR+sD12taKEqKJg/Dlmhttuj2K6y96FdHi5cfkR/PjcQMa81WXL0gqUl8BPYiHlSUT+
	KX/RNOaBdk4NovG14xxyBu6hnvTxrBWKRp5Ub+8b2ZsCBOeRhH3MFiZd/Xm2njOvFSeuB0k/bMT
	y7Aj+64EnUojAFRxBV4sy+s9oEEH0VJxqRtDIX8NiSMgTTTuNTNKkQhu2hGIUSGtgPtlFzwPzH/
	catT/yrGpIPoejvkNCJbMA1wsqQGYmr9pgF1hIGFjlFSjApiPxgJhakYaJYnvSR8XAaLkIX4FZp
	CT2pWAQWOOl6pR6PKGVrGRqxYtfepbZA1nG5kRw+m1m3zOsKBYKEWkXP9SpAsZDRtcl1wEL2vMM
	vs/M2hhJ9HX7rYdhEQojC96ZjC6qSYiCrKiLcF813Ami5ft6I93xFyu0kkyzoDsUWi62aV9aFdA
	==
X-Received: by 2002:a17:90b:17c6:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39580f119e0mr6094899a91.7.1787134002619;
        Wed, 19 Aug 2026 03:06:42 -0700 (PDT)
X-Received: by 2002:a17:90b:17c6:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39580f119e0mr6094806a91.7.1787134002201;
        Wed, 19 Aug 2026 03:06:42 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb8578asm2026605a91.11.2026.08.19.03.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:06:41 -0700 (PDT)
Message-ID: <82fbdec3-5030-4eb6-8a4f-e2be1ddab024@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:06:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: wmi: Complete regulatory update
 for dropped events
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260818-topic-wifi_reg_fix-v1-1-18c7c289e528@oss.qualcomm.com>
 <f4f1e338-1206-46a1-bbfd-79fb768dc382@oss.qualcomm.com>
 <7334cace-49e2-4a8e-aae2-6541c62f5b5a@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7334cace-49e2-4a8e-aae2-6541c62f5b5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a858035 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ryZ7i3bytUmpndEZJFAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3NiBTYWx0ZWRfXxWVYwoiQkOoo
 tWifWOaoKObvE0AuMXL6lprDUL4gzpefiaTz82Lxqf2s55n0/VPYn2WoTlfsgMUP8Uk5r8l+4h+
 aAs9SyumOEpmG0/MgzIEiJFie6XQBUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3NiBTYWx0ZWRfX1OM78dpMxJzx
 MJ8r9JwizpRuoaKGQxSlqAhF49YS9sbIWtJwReeTcgZarVvgDfTbtDxbtaPafRDdn/ry0hEcjaZ
 7dfNs2srPDqAKZdEc3nE5AID2q8XbWGBOclm7xRm2JaXa7ISNHYOe8cwsWJ+36GCYMKA8oWXpjs
 cbdfnIaj9TSEVugz7G6XDdNOjH57+E3RqlyYQHyhFmjL5HMCytRWBO9NHFf6/TEMfAzK3Qml2XF
 6aX2yNkDy5R5G+n1AgXdiQ5/bTCEoJIPTgM84lX26h5t1KPzluXu3iHISXgBi5QssquL/1Rrz6b
 yEeFF62PeXo/3dcr90fXpRkZtOxZdAHB6N5uTqZ0Y5NhC+VcQx+Hbky2EDRucFvhb8rnQCKaGoR
 WMcRLvzwOsKsxuaTusD7TFbF+u1ijp0IvK2ninFSjkKmMpEOIxl0A9DR5TRlLePpRa5DPvEP6ml
 oSQBQPAFbHR5itbhNtA==
X-Proofpoint-GUID: IW1kaq5bLmnyQXwz8EuwhQS5f6humcoS
X-Proofpoint-ORIG-GUID: IW1kaq5bLmnyQXwz8EuwhQS5f6humcoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_030651_675543_AED3A1BE 
X-CRM114-Status: GOOD (  14.85  )
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



On 8/19/2026 3:43 PM, Konrad Dybcio wrote:
> On 8/19/26 3:50 AM, Baochen Qiang wrote:
>>
>>
>> On 8/18/2026 10:57 PM, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> If ath12k_reg_validate_reg_info() returns STATUS_FALLBACK/DROP (which
>>> are not fatal), the code then jumps to mem_free with pdev_idx still set
>>> to 255, making the following completion never take place.
> 
> [...]
> 
>> there is a similar patch [1] as part of a series [2]:
>>
>> [1]
>> https://lore.kernel.org/all/20260729-ath12k-regd-wait-timeout-v1-1-504aa6e7e93c@oss.qualcomm.com/
>> [2]
>> https://lore.kernel.org/all/20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com/
> 
> Ah, sorry.. I tried searching for whether you guys handled it but
> I didn't find that series. Let's go with your patches.

I should have put you in the cc list or reply in the internal thread ... :)

> 
> Konrad


