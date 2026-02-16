Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBEBE81A5D
	for <ath12k@archiver.kernel.org>; Mon, 16 Feb 2026 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+kXw8zZVr94f7kLbxHGuxmssQSmZZ4vIEtDBBFxxzA=; b=s11vtKE+zYQcP60cGKZdUzzTLW
	N4aOHD3S0HxsqHDCo55h32TizEA+7TeJjyhTw50FCcRU0ZYnIGtuMFM7aqPBwcDEJ9Js6tsPn6Ay0
	kNH4XmvUQgBB4CnKaPt2VOZKqWdKOgE0nkAQL9qDqrGn01uC2nhzpS9+rENV1P1I/HZzrDJR/LXSC
	l4OzbjcoD8kKggNAJeB0QmdHJdY/Gpibh37VsiEmyPAZ3Eiax3MFe142+yG723Er35/zzokd+jFra
	u+G9oReqCnaAi6ubdyXyDanyW2h4fGaO3DL7IaAx5HT+/pAbJT1nhZyscKC0ybqD0svzqTIGYrgPL
	eUWk6eWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2ZX-000000076Tk-31sJ;
	Mon, 16 Feb 2026 17:39:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2ZA-000000076T7-0KR7
	for ath12k@lists.infradead.org;
	Mon, 16 Feb 2026 17:39:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GF6q893392907
	for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 17:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+kXw8zZVr94f7kLbxHGuxmssQSmZZ4vIEtDBBFxxzA=; b=KlBz+HH9eUgp/apu
	hloYt5fRwEFlwLpEXvEjSGIWW8S/NG/8peCKHSOlAPs+0vS4UuSmF0lfvoPzV16p
	QxSTxp5uCn3ovmoNLof/NZPxnx9utZek2m9V+L/Tl9BRdArCHm8GBU+ot4LVGekV
	a2kLWzzRNSZ0ER/M0X6D0hLnnuoIafZfR5y2oRQVDa0C9j0JhRxwvFG2kHqqzAmb
	evONlz45ET9Y7WPgPmf7Bs+1DLaVWld6vu0FEIX41YLUYtREtG3yRdXAb8AiXTrp
	qXuJk2GRAAfIMxR4p8oWK1gcJseeudf5EtgCiV/XHa+5huFkiz5+ukbvsirQL4F4
	Xuwv+g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kh8djf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 17:39:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8243cc11582so1435816b3a.1
        for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 09:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771263563; x=1771868363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+kXw8zZVr94f7kLbxHGuxmssQSmZZ4vIEtDBBFxxzA=;
        b=hEVGy/hWL1OZfsOgMDe3j6hKzNy8JSJlNhBv8ic2DA+qTg3hnCmwYqm5snmsj3+Idj
         04c7Iyo8NGUAqkdtXrVPVFWYm11csRiA3dSlLK1mBwikACAEXFaLRCBIuL7oM2P6rIlK
         BBQ6g5JB9x0wnzGj3hn91BRujvBXPxT5/vbVWnmZFfIO0V7BG/qA5grKSlTUCV5CUH9b
         6CYXi3/jmu3YkOnymbC0jjKzAxhTxpETXsH+OAZZIyP9qKxgzgxuXi5aiMyPEY+8drHU
         GISszt56yz7JQ7ZfUjn9kptluQkPpYzqEON5YKqhrgnyFwfFU5XTmP30x+XPSQ3pgWN+
         YD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771263563; x=1771868363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+kXw8zZVr94f7kLbxHGuxmssQSmZZ4vIEtDBBFxxzA=;
        b=SL+G2WRmVcJjyAC3lHwoD7mxAVp2iEr079VI0EAFC6/8enypJulYxL4sOblQhZL960
         bhcwp0xui0HH79lvRfJz0WQoKTfHImZ86MtwSC+TBckO/UEanQedSruH5uvMBa3b7RbB
         RZJI2ORxPno1yO/PyztLde3lI7yj5fxO0dCxRFFvKsPTyf9oHhPA/70gIYr3LrEXH8Ec
         /TooQjLg/F+HGvJ34XQ1LZyao1fz29NTGh50xPTjLO8hMPjTqT4NDdmA90u+lj7cpYuB
         OS8tYNWsoXgZ8EODUw7JQ8/V8KO+JuTIQNxWkXZqc5ZlKB0qtl5C9+h8jyEg1aH21byy
         VwYA==
