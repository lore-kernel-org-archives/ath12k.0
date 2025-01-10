Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D227EE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 20:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF7gexX3j8oIJVpcpEigxvZYGq7MjRbFVfqVXfLEDrE=; b=hhzBZWnErCt5IG+gS+F6yHk0QY
	TsDAF2qJAqUDLwdVYzI6JpIr+et8/heG5E+esD/fMx5fwidzCn2nZUezhHsN7ak9ls3W6+GTezXQw
	V+mwT5QIoXgZVgJZ8LqWrTAaHuPYj3XwuY1HvN/0Ra0VEk+ZFRpIyto67i/AnFxhoMdrw2YqVtg+g
	NB3SD3kLAnIfP+H+kBdAgq/IbAo/b8eIrOgjNuOaex5MR/okHXb2UUHPtLG+o6eKP2ovfQuq4oaKp
	dr6tewodmAr0De2fBC9JemBkkq25vRRTxbe9piQqMpDDALtg/IqkoTFCi/zGgcCMzk6S8KLZqngf5
	LpeullIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLIq-0000000Gr8A-2TlV
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 20:08:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLIn-0000000Gr7a-2eMp
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 20:08:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AE6NDV013212
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 20:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sF7gexX3j8oIJVpcpEigxvZYGq7MjRbFVfqVXfLEDrE=; b=MO43gHM7HYv7SNV3
	oyFw2C0J9LVI+Kp6ct5OeEauoWts23kOAeoSeAGS42DdfrqreDye9WJxDNjcb/LX
	Ppqmf0Of8wRAFfd1YstG7p1nz9tJC6a0ONgjYh8WDUDvrdRGtobP61tsPGMh4NuJ
	XdxGiBa9xrxbIIplKBWGPyvE7S9cCpa+jmr2mVS7A8R/h0M2NwmnEwsm1PdsEtyR
	6FA4LmaxCOASG7fpZZyyC2t4FfYSZHawSXBacPOuh1uYB/Izd5BJu6PKek6oQq1H
	eLxiBPJmY8oYqXXKAeS19dF9BWE5ia0EfPxTKgOpMn+PPSCF5WtSxBxmUAdElnJ4
	bk62IA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44350srwg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 20:08:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216405eea1fso46026445ad.0
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 12:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539695; x=1737144495;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sF7gexX3j8oIJVpcpEigxvZYGq7MjRbFVfqVXfLEDrE=;
        b=qp8qgESR8gdYLPficRU09VV/89icU/g2RqQABprAvxpNVGqLW8+0A8E6s6/nWeMiqp
         3wm9ASS8Fk0uRTApvZkQU/omXDlXnWwv3OPOXbD0h2qqLeFEAo+j2KM6XJ1w/PKqHfr7
         ry77vUZ5SVQYN1TXQyb7L997nihikERWxNgzM5GbkiTzGze6N40y1dAzR8wAMyf/HCos
         aCoiOcEUShGZO5z2t7npZtIWWm4H49xZHL+HD8BS0p+15P2hYEtAfm1gmapdytjfAxJq
         s7dHTb/htgBxWaQOQjAcFZGOhojm80Wa87BRVc6c9F+YIHwnI63hCCXz/3yUXJ2xEapE
         5xJg==
X-Gm-Message-State: AOJu0YyH+QNvf9CKiX6yB8sBPKjBZEq3ye/zap9qHqItaUq+Mca4+7sn
	XEgglcB7BXfBi+Gc9lEKTmwcEIqdlkdX9n7nhtTirjod3Cuk8+XNVKpOYO1KJyPwkX5vGeJXfzj
	Gu/A3POxbu6bSrVsDO9mAyem3VeF50aCaFqDyfvCdgBkmwvYagPUh884c7tSuNzUG29ns
X-Gm-Gg: ASbGnctx4jtoJ92POpsFW70cBJVA2IC0z8nfMmVHB8UsKJr0BCDwtZEhMaL0vDClFSX
	N1S7OHjmIQxVNkaEBcni4xqaMMzJdsMlsUZWi7yrcczmdJ9j+Zgiw6QTloItvY6e/2xlVZeHRUI
	6ybmXUpcUZHZLNyJFkNNJG0GLDxen5y0bjBXGIj3KJsZTwSuEhzLT1QKJ8comgFyM27LbWwLUXe
	4op++4iRuJ0HBVNV3IPHGcHLjjiGVMYFia/XmGVf7HBOhVFpmEtJEM6yvRsuYWwdllZsU1GLpwA
	E4+hZ0GJ5fGKBeLRZmPYpCEFgkgXeE7Q4+wqx9tpIPAsXEZurA==
