Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31DFC282EC
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIviajEdCOBgiCD88+lBOgrVsyUY4qffh1cnELJmUSI=; b=UfcVRSMBhidSLf0wSFh+JuhwAl
	zshWCUodrIfFwd/mtnllNZeVeI8P5xUxGCyh82zDJWP2Kn4fP9/OfdUD9vHHPLMLvXhip+mtU0ap9
	kjE3UvBoOMluCvuLjs+fD0YqtrtAwQ8u2OmqtSGv0N8LqhRm0pdHjGJWw2rB001xvASbd7IyKh6wn
	dsd4pvoxbzwcO53LnniaNJUuqNT0Fv1ggGf2fSatu/ohl6w4lgbEDYco2cp+OdhNZSRQr5lwC8nkd
	sv2BvT3D3LSnsefv3ASwrHueMPdhOVs3RHUtu6bvAstDsdSkY5MxcEWPPbLbN761tdV45HX038zSk
	ZMnMRztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tudA1-00000006z1W-1mys
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 20:03:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tud9w-00000006z13-0z0t
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 20:03:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IIBeSX005834
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 20:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIviajEdCOBgiCD88+lBOgrVsyUY4qffh1cnELJmUSI=; b=BBmVxCLUKsP+ATsH
	jDgpU3DQM3izD+t3/G4Jsu+CTmR3raL/5NWe4yEdQswam7PtQ2VhOAoU35LFSjYf
	cq/s4FUtbuDXhSNedgAdKH8+IrquN2lueHuZ28ewYbzB8esAbP5Gt/hJVTG2Qq8B
	iD+ecNz4vvmNdDmIqUc7/SvNeLPmuuwZrnaNXDrEfHkgmfzUSyCzDE0nv9Bqs3+n
	KUmgcpbuFnimzty4c9uNmtlOkw1FtTgJQyCMbhQz26ZMhAsd/zlX7LDh3ddMQ5YT
	8qp8RvVsCMdS87e5ChgSPxhAz/ZNF3sAb567OAtNeVoU/jQuiUaNSuR+Tet7iLtg
	6Tx5Qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxg810-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 20:03:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242ca2a4a5so82641685ad.2
        for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 13:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742328209; x=1742933009;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIviajEdCOBgiCD88+lBOgrVsyUY4qffh1cnELJmUSI=;
        b=h/rpRZI+Pn6iOZg+h2cvf0aAxEP1NZ2003P19Qd0nUn+5uHvyiftawKGF2b8umX6fi
         FIuhFmtZqPhMDhJ9GjuiQQ9ct31WIdmmFhTJ/qOpedwhyGJ7vNJ2ycq0qlubLjgMhK6W
         EcpW+QcrDGjXZ3HuTv0du0Y4Oe93+P6mAPdBA+CkmQ9WW8uas8HSzcw+/vI8jfWsrN/1
         +7vukB3hAc9GqWr3suYq2dQ/OvGD1YZ07wrMDbJVCruH3VJxOABPcTGD/CFqF3zBkGQH
         lZxK1MFyXLorTePe0QbJuhqAol35nCdP6IcmMhVLmXubTEUzYWVWd2qK44S/EGrifu+X
         GE1w==
X-Forwarded-Encrypted: i=1; AJvYcCVQVZcprot+lxfvrcXaM6PQfFtjmABl94F655tMIKf9/8fUD4ShQCCsveFODewQumRLKSDh2iM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7qIrQ3P0leYVGFax8uCdJCJMlum5Maw/xLUPEiX2dmlL5IARl
	BOeNKzJunbzkXd46gi/FwtzIi2uFlaMGzcIc90TUzqVXSsdz59Eu27Lp38jC5PBKRpdYhsxExxy
	EdYn/Km6YDcGzRyrk04x4UoblfaqqfqTZi5p4iB6EA/M4uO4QNwsi8+Vo0B0N
X-Gm-Gg: ASbGncvmDmTJV4rm1+1GDYTTq/3GpBVO+RYu+KO2doi/p19Hbg0xwIozm/+TJCS0BWF
	yiRyESVnRZYzH+mWmUgP+yDpu7J+lFv5z37BdRUmvWtv8v0k4xvP1Svwu5tRy3TwZnyMzlGaxpH
	8OnpXivwFZAtSziP9TfL5Bbw+LOgVf51AehQ8dTayRluigqWzZom8Gefp9+/2bU4MkyhZzoTPz9
	AE9kQ7UJSBcpO6JPe4U1vp11MX+V89Fhn0dXBSMZ/0GjvGewpVhcbf626wmvKzPZliXdxDHotRr
	gvbFFnUJSdLNVAe9uftiZ67y4P5Ry+crZYWLRTbzZhJJ2Pef6NVs+OLB1LBUaN6hrKbsejw=