X-Forwarded-Encrypted: i=1; AJvYcCVYetB7y4UhWkDycnozn0f24lB6et3Wk3bIzxO2OdYo4B9Dy6J75HSJ91V+deruT7BlQsnyk0c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9qBs7Lqf4LMrg9S29izBxMhe1H3ZdEDyNmEfcddz6JGcreZ+t
	RMeY8XbkmAtNMuUjyo+1Cz7vubxTZYC+2BPASnFfN6dvn7y7HheGFj+22CU1FUAh6C5VYJfnpMu
	Vig9HYyryfB8vPSL/vMv49WuHUK5sqWYPBpwH1hUO55qjCt8F+K7LtoJPc1roJBEX
X-Gm-Gg: AZuq6aJElAfSTjTaU+WVwg0uu1HG9YxRY8rGl9HS5wTOfPULOmlU1zL7SHBR/zVy+VA
	ei+ETjOcI2N+7IxFXe/kJTRl2od5RIg+PEE4SggY7fPh5G8Xl7OTym6eEgRxKpnyR6iBheqCnYX
	cateZB7WWn1aTIGEBuqSz0zISyiU2Z+fOgwzxUUuj7gkfCu5zGTSBpw7+v78hlrbY15/KYzmcG7
	lWPHfcZNbpSzSphylHFnBapFt5aQcnNuzu7knuyX/qUl/bpukvuQOjxhuTuSt8Ov1lurav+DFwC
	oM8JaHyxmBFvhyu9e/n2gToqklLgAsIyUzSLnNhTtgvN/gg9c1BZ9AzEw1WuCnLrgrqvAdfQ2Tl
	AlhTZKjjWZp7bbCjR9ANAGRGFbi8OENeaLz8soU1wpBUl1ecg0NDa
X-Received: by 2002:a05:6a00:bd92:b0:81f:3a05:8a84 with SMTP id d2e1a72fcca58-824d5ce9beemr6820971b3a.11.1771263562620;
        Mon, 16 Feb 2026 09:39:22 -0800 (PST)
X-Received: by 2002:a05:6a00:bd92:b0:81f:3a05:8a84 with SMTP id d2e1a72fcca58-824d5ce9beemr6820953b3a.11.1771263562116;
        Mon, 16 Feb 2026 09:39:22 -0800 (PST)
