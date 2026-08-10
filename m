Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F75C5AD4E
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 04:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WsshM48rhq3oko+rk+xALFZQt/sxdV74HMC+99dUD8=; b=qnB21D7vEzyS9/W4xN35BgOuTN
	HsXdFReW3v8/10tyRSZL6FY3tA33E8UvfJgha26sl6jrpDWtGy1kkmjjfDtxCFjpFMfceiW8mF9Go
	R43I4R9gBhT+CjbV3rJGrfzuka0NthpioUOQ920FVjwDtewQFAcsatDmqr4+NBZPK7RHtdOpsason
	3wxf2H0u+ujmYebL1PI68B1RwrKKHvWC5D6ZBzfvIytGN+/BU2/FUQQSfTcj0TUH1q43K81nHs2Fe
	uR/3GHqFv/Fd/TRBP7GgBKz9gKQfrMpSkftKPGOWWxKUdgJA34dkKN3a0TuJp/dOaGaRG5Gv810Zz
	eWo/P85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI3R-0000000B12v-3aEJ;
	Mon, 10 Aug 2026 04:56:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI3N-0000000B128-3KM4
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 04:56:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L6sRT3728626
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 04:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WsshM48rhq3oko+rk+xALFZQt/sxdV74HMC+99dUD8=; b=YHHttd8LmLJ1bJ7s
	pGl1xh+yN9FcaJvXR5lxJUxO7NMDRPzZEsi5fG3zOCDFMyIB7CtkSYAmvdMjQlYs
	KFww2vtIW8hLSQbIAg4wKTEtDq/vdI9Mi8pVWxuHeLmVBY0LHUivWVJCW6iieBMO
	yFBjHC6bHFbKZuV5Zi1K04gBgYECjBxKTAQBtNWxuYnMmx775nsmkedhBtY22zWl
	kSCOtPJz+Pl57hJzTgMhKn9yKoP8TzeWfu/GD75FzBRdUbBxZ8+TohuH9xo1nn4I
	BA+rKDkSlfwiieUBBqM4ApAHfuUGuDMAhuYoHhSsaGFmdMHC7iDOHggmikiIHfyL
	Jc6VHg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush4fbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 04:56:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84859a64079so2875205b3a.3
        for <ath12k@lists.infradead.org>; Sun, 09 Aug 2026 21:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786337760; x=1786942560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WsshM48rhq3oko+rk+xALFZQt/sxdV74HMC+99dUD8=;
        b=ksTG0dbWrN+jydroARbgblG2KbLnM5YwX4HWjHglHPDWwi37WygD+CWKvTARMPBKPq
         kUd8S/NUVI62jtRktY7sa57EkKKg1UISPGPFBeshQ0saGTZNr4WLxIoCL/pQcmC/B9HE
         fr2WwLbIlWXFP4MACcJhM8CWJT0CPAYv725UJuanmw2nIaJbpoAivpEgLeC6nRYvvQnj
         6eEki2nPD2rNEXkxm887WMHvpd5wBhj2w5UmiveU4AA10J98kIIM/lt3q6zeZFQ9yf1I
         17akqw8NjOUGxi0qGmdJyQuz+bWcVpUSdVAjthtVMMVeFydwRp7c6rOMVaUSlOy4ABXo
         ZapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337760; x=1786942560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WsshM48rhq3oko+rk+xALFZQt/sxdV74HMC+99dUD8=;
        b=R9ExYwOAvd6KYvmI+BV2c/YtR8PCAle7X4evuScI/fSQXX1EY16cqRAqK2FbVJGAbi
         kRfWyvmK50VfVDE9mODHZH1p8/7Ez86Iq+Wni+70OvKsyHSutv0TNYZ5NBvzXfXFnP5r
         3Ho6IPqkqoZ5tDZf9YqN21NL4CXvErII84ZCkJwPPJVkHg8DyHlibuUN4kO1xxWYlr5C
         QVavvFdjQl5J/E8KV3EM54s+q+HtTwtMwwLmjQxi95oVBIQxhdWzh1T36zkV7fzBZthe
         P0n3xv91Qjm3xpknSrTpozBmKm4zaReCMYSlozOxhfNwW1l8YgNtNyfHfNmWz4zdCkVH
         aUXg==
X-Forwarded-Encrypted: i=1; AHgh+RpNfgHZ9gxyPc40Oq3Cp5uwI8Tsc778udi8wKwmyhtkx8f9YEYVbJayuJ/1on2w9FF8rL6hCek=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyA5lDU6r2gmwghCgg+M3EA5983TPiHTlYWbn2/nK077hsjIUG
	yjg+Kdg+GZjee/HiJOZUDcQtFwpqA8jG2gXDsxanoGS4qqvw0M3FPGxPXW8+FBrewZr5M6rwOai
	OFXMjeRIDILnOMDiByo44XqXa/2wzstqfCJaRJP4fTI0Fmmx/2z5ve7WN3hN/OSpX
