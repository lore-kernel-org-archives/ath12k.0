Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E273C27C4F
	for <ath12k@archiver.kernel.org>; Thu, 13 Jun 2024 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iue42sLdGCSFIIO/JgVh94UskTkAz/RYfXMryCDdK6U=; b=GBZOG3asQdaM76dH2FsykpKWut
	PUGMA35AP70inj0LUIA4TVq9likEkhmtKwYKWAI34sylZc4gldlHuQqnFdCHY+YaOH3BcikHSEsUK
	7RteKtozrSk0GY85Qt+mh/mlIGjEDM/EkxJsjBcSFGcFxrA3YIHrjtk0xp7B3kcEReSQCAYKL2vbw
	AwzBE9ljbdO4ur3L/4QRlXG9rL6uqJC4dv/QL/heLRSaJyaELDK6prbs988QsIn+MW5DpqUeQg0+o
	Zpj8p2e/5hCy15Ru9ULbDxUsr+8Y5lA/oVbxpoftgT8aZLtBmztyaAKfTBEF68G3ycbQZOrhkGp4D
	GPPc7Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHsjf-00000000dX8-3qAn
	for ath12k@archiver.kernel.org;
	Thu, 13 Jun 2024 22:15:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHsjc-00000000dWM-2h4g
	for ath12k@lists.infradead.org;
	Thu, 13 Jun 2024 22:15:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DM0BJv008273;
	Thu, 13 Jun 2024 22:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iue42sLdGCSFIIO/JgVh94UskTkAz/RYfXMryCDdK6U=; b=lCJyofrGuLrE20US
	54/Vqit/96hUZkZbvHmFQe8E+nTfeXVm0GDqv5Me9EHPRVhkr/b1gtjv1C8wOq9y
	KWiI7i52s7HAxmXbILczXNJwCEtxFgKjLl0+yW233M+p3CUppXqza3Xo1kH732Mq
	XWM8FnwUR/epPuYpyMBG0TnqFNg5+zik4F9kEg06rOX6bIhkTfJIuEFvpA3rw3ZQ
	FqrPp9K9FPeKJ6Tj2V7h5joiqSJ7/oFo0/cxThNrp3XxmGEu1SrDhBtxXByzNSZV
	4aoMzKyQaaqqqgRt051MnD8E2n2BePBbrWEjkHPpmsBFlj+T+ANYs4evXAGutRYn
	BIRsCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q28dsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 22:15:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DMFrXc013652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 22:15:53 GMT
Received: from [10.48.243.167] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 15:15:52 -0700
Message-ID: <199dbb00-424c-4827-ae9a-0e657918fc06@quicinc.com>
Date: Thu, 13 Jun 2024 15:15:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix legacy peer association due to missing
 HT or 6 GHz capabilities
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>,
        Zachary Smith <dr.z.smith@gmail.com>
References: <20240612225336.2303119-1-quic_pradeepc@quicinc.com>
 <760d99d1-c709-43b5-9d15-c2a0fef98b66@quicinc.com>
 <a7921a28-6f36-40b4-9d56-284b2c2684a6@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <a7921a28-6f36-40b4-9d56-284b2c2684a6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bycOyysGtTyGuf0v0uI-a1MuHQLdBAPR
X-Proofpoint-ORIG-GUID: bycOyysGtTyGuf0v0uI-a1MuHQLdBAPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406130160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_151556_865064_B8E15D4D 
X-CRM114-Status: GOOD (  12.30  )
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

On 6/13/2024 11:59 AM, Pradeep Kumar Chitrapu wrote:
> 
> 
> On 6/13/2024 8:42 AM, Jeff Johnson wrote:
>> On 6/12/2024 3:53 PM, Pradeep Kumar Chitrapu wrote:
>>> Currently SMPS configuration failed when the Information
>>> Elements (IEs) did not contain HT or 6 GHz capabilities. This
>>> caused legacy peer association to fail as legacy peers do not
>>> have HT or 6 GHz capabilities. Fix this by not returning an
>>> error when SMPS configuration fails due to the absence of HT
>>> or 6 GHz capabilities.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Fixes: f0e61dc7ecf9 ("wifi: ath12k: refactor SMPS configuration")
>>> Reported-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
>>
>> Per checkpatch:
>> WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
>> #17:
>> Reported-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
>>
>> Is there a separate public bug report from Aditya?
> Hi Jeff,
> No, this was internal report and does not have weblink associated with 
> it. Also, do not want to ignore reportee.

I'm unsure what do do here since there is a requirement that an acknowledged
reporter have a public link to the bug report.

Note that normally internally reported issues are not acknowledged in this manner.


