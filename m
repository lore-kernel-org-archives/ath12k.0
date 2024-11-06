Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A070BD59F53
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k37186Jjrf1YEYU93z1Umnye1L6hFQEO9ORFBh4iVU=; b=zoFjWC2mKhCFVYXpKbKiM/PxL2
	hFl5Cslnol6UNnQV2i+mPDtn4xalvFO+26RSJ3VjbQU3KW0/Ngc8NX5gVSAfFKbdE4Q1oFStx5sDS
	dpu6y/w/jqesOnV7GUWW4j40NvnyACwuzQvRUxIkKM8uM3zBw8S+0OLbATi2BpPluwJlYUZcBo6ez
	b0d+oCtR6bjaJI+L/a0Kkk6bnbSYxHr6VkocSNbPQ+xOOKXspZmntMgWwipr3jDZ4/1fY0jBMXlvr
	DTLciQW5hoQr+BV9TLorkPkzvl8wDhOLT+H9Ieoq5eM3ydiTJ1EVh3MBeUDPJ4lUtsf7FgOa7O5zA
	FABMLULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyP-000000042aB-1QJw
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 16:33:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyN-000000042ZJ-2fIP
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 16:33:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6ERRpc002169;
	Wed, 6 Nov 2024 16:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4k37186Jjrf1YEYU93z1Umnye1L6hFQEO9ORFBh4iVU=; b=f+F2ug57t0oTerDO
	AeX0fArlslqjqU6/M0iagoffMlB6dEJDygDSwB2Wis3UdquscoMnDPOJipKVcKXm
	BcEAgXAgZ/xEdly+FJd4RbwZQIjua7ruayBM71jCK/DnL3IWtvpgK6NZP8bQGHZy
	ZTccLrxsoJFYhAUnhn0bWUZm99MwlDaCQo8uvIehub47fxk0jtEeHNm7RhG2ft6R
	di4WyiMtsyNiTXO7SQ7+TlwbSOl5oqiLxNt3uvfeGr+eeR7mlenDBU2bEvWHtzB8
	QEN7XiiRmIYcrv6jIQGeVxJv3zbROnQf+05fpusshbT5pXvvO8nzLpb0JdOQaPUD
	rWWe5Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r072hyc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 16:33:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6GXWXD014978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 16:33:32 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 08:33:32 -0800
Message-ID: <50cfd92e-ca96-4dcd-9787-0f1d7d705c7d@quicinc.com>
Date: Wed, 6 Nov 2024 08:33:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] wifi: ath12k: add reo queue lookup table for ML peers
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-6-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106142617.660901-6-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pjAqySWZotCRwxS0xNVB_6mzvjuxXWzL
X-Proofpoint-GUID: pjAqySWZotCRwxS0xNVB_6mzvjuxXWzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=987 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_083335_714938_5D8230EA 
X-CRM114-Status: UNSURE (   9.61  )
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
> From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> 
> Currently reoqueue tid setup uses lookup table (LUT) during peer association,
> but for ML peer there will be multiple link peers (belonging to different
> underlying firmware) affiliated to each other. Hence the reo queue should be
> setup only on one of the links which is the primary link.
> 
> Add changes to create separate ML reo queue lookup table for ML peers and use
> the same while setting up rx tid for ML peer's primary link. For ML peers use
> ml_peer_id instead of peer_id to setup/lookup the reo queue entry in the LUT.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



