Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B512CC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Na6ad40206QPDp5o8TaF7vesMMfV9eHR8tgG5QqC6g=; b=06ySSha5ZkTymzy/Av4qFaPsF2
	fRo+dp8yLD2G3cRrWkjXqNux4g3dG4ligKZe7q0YMFlyN1g2rB/z2Aix0SwpnOrQk6R+98Jq/hw0+
	N6TjLiOc5aePeCZw/4o9TEBgrL/mDNAC3RUwfBRXO7bdrQQxjqtgLKnDYnsF3MwSX5bLzVwn4/pWM
	ZkeftQTJTPQuGjgdMKhDSTM80m5pl4zB8Lp5rfbkqEs6q4ua+nl+B6sg4Kt5IWPVCUSm2Esxp7pVD
	k2ikJP5g6jYiYXnN2C9A4rlzyI0PXDvDK/G/tNHaSKGzsHMEinEPaXpgjl0biEE3nKCgqOdnzLmAH
	gBgpXYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03IQ-00000009dkh-1FVl
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 17:54:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03IN-00000009djQ-0K1b
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 17:54:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P5bHg9019195;
	Thu, 25 Apr 2024 17:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2Na6ad40206QPDp5o8TaF7vesMMfV9eHR8tgG5QqC6g=; b=YK
	ZDLtAM2QP1GWYtcRltxJCqFN0jkQGENSGviF0iAsVQ8cZkdBhg1YE+RqcmoBOYDa
	91uex4++JeiCpAspCXJx1L5IjLHDMfSOJ2XSn6dxqtgb1Ek7yHaoau+lgTR1n7pP
	e60ayLeeGAsBSMAAlmmYDpk4ZVh7gIAcejJR9bFlRo3y4KebtT6/1DxqM/Zqn2Mk
	fcg4emILbVwmyF4k55ZZyw5YmZQlcj2xxvQZevcxtoV6tO78WrtVRIoGFm3NctCb
	qURD7IeMWQMXa1fCDtQkM+0L8ASWBKkXNdvbjuIF2jkkQz4r4AqQ2iZZuzRDGhXH
	j9Fvc8TRmUcgE3EnViEg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenkb846-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:54:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PHs4xx022455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:54:04 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 10:54:04 -0700
Message-ID: <c7097676-439f-4dfc-abca-8b7ed8f5fb99@quicinc.com>
Date: Thu, 25 Apr 2024 10:54:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/6] wifi: ath12k: add 6 GHz params in peer assoc
 command
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Avula Sri Charan
	<quic_asrichar@quicinc.com>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
 <20240424191141.32549-5-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424191141.32549-5-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uBdlG8xjpMIhTyLvh2sCL0JvXMoAK0TT
X-Proofpoint-GUID: uBdlG8xjpMIhTyLvh2sCL0JvXMoAK0TT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_17,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_105407_289419_EC210200 
X-CRM114-Status: UNSURE (   6.81  )
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

On 4/24/2024 12:11 PM, Pradeep Kumar Chitrapu wrote:
> Currently A-MPDU aggregation parameters are not being configured
> during peer association for 6 GHz band. Hence, extract these
> parameters from station's capabilities received in association
> request and send to firmware. Without this, A-MPDU aggregation
> is not happening in 6 GHz band.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 

why was the following dropped that was present in the prior versions?
Co-developed-by: Avula Sri Charan <quic_asrichar@quicinc.com>

> Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

pending fixing that,
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


