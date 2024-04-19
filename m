Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8242C4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6F7NHhVAe9nbmFfYRVj8WYErLoLaeRk5UKxOpWra3bY=; b=Z3cBvBrHH1wbTsVa9DDeYbHYK1
	UvKcGCTPyRv44MiuoTOFiiemqQOJaPHPAnYiP8liNDsKSqkklrkOoDmUjyBJPFK1A4h4N/00WLDCG
	3wWdXVPs3CDd6gg3BiR4X6nB16uWJTzQQDL3H3ZEF7/OgO8318BzadlkpY1oAVFB7ZBLsPvpqN1at
	OMXF1k36HCAKgBumvbA1Wbs1Gh0xO3IXPC80vX3p3i9tEoLnzNYXJGtar/CsQkumDtAkpi9Df8X+C
	dTZxtBQFIALjX9tlIEuMxhGLd/tJkIrXcgWUJrhm+BgAY4wBJJal6PssoaA/UJLOpH4O65swyjHKC
	AkGZeAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpgX-000000063TT-2k4Y
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 14:57:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpgV-000000063T7-3xUL
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 14:57:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J2Gv0Y016749;
	Fri, 19 Apr 2024 14:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6F7NHhVAe9nbmFfYRVj8WYErLoLaeRk5UKxOpWra3bY=; b=e2
	zyYOon+lncyHvQkcdXmYSD16GK+rPidLgDmcyojiDERDCMjLv4ORpIm+mVIWQTaH
	DRrpGh4BZ5ZIk8HxoQelT8ccrt6RsZ3dQgZOdgDuzjfX15pZPu7MsfeABrYu4tKR
	2PIL5jFEDA0zmWv533LPQreHY3ZAYB7ktuHVaYFp99Bd+ToBJy9Fo3taGS+GOY5e
	ajcOKWZ4GtYRYt0E0tKVPX6O40iIDjbjB6EyeAUt1OBXFdD1M/jXLBlZAkfGjVDV
	xspgxygJcJ54YRyM92uQCfGsJH8fHMdOdnt97JBBOBdj03I3B9z6dwKwZaPrA/VH
	+4gDPFeM3kev/Aahh3LA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xk9s7a3yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:57:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JEvnKh011159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:57:49 GMT
Received: from [10.110.91.89] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 07:57:47 -0700
Message-ID: <316bae34-617a-4db3-8a55-7045d657adda@quicinc.com>
Date: Fri, 19 Apr 2024 22:57:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240418162019.1246749-1-kvalo@kernel.org>
 <71414c51-26b2-4ce7-898c-5df0e8e31825@quicinc.com>
 <87h6fyhtrs.fsf@kernel.org>
 <a24666f5-503e-46fa-9232-df4748f824bf@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <a24666f5-503e-46fa-9232-df4748f824bf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wLtRpB1-MUz-Fs4zkW01jnSBJsuArOcE
X-Proofpoint-ORIG-GUID: wLtRpB1-MUz-Fs4zkW01jnSBJsuArOcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_10,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 mlxlogscore=679 priorityscore=1501 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_075752_031256_ABC80F57 
X-CRM114-Status: GOOD (  12.31  )
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



On 2024/4/19 22:51, Jeff Johnson wrote:
> On 4/18/2024 9:16 PM, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>> I can verify this doesn't crash my system, but apparently my ACPI doesn't have
>>> the underlying settings, so cannot verify actual functionality
>>
>> Thanks for testing. I hope Lingbo has a device with proper ACPI settings.
>>
>>> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi_evaluate_dsm() failed
>>> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: failed to get ACPI DSM data: -2
>>> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi failed: -2
>>
>> I just want to verify that these are debug messages, right? Normal users
>> shouldn't see any ACPI errors if there are no ACPI settings in the system.
> 
> Yes, those were debug messages (I've added ath12k.debug_mask=0xffffeffa to my
> boot command)
> 
> Also note my Qualcomm Innovation Center copyright checker reports that the two
> new files are missing 2024 copyright, so please update
> 
> /jeff
> 

thx jeff, i'll update the copyright.

best regards
Lingbo Kong


