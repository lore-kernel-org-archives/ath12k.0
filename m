Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99686C54E5D
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9duNkh+BzjgC/t6RYHzgYGGlFzszvhiTwTw+O1vULZU=; b=GhXNyaw3wNtZi2f1utkRz646q/
	sw2SZENuHiZCDg2ju3TP+7rpkNbfSnpYWzRKhrUoQpM0plYFfJPVjwctswb3qYTJg+j+cBxR96Riw
	5gsDMoE/Ep5PDfYzDiNiOIB3HGvIAirVSbj4UmhPt9zNyn2MKbMIFYCM/n4xANUeUdMZVbrqAC6z4
	N8gPXUa2rFZ7Kxs0jlqf2KkFJQ5lFSXnkAG+EndGmghXK2cYpZMo2L71wZzvO5cDG+cSZWc8tK6U0
	V0wjMIkqiQxFU95zYE0XMI9Tz3Z0tBfMVKaAdecYSA183kP7TW+oNpe0lTKkXGAxZfolX8pA8ScSK
	7S/NQkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBCG-00000007vVk-01u0
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 23:06:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBCA-00000007vV3-0LD1
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 23:06:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CMsaxt027815;
	Tue, 12 Mar 2024 23:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9duNkh+BzjgC/t6RYHzgYGGlFzszvhiTwTw+O1vULZU=; b=e9
	9Bc1S5ikjExBsXfRVdBOD8dqlOQu8Q883Y3lqKvWvETiveANTioUAAsXz7NSx+6F
	jYGmD+QkWOlpVK8+Wh4tZKnl37k8VXhFhvqd6FEVflbOu+aRiBe7DlZglo8j69ba
	+m2ZzfDD6XVhKMei9qXHh0MI9QI8X9d/rZWEeyX3ZhyfbrM5nBNkkb7eQ7DIWeq6
	eEFJ2q1oXmWKHPNGtLa+cMK1hMzkhsU4OPNh3Hon0ZnC6VASvnAtDhTGOO6uyNP/
	Gf+AB/v1WiGNKOKkCQXPa4+JmxaScnqJpBBKl55olRdU7wCVj2/mGaw1AIqPLvai
	AEqmUNlvq19rSXleGokA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtprj9hff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 23:06:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CN63Ep026161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 23:06:03 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 16:06:03 -0700
Message-ID: <1153d012-5cbb-46e0-bff2-ccd61adab782@quicinc.com>
Date: Tue, 12 Mar 2024 16:06:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] wifi: ath12k: Add additional checks for vif and
 sta iterators
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-9-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240312135557.1778379-9-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VWzSd0U2DnQ-jrXPLvieUzniYydKPSY6
X-Proofpoint-ORIG-GUID: VWzSd0U2DnQ-jrXPLvieUzniYydKPSY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_14,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=705 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403120176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_160606_297710_B4D74BF7 
X-CRM114-Status: UNSURE (   9.41  )
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

On 3/12/2024 6:55 AM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Since vif and sta objects of different radios are added to same
> local hw list in mac80211, additional checks need to be done
> in driver to ensure we are processing the intended vif
> and sta corresponding to the radio when the vif and sta mac80211
> iterator utils are used from driver.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


