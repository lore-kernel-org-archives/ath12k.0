Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE008C0218C
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9K+oGbmnKAX6d05tXBvf4pq0h7uvZP9S2XaWVJotMU=; b=Cf/0EwlyqLwE/EJIYIJrNVZntM
	9/s5Kg55n2w0mHlYS55SE+XvqGl3YqBVxti+FD2rr8dZsWe7DHd+xfBWOF304VtWyAHKVu0794P3l
	mwty/0mJ7Hp+7zfR3z2NTJiHZZx8NZ5jig//bk/bP3Fi0Rv4j9o9ACt8BvhBEj19kL5lgcfDYNRtK
	s+NQH3/LKzAAzJFYjQmRcO5FciNL3U9h68UAuAwcYzIyHBEMWCT4wzIYY1LEymzZ9MAKIwnZHbxZG
	E6gEHXQukokOQYfHJpdNWvEnjC5AoEKcB/aFMx2KxBnnhnGtsn7rLg3oXGhtQAgAiYI+y7kQnrbFu
	vz9bDjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKHE-00000001sOX-2cqE
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 08:15:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKHC-00000001sOE-2oiQ
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 08:15:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R4kdgr018672;
	Mon, 27 Jan 2025 08:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9K+oGbmnKAX6d05tXBvf4pq0h7uvZP9S2XaWVJotMU=; b=dzB9wmewz3sLsw1n
	VQLTTkbATKG3R2ZO8t7vA2IOKXKPZRhi3rFEGYaB9pbA+m4KDtJNmWcB1pu/QDw1
	qUKCghsOSx+mYgnuO1cHjcvi7FhGma8CScCDJo05RaswcxDPmrZXe201YqW41fgC
	WkISM1b6EkMUmI5fTI9Xin5GJyYtVRC5koynDuMapSohX9R2FyFlVq0WSu0mIutn
	DfxmMlxWnoNGd79GvT9adrY9wqyo9I+zIAn4+ZZwOIMw1UHu9VPYLff8+jMh1MCM
	jA3X1kawdJaIe9Yl5+MQSDifg4Rt0q2jXCIpB9gjPp/xWuOeq0bOYF7bDD7b7Lea
	MsqNrg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e3dr0d5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 08:15:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R8FJaR028555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 08:15:20 GMT
Received: from [10.253.73.203] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 Jan
 2025 00:15:18 -0800
Message-ID: <bd1544e9-0947-424e-9cb0-f50c41e0be41@quicinc.com>
Date: Mon, 27 Jan 2025 16:15:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] wifi: ath12k: Support dump PDEV transmit and
 receive rate HTT stats
To: <ath12k@lists.infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <20250113071758.19589-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Jxvz3kY3eup3J9_N7BSCWi88N2PemVKa
X-Proofpoint-GUID: Jxvz3kY3eup3J9_N7BSCWi88N2PemVKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=742 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_001522_733750_79CE3186 
X-CRM114-Status: UNSURE (   9.22  )
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



On 2025/1/13 15:17, Lingbo Kong wrote:
> Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
> Support to dump PDEV receive rate stats through HTT debugfs stats type 10.
> Support to dump additional PDEV receive rate stats through HTT debugfs stats type 30.
> 
> v4:
> 1.used tab(s) to align the = to match the existing code
> 
> v3:
> 1.Rebase again to 48322e474f04
> 
> v2:
> 1.use TAB to be consistent with existing code
> 
> Lingbo Kong (3):
>    wifi: ath12k: Dump PDEV transmit rate HTT stats
>    wifi: ath12k: Dump PDEV receive rate HTT stats
>    wifi: ath12k: Dump additional PDEV receive rate HTT stats
> 
>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 500 ++++++++++++++++++
>   .../wireless/ath/ath12k/debugfs_htt_stats.h   | 182 +++++++
>   2 files changed, 682 insertions(+)
> 
> 
> base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256

hi jeff,
do you have any updates on this patchset?🙂

/lingbo

