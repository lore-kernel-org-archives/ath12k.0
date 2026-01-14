Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA607D3900E
	for <ath12k@archiver.kernel.org>; Wed, 14 Jan 2026 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nKyRDWYXLhKOGSTl0Nwo0SBmlE3o0buBJ8etCeq/b0=; b=YIVdyJ8I4QFDIqtiB9eYX4ObaO
	WsmGEvk03gm/r759ZBXdOCXZuelIQxac5SSERRR8ItLCurreLZHdFtPCXtLduu1IJpvDP4O68taEU
	BAo6Wv1Gq48Uq36abk7XJ3Lx4K2zR8t0gZYbZ9VJrdmVQzUheBftGXRqk0VP6by98pOc6yXWjm0Vj
	8BUgC5o3TMoILfXoutcDiOJG/Uo+ZBTOcbBKHg9lws9L82z29gM5sAqfHcqW0E6OYOhF9kRk+Kz+v
	QUfnBLZAkOqq/xk1cGonQzFyZtt8dFLZgSJdj/eoHmkz/+pTZKHloNOr+KmA28yvDiHugIlbwvZCN
	Y08kORhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6Kx-0000000ARmf-3EpM;
	Wed, 14 Jan 2026 19:15:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6Ku-0000000ARlq-2xsf
	for ath12k@lists.infradead.org;
	Wed, 14 Jan 2026 19:15:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEE4wO2497469
	for <ath12k@lists.infradead.org>; Wed, 14 Jan 2026 19:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6nKyRDWYXLhKOGSTl0Nwo0SBmlE3o0buBJ8etCeq/b0=; b=l8xwDycMnqpMA5po
	dawf3cXzZB8UT4nI5+01JfeWnCUG8WJTOTx15fPd78vya0VGizSbIO1MAodKNQtx
	qE+RsqDGq1/bF5+eEEqlSXBDmAwBO4PbAWBLYvcUp9KrXgmw71bvsh0set4k7MNH
	BHRsZmcaJrm5rnzlk4KEpeCKWMpxwf5Gk/SwvpvCqyjOGCelqb7cIDP6jwezPUzb
	sWpyvbjun3jILObeqGiZc2V1I14oYU48/Viq7y6Cy1sbPBRVnWBddFq1S8td15pz
	0ZiM1r8yT7hsVtdN6IzPWMjMDVtcqc8tI/1gVMgyLSGr8nvqSjs0UBfdiuJe5SDp
	j8lDnw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x3t92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Jan 2026 19:15:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1219f27037fso523396c88.1
        for <ath12k@lists.infradead.org>; Wed, 14 Jan 2026 11:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768418119; x=1769022919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nKyRDWYXLhKOGSTl0Nwo0SBmlE3o0buBJ8etCeq/b0=;
        b=AB8+aSqIltKW5MHdB0F1U7Gp/v9CCAorGQV65PxwxjZ8TsJoPurgg3im/fgfLhL1PW
         S+DzH39fpWhesy8bxNBn6ivq+85udlqPEUAm4JOohHO/SLkM1YdTcNBfujfp5M7HuM9C
         ZPfbZaJNCk1oxTmy99YrHlM6/wmuadYjijcgBkFV3IjY5Hg1GJD+SazRmd3dSanvjBja
         /7rk8q6l6lwAKt9HmHvEmJtZyNpcI8iRSjUtuhPuUB9lK6pBHd548rIMGc7JpIAjuE0x
         HYLR1DD5QBo26JgTuSOh1kN0AQmf8Q8cvxktjBS0PEP0V/dXp5IFwUhWOZsJx/jKKnqt
         gqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768418119; x=1769022919;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nKyRDWYXLhKOGSTl0Nwo0SBmlE3o0buBJ8etCeq/b0=;
        b=GtUn9l7QmEGLD2M+eHqfmo8eMf0bvUBmrncB2TWPWdQ4C1cVBiDUExkKNk8/E1LYIb
         PhSuhuAyZ4yXPz608q2z/kFN4QQtet7NgVIdA8d4I3qsJZgBj0OvCrjlRnZEtNXwHQeu
         8d7M6JSlIzwbQM+dHdv169eySMOnA1kWfDfNpr/sHjVF6B1PkTXedeHr40WLjmjvCC81
         xIG8lYc8NBJntjRK8+e4N8wNt1KbmuDi40Bm8vHn5sXjA0O3Ixbyh+mHBRzikj2zl/5r
         q+u9WLjbidO8CHX5MUGKY7MVvNaDLkOK3v7EMae362CM1UOjY4FilCTlur+Hvq6Y2gsC
         JT/w==
X-Forwarded-Encrypted: i=1; AJvYcCWaxXn9F30gFigFNth6ifHSDe9G4NEdKKOwtyzZZyJ3lzz+egjqBQQUzQu/R9KLbw399v33Vq8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKRlixVFiMN7YlnnVD3nb4G9y7Hlm6JLiSCmvvRZXtP7rI/TPc
	AlvUPtz0uhPK00WWSp0sWhMhRvrS6FMvMDWV8Vjg7y2tKBJXNKjJLda677UeHlKx8ZzpMF534n6
	TTM6kTkemWW/MRzMXjPb3hHNzJTLjqfG/LmzfdMOPF8PmikTAnRgwkFc8JYwX4IiC/MT8FdM6
