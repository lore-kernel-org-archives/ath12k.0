Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE96C48260
	for <ath12k@archiver.kernel.org>; Fri, 16 Feb 2024 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEH9reJzSJ6u2KRXYY5q3/m7eSnbXCysrVPfSl4mIok=; b=so7clfIR+aVtgugMtF3VXGF7t/
	S7Ck8kHbViF/R7vFvvZ9fu1OUF+YXR8YukOMjRXF13ZbgKaKKo6insg7NDKWG7ISK77LBYWPmz8P3
	xQlzkuV2rdyTRklvEzpb6F8fYtbc2i4Hk4L9doSwEiPW1i32K4+kbDqeD/Grw0RzCx5purfgdVKvE
	erPclyg0/n03KsG8Odx77gCDviQgENfc+D0uyUki7IhDtTodj0AGIiZrKl9sgQP2AzQxgZEI5Cza9
	HvmKK1BejRwXqcDTwbr7y9LlqRdiTus0lB+2AQNpFpe3NG6tFtc0kw7/bxsOigm6Mr+yQsGsS9HbE
	kQ1a0SPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1Li-000000032xZ-1b0G
	for ath12k@archiver.kernel.org;
	Fri, 16 Feb 2024 16:46:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1Lf-000000032wo-1ADI
	for ath12k@lists.infradead.org;
	Fri, 16 Feb 2024 16:46:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GErVoN025495;
	Fri, 16 Feb 2024 16:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vEH9reJzSJ6u2KRXYY5q3/m7eSnbXCysrVPfSl4mIok=; b=cO
	2+ZKjUtzH/0Eo4663ILJkucvbxpBBF0Drpz/UlmycJ5aVaNGMk077vv1ooK4QjLi
	LiC9pbcb5+tsMwdWwSNDlniXIPLQZ3taK8vrWHHSkC/o4GRpdOJIMxJmWUeZ1gpz
	xXsNLX1SXpJGnfuFdPgJMprvwQTdunut6I4L2Jy5vndKn+QGYML3IAIfSd7xvYki
	XNBgo2yUfhLUSj+EFzgoSHh7isPC8x2D39+4ZClNoN1g5+xXHGD5rLgCx6Iu/9YH
	W998F1SS4t7y1WWoYWmmnSxhiy9jpbAFBd+gIrNG/Bni87P45AKEmgcYHA+Si9gf
	LXNMH5+T13T/CCqrBAgw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9xdx9gxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 16:45:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GGjvVw024458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 16:45:57 GMT
Received: from [10.110.53.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 08:45:57 -0800
Message-ID: <2368ff4c-374c-4203-b0f8-f8a761370310@quicinc.com>
Date: Fri, 16 Feb 2024 08:45:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] wifi: ath12k: modify ath12k mac start/stop ops
 for single wiphy
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Sriram R
	<quic_srirrama@quicinc.com>
References: <20240206091954.4144454-1-quic_ramess@quicinc.com>
 <20240206091954.4144454-4-quic_ramess@quicinc.com>
 <8734tsnz8i.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <8734tsnz8i.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z7dAGSns-pLpK4OF1P5RbF_cgYslsxTp
X-Proofpoint-GUID: Z7dAGSns-pLpK4OF1P5RbF_cgYslsxTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_16,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=562 adultscore=0 phishscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_084603_464838_9DB95459 
X-CRM114-Status: UNSURE (   8.25  )
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

On 2/16/2024 8:35 AM, Kalle Valo wrote:
> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
> 
>> From: Sriram R <quic_srirrama@quicinc.com>
>>
>> When mac80211 does drv start/stop, apply the state change
>> for all the radios within the wiphy in ath12k.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> 
> I haven't reviewed the patchset fully yet, first quick impressions:

I didn't review it at all since it has a dependency upon a series that
needs rework, and hence I figure this series will require rework.


