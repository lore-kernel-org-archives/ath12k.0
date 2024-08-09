Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10EAC3DA4A
	for <ath12k@archiver.kernel.org>; Fri,  9 Aug 2024 02:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bvx9D8fla0yX2yGGxAoqcugB+By21+/Vmy/KGTmswYU=; b=gLVH4aLDECJaT/7gxCrSyqT576
	JlAQYsPQYCi7c8hbwHLNkA+NrvBhi6fDWacw0LwTDpzWiyUVYxz1fuU8QkHe5RAdtOxW6+EoZmlLN
	DCsiqF2uKYOMIFG6IwV+Rxjasx58h7c/+LNbM46rPNhcdhK26+I2ZBZtuZaQ0jMc0gyNgSfKqQYJR
	d/7mEUAWCWPfNyy6lcOFptMfq8RTda2tyGkooF6NgM4wT+/1wJOIfUaPzqF71pP+BO7frs21LbW9D
	F4v1fyFg9Kn/s4F7+AwUIEjnyBFZXxevI2fjwHiQTb8v9SCBwQNaFdE74cGy3XuMT/XCpDFmP+99E
	Jfj165Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scFCt-0000000A1Qb-1y4E
	for ath12k@archiver.kernel.org;
	Fri, 09 Aug 2024 02:18:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scFCq-0000000A1Q4-0t90
	for ath12k@lists.infradead.org;
	Fri, 09 Aug 2024 02:18:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478LVQW8028939;
	Fri, 9 Aug 2024 02:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bvx9D8fla0yX2yGGxAoqcugB+By21+/Vmy/KGTmswYU=; b=XQ06ltrJvKYank09
	0Uk8+RHoZI2quBcV6nQAtXI7CxygejDbvlN4X4ZlUhhimhg2uyjpKlnQXPCYEawH
	cchhdv5vjk/qympySX3O7eBBTjtTpcDfBzPpFigIH6ClGifnBj7BRgcQSXpko1vT
	VOToPhgeL+yrHyn8efjwHZq7LGElyr+rNm3Tr69ojkGD4AosPnfJdKHJnyS3hwT/
	3Y0ZIOyY8aBLrWgUDQmvtMT0zadvZcrReND/dKXxvDVAk8BgiSQatq/zwnX8TnO+
	eiF7UGpacoft7na5yZnHmwQ2Q8kdRFn/iTRv+aWrQTJql/Ot7S3aQJ9Y/MPmuyIH
	Lja4fg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vfav3vhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 02:18:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4792I7HE024532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 02:18:07 GMT
Received: from [10.110.101.208] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 19:18:05 -0700
Message-ID: <870a5f4d-a237-4431-8488-8a70b850d6af@quicinc.com>
Date: Fri, 9 Aug 2024 10:18:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question Wifi 7 WCN7850 ath12k
To: Reiner Rusnak <rr@embeddedwireless.de>
CC: Catrinel Catrinescu <cc@80211.de>, <ath12k@lists.infradead.org>
References: <A0CF7502-9475-4201-869C-443F4FD69E56@embeddedwireless.de>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <A0CF7502-9475-4201-869C-443F4FD69E56@embeddedwireless.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZrlT6wLAPa6ygLTRmBhZkHMpw3CnZ28N
X-Proofpoint-GUID: ZrlT6wLAPa6ygLTRmBhZkHMpw3CnZ28N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_191816_280236_80091789 
X-CRM114-Status: GOOD (  15.14  )
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



On 8/9/2024 12:04 AM, Reiner Rusnak wrote:
> Hello Yang (I hope this your first name),
> 
Yes, it is.

> this is Reiner from embedded wireless in Ulm, Germany.
> 
> embedded wireless is Qualcomm Authorized Design Center and recently busy 
> with wifi7 drivers for Hamilton and Waikiki modules.
> 
> I see you did recently a lot of work for ath12k WCN7850:
> 
> 24/07/25 wifi: ath12k: some fixes and clean up for monitor mode
> 24/04/29 prepare work for monitor mode on WCN7850
> 
> We appreciate very much your work. Thank you.
> 
> We are interested especially in monitor mode.
> Is it already testable/useable?

I often use it during my daily debug.



> 
> If needed, I can test with you.
> We have m2 cards of several vendors and access to Qualcomm SW and HW 
> reference designs (QSDK, lea driver, ath12.4 etc.).
> 
> At the moment I tested sta mode with Kernel 6.11-rc2 successful, but 
> failed with monitor mode.

Upstream code doesn't support it yet. Still need many patches.

> Any chance to get it run somehow?

When all of they get into public review, you can also have a try.

But i cannot accurately tell you when they will be completed.

> 
> Thanks for any insight,
> 
> Reiner
> 
> P.S.: Next week I'm on holiday and get back Aug 19.
> 
> 
> ###################################################
> 
> Reiner Rusnak
> 
> embedded wireless GmbH
> Söflinger Str. 200
> 89077 Ulm
> Germany
> 
> fon: (+49) 731 - 9752 - 991
> fax: (+49) 731 - 9752 - 993
> mobil: (+49) 163 - 4198 - 230
> 
> @: rr@embeddedwireless.de <mailto:rr@embeddedwireless.de>
> web: www.embeddedwireless.de <http://www.embeddedwireless.de>
> 


