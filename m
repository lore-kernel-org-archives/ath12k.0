Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511BFC5AE59
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MVhH5BgyQRmWPzMx4Kwju7NRE4pyh+6F5OrfoqPe54=; b=u7m1eCDJy3mwKc2pTLrbBEZeuK
	9iMD9sZhd6ShioqYHC2fuVJ6hS89oGQZ7s3JQIQj7nxcXgTQj6O/ziwGiMLtglozFW8va424JDQtD
	0gxbL482lpvnluHi8kZoGSYivc5oa9QjvZdwW9Qd3tiyotTUz98RoFT5AEZItqEaY8PbWPG57Gr3V
	h3vojkpqJngrnk+/uoO3lmzMY2OOAGAs4h4sDHfs9YlXHO5wTm3jkG9I/CLWWgpEhSChRMt3Y09m7
	JE8PWbmkFlLUDEeEAHAjPP1IJ3jC3VrTxQLGww7IG2ftUvaDk1fLMac5R42I7RH3tZ2giH6Noyas5
	m6O+3Pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6Jm-0000000F6BH-0N66;
	Thu, 05 Jun 2025 08:51:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6Jh-0000000F6Ac-0rfY
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 08:51:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554MVRqY013969;
	Thu, 5 Jun 2025 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MVhH5BgyQRmWPzMx4Kwju7NRE4pyh+6F5OrfoqPe54=; b=Neq7VcWn8x3mAFVe
	ccSl51IzjFpozlgNTa2K8sQWCrOFHZo2GeYwnmPCOogc8b7ZplDCQUPzUhQ4eQ36
	8TTPUZk64HwRDYjP/Eq7fk9el/pClzLbJA33C/t5wqF2o/Pb5Wii2IrM3vpTrbdp
	AYMlgRmW4KnaFlGUpX6xrl1gB+ykPm0vRTrCE1ygP1mkQbiOQd3Bokluvz2Jo75A
	EarOJkrQk5eOHEGvyKq3qxBqZ1kAT3amxh5F/A8E6y2+tCxxGWLC3iVIMbABHrAT
	M3IL2hX3e3v0REvz4CkNrj4T1vvKkWaZ2Ez2fQx7RABADi6pwqwbKFUyhKXG92qn
	FHcUKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be84e1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 08:51:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5558pDKH027392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Jun 2025 08:51:13 GMT
Received: from [10.253.10.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 01:51:11 -0700
Message-ID: <e1920587-331a-4742-8cc6-46bbf187d466@quicinc.com>
Date: Thu, 5 Jun 2025 16:51:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] wifi: ath12k: fix dest ring-buffer corruption
To: Johan Hovold <johan@kernel.org>
CC: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>,
        "Remi
 Pommarel" <repk@triplefau.lt>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250604144509.28374-1-johan+linaro@kernel.org>
 <257bf9e9-f4b2-4ab9-804f-b895243c924d@quicinc.com>
 <aEFY3iz2gXtF_Dgx@hovoldconsulting.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <aEFY3iz2gXtF_Dgx@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=68415a82 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=JD1d9eFMGJjaDxi0_EkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Q7PO0mzhGUDN8Xn91SNUTXLzBPbtYNag
X-Proofpoint-ORIG-GUID: Q7PO0mzhGUDN8Xn91SNUTXLzBPbtYNag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA3NyBTYWx0ZWRfX9Zddn1dXHW8d
 wZlV6cC13jYAUZJWNs7Kc98vzjexy/gwemgZugM5aZv3uFME2G15z3jRp8wsU79q58UWZR6zGdH
 J7+t7Utm7Wd4v+7Il7aFH30FhU5M2ouKU0FtyF97QVmA83pSPKYM4GnRbXM3OitUy+dUnfcwXWR
 SrFDORXPNYxdh+HwY7Hf4d5IcDO4q/F7j2Ln4mDxXn9tAGHgH/Q0brwssDRUi5o6RWdnYrtY+Og
 Yo9RRoHUC0G39POhIqJi2QQMjYxg+ugVTUVYi1lCUrnCvjOh3jwn3crQXFWb5Am0mciB2kYIEDN
 kI+bNG4jfuLYI0LgsSvbcEGjmwwX8zFNrfVEmkJk75bcrGP5NXfqbYFTP1+1IEPkuDwx5oxfGZn
 hwxbMCAq/u58Kxd+o+R5Bv2M7PA/ZBtCccCQ+CYbIb/1c+bIWQrbYGIh3/yCs3t1+ldpKVE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=849 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_015117_257788_F5E8FBFB 
X-CRM114-Status: GOOD (  15.06  )
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



On 6/5/2025 4:44 PM, Johan Hovold wrote:
> On Thu, Jun 05, 2025 at 04:37:13PM +0800, Baochen Qiang wrote:
>> On 6/4/2025 10:45 PM, Johan Hovold wrote:
>>> As a follow up to commit:
>>>
>>> 	b67d2cf14ea ("wifi: ath12k: fix ring-buffer corruption")
>>>
>>> add the remaining missing memory barriers to make sure that destination
>>> ring descriptors are read after the head pointers to avoid using stale
>>> data on weakly ordered architectures like aarch64.
>>>
>>> Also switch back to plain accesses for the descriptor fields which is
>>> sufficient after the memory barrier.
>>>
>>> New in v2 are two patches that add the missing barriers also for source
>>> rings and when updating the tail pointer for destination rings.
>>>
>>> To avoid leaking ring details from the "hal" (lmac or non-lmac), the
>>> barriers are added to the ath12k_hal_srng_access_end() helper. For
>>
>> Could you elaborate? what do you mean by "leaking ring details from the 'hal'"?
> 
> The type of barrier needed depends on the type of the ring. If we add
> the barrier directly in the caller, the caller would need to know what
> kind of ring (lmac or non-lmac) it is operating on, something which is
> currently abstracted away in the hal helpers.
> 

Thanks, I get your point. I can see the difference in patch [3/4]

>>> symmetry I therefore moved also the dest ring barriers into
>>> ath12k_hal_srng_access_begin() and made the barrier conditional.
> 
> Johan


