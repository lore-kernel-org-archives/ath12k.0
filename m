Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6926CED27E
	for <ath12k@archiver.kernel.org>; Tue,  8 Oct 2024 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSy7UTjBLw12etpFlwiEM1P+BXe0S0NJNh1K6d0Pgc4=; b=imBsJJpGGAeADxHe2k7Vow+rvN
	77ktm9koCrM14cfsepq9PhCm8tW66ZYqyNs72deuWdXstNNa7ZCP9qaqcnux4AhofPAB22FeehPHj
	8ynBqllUPJMGmA2sN+upvv3DH0B2jT+hS/irWR7+FKex7GPK2BID6PARLqBcwt8BZuT+X/IgmrlaQ
	5FklA2bhcNDJqN+dL006y8KVYaG5uX2SLIh5hE62CyNDhKIk6JEkhJ1boZ2YGI54ejJvu287aHy3i
	AMOI+vaNx9+3fG2sj5ndvXP0LImecpH0uI8pkkwzAsEFBxbmO2HGcYgWKT8YcLT1sabN1hDBKVxWN
	ki12p5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5wY-000000059Kf-2A0O
	for ath12k@archiver.kernel.org;
	Tue, 08 Oct 2024 08:51:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5uJ-000000058lU-0X13
	for ath12k@lists.infradead.org;
	Tue, 08 Oct 2024 08:49:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984TVgS010058;
	Tue, 8 Oct 2024 08:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSy7UTjBLw12etpFlwiEM1P+BXe0S0NJNh1K6d0Pgc4=; b=JGWVDFdCi8H/DofM
	S+DgLIKSSckxRm40E5I77HEYqV7HAZlEJXeHnagrj0uY9+ncKPQOztTH02GBenFQ
	KrXiVHz+OZefcZCV/LKjba9I6xCnhEo5z08fE6iiAtEvdi8/908093+40/xdwB4G
	XDBN9BDn7BQHdAR9/FcD14VrqYCFrTKD+CIhu0pJQ8Pw8A+4t7vyPu1Tj3eUeFlH
	anbI2JZY7GWyT8FUt6wzBfqUJ/JC0S/6o+IZy/csfLl+X0jlztrqdAeK4QaLN3ee
	Sz0pJvbgPpSM3IKArO9X4VMapksHehamLpRXypaih9Ugd450W15PqM/LUiX9XJfz
	njjtpw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc0jvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 08:49:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4988nPJM029107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 08:49:25 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 01:49:23 -0700
Message-ID: <6fc2d696-5d8c-42a0-9264-57f048093b74@quicinc.com>
Date: Tue, 8 Oct 2024 14:19:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: mac80211: re-order assigning channel in activate
 links
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20241001085034.2745669-1-quic_adisi@quicinc.com>
 <93df47a867ee1f8d84cabdbc953707eab2ea3704.camel@sipsolutions.net>
 <6504caf7-e9d5-49ff-983e-73335f8ee3a1@quicinc.com>
 <97054998-0793-4c71-a202-dd5167fcc24d@quicinc.com>
 <a66621974d1bdaf4ef9c922907786cf757cb4fac.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <a66621974d1bdaf4ef9c922907786cf757cb4fac.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3Oa_dI6R6wepz2mlXmDFYNUu1pysRLF8
X-Proofpoint-ORIG-GUID: 3Oa_dI6R6wepz2mlXmDFYNUu1pysRLF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=785 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_014927_229202_A4C5E365 
X-CRM114-Status: GOOD (  11.35  )
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

On 10/8/24 13:06, Johannes Berg wrote:
> On Tue, 2024-10-08 at 10:43 +0530, Aditya Kumar Singh wrote:
>>
>>
>> Is your testing complete? Do you see any issues with this change?
> 
> Yeah, it can be made to work, but we're still discussing the best way
> with some internals (slowly, due to the holidays in Israel).
> 
> I think you can just leave this patch as is, and I'll keep it pending in
> patchwork until we figure it out, and then I'll just amend it with the
> iwlwifi changes when I merge it.

Sure, thanks.


-- 
Aditya


