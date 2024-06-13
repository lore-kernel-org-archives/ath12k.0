Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D02C27C75
	for <ath12k@archiver.kernel.org>; Thu, 13 Jun 2024 22:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wi3O1xjOyMTFQWm98Sl2JQrawOmdmn8o0kX1XSoKFg=; b=ITog5wUKERXHM6Wmk4bGhVNHK3
	6V150hx78BKDIJNsyqZnLUBcGsaI1gClanbQFLt81ctK+4v+2kVfbRSsi1k9vbwi1pDLNwdcY2CAp
	k8+goKu/SJnCYteGU2iJTbb/JXIyUx3jHkjwm8xXeM3L5mnq2J6fZ7SLwdF4ycyHev6U6hvIypXEk
	hliVZC4QjbgUJbiWJ1xp/JND5ebF4Z86z8OHkEeGL3iIe+Fgs+4H6kEQg9F5GjWHqwV5X2WDZ/Icm
	iiXH702PtUJK54oSRF4VjPiSa/XOzFBZ83SkzZ9/y6Vu3wy47g6ugssk2DRGktrK1OR3NBRk7dlDP
	Yk6r4JOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHsgP-00000000d2I-0fGn
	for ath12k@archiver.kernel.org;
	Thu, 13 Jun 2024 22:12:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHsgM-00000000d1i-3Ai9
	for ath12k@lists.infradead.org;
	Thu, 13 Jun 2024 22:12:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJGm8O003692;
	Thu, 13 Jun 2024 22:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wi3O1xjOyMTFQWm98Sl2JQrawOmdmn8o0kX1XSoKFg=; b=SmNSv7oSGKsyEtwt
	y1gSWJryWOLDqQfrXp2uK4rV4rYoENcXSMK2mhqD92r2sVmviw0V6bU+Z+Lr6ya0
	1BRNOj0ZM0WVR1DEsl1Lxs5lrWzuWGHnqVOSr8iED2ZCTc8Z4CSmE88675UzGii7
	Css8JvawJMA3zay7IvvNP8/gib6jFpdQrdliimTtVMo8DI4fo7ylbOdKj4H2GDBf
	BZ2fl2yXe1t7+ZqtxsrAJA4xVKxY6tv2rjytjtplSf2Jq+IxdWELNTeQd0VKTK3D
	zXdanRlLy8M09dvWMv7e0Q8wuzx1Hely4VYMKQ9gWX6SFE5fJZwo8Sagtkb+V5CG
	VTyREw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q2rdar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 22:12:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DMCWoH020659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 22:12:32 GMT
Received: from [10.48.243.167] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 15:12:31 -0700
Message-ID: <da716af8-f237-4ffe-87ef-efc931955932@quicinc.com>
Date: Thu, 13 Jun 2024 15:12:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix firmware crash due to invalid peer nss
Content-Language: en-US
To: Ajith C <quic_ajithc@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240613053528.2541645-1-quic_ajithc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240613053528.2541645-1-quic_ajithc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BnjVU1fZIvG39rMfTPPgLZMVF-YUez0b
X-Proofpoint-ORIG-GUID: BnjVU1fZIvG39rMfTPPgLZMVF-YUez0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_151234_878319_D99A35D1 
X-CRM114-Status: GOOD (  11.56  )
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

On 6/12/2024 10:35 PM, Ajith C wrote:
> Currently, if the access point receives an association
> request containing an Extended HE Capabilities Information
> Element with an invalid MCS-NSS, it triggers a firmware
> crash.
> 
> This issue arises when EHT-PHY capabilities shows support
> for a bandwidth and MCS-NSS set for that particular
> bandwidth is filled by zeros and due to this, driver obtains
> peer_nss as 0 and sending this value to firmware causes
> crash.
> 
> Address this issue by implementing a validation step for
> the peer_nss value before passing it to the firmware. If
> the value is greater than zero, proceed with forwarding
> it to the firmware. However, if the value is invalid,
> reject the association request to prevent potential
> firmware crashes.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ajith C <quic_ajithc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