Received: from [192.168.1.2] ([115.97.96.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb5596sm10757838b3a.58.2026.02.16.09.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 09:39:21 -0800 (PST)
Message-ID: <4efd11af-dea1-49a6-9df0-1c7fd84f6c82@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 23:09:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v8 2/3] wifi: cfg80211: add initial UHR
 support
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Lorenzo Bianconi <lorenzo@kernel.org>, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Ping-Ke Shih <pkshih@realtek.com>
References: <20260130154259.265130-5-johannes@sipsolutions.net>
 <20260130164259.54cc12fbb307.I26126bebd83c7ab17e99827489f946ceabb3521f@changeid>
 <f96125eeda23451c19067359eb9d10b4047bcdd3.camel@sipsolutions.net>
 <5d54feea-d0cd-4bd7-b0d2-02e42f0fe5e1@oss.qualcomm.com>
 <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
 <9576fdbc0b9b62caba88e05716d7c7028512130d.camel@sipsolutions.net>
Content-Language: en-US
From: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
In-Reply-To: <9576fdbc0b9b62caba88e05716d7c7028512130d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=6993564b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6sPDMptOXngzVA0SphYZxQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=UQeIIjOO5qqIzHpyNngA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: rI-GqX7biXEE6S-PJ9-TUo5leaafSblo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDE1MSBTYWx0ZWRfXyNWQZhgBG7vb
 YX7kM9CPeP8tUPnWyvoOf4F2QRVln169jdxs7ahjve0O5i2MaoqbD4f4HfhpDbSu1BQmxjuLTv1
 9NWRKCGewg1Tqfr6CeQwBMfutea8gjysGlJzFyd5fb7K7GzL3on6B3TTdmKWMTE5DlPrvn/73h7
 /fsAoyBVv4qUjeUzc40FCRvWwTZIUi9LbwBt8RzJtvgG1bl9FTxM/A1Lmt3uzxvwC/H3qaBySk2
 iDNaEALbRmqI3G8qzKk4wlwhAa40/n7R8Ty6k2fTx5M6GCnnCKNzNsWzvrQ9UtpbeBpGh3SuB9G
 BZVWr0GuqXrcH/22cjukLGCANq1MphnOuxFZyeQkIVRfen3r56g94wybmY0sp3FyhYxDBatYiyc
 4en0ZBLYMPy3oXWuEU6K3P2N/aVxpJmGuIITKOvWW0fnPgwT9DP2SpzhCX4V84cQ1MiWLJAfFCO
 UU2503q5nNWOoPWHEOg==
X-Proofpoint-ORIG-GUID: rI-GqX7biXEE6S-PJ9-TUo5leaafSblo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_05,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_093935_963109_45A0D05E 
X-CRM114-Status: GOOD (  27.14  )
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



On 2/13/2026 3:56 PM, Johannes Berg wrote:
> On Fri, 2026-02-13 at 11:11 +0100, Johannes Berg wrote:
>> Hi Harshita,
>>
>>>> Should we add a separate netlink attribute for the UHR operation, which
>>>> hostapd would fill with the _full_ data like it appears in association
>>>> response etc.?
>>>>
>>>> That way, hostapd doesn't need to build a separate data/attribute
>>>> structure but can just use hostapd_eid_uhr_operation(..., false) for it.
>>>>
>>>> An alternative would be to add more attributes for everything, but it's
>>>> probably more complicated on both sides?
>>
>>> Thank you for the suggestions.
>>>
>>> We feel that using separate nested attributes for each feature is the better approach, as this allows us to reuse the attributes for the Enhanced BSS Parameter Critical Update procedure, where similar information is carried in the UHR parameters update element.
>>
>> Heh, I'll admit I'm surprised - I'm usually the one advocating for
>> finer-grained attributes, and here I didn't ;-)
> 
> Wait, so I wrote a lot and forgot to circle back to this question ...
> 
> Basically I think that it's not going to be useful to split it up. I
> have no objections to it, but it complicates the code (especially in
> hostapd) quite a bit, because it's going to be either
> 
>  1) include each thing (NPCA, DBE, ...) in its own attribute, so that
>     e.g. NPCA would be 4 or 6 bytes per spec format, but then we need
>     separate validation for each in nl80211
> 
>  2) we really break it all down to each individual value, so e.g. NPCA
>     would have separate attributes for minimum duration threshold,
>     switch and switch back delay, initial QSRC and a MOPLEN flag; this
>     is a bit easier to capture in a policy, but a LOT of parameters
>     overall.
> 
> The thing - and why I wrote so much - is that we basically only need a
> single current, and in the case of updates additionally a single post-
> update, UHR operation.
> 
> So unless we're going to completely design away from beacon templates
> and create an API where including the UHR Parameters Update element is
> fully the firmware's (or driver's) responsibility across all the
> different frame types, then the split isn't really needed. And even if
> we _do_ design it completely that way, giving the post-update UHR
> operation and comparing to the pre-update one isn't a huge stretch for a
> design that just required fully rebuilding all the frames (parsing all
> the way into fragmented elements and putting them back together in a
> completely new way, including re-fragmenting elements and subelements
> etc. which all sounds very messy to me.)
> 

For beacon‑offloaded drivers, we initially thought a separate NL command
for the UHR critical update, with dedicated nested attributes, would
make it easier to trigger the firmware/driver. At the same time, we’ve
been having ongoing discussions around CSA and the UHR critical update,
especially around the overlap with post‑beacon template handling in CSA.

Thank you. The proposal to introduce CMD_START_MLD_BSS_UPDATE gave us a
different perspective and helped us rethink how best to handle this.


> johannes


