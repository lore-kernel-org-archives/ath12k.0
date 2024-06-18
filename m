Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAB4C27C4F
	for <ath12k@archiver.kernel.org>; Tue, 18 Jun 2024 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbs0erw5OqnlYwGFkBSfxJZnMphNTdjPSZw8vQCCnn8=; b=0iZCNRsY0XGW+K7DEZQVPHQXVH
	POqJlxalAiqNq5wQPYYQfYsFjvuP8/mf3jMNEHdj62z08mQPH5hWVbaOfNSxBotAV7Ly0N//1m1JY
	V68gXFrnVVfZ0HFgdhWMVicmy9/O0JWQT3Pg7eNaYw5loXwJqEzzaKx1aLq94UIfBjVr+QMcIDb2S
	4ianSwYCSSLslWQKU//9IECK0pDut+9wUWH0vHIC6F80b0Bjs1s27GiUs/kO/OChdlr8LPpCjU2dK
	dnnDKL6MMvagTKemz81DhBZ7Z1+U7B04/fCuRy35x8tlBqnWNGiYRLRgNRKM8Wkp8h9wbMwqWW+lK
	5vB41l+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVvi-0000000EJWg-0ArM
	for ath12k@archiver.kernel.org;
	Tue, 18 Jun 2024 10:19:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVvf-0000000EJVJ-1sL0
	for ath12k@lists.infradead.org;
	Tue, 18 Jun 2024 10:19:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I387Lf019209;
	Tue, 18 Jun 2024 10:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbs0erw5OqnlYwGFkBSfxJZnMphNTdjPSZw8vQCCnn8=; b=V5veSNsK+srIs9QQ
	yO6Q69h4F28y8W7Ez7Y6s923skrJry9LtMg75cFMVw1UE0Rw1RmyUDKW7VRDiQN3
	6KpqByDyknkaCrGlPtKmlcBB+5ZoJlS18ePZNiqmKxu9PRLSQ4JX6h5uMGwv7LCZ
	CtFxgJjjH4WvpjDKxbxlzyC/rCC+D6q9Co60eFfsJ+oQyu0QPNB06tiNPjv4z/nh
	f2APWsCYGZBXJ26svzXVGMFVNrSv2mTgS7G0S6mLd3SIMhWdTIZAxakUgvSzY1oI
	A1GYtCYHot9K3IIpNxCYyU7qMoEBvK+J3nrV43MHFcYJtXA9Us9rTnkIBB+dk3vJ
	bulhfg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu22grvex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 10:19:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IAJ4V8024670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 10:19:04 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 03:19:03 -0700
Message-ID: <29fcda42-8d83-40e4-856a-d98e56981091@quicinc.com>
Date: Tue, 18 Jun 2024 18:19:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: prepare sta data structure for MLO
 handling
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20240617131650.3288118-1-quic_ramess@quicinc.com>
 <20240617131650.3288118-4-quic_ramess@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240617131650.3288118-4-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uAEbIrKkJC0h08fgwvRjr0je8nCN0btq
X-Proofpoint-GUID: uAEbIrKkJC0h08fgwvRjr0je8nCN0btq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=807 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_031907_535449_F3C12716 
X-CRM114-Status: UNSURE (   6.44  )
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



On 6/17/2024 9:16 PM, Rameshkumar Sundaram wrote:
> +static inline struct ieee80211_sta *ath12k_sta_to_sta(struct ath12k_sta *ahsta)
> +{
> +	return container_of((void *)ahsta, struct ieee80211_sta, drv_priv);
> +}
> +
better naming as ath12k_ahsta_to_sta()?