X-Received: by 2002:a17:902:cec4:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-225e0a5212amr238093635ad.5.1742328209354;
        Tue, 18 Mar 2025 13:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwWbfqKKFOuVPqA3GS/o1rSBUsBnCbC6YlfZXuqGv4kJNVWRit7JjQXIrfwspkZnXcFQrRlg==
X-Received: by 2002:a17:902:cec4:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-225e0a5212amr238093175ad.5.1742328208921;
        Tue, 18 Mar 2025 13:03:28 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4de5sm99117575ad.230.2025.03.18.13.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 13:03:28 -0700 (PDT)
Message-ID: <26eeef33-ccae-4483-a0db-78b120ffb960@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 13:03:26 -0700
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
 <8e5b0ae1-ea1b-4dfa-84dc-c53edd2afc42@oss.qualcomm.com>
 <551018bc-26e2-47f4-8fcc-9478834b9199@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <551018bc-26e2-47f4-8fcc-9478834b9199@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67d9d192 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=DgR1PzNg5l75-NxZnrAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: b3bGfEPxZztXNvBD1jdOkHMfkOHL6-tY
X-Proofpoint-GUID: b3bGfEPxZztXNvBD1jdOkHMfkOHL6-tY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_130332_427267_CA54C83A 
X-CRM114-Status: GOOD (  19.35  )
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

On 3/18/2025 12:06 PM, Krzysztof Kozlowski wrote:
> On 18/03/2025 19:53, Jeff Johnson wrote:
>> On 3/18/2025 11:19 AM, Krzysztof Kozlowski wrote:
>>> On 18/03/2025 19:16, Krzysztof Kozlowski wrote:
>>>> On 18/03/2025 18:55, Jeff Johnson wrote:
>>>>> On 3/18/2025 8:50 AM, Krzysztof Kozlowski wrote:
>>>>>> On 18/03/2025 16:44, Jeff Johnson wrote:
>>>>>>> On 3/17/2025 1:46 PM, Raj Kumar Bhagat wrote:
>>>>>>>> +	hw_rev = (enum ath12k_hw_rev)of_device_get_match_data(&pdev->dev);
>>>>>>>
>>>>>>> kernel test robot warns:
>>>>>>> cast to smaller integer type 'enum ath12k_hw_rev' from 'const void *'
>>>>>>>
>>>>>>> looks like others have fixed this by first casting to (uintptr_t)
>>>>>>> a few examples:
>>>>>>>
>>>>>> Cast via (kernel_ulong_t)
>>>>>>
>>>>>> But another point is that this patch at stage v11 should not have
>>>>>> compiler warnings and it's not our tools who should point it out. Except
>>>>>> W=1, all standard static analyzers (sparse, smatch and coccinelle) are
>>>>>> expected to be run.
>>>>>
>>>>> I ran what I thought was a reasonable cross-section of builds and did not see
>>>>> this issue. Seems this issue is only flagged with config: um-allmodconfig ??
>>>>>
>>>>> Guess I need to add that configuration to my builds...
>>>>
>>>> This should be visible on every build on 32 bit archs.
>>
>> Yes, I'm seeing it now on my i386 builds
>>
>>> Patchset does not apply neither on next nor on on mainline, so cannot
>>> verify... Probably another problem to solve here - some sort of dependency?
>>
>> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
>>
>> The series should apply cleanly on ath.git ath-next branch
> 
> 
> Yeah, but next is fed with for-next branch, not ath-next.... and
> for-next is 10 days behind ath-next. I assume for-next is what you send
> to the next merge window and ath-next is rather next-next-merge window,
> just like DRM people are doing?

we have for-next which feeds linux-next.
normally for-next is a symbolic ref to ath-next.
but when we issue our last PR to wireless-next before the merge window, after
we are pulled we fast-forward and hard branch for-next.
so from that point our contributions to linux-next stop while we continue to
contribute to ath-next.
when the merge window closes we remove the hard branch and reestablish the
symbolic ref.

/jeff