X-Gm-Gg: AY/fxX6Xn9K5tHo9yfI/xNI2TCsLJCTez+uZAeXoSkmVmYAnOqHwvHM6eUGcAyHQDiM
	wBV7dnCxTO0UOkQWR5swvxT9doxvAS7pJVM8+Zt1iTIzqYZIPVEYzX5C8RHiRTIOJMNqxzD6MPW
	FWe8iANmQUSmhjnskE4VxR+1ulR8uNsA7/5ohwOzWIr+utYmMg7rO2uyPd0YxhkfWu8NZ1boQPB
	VucvaUTXhc1xvJJwPj5FXv5QDVGNHrveg22Kp5aDPf1vFHEMNVnq8TtA1m57sh2duhHkdnyS5Ry
	ctYnPsh5Ji5mMin+0vxfJryhwB9U4rExRQbXnaIatNr+cOaf2Bdiclo9x+25GiAnSjXe848aRUP
	r5T5neMsJZhcfd/amOpukK4mbz1ZmZpBgRLIs3x2/nPCjR+Czw4xEPrFu7AOvo3x4iMYGHA==
X-Received: by 2002:a05:7022:6197:b0:123:34f5:bb02 with SMTP id a92af1059eb24-12336a35184mr4292804c88.20.1768418119251;
        Wed, 14 Jan 2026 11:15:19 -0800 (PST)
X-Received: by 2002:a05:7022:6197:b0:123:34f5:bb02 with SMTP id a92af1059eb24-12336a35184mr4292714c88.20.1768418118017;
        Wed, 14 Jan 2026 11:15:18 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1233693c619sm3331263c88.7.2026.01.14.11.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 11:15:17 -0800 (PST)
Message-ID: <63ff0362-4ee4-4f13-a212-dc1351eefe08@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:15:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DESIGN RFC v3] AP Architecture for Wi-Fi-8 Multi-AP Coordination
 (MAPC)
To: Johannes Berg <johannes@sipsolutions.net>,
        Abhishek Rajkapur Suryawanshi <abhishek.suryawanshi@oss.qualcomm.com>,
        ath12k@lists.infradead.org, hostap@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <653a4207-38f8-408c-8067-c4960c11a71f@oss.qualcomm.com>
 <05381371a41f154058429f0a1079204c4a454f45.camel@sipsolutions.net>
 <59cec65b29ded381c85d1be943d88e956a4b7e74.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <59cec65b29ded381c85d1be943d88e956a4b7e74.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QY1Nf3wPhSxh52nHJSbudWgIjt3t32DY
X-Proofpoint-ORIG-GUID: QY1Nf3wPhSxh52nHJSbudWgIjt3t32DY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2MCBTYWx0ZWRfXxTStjilunqF+
 munPn507H7tOyhlptQlpqJyMkN3Vg3yBHVnTNaTyRVB4cHxGtKHLYj4f/GDb9XAaz800jR6F6Ez
 VI1I5SX8dI8peMXHzXJr4kyMWRZAqUbncsSMfbXbF2qo69nA4yWxyziEFjAZ8vyltjcJrfQiwQ+
 RZOzZUOLwtrmk5nYMQDY+gvgHIi6mLAUn+0clSdDz38zR9G6S5vchCpTC0eWZnBYpRx7rlMIPFm
 mWixX+wH/33EteHriv5JjhBbly6WdDdyrrIrTi2o3MRskuU4qKw9zrIGDas808UW8ZvaB9U0aFk
 itkxQYD1pqzfLrkY7W3KtrY7oHjwiAWtbV9YC6r98rrpuEu4GgRJPHwy0kGBN+mYwDQ54hKKwm9
 rYbARoC77moN5Jc1VHX+ercGiar+4ldY1wS2oHpC9Zr2ormQjzQAWR+sxatLDq2PnMC3GK4R/n3
 UGScUGsyqZEQpEIyKVQ==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=6967eb48 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qCjLGQ0mDaV0PH0PGrMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_111520_742153_537E9176 
X-CRM114-Status: GOOD (  19.03  )
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

On 1/12/2026 11:18 AM, Johannes Berg wrote:
> On Mon, 2026-01-12 at 20:12 +0100, Johannes Berg wrote:
>>
>> Why do you always want to let firmware be in control of everything?
>> Seems at least for some of this you'd really want the upper layers to
>> control it for purposes of coordination? How does the FW even know which
>> other AP it can coordinate with, isn't that something a network
>> controller would determine?
> 
> A less generous reading of this could be: you guys want everything to be
> controlled by FW, so you don't have to open-source it in hostapd. Now
> you realize oops, don't really want to do all the security handshake in
> FW, so we need to ask hostapd and then we need keys and stations and all
> this stuff. So let's build something nobody else can use, upstream it
> and we get the best of both worlds - others will maintain the mac80211
> code for us anyway.
> 
> Am I wrong? Is there a technical reason for not simply doing MAPC
> discovery/agreement negotiation etc. in hostapd as well, based on
> driver/hw/fw capabilities, and then you don't need all these strange
> "triggered by firmware" flows?

My perception is that Qualcomm would love for all the Wi-Fi 8 functionality to
be in userspace and nl/cfg/mac80211 since then there would be no code
maintenance overhead on our part -- just you and the userspace maintainers.
But there are concerns about latency, and internal consensus is that some
aspects of this functionality has to be handled in firmware (or even hardware)
in order to meet customer KPIs. This comes from our history of supporting
large-scale deployments of APs, and the expectations of how Wi-Fi 8 will make
things better. That is why we are posting design RFCs, so that you, as well as
engineers from other vendors, can review our proposals and give your feedback
and counter-proposals. We want to avoid developing what might be an
architecturally pure design that doesn't actually meet customer needs.

And apologies for the "firehose" of both design and code, but we have a desire
to ship Wi-Fi 8 products using upstream code. I've passed along information
that you want our engineering team to focus on the base NPCA patches so that
there is the appropriate foundation. But in parallel we do also hope there is
engagement from other vendors on the Design RFCs we are posting. Our goal is
to upstream as much AP functionality as you can absorb.

/jeff

