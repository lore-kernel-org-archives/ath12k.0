Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF375C3ABD8
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=; b=iw92+scxyvDiKdVCLU/hAHEDf2
	o9w3vYQq23Nj4qBmKdO5atP0+dTC4Mo7cNc/S2o8KXPOqTiI31vfz3Ep9NrX4/b+5YXuB8aAEZjbT
	V5aSvIT7FS3Y5D4FA1iNVe/dfTvlTsMclzjAMVR4aqiN2bKKG0mGUzqhxVMBBGyJ3fRAq/FzVF6Xq
	y1+4NqsBeNSBJWjgkwDpp7w8oDrlPgzRDCfDT8Aqb8pAQmZbfVsct/mm8SdtV/ifoV2nCbu1EsnvQ
	+fvSlDWAIgdwGErN11eV9gAG+mZkAsWV6U79fGCuLUbfwzfdhrvMXKKVC6h/11Iq9JF61LS1+T85q
	ZjOu8piQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0P0-00000004Pb2-2H8f;
	Fri, 16 May 2025 19:07:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0Ox-00000004PZz-2se9
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:07:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBjUkO014961
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=; b=QcNBF8mCDeyS5Naa
	0T8m/NLXdTMUNhPA/tfAQMn+l+rCX6qgTYgoGHGbr/2nCbMRoUv83DkADcWXRnzs
	+98CposOLGncta3FYfLQ7SyThCfMb6a+5++M3Da7ZCvgxXHGV3Bvr1O9KS83xG68
	4SegbEtYALcK6MT4ebdPPkvg1/RU9PnMoQO98unwPaOLlBT/jbVchSXIej79vOx1
	bavNeC1aZbwEnaMdbTqR0DqEIRYNxC+kVvafyuMoFRr39gA/eI4TZgrfYmZacZkZ
	69iEnyXf6BdClH6MsAGUAk0ngtahfqF9pVNplhiata72SH9VIEJHlrFR2ACXvLp/
	X5TMpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpk3k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:07:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74235ee893fso3509490b3a.1
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422442; x=1748027242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=;
        b=eHThruF58yZQszThYtm7PCjpDjYZ7ai43h2J51pq8nZVwSTm8aYr61bJeGWGZH/gSv
         Vj+n8Gh7pUv8vCBVDAAeZbSFszNnyg5ZgIq2wIuSalqTJe+6DI/6la/N2Mz2F6mhm1xs
         mxZlc4TgqLejiYU7c7H5qgS1KlriGYnzOj4ro5SDIvinJ3edf4CQsIaQo0RbsSfIeYqk
         a/SB9jdTIs+QBkaOUQjTFupzIX2tQl0HgECoCAHfE83f/6XJHmP+uZliG1odAfX4/ohP
         Rn3Ojr5hlReTgBJdlipRnDDhEm8D/L3nSMYeLOIu82WGZ9kc9QnNtFkiFlPZZAVM61Tf
         /+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh9tKk5MyxfJpOjTz+8NWOVSvVXqikLxylpPaVsKhycVBVzaTHWM9POgf5yKr9Pl7bagTGQTU=@lists.infradead.org
X-Gm-Message-State: AOJu0YycNjKQOZvR8wSm5MRyaoZukyGVoQRT1VEs4MMitrfl5af+95pa
	DVVT0L+u+s32h1vHvrAVLZiVPz4SKbcJIMkveO47HK89ywJydp8h+RNnCux0am6uOd6/MJgkm3V
	guUYvRci8zAwF//5vBqNHBI3nDeRTIX9IaPAGDoq90tdvI4Xgk7HWfIp/v/HKgmaP
X-Gm-Gg: ASbGncvJAfArbKJlZ3OpMRHh2KR+SB7JpAUouNVbgEcSEKOzrpfrx8EKGQeS3GbJVS0
	2aWR5Tn1tF7y55DwlRRIwtqee+HaUEr0G69m1ybzNbOqsFN0W4zPh+aifEswKlrzhYs2XInDc8w
	nahWW57gUoSLMJi7dbd8qfeehBArjCpGxax6lnoZBTkMXaN1XljYdzZKqtSYGgPG3x8+fEbzrGF
	icAwUjhS6VnluND2f9er0ifCe6c26JJjHn5igSuR2UpEaLKBY7TjhUpxbUm2ykCtjmYuUmKv0fx
	8jYbom5SCNJk34lNwqGp8Y+NioCgeYZH90o9F1vBLJbxZ9go7MuFqBxl0ULH0w==
