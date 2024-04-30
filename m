Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF87AC4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 01:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQz0jT858WbxozOFH647yHa4dxYo5PopzxQP2OLzJC4=; b=fulRcbkWOTbzCAVHFkhUfIAavw
	IjlbClnnlandUcA4kyerownTQWwpIBHYzn5XQDNMjSBzezLcrKAMOzFfIZyJShlTxdgW9DAthlUow
	MOSFkCvFk45yXXUCRdTrAFpwF4L9VZQC92m4aNjzov1uy6PdwLV+tAW8Q1F5+XkTPCCT6mCbV3YTq
	41IeNz1o0Njy/ARLcxhdjrh8GCT2j0TI0/AeCCtWMgrZBTrmHNJZ+qQ+L9QT2oc0YD1VrCUEY83ma
	utLPTDwOsoo4LiZLq73gVq8ziDOPEImPgsbdsdMhXuKGA+EaekdWQowAYKtgc7Op4PykS0UMehYX0
	u/ow94DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1cix-00000004jpR-1ckL
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 01:56:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ciu-00000004jom-3P2N
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 01:56:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43TNjIMp026547;
	Tue, 30 Apr 2024 01:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=OQz0jT858WbxozOFH647yHa4dxYo5PopzxQP2OLzJC4=; b=Vc
	GTwznZI5an5+VnSsx6N8vqBX27H7hpZr9pvGeXRrvvTaBxIStK3nve3ys0gwDzTD
	nyxlw0rqSa6gnRCxFILMNLAcgmOTxITD378riHqc5EjE7uz/dSEPM3nC16ik0vUM
	s85Y+R28VntP1nVB8nNXdjLGl8FgWrYDK+neyXmjzMW3uL9xCF2Bz08Y9g7QgtJJ
	RsMv6HdzTOAsZo5hWpPjN9AWAUyaxkxGM6h7KRiMKnncGt7GqtXocJ+VEovkfdHP
	cssouSMmCd9aj+Hm6OswlTwjlDofVEILqdaqpW5GNc/8UdTF4K3skdj9QlDoWw0p
	m2COmJ9BI7qtrTmnTGWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xthgvsb8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:55:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U1twjc010325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:55:58 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 18:55:57 -0700
Message-ID: <de3e77c6-53af-44c2-97dc-8b9b61eb86ae@quicinc.com>
Date: Mon, 29 Apr 2024 18:55:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] wifi: ath12k: remove invalid peer create logic
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240429081525.983-1-quic_kangyang@quicinc.com>
 <20240429081525.983-6-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240429081525.983-6-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BUGroUby09bo8Y94X7i-5dlKFNeZl7rv
X-Proofpoint-GUID: BUGroUby09bo8Y94X7i-5dlKFNeZl7rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_22,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=910 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_185601_024814_D0C9013E 
X-CRM114-Status: UNSURE (   9.55  )
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

On 4/29/2024 1:15 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> In ath12k_mac_op_assign_vif_chanctx(), there is a logic to
> create peer using ar->mac_addr for a STA vdev. This is invalid
> because a STA vdev should have a peer created using AP's
> MAC address. Besides, if we run into that logic, it means a peer
> has already been created earlier, we should not create it again.
> So remove it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


