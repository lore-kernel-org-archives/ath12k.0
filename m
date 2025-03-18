Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854C1C282EC
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzUJl3WHjhcEBJ0bAL4awWr4SphxOz4pTp92LYZRfvY=; b=uhpsT4l/JcVpfBderdXZtoBQoX
	OmYr4tBrmVRLf1TqYXG/pZLAG2If3aXZ5nzmiyJYgoCQJeTIDAjtAqHiEanS3ztQTDHx+P3Id7zBd
	OCBOfQbXgRh6OmKgZFF0p+u6gjz7N6WOaCRzUz74cPFL/jUoWtoCMa+NtnCxvryiKciWpch2Yvscn
	a95Fo0iLhxDax2UJnHQmxKOgZ70mAKyiNri/Fqu/8+4sFqvhMH3oHyp0K0+W7yhtwYnRriezCOmAS
	g3AFl9qRy2JSaPiAtYuRa0TdN8worzqZfDq1dHD2oS8scjp5WrJs7er96XSAhrp0gPKc4uArub6/+
	HHCGR2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuc46-00000006qdS-1HXa
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 18:53:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuc43-00000006qc9-3D6T
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 18:53:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IIaedi028628
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 18:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzUJl3WHjhcEBJ0bAL4awWr4SphxOz4pTp92LYZRfvY=; b=MlkrNYcyX6P+NZu7
	S/IjSNcNXHDT1ZgF9dfbIUM7ZscfiVHKGBdlEEubNoQWMRqQbG4VGEAb8z4EPQGo
	TvYsEAJv251E0GKevM+62pMfPGk3rlJlidDoLJ0R/VLNATL94Y5BP94b7XNGeKK5
	oDSG19Qc1Q9NeBnGxdYMTWAaZT0hAxtVhMqxq1h1MYe6/6ln9x5s/AX6oxifMfSt
	+TNyNuxexf1kpW1/GCqngTiA6qqL022eG5dp4FzJYFbUWNBlwO+wInTcKn6iSuVJ
	FVYqDbPxrPqeezT3bu6ph7hT+2uqP87aDPjzMl0oZ1pzqhEdKHnkNiVkd8/jxo4b
	wpxN9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtk0fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 18:53:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a960f9cso94028375ad.0
        for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 11:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324002; x=1742928802;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzUJl3WHjhcEBJ0bAL4awWr4SphxOz4pTp92LYZRfvY=;
        b=wih6TspoWEE9aZ60gCItMVzA1/0BrsOKw4xMYGQbC3bLM8OFfFrP8BBK+dJXI1+99a
         1rZ9NI5iDoS8MsNiCz/xNze6ZWRjN74D3Pg5zNlbbka2gV3DnOvbUrGB0MOBvbmBUfAZ
         78RaTB4a87lb2DGk5dxibmnXVETFIgHsdpFLE1hlVCMDIom5POov0G6cxh9qvin0oRNA
         Oy0NsTRRFt5N9s2vOcIg98eEiqiFBijf8oOXeL1SvMJPuYqlpW9fCIP/kyO8cw8GU6eG
         4ZT5QcUyRrCEpGmWdivbqg7DEKRY6MSixi13Ixf10rSRR63p3joR8DJdfIA/Qhx3Lthy
         rLbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgwgb5OuhZ9jDKSD4hLX2Skwqy1ZUABA6bgDB9uRqwKSI3tG7v1AEoHNlHMTllOR26K1mDmZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6OQ4KdNGA9ZTWKL1oZH0Hhndq9RolBsnBNG5cjdaSfA9yvSSS
	FVBs6vsVEQYVjhELwVY0zL31xXWLJ0zXH/oGNZuiDAGZmfxfQdtcYFUYXN+rxiKIorJMbU71Bkf
	lMwWvttoo7e9tgG2YIVPkEw5ZOvA6Eo7RwGv++u1Wb2y07ARpRKk5LbaFcj9y
