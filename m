Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99A2C7EE30
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DKaR3UNpAdV9bWro9TvXD4wT6Yvg2ukG4OkQhKAalo=; b=lf+HJp+I7eoKY61r/D54jqehzj
	oMrx7UDTrBrWMdVlqDz9s5SQjjszZtn+71cJA+AHEDzo4an7YMT1er5BHtxPldVTSke8CFzsV8gMM
	yUkfob5LDRQREuJd7PfDhsb4cycp5gmNySQFC1xwmM6XmcqShPx08X1LsbDYqI4xtnnGutuc4tjHq
	VOyBEnewM2z8V2r0tIPzVktuKh30JfWc37DLztqPhwcJRXE3ZnhAom1IVR9fwAFi0VHQ9+8C/3o9r
	PKBSE/Aopf4eslFWai77TeVpJ+u9SDt6zXb4P+yyWqD1teZDAUum4audHKu1eDOx+FDOxOaXTf5P9
	O6b1dwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrSH-0000000CT4m-1g9h;
	Thu, 26 Jun 2025 18:36:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrHx-0000000CSP7-1yHN
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 18:25:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9wkR6022841
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 18:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DKaR3UNpAdV9bWro9TvXD4wT6Yvg2ukG4OkQhKAalo=; b=F5DphSyXAAn+rmeM
	4plIwD/SPJf6JaF9l0c4KPGh0/0rLgjWsbr/YS+2+QSM/NMlVGOazBtpR0WQH4ps
	7ldT17EhOcsKZehLZjKITHKEVP6fgsVeCTEyC493yI3ppN/sXVR6/NEIjV6jOWrx
	0BDY25Qx3gNCpX7hl7ZokvfBz8GJF9wyFMBLY4bwb2Mtp3QuGEXtlwmrg9v20Uyg
	aFH3kxol8pxRM5dFjSVnh1TYXVdGPCjKETza+sxUmn/Fp7G95C/uXOnwyLfCCMZa
	huiGOgNcOiLB+az5UHQq74BxZppQK0D8LU23osDASl6/tq9hwTBe/vAAB92WJBM0
	aY2yhQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx2kvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 18:25:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748d96b974cso1097032b3a.2
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 11:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962331; x=1751567131;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DKaR3UNpAdV9bWro9TvXD4wT6Yvg2ukG4OkQhKAalo=;
        b=m2epJraoSUjTz9Wf44I7ykl3xOwSbGLEh4E823P5difQG04xBnSqK8dGfv3cAHXHZa
         vj8P1qd6c75a+k0mmOaZiWmNT+dlx3mNVIEmSp6xd+1O7aZA3T6u+t1r1x85PhVN40bQ
         yS3lZjfLy7q/aNEmTdz28MXINHQK0f4WO57/stQFZxbQGlTK+eDjFoH9PJNXBBodRhcV
         sWDH6OqqzZLw2GfM9YIALTkJosBTUsNqVVa0dYMVeaFF7oEuRrvpSvoaUrW0mu6qYKjo
         V3HYVZrzpiBKocsw0jgjD48tr2j4MmWzBobST0KFTMjwYXi2lx96ztepqiq+ElEDRgRP
         udWA==
X-Forwarded-Encrypted: i=1; AJvYcCXPK0W7gkGXmnUzvCLfBNu7Xx7Xxs28pV7rSkd1JoIAxvRCfqgYsOFcwCEm50G1JAkG/TbNVgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaIlqZI7FgB8jPZsEhlboOyJwMyV9i9ETinD1q1Nf7gqgRzFeg
	Ps8nxLhIC7wzbmiZhJg4Krk9tbw3jqiuhzxj9lpXtzRsFrTppZhsLWoCHd12I8L7fcO1WV+0Ulj
	QzORIGNRSXffpCvO/3MCmy5Yd/nGNkIMC8NlNtmUsIyDQKauEibRh8XGrraqGNMaS1r4o89Kg
X-Gm-Gg: ASbGnctQBmWSPFpSD+awS7hdn8pqHJvusAKpVveX18JNswpHlmIH0viCxT7p61vYr+P
	ICFG9SLGV1fn5nzq24SyA3YDvjFztNXR9K4Uw+jU6oxcUShyz4PshtoafHfay2onibxR3UZTbLk
	1yCx4VBglMWcAZrj+WCN50+oMFzezCdLtHK/rl4V1xWszMaa/ich3yIZJyDcLGfWC+s6mVqf06l
	FKr2HHr/51zNuFarmA2K95XBvwB/DAuL2ryJunynny/EGJgsCfOwwLmPl/a4B2zxuU9eha9prZj
	wbgWPQt0qUnlvM82HsxzoBW3ysGZGVcQjWdUS4uldWGAtt3Myua3k/ufnZvF/Gntg9uJut6bb1R
	DoSbzoxb0btxNb+4=