X-Gm-Gg: AR+sD12fNNY2Jbizx9yAAGesuMLJnJt0vbWqw22iRmbTd+iFvkR+BrS0s/IpF7rWlZ+
	bYwndaI61bmSXidTuUEXd7DzqEv1GsqAUMLqzppm91d0OJVQXvRKCrVmKVzV/UV24v2qD+NcUAA
	y59qf6L6S9+MuNBOvWL5Gt0M01lc0vqWC0aGbNj7QERbXnNDXAeHbq5RCVieTVfL0O5auDGPTwi
	NHugqCSHJkGsTyu+5YgCK/4hIz0F1xS0FsHo7qAJraJaXUPnYdTxi+hBXXn/K4Gw8yoOdtSYURm
	6Z95OfZWHk9AEf1PIf7FH/nshQXIYFqnE36ujsOti0Wjd0t45jHlzIPWQbQvo4R555Y4PrtQU+Y
	bKSw3h+02vSjCaPH6Jqmxc9Wt//uQO+t/boQUyCZyQGJZDrbkq+gC3nk7yd/CVOeM7Ts8fbchSL
	xSgjz3Q4DN77GbAdPOqQ==
X-Received: by 2002:a05:6a00:2887:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-84f2dfcfd34mr47829872b3a.8.1786337759747;
        Sun, 09 Aug 2026 21:55:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2887:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-84f2dfcfd34mr47829849b3a.8.1786337759261;
        Sun, 09 Aug 2026 21:55:59 -0700 (PDT)
Received: from [10.79.124.186] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3d1155sm3203620b3a.20.2026.08.09.21.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 21:55:58 -0700 (PDT)
Message-ID: <41001b17-36b8-4c5c-9a8a-959ecf7b28ce@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:25:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 7/8] wifi: ath12k: fix 1-based ring index in
 REO Rx Received debugfs output
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
 <20260806132427.3704828-8-pardeep.kaur@oss.qualcomm.com>
 <746f106d-f435-47ca-a33b-32e4b97843f7@oss.qualcomm.com>
Content-Language: en-US
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
In-Reply-To: <746f106d-f435-47ca-a33b-32e4b97843f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nAX5adN27b5l6ddTGG-T3IWvj94hpcG-
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a7959e0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZXtejqto8Ws31T1WmfgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: nAX5adN27b5l6ddTGG-T3IWvj94hpcG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX8Jzsr1C7oUeB
 Q/6/06lmT5axcIj948I6a7MlBCpCNC6re9I+Rw+Jv1kjY0T4LhKUJ+jRSGlNtw2zXA6r1LAWYMn
 FaFj4GVqBG+uQdSILQhlMTbpmXvCjUMhG5M+5CQafk+ILZaFkTTu9sYPVUev+rQn9iWnIgMuupK
 S57ZGDXmo3v3P7dqdFp08WcuX0AAFFG8OhBxVB5JS29ZiXEeW1t5CXhfuzCd4AcgAyapBnJv+si
 G/tFouah9/01as+5uLST6xX1pjak9+IND+kccq8Raq3u0b20LVS/aPLKJRHeuQ/Is6VfAzWK079
 WuoBipceqlFEZ7sS1WgHXtpQ5KcBEglnnjnua7f6NRynTkqwNM8AF5qNvXmf2obkZJ2eyFcZPgd
 UUeQWkqQFHZ9O0sIiw8vUkoMOCxzYkagn8S+j6PQhJprAabHtcZDVhCB77iELXhIL5cfCtV9AFl
 e5xr4FCmzwZAFUtAC8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX8r9pa+KAoI2C
 0WvExXl+MlQOhxcrSL/ufHpnUaY4G7AEHA/tgdF5w3ySCoM4MCJyx/Puvhgcn2efN7o4JsO1Fhh
 sPReTuIv/TcRXYgiV28aagVAx6YrXp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_215603_296648_EC83ADB3 
X-CRM114-Status: GOOD (  15.38  )
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


On 08-08-2026 20:56, Jeff Johnson wrote:
> On 8/6/2026 6:24 AM, Pardeep Kaur wrote:
>> From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
>>
>> The REO Rx Received section in device_dp_stats debugfs uses a 1-based
>> ring index ("Ring1:", "Ring2:", ...) which is inconsistent with the rest
>> of ath12k where rings are indexed from 0. Fix it to use 0-based indexing
>> and lowercase "ring%d:" to match the style used by all other ring counters
>> in the same function.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: 84873d542e95 ("wifi: ath12k: print device dp stats in debugfs")
> drop the Fixes tag -- this is not something that needs backporting

will update this

>
>> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/debugfs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
>> index 216a1af22898..d4ea21aac21e 100644
>> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
>> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
>> @@ -1215,7 +1215,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
>>   	len += scnprintf(buf + len, size - len, "\nREO Rx Received:\n");
>>   
>>   	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
>> -		len += scnprintf(buf + len, size - len, "Ring%d:", i + 1);
>> +		len += scnprintf(buf + len, size - len, "ring%d:", i);
>>   
>>   		for (j = 0; j < ab->ag->num_devices; j++) {
>>   			len += scnprintf(buf + len, size - len,