X-Gm-Gg: ASbGncs70IoNexyWtI634Ng8HvOQtP17R2KBym2QN2TsUgGAJPPModgxxDQg4ALFy6M
	41zGJpNDHdmHK3odpXgFPWow5DD1pGPbSRGcRKjPgi57noQzXv8diAqFiPnqV8mUVnvkmBMo/OK
	9Vp8SA5X54j2EEWbZYl3BxG9aO4OGtzB/2WjS8c27YO3jKI3tLLz7lYg38z+bgAPvnRYwj5IcHm
	QAbCKCkGxcO9qQqJrw3OuWxc+9K0wlo9nOxvEUAA0G9cSSbsOsoMClskApvLA+3b1MoTyvN+LdM
	tmdeA8+J7NzaQh68xS18v5P9VEa/jyN6CeDBMLdVe/sGXqqlhtu9buSunoojA0NMEUGy0ss=
X-Received: by 2002:a17:902:d491:b0:21f:61a9:be7d with SMTP id d9443c01a7336-226483de49cmr1686155ad.49.1742324002074;
        Tue, 18 Mar 2025 11:53:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRFs/PZj/vX5LmwWSynJGPcDMBE/XufCjD2tu+h93eucTtabPbXuyusrAdyiZO2jXqnhWxsg==
X-Received: by 2002:a17:902:d491:b0:21f:61a9:be7d with SMTP id d9443c01a7336-226483de49cmr1685885ad.49.1742324001687;
        Tue, 18 Mar 2025 11:53:21 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd7bb4sm98124335ad.237.2025.03.18.11.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 11:53:21 -0700 (PDT)
Message-ID: <8e5b0ae1-ea1b-4dfa-84dc-c53edd2afc42@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 11:53:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v11 08/13] wifi: ath12k: add AHB driver support
 for IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250317204639.1864742-1-quic_rajkbhag@quicinc.com>
 <20250317204639.1864742-9-quic_rajkbhag@quicinc.com>
 <683b16dd-a3e9-4cc3-836a-95f3747d3c0a@oss.qualcomm.com>
 <0da16aae-2fa3-49a4-bdd3-f08a7655365f@kernel.org>
 <f35a6080-8dbd-45ca-8fb4-d6b01a5bb007@oss.qualcomm.com>
 <332db13c-81db-42ad-afcf-3a4262344bf2@kernel.org>
 <31b4ca9c-892a-4ba5-b006-95deed6deceb@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <31b4ca9c-892a-4ba5-b006-95deed6deceb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h-_QRf1j9W6rj0HuOJfkNjdFWekZGAM6
X-Proofpoint-ORIG-GUID: h-_QRf1j9W6rj0HuOJfkNjdFWekZGAM6
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d9c122 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=fXXGRLuD1ZcmTYMWEx4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_115323_815092_F22DFEC8 
X-CRM114-Status: GOOD (  14.51  )
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

On 3/18/2025 11:19 AM, Krzysztof Kozlowski wrote:
> On 18/03/2025 19:16, Krzysztof Kozlowski wrote:
>> On 18/03/2025 18:55, Jeff Johnson wrote:
>>> On 3/18/2025 8:50 AM, Krzysztof Kozlowski wrote:
>>>> On 18/03/2025 16:44, Jeff Johnson wrote:
>>>>> On 3/17/2025 1:46 PM, Raj Kumar Bhagat wrote:
>>>>>> +	hw_rev = (enum ath12k_hw_rev)of_device_get_match_data(&pdev->dev);
>>>>>
>>>>> kernel test robot warns:
>>>>> cast to smaller integer type 'enum ath12k_hw_rev' from 'const void *'
>>>>>
>>>>> looks like others have fixed this by first casting to (uintptr_t)
>>>>> a few examples:
>>>>>
>>>> Cast via (kernel_ulong_t)
>>>>
>>>> But another point is that this patch at stage v11 should not have
>>>> compiler warnings and it's not our tools who should point it out. Except
>>>> W=1, all standard static analyzers (sparse, smatch and coccinelle) are
>>>> expected to be run.
>>>
>>> I ran what I thought was a reasonable cross-section of builds and did not see
>>> this issue. Seems this issue is only flagged with config: um-allmodconfig ??
>>>
>>> Guess I need to add that configuration to my builds...
>>
>> This should be visible on every build on 32 bit archs.

Yes, I'm seeing it now on my i386 builds

> Patchset does not apply neither on next nor on on mainline, so cannot
> verify... Probably another problem to solve here - some sort of dependency?

T:      git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git

The series should apply cleanly on ath.git ath-next branch

/jeff

