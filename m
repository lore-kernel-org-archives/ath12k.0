Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA92AC5321E
	for <ath12k@archiver.kernel.org>; Mon, 26 Aug 2024 06:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NZ28nRp0AH9lnqwmjlDKM9fE4ojjn32EOCI4LEa3L4=; b=bJ4eDI6R01FFVEWIyun8mMItNP
	htr3ZNK0ofQGLcmX9t77YjZggc80QI72jDIpund8fQ7hmCevttj4ODc8WWM1PXXpZJWYQp3TdAE2Y
	DfiSm50g0FxrTCvzuRGprBE/pVQ/jEzYqhuRNt9Ur43FgTH895ig5ZyhZY+22Zu8fBmEu9akGBFNT
	5SPA7BEhWM452GPP/R4cMdArgSRJbEu9q5EvMgUkNIntJ0k2D9OGSBbKRZam+ky7f6gWDsWmHS5xv
	2jz6gpXnCB15uw/K2y0aJ8sJDBOhLmz7mVIvEJMGWsc2Dfm+mhMolzSZGOPjG6WqnT79J8604tzK3
	jtyN85hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siSqK-00000005xNU-2DSb
	for ath12k@archiver.kernel.org;
	Mon, 26 Aug 2024 06:04:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siSqH-00000005xMl-0puM
	for ath12k@lists.infradead.org;
	Mon, 26 Aug 2024 06:04:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PN0eqZ009201;
	Mon, 26 Aug 2024 06:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NZ28nRp0AH9lnqwmjlDKM9fE4ojjn32EOCI4LEa3L4=; b=RJVV2LWeWiP2BTyw
	TrFwe6YWdttFCamAqjjt6U9xxIvspUUdhF7wrYG8ABvDuJzGSabzjfFTSINHiy5a
	4LtWiS0k6IkfUDhLQhcZ6bCukpBBDa9tHwNi9G+kmVFkZqfHrQsVdZ4uc4WOYVDE
	tbGASLjQN0zpH4xPbmlZb+9NIYIfvz2vsEi++xSFgE7mtsdDLt4c1yowq+QihwNd
	97rDs3Vh6JzgUJZ2mr4CBNs4curcG5AxtqBRSNtPwI34xaFnOfcJhJjNmAPS42oW
	eczRHYLs+8E5reflSN5fv4asa4Lg1Lp3UIT57xh61uAgxWfr0huiKspCZ03ZRJ46
	ptpaqw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417988akhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 06:04:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q64Us4002872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 06:04:30 GMT
Received: from [10.151.40.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 25 Aug
 2024 23:04:28 -0700
Message-ID: <68bf6f43-d851-f2a5-54db-61538cfb46ce@quicinc.com>
Date: Mon, 26 Aug 2024 11:34:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] wifi: ath12k: Introduce iface combination cleanup
 helper
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240814103423.3980958-2-quic_periyasa@quicinc.com>
 <172434561175.2469785.10367608474646125650.kvalo@kernel.org>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <172434561175.2469785.10367608474646125650.kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mBIRafPMEORtSlIzLh1n4mX6D_SBOcIt
X-Proofpoint-ORIG-GUID: mBIRafPMEORtSlIzLh1n4mX6D_SBOcIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_03,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 mlxlogscore=817 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408260048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_230441_267675_E107C0A4 
X-CRM114-Status: UNSURE (   8.09  )
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



On 8/22/2024 10:23 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:
> 
>> Introduce a cleanup helper function to avoid redundant code for iface
>> combination cleanup. Remove the cleanup code from
>> ath12k_mac_hw_unregister() and ath12k_mac_hw_register() and replace it
>> with new cleanup helper function.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00183-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> I'll drop this patchset because of MLO cleanup.

This change not related to MLO dependency. Its a basic to group multiple 
radio under a wiphy.

> 
> 3 patches set to Changes Requested.
> 
> 13763255 [1/3] wifi: ath12k: Introduce iface combination cleanup helper
> 13763256 [2/3] wifi: ath12k: Refactor radio freq low and high information
> 13763257 [3/3] wifi: ath12k: Advertise multi device iface combination
> 

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

