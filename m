Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D48CA9ED0
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9hWISRKxYpfkDOhDQ86zNqoHmHjtrP19NViwFa2Ukk=; b=QfTlx+7AJL6/7zBxTT6d/4c6t1
	j2UiyklpmP9UsqgpOLrS1jh5Qhzmp3/j+Y6OsdMirDm0LsTS+YPVpqJ3urRQBv9Vc8L45vfyFVqnK
	8Z9HVy7U1XEsQcnlsDDFY3/Kps7wbFeUYXLDD8tZ3TADRGyGnGSrlDMW1mwyNqLDeOWYn+9C2bMXi
	y/V45PPSHK584NP1Otazxk36eiDcPefERyddA9rw9X3fBpe3cNhc8R9XfQrIe0YDnfbjcDb9SLWFd
	ioUrwyqy9kS5jXhcRY1ZyoYnfssF3k+WTpwrbtPGhD+Ffw03M6ixPaByTE5dVJ3aJxWdo1zfuQVfH
	GJUWbfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ3D-0000000AzAq-2EDw;
	Mon, 12 Oct 2026 16:38:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ3A-0000000AzA1-0A5P
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 16:38:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFfSo42768442
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 16:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9hWISRKxYpfkDOhDQ86zNqoHmHjtrP19NViwFa2Ukk=; b=EFYNjBA+3Yb6xa16
	glc9d8L1Y0XzPvDxAeQRot+x408D7JVSsJL2xgYuxA8xb0ogUy5bSQDdo6V3sQyf
	S8NSbO5yXzIEhGVgZr9P1z+Ol5L8MkE1ZUGOvhmNOrIltWLKF4qC3rnSqFm109TX
	T4eqwsftgftWWotLNTGbfFg8ABTTxwUJ316Ml5FkcS2x50/+t3ZRpT6m54sPkFRN
	ykdfZQTxHCKZ3RIRWobGlVUvXbwAhrsYxuxyAy6pYkb5VYJ13487dg1Q/9/VtSqv
	K0WDg00TOeQbp9dJksSR+z+mn2O5xqYRbxKbutoybkw6Neh5XBEBqsgMnm/40NlX
	n8MRGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq2djb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 16:38:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso8791985a.1
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791823134; x=1792427934; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9hWISRKxYpfkDOhDQ86zNqoHmHjtrP19NViwFa2Ukk=;
        b=VetR3K6oD3erd5kFH65kYfUJ6+OunGXmshaahsM7Z0v5EjzEM5RhVf0EBbNHQ81CAW
         v8Hy2t8u7T5syb3TCxwaWjuG8iuCUbFlacGi2QxhAUR0Rl9zhLROIpb3Qvsk8bc2qC19
         yNjWgfQPiayS8oQUQf3fogCYeY9H42N2CAWmG+RUvTKaqI+hFzeyBXVwnriVDNQjXU4Z
         XcujtZnlQUpT+TxdFdiBQzu1Pvb1OJ0fnWsYlIlD0btsymrIuY0ejop9QuQAKsSSRGEJ
         jDMuG+Rk7BBSiYtdkmRaOPMlDpYMgNQcydfCFzzxn0IsvnAdtHEoS1reo6Uc0xdcL81j
         D68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823134; x=1792427934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9hWISRKxYpfkDOhDQ86zNqoHmHjtrP19NViwFa2Ukk=;
        b=qDhpvo8ZwYBg2Q5m5pDfwtdONaG5XbV/5a/eEqY1vvnIKyz5s3XUlrw1pYO/7Kb8jK
         3/ZhLfM2yrCHtdwUyuv96XzEzQJegxoDyQP7S7gE74Q8hitAj22NOILzZMkqygwX2Rq+
         lXe5Xo7OCzBcayKuDX+Fc5R0pn4zrHe++/BJhQiiDPzbxu/Cej99oHx9VPhw9AZk/3hI
         meTUl+NK6teAN9+ybBkOnqjJSJ3qubbGa/AHtlFqTIuRYc3ETWGFDsrr2uiVv4tOmh+i
         eZA76xa8KzBL/QneEOKf/rQ1jKm1dphm9OYS4TnY5G1HTrodYb1grQOxLeLV5JslAK5Y
         vwBA==
