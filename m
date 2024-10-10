Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A959FCFC5E2
	for <ath12k@archiver.kernel.org>; Thu, 10 Oct 2024 16:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNtt0dPjgL23uhZec85vU9AyZs85zoV1xd56rwQcLFk=; b=GFXFTg3trQbTDkGkdJfV1VYnho
	NZnTFiv0NvQMgVRXWT6k9mMneimySg6pvM9t4RCMuUKAFTtU5fPicqrGv+haIjjcE9GRTSEH0Kq1o
	eaXtmqCOhbvgcBGKmsCxoWfbdGGJu2DoP/w+yfIfn7T6nqDf6fgXlmaebDHn53YnNkubshUH0HBa5
	sEDdfo4NivgAaooPitFbovF3Y17A+H7V75VBeojGKKywr7ReIE0FcQ++VBhOS+zreT/jsywYCTkt5
	V0Rl8+Yd6PCCi/vFbuZ+fUyggT22n+3AVzYpwPiZmlzrYWnZLNJXB7nWg9fNpayDFrT2yy6fTNW5N
	qN5med9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syw7c-0000000DXX5-1OeR
	for ath12k@archiver.kernel.org;
	Thu, 10 Oct 2024 16:34:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syusM-0000000DHUx-2RYR
	for ath12k@lists.infradead.org;
	Thu, 10 Oct 2024 15:14:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ACVM0G023563;
	Thu, 10 Oct 2024 15:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNtt0dPjgL23uhZec85vU9AyZs85zoV1xd56rwQcLFk=; b=S4w8Xdfg84XmZZSy
	zZcWFcDWerXr+oeNXrNVca+H5I7jEcmdVCvdMo9i5z0IYrmW4CEIZPqz2jAZxK37
	7/IcK0RH2to4t9D1I97Yk88ynIDBB4R/RZWaCtUITSvVzL9P60HFh3+Ob6TUhoBR
	2GdpIt8uoqrg0xUO3UFDzv8CI8GXggNgXOfQF2pZwZcQsbkdCmwE9sefTQ7rxGz9
	HVd2fmV+V2nRl1kypjUwsxg+6jBhWfZkvjKSs9KpMohXbR8nRFfka7MHmXNNOrgG
	AfToWBrVW65OKj+rQY7QXYh2N20SUWbLj1dO4OOU/XFfET0OFHoBxWFhVFc4diWn
	1kCBVw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndyhvey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 15:14:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AFEkfI010122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 15:14:46 GMT
Received: from [10.48.240.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 08:14:45 -0700
Message-ID: <f77bfa26-8625-4f64-b644-aacd4f299d48@quicinc.com>
Date: Thu, 10 Oct 2024 08:14:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] wifi: ath12k: switch to using wiphy_lock() and
 remove ar->conf_mutex
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241007165932.78081-1-kvalo@kernel.org>
 <20241007165932.78081-4-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241007165932.78081-4-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IS8xv6_gE_4Pm6lf5ZRHJbvOveUQnUK0
X-Proofpoint-ORIG-GUID: IS8xv6_gE_4Pm6lf5ZRHJbvOveUQnUK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=789 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_081450_774194_023A9DCA 
X-CRM114-Status: UNSURE (   6.75  )
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

On 10/7/2024 9:59 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
...
>  drivers/net/wireless/ath/ath12k/peer.c        |   6 +-

This file is missing the Qualcomm Innovation Center 2024 copyright
I'll add that in pending


