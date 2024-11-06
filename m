Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2521CD59F55
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GSGA5Sp2QuptDN+Yg4GRoYcDQP+4oBUpqS9ACpZhqc=; b=CGpWHKBlVM9aRx2cCBmBUtJhcN
	LCdULmXXowA67/gHPmxVVUMtZ2r0cnwomD3WBFbVgtor22tJibvhsPtP62nz9tKIJ7ds+5C4FeM9s
	uzzS0/9WyLQvBxxRCdlZscciIVzlVTfqyjnf7ho/S3zniffEflWUTalRNn1C4Ma7UFC5q4baNhsBE
	ljxBFYtHk/1Ps6yFbC/6KBeL2mlCeT+9xtOfjqIrYQ1Lw/oIckN3GEAvr2B4q5wEe6mqgD/Vz7ws1
	OWlLOW/eYQV9QQO9KIrfAfjRgETmE3u9iFP+tXVhliipswriBuuTg3ZN8D+QSuASEIAchVboRqzlx
	nwKwDdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyV-000000042d1-3d6l
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 16:33:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyT-000000042bo-3Luf
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 16:33:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6AnwMV004809;
	Wed, 6 Nov 2024 16:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GSGA5Sp2QuptDN+Yg4GRoYcDQP+4oBUpqS9ACpZhqc=; b=cne41xV6rjbnxWe8
	HaQlj+aPTfZGVE9/QPnp17zcRjr9fHh3F1gjXSQOQjZQUr6puQ03gZDKWCVDb7rS
	q3N0DNhDzM91sAZ9sagI0yN6Z0moQ6QNP6jbtzzGP2FBjK9DyWmDbzJ7Le2AMTDv
	THp+Nq6hn17e/ksS3lBGRl/a3Mohcf8wthH1ARPEuH74ru68gFr/3d65G8QaFqVl
	xt8IesvrRNefeLITvGbnjOQ+xSM/qkpr5X0HjpS6GxBrNe5AC/xM9BboQAoi4NOT
	Eo4+4yqg5Ls+3EMX4BpUPqFTY+WhNMQGTfUQJlFnURe/4AN+/Z+QKXfZl9+JD2Y4
	qhUjXg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qvg3tesp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 16:33:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6GXdKX004778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 16:33:39 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 08:33:38 -0800
Message-ID: <cfccc631-c80e-449f-9f13-6fb0473dca7a@quicinc.com>
Date: Wed, 6 Nov 2024 08:33:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] wifi: ath12k: Use mac80211 vif's link_conf instead of
 bss_conf
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-8-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106142617.660901-8-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Bvw5BGyvNQYKoJm8TrvcYZZKH2_oi5S8
X-Proofpoint-GUID: Bvw5BGyvNQYKoJm8TrvcYZZKH2_oi5S8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=598
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_083341_886409_918AE9CE 
X-CRM114-Status: UNSURE (   7.95  )
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

On 11/6/2024 6:26 AM, Kalle Valo wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Currently mac80211 vif's bss_conf is used to fetch any vif related
> configurations in driver but with MLO multiple links are affiliated to a vif
> and corresponding link configs are present in vif->link_conf[]. Fetch
> link_conf for corresponding link from vif and use the same for configurations.
> 
> Add ath12k_mac_get_link_bss_conf() helper to fetch link_conf from arvif.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


