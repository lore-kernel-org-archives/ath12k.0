Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE41C47258
	for <ath12k@archiver.kernel.org>; Sat, 13 Jan 2024 02:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxaMr7lMldV86XiJ06BE5wnmVQvJbYgrbXiBw6ZCd64=; b=gUS/271BQrP1VKnB7smEJy4nOA
	4oxfHFser0W9+fbKkUsLCMMqOFWuuHWH8B36/WUVpOwIrP47MV5YiRse60gxWy+WIWATX0qf25/bs
	RfbwAErA3qAQAEcu21eZQwBunLXzU4Rl732eESwngcpJqafZTDLb/tQUKFWi55zQnyD/2JKaRMOjW
	73VH9FcA9ii81g+7BIt9Ssdujje9wcht011hy1I1Nlk+P9u7EWDT3VbwzcMNGLh97ahKHAd/6hidL
	wxUuWbhcGKlIuuftdGRV/GMazAWNABvJn+G+CnUdWqKY3Fv4zQPCn/w4s746sxzhyCbruByYxv/M3
	Tki+/aIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOTQK-004QrJ-1S
	for ath12k@archiver.kernel.org;
	Sat, 13 Jan 2024 02:07:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOTQI-004Qqi-0J
	for ath12k@lists.infradead.org;
	Sat, 13 Jan 2024 02:06:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40D1Hssf006868;
	Sat, 13 Jan 2024 02:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=HxaMr7lMldV86XiJ06BE5wnmVQvJbYgrbXiBw6ZCd64=; b=D/
	8l3cnefEk3Xvb/yiASHAw/mwm3/UC0wvxNcQQrlYOYsX1OZoBvTh8q27eJ1A05Sp
	HAM/XKMu8evSlKc9J5MN+UIu/8e4DByobTZ1EhQBKXdv5lk/Optbzezf2vIuahaZ
	QixlhJSntNKa1Q2fl8IzzQ1I1HQu4rJzpPaxB2IQi61qPRXJ4iIM8FuPsVfsGQA6
	nkQx9cPCXMUwxDLMuLuwLfmwGGm85q0BQQg+RZzVpkQbX7/CBeKW/bYB/O+CuMEi
	+0TtF2Bsr9oIhs5KtPqYsqYa7AH111yMRe5+y11IZc/nBdcugIMmGb9LCJn5P2MF
	AQwFhoYqvFiNFwa3soPA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk43xhs7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 02:06:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40D26uUC023547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 02:06:56 GMT
Received: from [10.110.118.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 18:06:55 -0800
Message-ID: <d75fcb8f-7e8f-49b4-b4c0-75b7c8663101@quicinc.com>
Date: Fri, 12 Jan 2024 18:06:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Add QMI PHY capability learn support
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240113001659.1022465-1-quic_periyasa@quicinc.com>
 <20240113001659.1022465-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240113001659.1022465-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZES3LsRKRdnHLDfH9ulejEWGnf0kezxC
X-Proofpoint-GUID: ZES3LsRKRdnHLDfH9ulejEWGnf0kezxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=872 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401130015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_180658_254104_11E88CCA 
X-CRM114-Status: GOOD (  10.21  )
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

On 1/12/2024 4:16 PM, Karthikeyan Periyasamy wrote:
> Currently, the number of PHY is learned from the firmware service ready
> event message. However, on the QCN9274 platform, number of PHY is a
> variable parameter. To enable MLO capability in the QMI host capability
> request message, the driver needs the PHY count information earlier than
> the firmware service ready event. Therefore, a new QMI message,
> "PHY capability message", is introduced to retrieve this information.
> This message allows the driver to fill in the MLO parameter in the QMI
> host capability request message. If the new QMI PHY capability message
> fails, the default configuration in the HW params will be used.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