X-Forwarded-Encrypted: i=1; AKwUvByV0CtnQ8FqlzURpPF5EFLaDwHD1OjkKrFj+KIMZL6MUaIDPpw3FTeoTCdWmn6ldZzxI0jYm+4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJqS3BD9SDJeFmZRpIwJYz1yjZFtntLbptOLc4gTKz5sHhTeIhN
	MgOVlwcmz654sM1QVLBPiRpzdEYtyNc8OD/5RkNWTvkhr57nGIk/OVJYSilKZNaB4O0ZA34X+sz
	+pIS1N1YythYgGqNpFHJn0pcZIn04IwFy9h5joqPnrC9logSzBxPLTAW2sTD7an56
X-Gm-Gg: AYBFou2iBhMVz8cGXlQ43ydQx+8lbYgtKOlsemJ2UkI/VoFkoKkQO6aln2oXqUYTo0a
	ZPhyHS7sap/FEk1KJiT6ej3E3U1PdXR9dsMea/QsxsRvdxrDjcZ6ncJGfhfxzWw3johoRCq2bR1
	75/3cFea3e2xiLzV0evR/J6WI3rY8UXI3Ge+PcoKalzHQAchG/shE67IUr7iG3LACuWS1GP5LkG
	EqjPTtKL3KGuDUAwNipyuoacKs/GdKYci1N0KBJbe7vgNi02buw2Fflxjgv3JMmWiwzgW0KGWh/
	UzvGMNzEgT4BSvdTiAAUnkkPmJXqBA7nMgEiuUGBVImFOHfXUI/CJAp6fg6BkwFMxxmnEHndYDE
	rR4gqm9M8YzB7rig4pwPYdQ==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1731094285a.0.1791823134359;
        Mon, 12 Oct 2026 09:38:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1731087985a.0.1791823133859;
        Mon, 12 Oct 2026 09:38:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34adc25c89sm152588366b.45.2026.10.12.09.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:38:52 -0700 (PDT)
Message-ID: <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acd0d1f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=TqhBrkvpmi7PlCebGDEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX/3VzpShpsw1S
 HMhmdFyxULScYHpppLMXdfcLVfnIYCJ19RGxAAtMVCMd1jvnc/ipPKfHXhlgTxdvU3jeuMbeFjx
 GpffFF2rBomlqnQVSG4Gj0/fGhaFgyg=
X-Proofpoint-GUID: GPGmStpdlTNbA1dQwe_NQ2FLJbVJXICO
X-Proofpoint-ORIG-GUID: GPGmStpdlTNbA1dQwe_NQ2FLJbVJXICO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX1EqsK8veHUzb
 ygibUW+F4vR2KvqvXw1bwW35U7hYvq8N3KVMmlsvemo0r7dur7K3qKzHJ80ZRkf4dILprhiFqmR
 Eu6NOAAvSov3YRnL+8ewuXO0R2VWTgOX/oKrU24hOmTyIM3qeICJVOGwBBhaEe+NWkVm1g//nxP
 /APHwnthPFOS23aGUJSHfhQ8PRhdgfG26gDgFplckclMrvJ78dl2gSjlxcIOYfPIt2X8Rydo0zG
 jmUhsuxI6qmVBRzhBcLDrLmPAHbmfzbBSVl1X6oyivYpNh0yhA7QVAsp8q84o73OSd73GWssC7G
 aEbjieaGXGjXTOrSbnl+XJYohSTzKr8YbsTsiNFCHy8YG4snGu1mJdwSxbuswXNHF+x4XFCamq5
 ok+wnzLLYVTTAoOA3CwCYH/N4AREDWQnyXBXnkWPoxhqSQIyTGKahdZCg2jbE45mxALNRzIhwBf
 lKBcSRlQkfhCTeA7NGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_093856_085486_BB355273 
X-CRM114-Status: GOOD (  18.46  )
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

On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
>> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> For some devices, Wi-Fi is entirely hard blocked by default making
>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>>> on those models.

[...]

>> Is this really a hardware description though ?
>>
>> Its really more of a logical/functional description. It tells the runtime
>> what todo, not what the hardware is.
>>
>> You could also have a list of quirks in ath12k for this or have a user-space
>> utility look for the appropriate platform device string name and disable
>> rfkill.
>>
>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
>> a compat string.
> 
> This is good point. Either this could be deducible from the compatible
> or this should actually describe the hardware and whatever is there
> wired/configured, not what OS should do.

Sorry for digging up an old thread. The board-compatible change is now
I think merged into ath12k, but I'm not sure I like that, as now every
OS consuming this DT has to carry a table of board compatibles (hence
needing updates _every single time_ we want to support a new device),
instead of being able to convey the quirk through the property

Perhaps we could revisit this approach?

Konrad

