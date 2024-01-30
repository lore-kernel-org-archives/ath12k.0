Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A11BC47DA9
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 01:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIdSsPyhkL103JZ551O2S+rutGWu/k6ZpMZ33V3N5xc=; b=1TW0mB+efBxXxou/33SRgnU5UG
	Bljhf7f+T+X68a+U3qj1lpCUYdDEXPuGlaqMJWh4hD+UW7OOPNTdp3SGvORkPLtgA2VzdJgPBug44
	PM7EKKLUYRDQgK7oBRG2teXzIPklSDuz6AqgCbMu5vOphDQGuHdEfbDZXdXCOLwHPLygAHdyuM2E8
	EYkL1n778Abq2qV6eM7GHQg5tIjZmW93M0Ly/V02FaBtHapKmvB96B6V9L1ZtkrKXE0xEPtRLPQgK
	wznyFSqAEc4wQ3kaFnClEXaYJnjizdUEO9VgLc6SdSvWuAbso+BMBPL2XnQaMVLnw/VOHqx9YehaE
	y0fxDurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdFU-0000000EsTc-0Uuu
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 01:49:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdFR-0000000EsT8-1p4E
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 01:49:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40TNAE10013714;
	Tue, 30 Jan 2024 01:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ZIdSsPyhkL103JZ551O2S+rutGWu/k6ZpMZ33V3N5xc=; b=AQ
	+/lIrxTJcOVYx1iPFOxCPirT/utDC2AJKEKfMAXbblkdI9igMLZH8+wm7P82MCD7
	liKi4x6SOL8C8opPRqcObc0WOUzpmVeVTDvkFopPHIy6B4b1nPTjRVFlUOY1K10N
	jladczimLwflo92MkAoEY+KO6yqg4b4Mc7lioNH8CCMJp/kClfLmfVA+KCEHbXI0
	KQ9E0skVDTkVy8hspreaet/FpXyrxYAAcWx30j6JcAjBq2HMBJQjTNUgs8m7J6ZB
	o5HJu5NfDyKjQGib2alA4ZuUC0zxlvsf6dJ0FK0Y/uTj8EHZGO61WWWm3FgPKj06
	aIo6lQGnR7fTcX+CGykg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxdwf9968-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 01:49:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U1nCEL007239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 01:49:12 GMT
Received: from [10.253.12.70] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 17:49:10 -0800
Message-ID: <39093756-0374-4abc-980a-51a3b8b33b43@quicinc.com>
Date: Tue, 30 Jan 2024 09:49:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] wifi: ath12k: fix broken structure
 wmi_vdev_create_cmd
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240129101453.368494-1-quic_kangyang@quicinc.com>
 <20240129101453.368494-8-quic_kangyang@quicinc.com>
 <c48df22b-e04f-4c51-bb7d-36eb9b2282af@quicinc.com>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <c48df22b-e04f-4c51-bb7d-36eb9b2282af@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mPJoGOWHaG3uWS2ryKQ3oTFTtRRws-g_
X-Proofpoint-ORIG-GUID: mPJoGOWHaG3uWS2ryKQ3oTFTtRRws-g_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=840 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_174913_513579_99D56F8E 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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



On 1/30/2024 9:39 AM, Jeff Johnson wrote:
> On 1/29/2024 2:14 AM, Kang Yang wrote:
>> Current structure wmi_vdev_create_cmd is not matched to the firmware
>> definition. So update it.
>>
>> And update vdev_stats_id_valid for vdev_stats_id.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> FYI IMO this and the 08/11 patch should go first since they are fixing
> pre-existing code independent of the P2P feature (the P2P code just
> exposed the flaws) -- hence why I'm ack'ing these first


OK, i will move them to the 1st and 2nd, then update config file to send v6.

Do you have any other comments on other patches?




> 

