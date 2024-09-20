Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41F9CF3964
	for <ath12k@archiver.kernel.org>; Fri, 20 Sep 2024 02:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWfyaWfAAiZJgYnTFRJOTLzuk+98hNolpFxwrqckyjk=; b=Xv770fVkJOf5YaxgfM0h95WvtH
	a9cgKyHvvyF4bcCTtb+y4uR1MSHUNxyIk8DbmJSZdUJL0YG5NsV496N4F1n/7Pne9jQw0u09BvxUm
	v2zyQT+cXzI0AgGucOCXWGohvfX1VLLyjal0KikPoJSGatnjLZv7bh7Gbb5Qy55LiEZ1QbOlQ8NZ5
	ptChQyKwiJ5kNXsYOVYuPFB6vV8Qv6YTWuySDYP/gcc+1GhwXJpNKelZGG6J5ecNgMS1NcUTW/kee
	2vxF6cj/iKz+yQIE8pYV5V2uVYVnJu1fQsLPrj8YG+jxEdVEN5SNvrCEJDY9z+0fmQCVwI/2YrepJ
	j+fTKAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srTFO-0000000BIaF-2zGG
	for ath12k@archiver.kernel.org;
	Fri, 20 Sep 2024 02:19:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srTFM-0000000BIZe-2u13
	for ath12k@lists.infradead.org;
	Fri, 20 Sep 2024 02:19:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JKjb9S022842
	for <ath12k@lists.infradead.org>; Fri, 20 Sep 2024 02:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWfyaWfAAiZJgYnTFRJOTLzuk+98hNolpFxwrqckyjk=; b=KfUb+semG/X/w+Fn
	ykRvYSFf3JWBN2CO4jAcg4yw/4KPNjccsTWXNe9kf+WLW3Pex3G4c/wI73MI9z+0
	M7/0JOxjoPIKuUgH3vux793ea21nBNBUbHZbDnusRkQ1TUp2b9ZTW89d/GwhHVO+
	yJNuSrPZMkSihVuQira6o0GchhuPs1Vh4KRCf0L17Pw7I/plkUHXS8NzqbRPThI7
	E7IkbmKFkAqcXeL3a7CLTxg94PjLo1mYMHhy1tfxZ+AqwTnnol4sTjQtAqMAbIoy
	JE3J25e2KkvijL4+KhUZD6VCv/HXFYftyVPeq1b9YsvNNgksIdm6fghTSqNOGX3L
	7KRRvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfqej6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Sep 2024 02:19:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K2Jk21025323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Sep 2024 02:19:46 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 19:19:46 -0700
Message-ID: <a8ad7603-f18d-4aa8-a0e7-46ed397503dc@quicinc.com>
Date: Fri, 20 Sep 2024 10:19:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k - HTT timeout error with NCM86
To: <ath12k@lists.infradead.org>
References: <14e17e9a-638b-4bfe-8a2a-99b524a20acf@home.xx>
 <1MvJjz-1s0CoP3EEz-00rhmL@mrelayeu.kundenserver.de>
 <7488ed13-82dd-4b41-97c7-5692cacfa631@quicinc.com>
 <6d3f1f33-2a9a-4b62-a0a0-02e65bd1b461@quicinc.com>
 <eb1c8576-bf2f-4ec0-8651-62e97446e940@home.xx>
 <1MI41P-1sn33411oV-00GW5c@mrelayeu.kundenserver.de>
 <ede25d7a-ad59-4cb9-abb5-be5fb50b2f2c@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <ede25d7a-ad59-4cb9-abb5-be5fb50b2f2c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ldm3QrpA1LxkPFzxqRRG1v7MMccTk73p
X-Proofpoint-ORIG-GUID: Ldm3QrpA1LxkPFzxqRRG1v7MMccTk73p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=885 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_191948_768203_7559DCF5 
X-CRM114-Status: GOOD (  13.33  )
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



On 9/20/2024 10:13 AM, Baochen Qiang wrote:
> 
> 
> On 9/19/2024 5:41 PM, Dieter Knueppel wrote:
>> Minor update:
>>
>> I just figured out, that even the physical machine with std. Ubuntu
>> 24.04 server (before the VM gets started and PCI device vanishes on PM)
>> reports: "Unknown hardware version found for WCN7850: 0xf"
> is this a output of lspci? 
ah, just find that is a log from ath12k.

so I guess the 0xf indicates  the PCIe link is not working. Have you tried if a cold reboot could resolve this issue?

and please also share lspci output:

	sudo lspci -s <WCN7850 PCI BDF> -vvvxxx

> 
> could you share kernel dmesg logs?
> 
>>
>> Hence the earlier question, whether "MSI HERALD-BE" or "Gigabyte
>> GC-WIFI7" is supported, seems still to be valid.
> these "MSI HERALD-BE" and "Gigabyte GC-WIFI7" are with WCN7850 chip?
> 
> 