X-Received: by 2002:a05:6a00:91d4:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-742a97dadf7mr5579624b3a.6.1747422442033;
        Fri, 16 May 2025 12:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrLgC8dkstiJdx29E4dD097tJ0PNl82Z3nmB55Pim85MbNDC4YrFBzPEITGZxbyFl2dSY5OA==
X-Received: by 2002:a05:6a00:91d4:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-742a97dadf7mr5579575b3a.6.1747422441535;
        Fri, 16 May 2025 12:07:21 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876d39sm1914504b3a.146.2025.05.16.12.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 12:07:21 -0700 (PDT)
Message-ID: <b0c132e1-b75b-490a-b2b5-3f5e5c7b99ad@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:07:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250514081447.279981-1-usama.anjum@collabora.com>
 <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
 <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: htXCFvI-dLGrKnlHdtyE7N-Q9THF0iSV
X-Proofpoint-ORIG-GUID: htXCFvI-dLGrKnlHdtyE7N-Q9THF0iSV
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68278cea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=REsDF6D9n_RRfkEuQ0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4OCBTYWx0ZWRfX7OWhmugDgLMY
 8+qSownfu7YkH0w52RwMCwN3MlTEUvfGoasxmhAUbmRPBViI2qGErNF0wolNVhpWJ7fx3SKBRlL
 p75lkwnIIN9GF8Pv2+nRDKfIPIa1miw+jqaA4H3h/KsadONKtcXz+gQCd9KzCS2IyRevCyirsIq
 /QqbpXXRYVvFzHIRpd1OyM6FFmqPscyMrmNlPdCejgqL5A/HSn1S7Xui/W82OijaW8Eeij9lnI4
 u0HMyYLew1GguIzhdMIcoqz87gaLEjTMtukeDbeksku3G8qkRi6r6SPxfjKRaseB068K0qVOQqR
 etU0VYLHHwcGDgoy4YF6X8sCNrO5pYNgLHlrgWR/tBP6y9juCdRHVOb0i9Ef3/kvtwgcLCb/VmH
 iMxHvhTCYeKWYbyRgqehAexcJlzw8tW0/IaQzGBSaYACWjFaSocn8ejmlgzv/UfOiMisMXQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_120723_729556_42104057 
X-CRM114-Status: GOOD (  16.70  )
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

On 5/16/2025 12:42 PM, Muhammad Usama Anjum wrote:
> On 5/16/25 7:59 PM, Jeff Hugo wrote:
>> On 5/14/2025 2:14 AM, Muhammad Usama Anjum wrote:
>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>> allocation because of memory pressure. There is a report where at
>>> resume time, the memory from the dma doesn't get allocated and MHI
>>> fails to re-initialize.
>>>
>>> To fix it, don't free the memory at power down during suspend /
>>> hibernation. Instead, use the same allocated memory again after every
>>> resume / hibernation. This patch has been tested with resume and
>>> hibernation both.
>>>
>>> There are two allocations of bhie; rddm and fbc. Optimize both of those
>>
>> There are 3, but you touch 2.  I just commented on this in v4.  Only
>> touching two is fine (the device for the 3rd one doesn't need this), but
>> the documentation must be accurate.
> Yeah, for 3rd one in mhi_load_image_bhie(), this optimization isn't
> needed. Let me rephrase and resent v6.
> 
>>
>>> allocations. The rddm is of constant size for a given hardware. While
>>> the fbc_image size depends on the firmware. If the firmware changes,
>>> we'll free and allocate new memory for it. This patch is moticated from
>>
>> moticated?  Motivated maybe?
> I'm using checkpatch --strict --codespell and hopping that it'll catch
> typos. But it misses some of them. Do you use any such tool?

I use the same. Codespell is nice, but doesn't catch everything.

-Jeff

