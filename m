Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8D7C4345F
	for <ath12k@archiver.kernel.org>; Wed,  1 May 2024 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3z4gnYwvECJLlfvck2YkKbkaGeicKfs2PQmY7Pzr3U=; b=rnP8xWb/KUDADRTqRCP5tkKU43
	uhJrsrnZaIJ3RYB/SJQ0LlsbeS33m72eb0UxrFon5t6DxCrXOBaJz++0Da0FlXDfxZDjdH8TtzRu/
	TGdJbvGlplFOdZvB3TH4sqWyjvthEvB1OklkRFYMP7lUUHw3elQKTjmqL+4FdVzq5Vx8GVwGYKeZT
	970y2DOEAabuuc4qt8VRqrVFe+SDhTRMOkPxfKnjHDT8FcN5LGuxCExm0+ORGB8/g9YFPVqNuXt7U
	Yg6ojxhIrXIXmjFlUl9O7aXzKW2gVg7Jw0tnWgQGeUqWh6kN/91aqG0gkH/YpM6B3keDABJCpgZpK
	yQ4Qc5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ByW-0000000A09C-0c8q
	for ath12k@archiver.kernel.org;
	Wed, 01 May 2024 15:34:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ByS-0000000A085-3Z8q
	for ath12k@lists.infradead.org;
	Wed, 01 May 2024 15:34:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 441Bnx9q009312;
	Wed, 1 May 2024 15:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=d3z4gnYwvECJLlfvck2YkKbkaGeicKfs2PQmY7Pzr3U=; b=UB
	99ii33f76hz1+A0dvnwJIkXkm840biV7iRJqVomEqKWQEKJ/UEwv2Xw1Cczjr0AN
	Z2P3P1txWaxrlKoABxPPXMXpmUTjqSzNhSCVq/UR5ACEXH/GNPQeD0DnbN9/KMAm
	yfcxdb9NhuUxwuASRtW9wZGOqU+FjUe2mPmRuSvNIKz4kxFCTq0H4RkzdABmchiQ
	0aXge/BdklzFn2/A3khV2qXldIUSq/gVOnygrOlcbyHgXlXhypKRpG7Lu0GC5Md5
	h+5WmmT/3fZUQFsiLPQJsvPF2R4E4wWs3/RMlrvvIUEHEINSDZTbeOhsNzBEn61z
	dmLfxi+WzzbLXbsd9EUQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xueu91570-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 15:34:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 441FY951012602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 May 2024 15:34:09 GMT
Received: from [10.216.57.16] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 1 May 2024
 08:34:07 -0700
Message-ID: <824269da-c69d-668b-4e6b-d0453c4572c1@quicinc.com>
Date: Wed, 1 May 2024 21:04:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v2 0/8] wifi: ath12k: Introduce device group abstraction
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240425055759.1181165-1-quic_hprem@quicinc.com>
 <87le4voyka.fsf@kernel.org>
Content-Language: en-US
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <87le4voyka.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mcvGBRj7deCRL4nfIv3UFSfP-uUAA35b
X-Proofpoint-ORIG-GUID: mcvGBRj7deCRL4nfIv3UFSfP-uUAA35b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_15,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=804 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405010110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_083425_087913_61DDAF3B 
X-CRM114-Status: UNSURE (   6.82  )
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



On 4/30/2024 5:24 PM, Kalle Valo wrote:
> 47] WARNING: possible circular locking dependency detected
> [  147.211599] 6.9.0-rc5-wt-ath+ #1403 Not tainted

Thank you, Kalle, for sharing the full logs. Unfortunately, I did not 
see this warning in my testbed with QCN9274.

Seems like during rmmod case, ath12k_core_soc_destroy() is invoked with 
ag->mutex lock which in-turn invokes ath12k_qmi_deinit_service() where 
cancel_work_sync for qmi events are called. So, if 
ATH12K_QMI_EVENT_FW_READY was in queue during rmmod, it would hit a 
deadlock as in core start it requires ag->mutex lock. But, this scenario 
is quite unlikely to occur where rmmod and FW_READY event are going to 
be in parallel. Nevertheless, it has to be addressed. I will check 
further on this warning and see how to address this.

Thanks,
Harshitha

