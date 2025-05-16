Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE257C2D0CD
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 01:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMSRgH2O3frOvbt/bM3caFSTUMq1rcGXUVoL5oW2+H8=; b=1xSusaAn+z2jtzD+cF8jynA0XX
	PBR8rQ44obOZuXU/bV6hgb3Ee50Fm+mb3E1PLSHrukNjTVviIyD4uKokKI5ZBQapRopPG7BLHOOFD
	/SYHWKymdkPo7BmE2M+vViI/SMY32+KynyO+vck1396+xwoA/hBvFyphVHuZsOpA3I+F0YRQbF3SP
	y9NBsYljWwndMy/GpEqISyanlyARV4fM5EaCF3ibCgGpaRT7aWfdznGOWlAHxlhGX0sWF+Vftmukt
	XQ5Wk1WNqLwDY41qNENndmqS7NJltl3Hn3rQvFuAW2FMSPHgnaAY2N1+nRt+UIj+5neDx1azOrXy8
	S85OHZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFk0M-00000002DXK-25dm;
	Fri, 16 May 2025 01:36:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFk0J-00000002DWf-2gFF
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 01:36:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFI6E031498;
	Fri, 16 May 2025 01:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMSRgH2O3frOvbt/bM3caFSTUMq1rcGXUVoL5oW2+H8=; b=g/bFnMq8lpdz58n2
	QUXu61M45BptPyWUHvkbJJ1mLqhN0NsaMX5BvneECMeb2ouU4/JexEX+zFpb3jZh
	JecJ5E6dz0juy45eg1+jkdcbf9jPfg/vCiw7Kf9oKclmU7mPxV3LL1sTqaYmk1iJ
	c72bIYAQBSUrV0JXlRdxq0zYcXE0oQVZUKeAc1FIHSto0MIeas68lUM95gE3jQh1
	2V+RQVDAlRJQIhb+EwJgG4GvDvvWopfD+TNFvdD0EzzdbN5HNaTdXZcgW+U2ieho
	/LDm8kTTK5f4ghDbZWXwbggByptHOELAIuXJTvkr9Qek/MOePJrQiQrvfbXFD6Kn
	TEcj7Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr806w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 01:36:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G1aiSL028496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 01:36:44 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 18:36:42 -0700
Message-ID: <e85a632a-93f7-41a1-975c-e9117c3f7d60@quicinc.com>
Date: Fri, 16 May 2025 09:36:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
To: Francesco Dolcini <francesco@dolcini.it>
CC: Parth Panchoil <parth105105@gmail.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
 <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
 <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
 <afe586a1acf458edcfe7cf76f4dcfa8b18ad716a.camel@gmail.com>
 <28b5436a-556b-4b0e-a66c-eec453f4f5b8@quicinc.com>
 <6aa877c8-322d-44eb-a8ca-5d00ffa63d8f@quicinc.com>
 <479bd0f6ef7fbb5f0e0d0d8f71a804002e6b5f6b.camel@gmail.com>
 <6ee296a1-1cb9-4187-9c74-222bea54843b@quicinc.com>
 <20250515142305.GA74294@francesco-nb>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250515142305.GA74294@francesco-nb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O2skDLvnN0yeW2xt8pS3zdycN-3YCZnp
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=682696ad cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8
 a=wTQQdTw2f6IIqK0SLMAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: O2skDLvnN0yeW2xt8pS3zdycN-3YCZnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAxMiBTYWx0ZWRfX9PlpBI5G1hHW
 9ot9/7dy0m9fuG+0HZlMasDWunAePsfZg7RRYEEoYzlkQHzSR+DifSnthF1gNq4tHRZkmREt+hP
 qH0/VgP4KnE0T5IfyuML+3OW+jXrl501nEKoMBB1BVdy/WKmyi0rgGvfCd33NhI8IoUAZaQ/vgB
 hj7nqXEJTErRW+PcA7kk8BF/UUPTrFqyp+f8KcXn8bEPrTe7D+ZHjMzvJVVQ3Xw4lR7mrs/bPPE
 KfGMMESuFJEU2yDvxUHM2+OI/Sl1cKXQDNQCDOUDLCM8zH0Yoxjq6c4sNPBaOtT0s0WhNRW+F7g
 Dm7Ba3QAsNSRJnF1elLnojkK5Bnh1BDRngsAVnQYVJ/3eBNc7ivMcLmN+yXiASbJog+DOa+7/RZ
 vV03CmRkB61yy4ZVHM1706z1eS4q8duaw6sBCEAAQJjpp4pCVjIs9FbhXo7ekkqqx4Rc3cop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=652
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_183651_848998_FF3671C1 
X-CRM114-Status: GOOD (  15.17  )
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



On 5/15/2025 10:23 PM, Francesco Dolcini wrote:
> Hello,
> 
> On Tue, May 06, 2025 at 01:56:11PM +0800, Baochen Qiang wrote:
>> On 4/30/2025 8:50 PM, Parth Panchoil wrote:
>>> On Wed, 2025-02-19 at 18:18 +0800, Baochen Qiang wrote:
>>>> On 2/5/2025 10:20 AM, Baochen Qiang wrote:
>>>>> On 1/27/2025 10:01 PM, Parth Panchoil wrote:
>>>>>> I am currently debugging the ath12k_pci_enable_ltssm start up
>>>>>> crash/bug
>>>>>> with the mainline kernel on my system and would like to share my
>>>>>> observations so far:
>>>>>>
>>>>>> The ath12k mainline driver gets stuck at this specific line: 
>>>>>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L295
>>>>>> in the ath12k_pci_enable_ltssm  which attempts to read
>>>>>> GCC_GCC_PCIE_HOT_RST, particularly
>>>>>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L1209
> 
> ...
> 
>>>>
>>>> -#define GCC_GCC_PCIE_HOT_RST                   0x1e38338
>>>> +#define GCC_GCC_PCIE_HOT_RST                   0x1e40304
> 
> ...
> 
>>
>> GCC_GCC_PCIE_HOT_RST is wrongly defined, normally this should not cause any critical
>> issue, because IMO the RC is expected to return 0xffffffff when accessing a non-exist
>> register. However in your case kernel crashes, so seems RC does not behave well, maybe not
>> following spec?
>>
>> anyway I will submit a patch to fix it.
> 
> Any update on this? I can easily submit a patch myself, just let me
> know. Because of this bug we have a crash that is preventing us to use
> the device.
> 

The patch has been submitted for internal review. Will make it public available once
approved internally.

> Francesco
> 


