Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFA3C369C2
	for <ath12k@archiver.kernel.org>; Mon,  5 May 2025 03:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiGbZ0jK0ixlXLOERXzZpS+yIGD83aUGnLZBtXoqsgI=; b=lpPhL0TqulCNMdphZ9FeDmSTZT
	dBnr+hJh78wrhAQjF0cg9Cjed5ERYoU2klNf7ScVNeDPPu70vWdEWMNwh+JN7blrdrIS9yEqjj1MF
	2tU5avBLSGw5AZ91LsgxgDFnXSjLU/fCM1OzWPQIqx2DUkafCTirDCBP2vSu9vTfbSadVMp3kM7xf
	WsbP93jubwq3wRARfWD5X7ik0a0AM/FrBaTk0dIggtyz7Q+qG71fJYSWQ7ZZ9QP3VtQ5DCUkd/QdV
	tw1FpXD/iCF0w/v9OZcIbEJ9WeS39Vqe1Kez2CCPHTKuS6pi8YPBh0D29RRfAqPGhWen/k3pE7vDw
	Xy2rMEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBmon-00000006LjH-3BCA;
	Mon, 05 May 2025 03:48:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBmoj-00000006Lir-1yeL
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 03:48:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54519M1x021562;
	Mon, 5 May 2025 03:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JiGbZ0jK0ixlXLOERXzZpS+yIGD83aUGnLZBtXoqsgI=; b=inWAg4vpekpnjAjA
	DWJUYaE5tIf3y4B+x2jJSWDZ4ju4+M2qvOrBNehkAeKSovPCrZbn6huwsMvprZpL
	JGKVAX7mb8EONOLoQV/TBHKU0TwtFrgXf4VGa5rjrU4R1belWa3+E1r3NvaiHqFq
	CUvT6fdMjt3MaxmDC7fhYE9BnmCW9Up+5JdTtjDXzroqjHHDnx2arH/7rzN5jwAL
	dP1ttUGe6Qaii57eQHswjQdicDO5Okat9QM6HiAyTSf14mOW6+fbG+vDJzOeCtGT
	5VPW3py5Gqeo3ML5sMaOSQv99NuZUDoeARgmzkOfXw6pAWSawsTVnZVExiWWRPdK
	ry1lAg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n2r1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 03:48:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5453mUSP028588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 03:48:30 GMT
Received: from [10.152.194.219] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 4 May 2025
 20:48:29 -0700
Message-ID: <8522a98a-8f43-4ad5-b097-e177702e9b40@quicinc.com>
Date: Mon, 5 May 2025 09:18:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove redundant regulatory rules
 intersection logic in host
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Aishwarya R <quic_aisr@quicinc.com>
References: <20250430154211.669502-1-quic_rajson@quicinc.com>
 <b934485c-05b3-47fb-a3ad-b7e03706d0c8@oss.qualcomm.com>
Content-Language: en-US
From: Rajat Soni <quic_rajson@quicinc.com>
In-Reply-To: <b934485c-05b3-47fb-a3ad-b7e03706d0c8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAzNCBTYWx0ZWRfX1eEkik5UjkFL
 0VJN9nAbN64+XJtbn9xUl+1xPE437+tk53bfvuZomNTOeDBWnx75htAaOOiri8H/W82PJjmPNPF
 DTEUGVm8aMCCxQyFBTPvc9PvtSE+pVIdq9d9bpGiMyX/LPVwsaqhhKHGGdJSFDEncOTYz75pms1
 gXYgFjZVYsg75mS8WRhsaAp1JHmPHTIEhV2bxkSDpxnC/6tsDOWbuyAF3uvcnQWtjNHzAHvH1ff
 cjEWBbDxwbDwQNfbajB44HIur/pi9co5U4LpAuX4HGahNKMECiqeCHxHXduXb9iAyeHEWpE54uh
 9dO6+Ak4tKq/RmsPuIGLJSlCkrYeW4EACSJ5vcqUrWISJvZzU7J+xgHxuI4CPY1+ZpJSZoNsh/r
 1zfPuyhMtss31C1spwTd5isOwEX4tJwmQDRgWKOfqGiO7IxexLfUHzpWCOYzVmetzJtdZASf
X-Proofpoint-GUID: HgneW2nGZa4RQl00f_xI24KHFopH6lMU
X-Proofpoint-ORIG-GUID: HgneW2nGZa4RQl00f_xI24KHFopH6lMU
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=6818350f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=LRjWmmqLfYJXe2i0rwQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_204833_770851_94A77E6F 
X-CRM114-Status: GOOD (  18.12  )
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



On 5/3/2025 2:27 AM, Jeff Johnson wrote:
> On 4/30/2025 8:42 AM, Rajat Soni wrote:
>> From: Aishwarya R <quic_aisr@quicinc.com>
>>
>> Whenever there is a change in the country code settings from the
>> user, driver does an intersection of the regulatory rules for this
>> new country with the original regulatory rules which were reported
>> during initialization time.
>>
>> There is also similar logic running in firmware with a difference
>> that the intersection in firmware is only done when the country code
>> is configuration during boot up time (BDF/OTP). Firmware logic does
>> not kick in when no country code is configured during device bring
>> up time as the device is always expected to have the country code
>> configured properly in the deployment.
>>
>> There is a debug/test use case that requires absolute regulatory
>> rules to be used for a user configured country code when the device
>> is not configured with a particular country code during boot up time.
>>
>> To support the above test use case, remove the redundant regulatory
>> rules intersection logic in the host driver. Depend on the
>> intersection logic in firmware when the device comes up with
>> pre-configured country code.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Aishwarya R <quic_aisr@quicinc.com>
>> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/reg.c | 164 ++------------------------
>>  drivers/net/wireless/ath/ath12k/reg.h |   3 +-
>>  drivers/net/wireless/ath/ath12k/wmi.c |  24 +---
>>  3 files changed, 14 insertions(+), 177 deletions(-)
> 
> While this applies cleanly on top of ath-next, it does not apply cleanly on
> the pending branch.
> 
> Can you please rebase on ath/main-pending, and post a v2 with ath-pending as
> the destination branch tag? Don't worry if the patchwork bot ignores it due to
> an unknown branch tag.
> 
> /jeff

Sure, jeff. I have sent [PATCH ath-pending v2] wifi: ath12k: remove redundant regulatory rules intersection logic in host.

Thanks,
Rajat Soni