X-Received: by 2002:a17:902:d552:b0:215:96bc:b670 with SMTP id d9443c01a7336-21a83f4c0b2mr153536055ad.18.1736539694668;
        Fri, 10 Jan 2025 12:08:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFaHkvldrBPu+zvovOGOpXeuXA3jKfM6OoiGi91XLmLHzYBU6GvrCYFkaoLCC1ciQV/LZayg==
X-Received: by 2002:a17:902:d552:b0:215:96bc:b670 with SMTP id d9443c01a7336-21a83f4c0b2mr153535665ad.18.1736539694238;
        Fri, 10 Jan 2025 12:08:14 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d22bsm17117895ad.189.2025.01.10.12.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 12:08:13 -0800 (PST)
Message-ID: <e6ae2b06-0cb5-4453-aa40-881a5e18e207@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 12:08:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Support Transmit Buffer OFDMA Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
 <20241128110949.3672364-3-quic_rdevanat@quicinc.com>
 <87jzb6flwz.fsf@kernel.org>
 <c776b5ee-0e25-4d21-be21-dd318ae33d1e@oss.qualcomm.com>
 <c022493b-d009-4a1d-9fbd-219a3ecf84b6@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c022493b-d009-4a1d-9fbd-219a3ecf84b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BTPeHl9E9WOObuaYl83enOBLXgNBPS8f
X-Proofpoint-GUID: BTPeHl9E9WOObuaYl83enOBLXgNBPS8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_120817_799894_AD22D2AE 
X-CRM114-Status: GOOD (  21.39  )
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

On 1/8/2025 9:38 PM, Roopni Devanathan wrote:
> 
> 
> On 1/8/2025 5:08 AM, Jeff Johnson wrote:
>> On 1/7/2025 11:45 AM, Kalle Valo wrote:
>>> Roopni Devanathan <quic_rdevanat@quicinc.com> writes:
>>>> From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>>>> +	len--;
>>>> +	*(buf + len) = '\0';
>>>
>>> Please avoid pointer arithmetic, this is simpler:
>>>
>>> buf[len] = '\0';
>>>
>>> Or should it be just 0 instead of '\0'? Don't know which one is
>>> preferred.
>>>
>>
>> well my take on this is we have a lot of similar pointer arithmetic already in
>> this and other debugfs files, including all of the scnprintf(buf + len, ...)
>> calls which could be scnprintf(&buf[len], ...). And we have existing instances
>> of trailing comma suppression in:
>> print_array_to_buf_index()
>> ath12k_htt_print_txbf_ofdma_ax_ndpa_stats_tlv()
>> ath12k_htt_print_txbf_ofdma_ax_ndp_stats_tlv()
>> and others, all of which assign '\0'
>>
>> so this code looks ok to me.
>>
>> that said, while i've been reviewing the debugfs implementations I thought the
>> code would look much cleaner if we had a wrapper function (or macro).
>>
>> Note that the input to the current debugfs functions includes a struct
>> debug_htt_stats_req *stats_req that maintains the buffer pointer and filled
>> length. what if we had a wrapper that took just that, the format string, and
>> the optional arguments, and all of the pointer arithmetic is encapsulated in
>> that function, rather than being open coded?
>>
>> so instead of:
>> 	len += scnprintf(buf + len, buf_len - len, "some string"");
>> have simply:
>> 	ath12k_scnprintf(stats_req, "some string");
>>
>> that function would extract the buffer pointer and current filled length from
>> stats_req, calculate where to write the next string, call scnprintf() or
>> vscnprintf() to write the string, and then update the current filled length in
>> the stats_req. That would eliminate all of this housekeeping from the callers:
>> buf + len
>> buf_len - len
>> len += scnprintf(..)
>>
>> /jeff
>>
> 
> Since there are a lot of instances where this change is needed, can we raise a
> separate patch for this? If that is okay, we can go ahead with the current
> implementation in this patch.

Yes, I'm taking the current implementation to ath-next

/jeff

