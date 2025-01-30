Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA5C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 09:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eePmyQ6AyToHFq5ZzRudtzKbdM2PRLlCrpc5DW2Ub5I=; b=Hnk4zyh9AdlAAW1rlWmo5Eajo7
	YykcoHSfMvPq7KqqJNo5cWbR8RR6wF6v4Uu4pRecHk4iPHiYF/Z9NNndlIJexxsnPEhflBCi+ndfc
	08LJEMV9OTOZeDXJcgY+BVrs5iXgvt7TfNCcH2AbLZ6XvL9spWo0VFA3Ko1CT4J+hVdAevS3oDTqq
	ueCGOKOpaufIoqGY/hhOfZkkkiGUEd60kPyy2razNvyIYW5gsotH3X+RAHncb4BW+LMyFh+6Mh8aK
	hbKsWswmdcEQkdGmzIHVdkMlFMuittE5G7v4iyuQOBXW+lHM67XSvKC1WiwAEszHiM9Z8tEZ7FsY5
	W/2GGsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQgu-00000008UOe-1yZi
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 09:18:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQgs-00000008UOK-0SrE
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 09:18:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9I3Ek012127
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 09:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eePmyQ6AyToHFq5ZzRudtzKbdM2PRLlCrpc5DW2Ub5I=; b=lWL6G0zmDNerUlaW
	G/LIYKhkLnZ62yp0XY3nKsGLGHSdlLmALA3PoTpdT8tfHIEmKPsF+6E8agbqc8nn
	gEtu8qd/LSnCp8aufeBP3daYAQP23LV3ChqU09j76d/iNJyJyjOKtPcQ670cSWC5
	bXoUUZEScDIre1Yk6YACkVNscpFq9sXEE+TCBCo0yST0kg5MhbZs5qApwsmntcC8
	y8L8xD7zMBsSzYPIBkQrpcJ08Lk/JA6nLYwcCOBMV1RvgMhCFBvtr62tAteHv7zt
	J8LvrghgMlFbrIG5j6kcw3iLbXInAfpXRLUn5g10efHA7JcL5I1NaMm49dNIeQ5A
	K64p5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g6ntg01j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 09:18:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-218cf85639eso20729645ad.3
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 01:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738228703; x=1738833503;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eePmyQ6AyToHFq5ZzRudtzKbdM2PRLlCrpc5DW2Ub5I=;
        b=cEX11uk/cLSiHKy4LR6OwusMae508VI49s5NAioQnk/92LbnwnVH9EWXhkBTT5JMd3
         H11+OAK4xRznlgHYy1kCN/JZskQD1PXrNVbZPVo45yoNTdiSTfY0FXi5I1iPVK3gNQPj
         EukRJ3kAZsb1XhU1BEKbsaTcpGRBIC0iFbkVtef9do1XXUIDLO/TRcu6QRdwTuBM87WW
         FRiXnY1CycSPOx9Z+wrgTJjo80q0EI/J65Q1JxrBmGaSDCEMbRVd6ztbkn8+h3HVxoWw
         sF6VKyH+nZw/YlHmv7c3rllR8Mhk52DeKIzLyZU6j/hYX59JIelenkBxMk74c8aKbAVF
         LMGw==
X-Gm-Message-State: AOJu0Yw2Cvdyvc57KmsnzCw8bPJA3Sht48Rfr6+9yWuclqgS0KIYAJ4f
	vVOLR4ZG2JKKUqcTtwK5zM/GwVUKXIY4Tqz49KedZhWbKRuNTE+PHkAzE476Y15BlolcMcNMNSP
	Cud1jYqHlzbEtCB6bizH3a9Lz4DaZPh76GTLF+osV72YdoijwAbXOmpcCQIe2
X-Gm-Gg: ASbGncs8nXksVi6UasL6Rvr/Cs+Js9a1Sz0/7vrsD8ZV0OMCe2X/Z3VDjeHeofDsm8m
	8DJb6Fyu9ZKrzp3tAv5oJpbmSs6GhwfCoe3C2ArWuH9rVEowKDtCjOK+9ki10KL/EkUXB22VsuU
	MZO6QQ/Ky6aWM+e9wqopXmt1LMzEWiGIAIiOypKuwF8A/n5kv4/rUv408xoP/fEse/tjdb6ceda
	GtLy6nDOU66cJREuoQKIwgV0EH77OuQFx82cou6v33o8K3nLzhZXaqlhWIJFwpirbYUYo5y9Syx
	XubKU2JQ0iDhKPPmnW4vcdiTxi2L1N31pHVg5Ak=
X-Received: by 2002:a17:902:f60f:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-21dd7c44516mr103038895ad.5.1738228703443;
        Thu, 30 Jan 2025 01:18:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRttBzfpMMi7+IvNp9nzNnKCJLwBTy4+pzP5Bx50uGqeX9D+oTbLTRBPYM8mM5/vF6FVybGw==
X-Received: by 2002:a17:902:f60f:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-21dd7c44516mr103038655ad.5.1738228703061;
        Thu, 30 Jan 2025 01:18:23 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f8004sm9620975ad.74.2025.01.30.01.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:18:22 -0800 (PST)
Message-ID: <94db4020-b1c7-4aee-b22c-6fe6d357e593@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 14:48:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: Remi Pommarel <repk@triplefau.lt>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
 <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
 <Z5s9CO_mmazq2Kg1@pilgrim>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z5s9CO_mmazq2Kg1@pilgrim>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IU2wFmHdDg0o41DeSmWPcr0UbK74787M
X-Proofpoint-GUID: IU2wFmHdDg0o41DeSmWPcr0UbK74787M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_05,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=753
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_011826_285997_F18ECDEC 
X-CRM114-Status: GOOD (  13.59  )
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

On 1/30/25 14:19, Remi Pommarel wrote:
> On Thu, Jan 30, 2025 at 12:21:54PM +0530, Aditya Kumar Singh wrote:
>> On 1/29/25 22:25, Remi Pommarel wrote:
>>> Currently in ath12k_mac_op_sta_statistics() there is the following
>>> logic:
>>>
>>>       if (!arsta->txrate.legacy && !arsta->txrate.nss)
>>>           return;
>>>
>>> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
>>> if it return for empty legacy and nss of arsta->txrate, then the other
>>> stats after it will not be set.
>>>
>>> To address this issue remove the return and instead invert the logic to set
>>> the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
>>>
>>> The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
>>> remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
>>> commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
>>> mac_op_sta_statistics").
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> MISSING_BLANK_LINE
>> 'Tested-on:' tag missing blank line after it.
>>
>> You missed v1 comment? :)
> 
> Yes sorry I think your mail never reached me, did you CC me ? Do you
> need a respin ?
> 

No problem. No need of respin just because of this. I think Jeff can fix 
in pending?

It's strange that the v1 reply appears to be delivered from my mail box 
and it is sent to the list. I see even Jeff replying to that. But none 
of those are captured in patchwork. Not sure.

Anyways, v1 comment was regarding this blank line and one suggestion 
that in future submissions, please use base commit tag.

-- 
Aditya