X-Received: by 2002:a05:6a00:2190:b0:742:3fe0:8289 with SMTP id d2e1a72fcca58-74af6faf895mr277020b3a.20.1750962331010;
        Thu, 26 Jun 2025 11:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg26rtk7l1GRO3acP/L5qehLKVQkKWP/wrKtG4Q2URTIoHpv4Nf9Hk1emwQxoT7rVxQT41kQ==
X-Received: by 2002:a05:6a00:2190:b0:742:3fe0:8289 with SMTP id d2e1a72fcca58-74af6faf895mr277002b3a.20.1750962330599;
        Thu, 26 Jun 2025 11:25:30 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af54099ecsm318170b3a.11.2025.06.26.11.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:25:30 -0700 (PDT)
Message-ID: <fca2def0-227b-4208-8104-abc40368f7fb@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 11:25:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add support for transmit
 histogram stats
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Saleemuddin Shaik <quic_saleemud@quicinc.com>
References: <20250617112139.865788-1-quic_rdevanat@quicinc.com>
 <6b32c871-0d18-4cdd-e097-97fc2e7bdf28@oss.qualcomm.com>
 <cab5daaf-bafb-4df3-9e44-1d0e6dda0341@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cab5daaf-bafb-4df3-9e44-1d0e6dda0341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dIJ2UQpURaJCEqPB6XYYTgrxW73JdCbt
X-Proofpoint-ORIG-GUID: dIJ2UQpURaJCEqPB6XYYTgrxW73JdCbt
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d909c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=641d-tqymQqKGBjUoOgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE1NyBTYWx0ZWRfX0T3n1Lwnj9gi
 75SL8iSAVZdGBgolKn6XalJJVsWUW8GrbxWrZAenHJIGQ+6pEDP0Xo0jjF/sWvdRzUjJl4evdA3
 RODXXJx/VXcukA05ZqbJkKbhhCpBfa2CTvaauTbmsWG1SoP6BYwBkGHdVcxheRmjUmEGXXlO1cF
 x11IhUMh75wLUJOLy2Amvd96TR+waBDkrJ/So6iMNftAInAnjOFwuHWKeyvDfu7HwrKe3taZzA1
 zH05uWHRHvKVi3Ke1qw6XRSd8hfcIFc70FnmLFLpX+aywOnS37JIC5kwTyHd0lObEcIas6xqMCJ
 8ed3VL0FSDhp0jMuZGhU+E76V3qQh+ktukVJuCZ0b/6RViucYbGOxiQ94fX+ELcCmG5erEAdNvr
 QRL893L9KjEEboXXvbFpvI3xKZ4pasSTzZwy8kDpDym79LOArbPKohq1vSjzLvz1xTPLQwp+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=957 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_112533_628170_DD4E8A1F 
X-CRM114-Status: GOOD (  13.47  )
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

On 6/26/2025 11:18 AM, Jeff Johnson wrote:
> On 6/26/2025 10:20 AM, Vasanthakumar Thiagarajan wrote:
>> On 6/17/2025 4:51 PM, Roopni Devanathan wrote:
>>> From: Saleemuddin Shaik <quic_saleemud@quicinc.com>
>>> +struct ath12k_htt_tx_histogram_stats_tlv {
>>> +	__le32 rate_retry_mcs_drop_cnt;
>>> +	__le32 mcs_drop_rate[ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS];
>>> +	__le32 per_histogram_cnt[ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS];
>>> +	__le32 low_latency_rate_cnt;
>>> +	__le32 su_burst_rate_drop_cnt;
>>> +	__le32 su_burst_rate_drop_fail_cnt;
>>> +};
>>
>> Since this strcuture represents the message format used between host and firmware, pls add 
>> __packed annotation even though it may not have any effect in this case.
> 
> looks like I missed this in a few other structs as well, at least:
> ath12k_htt_tx_pdev_rate_stats_tlv
> ath12k_htt_rx_pdev_rate_ext_stats_tlv
> 
> perhaps i'll take this as-is and then have another patch that adds __packed to
> all _tlv structs that are missing it?

actually let me fix this instance in pending, and we can fix other existing
ones separately

/jeff

