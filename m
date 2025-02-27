Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AD0C19F32
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 05:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ki6BeIg8JJVB5zdMdG+8IfD4Mp7vXWTp8/O5AWKYXDw=; b=D9XWog8Py4stsmg8+LFjnZBm0p
	yb4iUjHLJq5T/FdhsihaKv2QllB27aU5UX01z0WZoqspsw94AUCWnNNWC4bYD0mgLvlcWY14+XZTq
	Qkc/Tg2EayU1I3+7MlAmlG8rSuQJkRdO90CjWFiP+78NA2ysAmaI3KFrRvL+6xxXltS9npd22Yq1G
	sV/QNfdd6HKVZr83BCJi05Uvpm9k0HUeLk7c8HeXMJCzB/p3nPiBeS4hXLYGcjQOMoQyKfgFTTyKv
	o/ozNrxDeIzSKHh3pWN0a5ZpZUVdCVCl8bFAqqdbnJ/FxXz/HymXw71H5W2c99TpS35RuXyNhHAVV
	UmesZ+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWhn-00000006OXA-43If
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 05:45:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWfz-00000006OGH-3KFO;
	Thu, 27 Feb 2025 05:43:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R1bUEN000441;
	Thu, 27 Feb 2025 05:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ki6BeIg8JJVB5zdMdG+8IfD4Mp7vXWTp8/O5AWKYXDw=; b=dAKs/ia4Yy8SEOYT
	nPdjdH10ViuS6D88txfmH7jL7m9jNhkc77bX2HuxwFPXSnCuocp8Iutc7VJKJsml
	iBderwORSosSra3qszdP0lW5YvUvnwQ73welXT4XronRomNqqx0Nl8rATsa7IaOi
	U2ua0bwUFYBQVBsNg2+LnP5ZnFTmywYpmfqn13gi+RcBezfGYxbK1+sJZmtCG89t
	/wXx7sGu9U2xsy8z97WoWJBU72iEyYy8O2C+Gyb8mpXmV3Za5q1dpoK803UE0mvo
	WR7BcwE2SbQilthPv5qjxMNDpr49D6gyrEmaKj+gOxy+g/JfqWWYAqRje6NZQxp7
	2JotjA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4522sktfj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 05:43:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R5hDcc000813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 05:43:13 GMT
Received: from [10.216.32.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 21:43:11 -0800
Message-ID: <0d8bad5a-4616-17ce-5b27-c5eabd7e7877@quicinc.com>
Date: Thu, 27 Feb 2025 11:13:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/5] wifi: ath11k: refactor transmitted arvif retrieval
Content-Language: en-US
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
 <20250210182718.408891-2-aloka.dixit@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250210182718.408891-2-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EPBGp0Orq9FwlE9wV-2_I0d-IRzVJnQs
X-Proofpoint-ORIG-GUID: EPBGp0Orq9FwlE9wV-2_I0d-IRzVJnQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=598
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_214315_974409_51E2D4EA 
X-CRM114-Status: UNSURE (   7.94  )
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



On 2/10/2025 11:57 PM, Aloka Dixit wrote:
> Create a new function ath11k_mac_get_tx_arvif() to retrieve 'arvif'
> for the transmitted interface of the MBSSID set. This will help
> modifying the same code path to reflect mac80211 data structure
> changes to support MLO. This also fixes an issue in
> ath11k_mac_update_vif_chan() where tx_arvif is not reset to NULL
> inside for loop during each iteration. Compile tested only.
> 
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

